<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 12/8/2016
  Time: 11:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 全屏弹出框css样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/style.css" media="screen" />
	<style type="text/css">
	/*media screen*/
.md-content h4 {
    margin: 0;
    padding: 0.4em;
    text-align: center;
    font-size: 2em;
    font-weight: bold;
    opacity: 0.8;
    background: rgba(0,0,0,0.3);
    border-radius: 3px 3px 0 0;
    font-family: 宋体;
}

	
	</style>
</head>
<body>
<html lang="en" class="no-js">
<body>
<div class="md-modal md-effect-12" id="modal-12">
    <div class="md-content" style="background:rgba(143,27,15,0.8);">
        <div>
            <h3>OK! 激活成功!</h3>
            <div style="width:256px; height:256px; position:relative;margin:auto;">
            <img alt="" src="${pageContext.request.contextPath}/foregroundPlug/register/images/easyicon.net.png">
            </div>
        </div>
        <h4><span>3</span>秒钟后前去登陆界面</h4>
    </div>
</div>
<button class="md-trigger" data-modal="modal-12" style="display: none">Blur</button>
<div class="md-overlay" style="pointer-events:none; background:rgba(0,0,0,0.08);"></div><!-- the overlay element -->
<script>
    var polyfilter_scriptpath = '/js/';
</script>
</body>
</html>
<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/js/index.js"></script><!-- 全屏弹出框的js文件 -->
<!-- jQuery 必不可少的插件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
    $(".md-trigger").trigger("click");
    var countdown = parseInt($(".md-content h4").children("span").text());
    setInterval(function(){
    	if(countdown==0 ){
    		window.location.href="indexVisited";
    		return;
    	}
    	countdown =countdown-1;
    	$(".md-content h4").children("span").text(countdown);
    }, 1000);
</script>
</body>
</html>