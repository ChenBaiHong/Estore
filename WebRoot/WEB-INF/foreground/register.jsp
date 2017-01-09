 <%--
  Created by IntelliJ IDEA.
  User: ChenBaiHong
  Date: 10/23/2016
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>注册</title>
    <link href="${pageContext.request.contextPath}/foregroundPlug/register/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/foregroundPlug/register/css/gloab.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/foregroundPlug/register/css/index.css" rel="stylesheet">
    <style type="text/css">
.header-top-w3layouts {padding: 10px 0;}

.container {width: 1170px;}
    
.logo-w3 {width: 50%;float: left;}

.logo-w3 img, .footer img {width: 7%;position: absolute;top: 0px;left: -47px;}

.logo-w3 a h1, .footer a h3 {text-align: left;color: #000;font-size: 40px;position: relative;}

.phone-w3l {text-align: right;width: 50%;float: left;}

.clearfix{clear:both;}

a:hover, a:focus {color: #23527c;}

body a { transition: 0.5s all;-webkit-transition: 0.5s all;-moz-transition: 0.5s all;-o-transition: 0.5s all;
-ms-transition: 0.5s all;text-decoration: none;}

    	
    </style>
    <script src="${pageContext.request.contextPath}/foregroundPlug/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/foregroundPlug/register/js/register.js"></script>
</head>
<body class="bgf4">
<div class="header-top-w3layouts">
	<div class="container">
		<div class="col-md-6 logo-w3" >
			<a href="#">
			<img src="${pageContext.request.contextPath}/foregroundPlug/images/logo2.png" alt=" " style="width:15%;"/>
			<h1 style="left:25px;">baiHoo</h1>
			</a>
		</div>
		<div class="col-md-6 phone-w3l">
			<ul>
				<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span></li>
				<li>+13678005440</li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div class="login-box f-mt10 f-pb50">
    <div class="main bgf">
        <div class="reg-box-pan display-inline">
            <div class="step">
                <ul>
                    <li class="col-xs-4 on">
                        <span class="num"><em class="f-r5"></em><i>1</i></span>
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">填写账户信息</p>
                    </li>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>2</i></span>
                        <span class="line_bg lbg-l"></span>
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">验证账户信息</p>
                    </li>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>3</i></span>
                        <span class="line_bg lbg-l"></span>
                        <p class="lbg-txt">注册成功</p>
                    </li>
                </ul>
            </div>
            <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
                <div class="part1">
                	<input type="hidden" id="token" value="${sessionScope.token}">
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>用户名：</span>
                        <div class="f-fl item-ifo">
                            <input type="text" maxlength="20" class="txt03 f-r3 required" tabindex="1" data-valid="isNonEmpty||between:3-20||isUname" data-error="用户名不能为空||用户名长度3-20位||只能输入中文、字母、数字、下划线，且以中文或字母开头"
                            	 id="username" />                            <span class="ie8 icon-close close hide"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus"><span>3-20位，中文、字母、数字、下划线的组合，以中文或字母开头</span></label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <script type="text/javascript">
	                    $("#username").blur(function(){
					   		verifyUsername($(this));
						});  
						function verifyUsername($el){
							var $this=$el;
							var username = $this.val();
							var regular=/^[\u4E00-\u9FA5a-zA-Z][\u4E00-\u9FA5a-zA-Z0-9_]*$/;
							if(username.trim().length>2 && regular.test(username)){
								var url="verifyNameAction";
								var args="username="+username;
								$.post(url , args , function(data){
									var jsonData = eval("("+data+")");
									//alert(data);
									if(jsonData.message=="yes"){
										$this.removeClass("v_error")
										$this.siblings().addClass("hide");
										$this.siblings(".icon-sucessfill").removeClass("hide");
										$this.attr("check","true");
									}else{
										$this.siblings(".icon-sucessfill").addClass("hide");
										$this.siblings(".focus").addClass("hide");
										$this.addClass("v_error")
										$this.siblings(".valid").text(jsonData.message);
										$this.siblings(".valid").removeClass("hide");
										$this.attr("check","false");
									}
								});
							}else{
								$this.attr("check","false");
							}
						}    
                    </script>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>电子邮箱：</span>
                        <div class="f-fl item-ifo">
                            <input type="text" class="txt03 f-r3 required" data-valid="isNonEmpty" tabindex="5" data-error="电子邮箱不能为空" 
                            	 id="email" />
                            <span class="ie8 icon-close close hide"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">请填写有效的电子邮箱</label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <script type="text/javascript">
                    	$("#email").blur(function(){
                    		var $this = $(this);
                    		var email = $(this).val();
                    		var regular =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                    		if(email.trim().length!=0){
                    			if(!regular.test(email)){
                    				$(this).siblings(".focus").addClass("hide");
                    				$(this).siblings(".valid").text("电子邮箱格式不正确");
                    				$this.siblings(".icon-sucessfill").addClass("hide");
                    				$(this).siblings(".valid").removeClass("hide");
                    				$(this).attr("check","false");
                    			}else{
	                    			var url="verifyEmailAction";
									var args="email="+email+"&time="+new Date();
									$.post(url , args , function(data){
										var jsonData = eval("("+data+")");
										//alert(data);
										if(jsonData.message=="yes"){
											$this.removeClass("v_error")
											$this.siblings().addClass("hide");
											$this.siblings(".icon-sucessfill").removeClass("hide");
											$this.attr("check","true");
										}else{
											$this.siblings(".icon-sucessfill").addClass("hide");
											$this.siblings(".focus").addClass("hide");
											$this.addClass("v_error")
											$this.siblings(".valid").text(jsonData.message);
											$this.siblings(".valid").removeClass("hide");
											$this.attr("check","false");
											$this.attr("json_data",jsonData.message);
										}
									});
                    			}
                    		}else{
                    			$(this).attr("check","false");
                    		}
                    	})
                    </script>

                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>
                        <div class="f-fl item-ifo">
                            <input type="password"  maxlength="20" class="txt03 f-r3 required" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合"
                            	 id="password"/>
                            <span class="ie8 icon-close close hide" style="right:55px"></span>
                            <span class="showpwd" data-eye="password"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
                            <label class="focus valid"></label>
                            <span class="clearfix"></span>
                            <label class="strength">
                                <span class="f-fl f-size12">安全程度：</span>
                                <b><i>弱</i><i>中</i><i>强</i></b>
                            </label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>
                        <div class="f-fl item-ifo">
                            <input type="password" maxlength="20" class="txt03 f-r3 required" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" 
                            	id="rePassword" />
                            <span class="ie8 icon-close close hide" style="right:55px"></span>
                            <span class="showpwd" data-eye="rePassword"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">请再输入一遍上面的密码</label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
                        <div class="f-fl item-ifo">
                            <input type="text" maxlength="4" class="txt03 f-r3 f-fl required" tabindex="4" style="width:167px" data-valid="isNonEmpty" data-error="验证码不能为空" 
                            	id="verifyCode" />
                            <span class="ie8 icon-close close hide"></span>
                            <label class="f-size12 c-999 f-fl f-pl10">
                                <img src="${pageContext.request.contextPath}/VerifyCodeServlet.servlet?method=verifyCodeImage" id="verifyImage"/>
                            </label>
                            <label class="icon-sucessfill blank hide" style="left:380px"></label>
                            <label class="focusa">看不清？<a href="javascript:;" class="c-blue">换一张</a></label>
                            <label class="focus valid" style="left:370px"></label>
                        </div>
                    </div>
                    <script type="text/javascript">
                    	$(".c-blue").click(function(){
                    		$("#verifyImage").attr("src","");
                    		$("#verifyImage").attr("src","${pageContext.request.contextPath}/VerifyCodeServlet.servlet?method=verifyCodeImage&time="+new Date());
                    		$("#verifyCode").val("");
                    	});
                    	$("#verifyCode").blur(function(){
                    		var $this = $(this);
                    		var verifyCode = $(this).val();
                    		if(verifyCode.trim().length==4){
                    			var url="${pageContext.request.contextPath}/VerifyCodeServlet.servlet";
	                    		var args={"method":"verifyIsCorrect","verifyCode":verifyCode,"time":new Date()};
	                    		$.post(url , args , function(data){
	                    			//alert(data);
	                    			var feedback = eval("("+data+")");
	                    			if(feedback.message=="yes"){
	                    				$this.removeClass("v_error")
										$this.siblings(".valid").addClass("hide");
										$this.siblings(".icon-sucessfill").removeClass("hide");
										$this.attr("check","true");
	                    			}else{
	                    				$this.siblings(".icon-sucessfill").addClass("hide");
										$this.siblings(".focus").addClass("hide");
										$this.addClass("v_error")
										$this.siblings(".valid").text("输入的验证码不正确");
										$this.siblings(".valid").removeClass("hide");
										$this.attr("check","false");
	                    			}
	                    		});
                    		}else{
                    			$this.attr("check","false");
                    		}
                    	})
                    </script>
                    <div class="item col-xs-12" style="height:auto">
                        <span class="intelligent-label f-fl">&nbsp;</span>
                        <p class="f-size14 required"  data-valid="isChecked" data-error="请先同意条款">
                            <input type="checkbox" checked /><a href="javascript:showoutc();" class="f-ml5">我已阅读并同意条款</a>
                        </p>
                        <label class="focus valid"></label>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl">&nbsp;</span>
                        <div class="f-fl item-ifo">
                            <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part1">下一步</a>
                        </div>
                    </div>
                </div>
                <div class="part3" style="display:none">
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>真实姓名：</span>
                        <div class="f-fl item-ifo">
                            <input type="text" maxlength="10" class="txt03 f-r3 required" tabindex="1" data-valid="isNonEmpty||between:2-10||isZh" data-error="真实姓名不能为空||真实姓名长度2-10位||只能输入中文" 
                            	id="realname" />
                            <span class="ie8 icon-close close hide"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">2-10位，中文真实姓名</label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>身份证号：</span>
                        <div class="f-fl item-ifo">
                            <input type="text" class="txt03 f-r3 required" tabindex="2" data-valid="isNonEmpty||isCard" data-error="身份证号不能为空||身份证号码格式不正确" maxlength="18" 
                            	id="identicalId"  />
                            <span class="ie8 icon-close close hide"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">请填写18位有效的身份证号</label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl">&nbsp;</span>
                        <div class="f-fl item-ifo">
                            <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part3">下一步</a>
                        </div>
                    </div>
                </div>
                <div class="part4 text-center" style="display:none">
                    <h3>激活码已经发送至你的邮箱请注意查收！点击激活</h3>
                    <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a href="indexVisited" class="c-blue">产品首页</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="m-sPopBg" style="z-index:998;"></div>
<div class="m-sPopCon regcon">
    <div class="m-sPopTitle"><strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose" onClick="closeClause()">×</b></div>
    <div class="apply_up_content">
    	<pre class="f-r0">
		<strong>同意以下服务条款，提交注册信息</strong>
        </pre>
    </div>
</div>
<script>
   $(function(){	
    function verifyCheckAttr($el){
		if($el.attr("check")=="true"){
			return true;
		}else{
			return false;
		}	
	}  
	//翻至第二页的确定按钮
	$("#btn_part1").click(function(){
		if(!verifyCheck._click() || !verifyCheckAttr($("#username")) || !verifyCheckAttr($("#email")) || !verifyCheckAttr($("#verifyCode"))){
			if(!verifyCheckAttr($("#username")) && $("#username").val().trim().length>2){
				$("#username").siblings(".icon-sucessfill").addClass("hide");
				$("#username").siblings(".focus").addClass("hide");
				$("#username").addClass("v_error")
				$("#username").siblings(".valid").text("用户名中包含非法敏感词汇");
				$("#username").siblings(".valid").removeClass("hide");
			}
			if(!verifyCheckAttr($("#verifyCode")) && $("#verifyCode").val().trim().length==4){
				$("#verifyCode").siblings(".icon-sucessfill").addClass("hide");
				$("#verifyCode").siblings(".focus").addClass("hide");
				$("#verifyCode").addClass("v_error");
				$("#verifyCode").siblings(".valid").text("输入的验证码不正确");
				$("#verifyCode").siblings(".valid").removeClass("hide");
			}
			if(!verifyCheckAttr($("#email")) && $("#email").attr("json_data")!=undefined){
				$("#verifyCode").siblings(".icon-sucessfill").addClass("hide");
				$("#verifyCode").siblings(".focus").addClass("hide");
				$("#verifyCode").addClass("v_error");
				$("#verifyCode").siblings(".valid").text($("#email").attr("json_data"));
				$("#verifyCode").siblings(".valid").removeClass("hide");
			}
			return;
		} 
		$(".part1").hide();
		//$(".part2").show();
		$(".part3").show();
		$(".step li").eq(1).addClass("on");
	});
	
	//翻至第三页的确定按钮
	$("#btn_part3").click(function(){			
		if(!verifyCheck._click()) return;
		 submitRegisterData();
	});	
	//提交注册信息
	function submitRegisterData(){
		var token = $("#token").val();
		var username=$("#username").val();
		var password=$("#password").val();
		var email = $("#email").val();
		var realname=$("#realname").val();
		var identicalId=$("#identicalId").val();
		var url="submitRegisterAction";
		var args = "token="+token+"&username="+username+"&password="
					+password+"&email="+email+"&realname="+realname+"&identicalId="+identicalId;
		$.post(url , args , function(data){
			//alert(data);
   			var feedback = eval("("+data+")");
   			if(feedback.message=="yes"){
   				$(".part3").hide();
				$(".part4").show();
				$(".part4").children("h3").text("激活码已经发送至你的邮箱请注意查收！点击激活");
				$(".step li").eq(2).addClass("on");
				countdown({
					maxTime:10,
					ing:function(c){
						$("#times").text(c);
					},
					after:function(){
						window.location.href="indexVisited";		
					}
				});		
   			}
		});
	}
});
function showoutc(){$(".m-sPopBg,.m-sPopCon").show();}
function closeClause(){
	$(".m-sPopBg,.m-sPopCon").hide();		
}
</script>
</body>
</html>
