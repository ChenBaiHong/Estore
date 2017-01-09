<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 9/25/2016
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/component.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/platform-1.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/easyform.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/tab.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/html5.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/easyform.js"></script>
    <script type="text/javascript">
        $(function() {
            var timer = setInterval(intervalTime, 5000);
            $("#submit").click(function(){
                var user = $("#uid").val();
                var pwd = $("#psw1").val();
                if (user.length == 0 || pwd.length == 0) {
                    clearInterval(timer);
                    timer=setInterval(intervalTime,5000);
                    $("#prompt").text("用户名和密码不能为空").show(500);
                    return false;
                }else if (user.length != 0 && pwd.length != 0){
                    var judge=false;
                    var url="${pageContext.request.contextPath}/AdminServlet.servlet";
                    var args={"logonName":user,"logonPwd":pwd,"method":"ajaxValidate","time":new Date()};
                    $.post(url,args,function(data){
                        /*var object = eval("("+data+")");*/
                        var variable = data.logonMessage;
                        if(variable=="logonFailed"){
                            clearInterval(timer);
                            timer=setInterval(intervalTime,5000);
                            $("#prompt").text("用户名或密码错误！").show(500);
                            judge= false;
                        }else if(variable=="logonSuccess"){
                            judge= true;
                            var formNode = document.getElementById("reg-form");
                            var jumpHref = formNode.getAttribute("action");
                            window.location.href=jumpHref;
                        }else{
                            judge= false;
                        }
                    },"JSON");
                    return judge;
                }
            });
            function intervalTime() {
                $("#prompt").hide(500);
            }
	    	var wH = parseInt(document.body.clientHeight);
	    	var dH = parseInt($(".form-div").height());
	    	$(".form-div").css({"top":(((wH-dH)/2)+"px")});
	    	$(window).resize(function(){
	    		var wH = parseInt(document.body.clientHeight);
	    		var dH = parseInt($(".form-div").height());
		    	$(".form-div").css({"top":(((wH-dH)/2)+"px")});
	    	})
        });
    </script>

</head>
<body>
<div class="container demo-3"style="z-index: 10">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas" style="z-index: 0;position: fixed;left: 0px;"></canvas>
            <div class="form-div"  style="z-index: 100;position:relative;height: 300px;">
			    <form id="reg-form" action="${pageContext.request.contextPath}/AdminServlet.servlet?method=logonSuccess" method="post">
			        <table>
			            <tr>
			                <td>登录名</td>
			                <td><input name="logonName" type="text" id="uid"
			                /></td>
			            </tr>
			            <tr>
			                <td>密　码</td>
			                <td><input name="logonPwd" type="password" id="psw1"
			                /></td>
			            </tr>
			        </table>
			        <div id="prompt" style="display:none ; margin: 0px; padding: 0px;margin-left:200px;font-weight:bold; font-size:14px;">用户名和密码不能为空</div>
			        <div style="margin-left:100px;">
			            <input type="checkbox" name="deadline" value="${60*60*24*7}">&nbsp;自动登录一个星期
			        </div>
			        <div class="buttons" style="margin-top: 15px;">
			            <input value="登陆" type="submit" style="margin-right:20px; margin-top:20px;" id="submit">
			            <input value="我没有有账号，我要注册" type="button"  style="margin-right:45px; margin-top:20px;" />
			        </div>
			        <br class="clear">
			    </form>
			</div>
        </div>
    </div>
</div>
<!-- /container -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/rAF.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/demo-3.js"></script>
</body>
</html>