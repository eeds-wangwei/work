/**
 * @ngdoc overview
 * @name  fileUtil
 * @description
 *   文件处理工具
 */

angular.module('fileUtil', [])

.factory('FileUtil', function($q) {
  
  return {
    /**
     * @ngdoc     method
     * @name      fileUtil.services.FileUtil#readFile
     * @methodOf  fileUtil.services.FileUtil
     * @description
     *   使用 FileReader 读取文件数据
     *
     * @param     {File|Blob}      file       File 对象或 Blob 对象
     * @param     {Function}       callback   回调函数
     * @returns   {FileReader}     FileReader 对象
     */
    // readFile: function(file, callback) {
    //   var fileReader = new FileReader()
    //   fileReader.onload = callback;
    //   fileReader.readAsDataURL(file);
    //   return fileReader;
    // },
    
    /**
     * @ngdoc     method
     * @name      fileUtil.services.FileUtil#getDataURLMimeType
     * @methodOf  fileUtil.services.FileUtil
     * @description
     *    从 dataURL 字符串中获取其 mime 类型值
     *
     * @param     {String}   dataURL      dataURL
     * @returns   {String}   mime 类型
     */
    // getDataURLMimeType: function(dataURL) {
    //   return dataURL.split(',')[0].split(':')[1].split(';')[0];
    // }, 
    
    /**
     * @ngdoc     method
     * @name      fileUtil.services.FileUtil#dataURLtoBlob
     * @methodOf  fileUtil.services.FileUtil
     * @description
     *    将 dataURL 字符串转为 Blob 对象
     *
     * @param   {String}   dataURL      dataURL
     * @returns {Blob}     Blob 对象
     */
    // dataURLtoBlob: function(dataURL) {
    //   var byteString;
    //   var content = [];
    //   if (dataURL.split(',')[0].indexOf('base64') !== -1) {
    //     byteString = atob(dataURL.split(',')[1]);
    //   } else {
    //     byteString = decodeURI(dataURL.split(',')[1]);
    //   }

    //   for (var i = 0; i < byteString.length; i++) {
    //     content[i] = byteString.charCodeAt(i);
    //   }
    //   var blob;
    //   try {
    //     blob = new Blob([new Uint8Array(content)], {
    //       type: this.getDataURLMimeType(dataURL)
    //     });
    //   } catch (e) {
    //     var bb = new WebKitBlobBuilder();
    //     bb.append(new Uint8Array(content).buffer);
    //     blob = bb.getBlob(this.getDataURLMimeType(dataURL));
    //   }
    //   return blob;
    // },

    /**
     * @ngdoc     method
     * @name      fileUtil.services.FileUtil#compressImage
     * @methodOf  fileUtil.services.FileUtil
     * @description
     *   传入图片节点，压缩图片体积和尺寸
     *   当未设置宽高时，使用图片宽高
     *   当只设置宽度或只设置高度时，按比例缩放
     *
     * @param   {HTMLImageElement}      sourceImg    源图片元素
     * @param   {Number=}               width        压缩目标宽度
     * @param   {Number=}               height       压缩目标高度
     * @param   {Number=100}            quality      压缩质量
     * @param   {String='image/jpeg'}   mimeType     格式，媒体类型，为避免混乱，只允许使用 image/png 或 image/jpeg
     * @returns {Promise}               Promise
     */
    // compressImage: function(sourceImg, width, height, quality, mimeType) {
    //   mimeType = mimeType || 'image/jpeg';
    //   quality = quality || 100;

    //   var defer = $q.defer();

    //   function _onload() {
    //     var cvs = document.createElement('canvas');
    //     var naturalWidth = sourceImg.naturalWidth;
    //     var naturalHeight = sourceImg.naturalHeight;

    //     width = Math.min(width, naturalWidth);
    //     height = Math.min(height, naturalHeight);

    //     if (!width && !height) {
    //       cvs.width = naturalWidth;
    //       cvs.height = naturalHeight;
    //     } else if (!width && height) {
    //       cvs.height = height;
    //       cvs.width = height / naturalHeight * naturalWidth;
    //     } else if (width && !height) {
    //       cvs.width = width;
    //       cvs.height = width / naturalWidth * naturalHeight;
    //     }

    //     cvs.getContext("2d").drawImage(sourceImg, 0, 0, cvs.width, cvs.height);
    //     defer.resolve(cvs.toDataURL(mimeType, quality / 100));

    //     sourceImg.removeEventListener('load', _onload);
    //   }

    //   sourceImg.addEventListener('load', _onload, false);

    //   return defer.promise;
    // },


    /**
     * @ngdoc     method
     * @name      fileUtil.services.FileUtil#compressImageFile
     * @methodOf  fileUtil.services.FileUtil
     * @description
     *  传入图片文件对象，压缩图片体积和尺寸
     *  压缩图片体积和尺寸
     *  当未设置宽高时，使用图片宽高
     *  当只设置宽度或只设置高度时，按比例缩放
     *
     * @param   {File}                  imageFile    源图片文件对象
     * @param   {Number=}               width        压缩目标宽度
     * @param   {Number=}               height       压缩目标高度
     * @param   {Number=100}            quality      压缩质量
     * @param   {String='image/jpeg'}   mimeType     格式，媒体类型，为避免混乱，只允许使用 image/png 或 image/jpeg
     * @returns {Promise}               Promise
     */
    // compressImageFile: function(imageFile, width, height, quality, mimeType) {
    //   var defer = $q.defer();
    //   var that = this;
    //   // 在 android4.2 以下的浏览器中，FormData.append(blob) 时，服务端会接收到空文件，这是一个已知的bug。
    //   var reader = new FileReader();
    //   reader.onload = function(evt) {
    //     var img = document.createElement('img');
    //     img.src = evt.target.result;
    //     that.compressImage(img, width, height, quality, mimeType)
    //       .then(function(_dataURL) {
    //         defer.resolve(that.dataURLtoBlob(_dataURL));
    //       });
    //   };
    //   reader.readAsDataURL(imageFile);

    //   return defer.promise;
    // },
  }
})