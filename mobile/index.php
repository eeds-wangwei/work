<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <!-- 用于调试阶段禁掉缓存 -->
    <!-- <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" /> -->

    <!-- 禁止自动识别电话号码 -->
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <title></title>
    <link rel="shortcut icon" href="./img/favicon.ico">

    <!-- DNS 预加载 -->
    <link rel="dns-prefetch" href="//api.ibos.cn">
    
    <script>var accesstoken='<?php echo isset($_REQUEST["accesstoken"]) ? $_REQUEST["accesstoken"] : ""; ?>',corptoken='<?php echo isset($_REQUEST["corptoken"]) ? $_REQUEST["corptoken"] : ""; ?>';</script>
            
    <style type="text/css">
    .splash {position: absolute; left: 50%; top: 50%; margin-left: -30px; margin-top: -40px; width: 60px; height: 60px; } .double-bounce1, .double-bounce2 {width: 100%; height: 100%; border-radius: 50%; background-color: #3497db; opacity: 0.6; position: absolute; top: 0; left: 0; -webkit-animation: bounce 2.0s infinite ease-in-out; animation: bounce 2.0s infinite ease-in-out; }
    .double-bounce2 {-webkit-animation-delay: -1.0s; animation-delay: -1.0s; }
    @-webkit-keyframes bounce {0%, 100% { -webkit-transform: scale(0.0) } 50% { -webkit-transform: scale(1.0) } }
    @keyframes bounce {0%, 100% {transform: scale(0.0); -webkit-transform: scale(0.0); } 50% {transform: scale(1.0); -webkit-transform: scale(1.0); } }
    </style>

    <!-- weinre -->
    <!-- <script src="http://192.168.1.10:8080/target/target-script-min.js#official"></script> -->
  </head>
  <body animation="slide-left-right">
    <!-- 
      The nav bar that will be updated as we navigate between views.
    -->
    <ion-nav-bar>
      <ion-nav-back-button></ion-nav-back-button>
    </ion-nav-bar>
    <!-- 
      The views will be rendered in the <ion-nav-view> directive below
      Templates are in the /templates folder (but you could also
      have templates inline in this html file if you'd like).
    -->
    <ion-nav-view>
        <div class="splash">
          <div class="double-bounce1"></div>
          <div class="double-bounce2"></div>
        </div>
    </ion-nav-view>

    <script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>

    <!-- cordova script (this will be a 404 during development) -->
    <!-- <script src="cordova.js"></script> -->
        
    <script type="text/javascript" src="lib/basket/basket.full.min.js"></script>
    <script type="text/javascript">!function(){function e(e){var t=document.getElementsByTagName("head")[0],s=document.createElement("style");s.setAttribute("type","text/css"),t.appendChild(s);try{s.styleSheet?s.styleSheet.cssText=e:"textContent"in s?s.textContent=e:s.appendChild(document.createTextNode(e))}catch(e){}}basket.require({key:"css/ionic_css",url:"lib/ionic-1.1.0/css/ionic.min.css",unique:"06301639",execute:!1},{key:"css/ibos_style_css",url:"css/style.css",unique:"11101550",execute:!1}).then(function(t){t.forEach(function(t){var s=t.url,n=t.data.replace(/(?:url\('?"?(.*?)'?"?\))/g,'url("'+s.substring(0,s.lastIndexOf("/"))+'/$1")');e(n)})})}();</script>
    <script type="text/javascript" src="lib/lib.js?v=11101550"></script>
    <script type="text/javascript" src="templates/templates.js?v=11151608"></script>
    <script type="text/javascript" src="js/all.js?v=11101650"></script>

    <!-- TalkingData -->
    <script src="https://jic.talkingdata.com/app/h5/v1?appid=20E55C0664208615559687FE25185B28&vn=ibosmobile&vc=1.5.0"></script>
  </body>
</html>
