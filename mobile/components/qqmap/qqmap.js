/**
 * @ngdoc module
 * @name wechat
 * @description
 *   QQ地图对接模块
 */
angular.module('qqmap', [
  ['https://3gimg.qq.com/lightmap/components/geolocation/geolocation.min.js']
])

.constant('QQ_MAP_KEY', 'WLNBZ-YKAWU-IFSVE-4RPKN-J5CDK-4KFEG')

.constant('QQ_MAP_GEOCODER_URL', 'http://apis.map.qq.com/ws/geocoder/v1/')

.constant('QQ_MAP_STATICMAP_URL', 'http://apis.map.qq.com/ws/staticmap/v2/')

.factory('qqmapApi', function($http, $q, $httpParamSerializerJQLike, QQ_MAP_KEY, QQ_MAP_GEOCODER_URL, QQ_MAP_STATICMAP_URL) {
  var appName = 'IBOSH5'
  var geoPromise

  function getGeolocationInstance() {
    if(!geoPromise) {
      geoPromise = $q(function(resolve, reject) {
        if(qq && qq.maps && qq.maps.Geolocation) {
          resolve(new qq.maps.Geolocation(QQ_MAP_KEY, appName))
        } else {
          reject()
        }
      })
    }
    return geoPromise
  }

  return {
    /**
     * @ngdoc method
     * @name qqmapApi#getLocationByAddress
     * @description 
     *    根据提供地址解析出坐标（目前使用腾讯地图的接口）
     * @param {String}      address  地址
     * @returns {Object}    $q.defer.promise
     */
    getLocationByAddress: function(address) {
      return $http.jsonp(QQ_MAP_GEOCODER_URL, {
        params: {
          address: address,
          key: QQ_MAP_KEY,
          output: 'jsonp',
          callback: 'JSON_CALLBACK'
        }
      })
    },

    /**
     * @ngdoc method
     * @name qqmapApi#getAddress
     * @description 
     *    根据坐标值解析出地址
     * @param {String}      lat  纬度
     * @param {String}      lng  经度
     * @returns {Object}    $q.defer.promise
     */
    getAddress: function(lat, lng) {
      return $http.jsonp(QQ_MAP_GEOCODER_URL, {
        params: {
          location: lat + ',' + lng,
          key: QQ_MAP_KEY,
          coord_type: 1,
          output: 'jsonp',
          callback: 'JSON_CALLBACK'
        }
      })
    },

    /**
     * @ngdoc method
     * @name  qqmapApi#getStaticMap
     * @description 
     *    获取位置静态地图
     */
    getStaticMap: function(config) {
      config = angular.extend({
        key: QQ_MAP_KEY,
        zoom: '15',
        maptype: 'roadmap'
      }, config);

      return QQ_MAP_STATICMAP_URL + '?' + $httpParamSerializerJQLike(config);
    },

    /**
     * @ngdoc method
     * @name  qqmapApi#getLocation
     * @description 
     *   基于 QQMAP 控件获取位置信息
     * 
     * @return {Object} Promise
     */
    getLocation: function() {
      return $q(function(resolve, reject) {
        getGeolocationInstance()
        .then(function(instance) {
          instance.getLocation(resolve, function(){
            reject()
          })
        })
      })
    },

    /**
     * @ngdoc method
     * @name  qqmapApi#getLocationAddress
     * @description 
     *   基于 QQMAP 控件获取位置信息并换取地址
     * @return {Object}  Promise
     */
    getLocationAddress: function() {
      var that = this
      return this.getLocation()
      .then(function(coord) {
        return that.getAddress(coord.lat, coord.lng)
        .then(function(response) {
          var res = response.data
          if(res.status !== 0) {
            throw new Error('地址转向失败')
          } else {
            return res.result
          }
        })
      })
      .catch(function(e){
        console.log('获取地址失败', e)
        return $q.reject(e)
      })
    }
  };
})

.directive('addressFetcher', function(qqmapApi, IbPopup) {
  return {
    restict: 'E',
    template: '<span ng-click="getLocation()" ng-transclude></span>',
    replace: true,
    transclude: true,
    scope: true,
    require: 'ngModel',
    link: function($scope, $element, $attrs, $ngModelCtrl) {
      $scope.locationing = false

      $scope.getLocation = function() {
        $scope.locationing = true;

        qqmapApi.getLocationAddress()
        .then(function(result) {
          var address = result.formatted_addresses ? result.formatted_addresses.recommend : result.address
          $ngModelCtrl.$setViewValue(address)
          $ngModelCtrl.$render()
        })
        .catch(function() {
          IbPopup.alert({ title: '定位失败' });
        })
        .then(function() {
          $scope.locationing = false
        })
      };
    }
  }
})