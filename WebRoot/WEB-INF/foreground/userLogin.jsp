<%--
  Created by IntelliJ IDEA.
  User: ChenBaiHong
  Date: 10/23/2016
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
    <title>Single</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript">
        addEventListener("load", function()
        {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar()
        {
            window.scrollTo(0,1);
        }
    </script>
    <!-- css -->
    <link href="${pageContext.request.contextPath}/foregroundPlug/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/font-awesome.min.css" type="text/css" media="all" />
	<style type="text/css">
.promptMessage {
    margin: 0px;
    padding: 0px;
    margin-left: 286px;
    font-weight: bold;
    font-size: 18px;
    position: absolute;
    display:none;
}


	</style>
	<!--// css -->

    <script src="${pageContext.request.contextPath}/backgroundPlug/easyformPlug/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/foregroundPlug/js/bootstrap.js"></script>
    <!--flex slider-->
    <script defer src="${pageContext.request.contextPath}/foregroundPlug/js/jquery.flexslider.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/flexslider.css" type="text/css" media="screen" />
    <script>
        // Can also be used with $(document).ready()
        $(window).load(function() {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>
    <!--flex slider-->

    <script src="${pageContext.request.contextPath}/foregroundPlug/js/imagezoom.js"></script>
    <!-- //js -->

</head>

<body>
<div class="header-top-w3layouts">
    <div class="container">
        <div class="col-md-6 logo-w3">
            <a href="#"><img src="${pageContext.request.contextPath}/foregroundPlug/images/logo2.png" alt=" " /><h1>baiHoo<span></span></h1></a>
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

<div class="header-bottom-w3ls">
    <div class="container">
        <div class="col-md-6 navigation-agileits">
            <nav class="navbar navbar-default">
                <div class="navbar-header nav_2">
                    <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                    <ul class="nav navbar-nav ">
                        <li class=" active"><a href="indexVisited" class="hyper "><span>首页</span></a></li>
                        <s:iterator var="category" value="#request.navigateCategorys" status="status">
                            <li class="dropdown ">
                                <a href="#" class="dropdown-toggle  hyper" data-toggle="dropdown" ><span>${category.name}<b class="caret"></b></span></a>
                                <ul class="dropdown-menu multi">
                                    <div class="row">
                                        <s:iterator var="category2" value="#category.subCategorys">
                                            <s:if test="#category2.subCategorys.size!=0"><!-- 一个类别中要判断它的子类不能为0，否则会重复创建前台标签体会影响外观布局  -->
                                                <div class="col-sm-4">
                                                    <ul class="multi-column-dropdown">
                                                        <s:iterator var="category3" value="#category2.subCategorys">
                                                            <li><a href="showCategoryRelateProductAction?categoryId=${category3.cid}" categoryId="${category3.cid}"><i class="fa fa-angle-right" aria-hidden="true"></i>${category3.name}</a></li>
                                                        </s:iterator>
                                                    </ul>
                                                </div>
                                            </s:if>
                                        </s:iterator>
                                        <div class="col-sm-4 w3l">
                                            <a href="javascript:;"><img src="${pageContext.request.contextPath}/foregroundPlug/images/menu${status.count}.png" class="img-responsive" alt=""></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                        </s:iterator>
                        <li><a href="aboutUsAction" class="hyper"><span>关于</span></a></li>
                        <li><a href="javascript:;" class="hyper"><span>联系我们</span></a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <script>
            $(document).ready(function(){
                $(".dropdown").hover(
                        function() {
                            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
                            $(this).toggleClass('open');
                        },
                        function() {
                            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
                            $(this).toggleClass('open');
                        }
                );
            });
        </script>
        <div class="col-md-4 search-agileinfo">
            <form action="#" method="post">
                <input type="search" name="Search" placeholder="搜索产品..." required="">
                <button type="submit" class="btn btn-default search" aria-label="Left Align">
                    <i class="fa fa-search" aria-hidden="true"> </i>
                </button>
            </form>
        </div>
        <div class="col-md-1 cart-wthree">
            <div class="cart">
                <form action="shoppingCartDetailsAction" method="post" class="last">
                    <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
        <div class="col-md-1 cart-wthree">
            <div class="cart">
                <form action="shoppingCartDetailsAction" method="post" class="last">
                    <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-user" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="login">
	<div class="main-agileits">
			<div class="form-w3agile">
				<h3>登陆</h3>
				<form action="javascript:;" method="post">
					<div class="key">
						<i class="fa fa-envelope" aria-hidden="true"></i>
						<input  type="text" id="loginName" name="loginName" required="" placeholder="电子邮箱/用户名/手机号" autocomplete="off">
						<div class="clearfix"></div>
					</div>
					<div class="key">
						<i class="fa fa-lock" aria-hidden="true"></i>
						<input  type="password" id="password" name="Password" required="" placeholder="密码">
						<div class="clearfix"></div>
					</div>
					<div class="promptMessage" >用户名或密码错误</div>
			        <div style="position: relative;margin-bottom: 14px;">
			            <span><input type="checkbox" id="deadline" name="deadline" check="none" value="${1000*60*60*24*7}">&nbsp;自动登录一个星期</span>
			            <span class="prompt" style="position:relative;left:25px;color: red; display:none;">如果是在网吧请不要选中</span>
			        </div>
					<input type="submit" id="submit" value="登陆">
				</form>
			</div>
			<script type="text/javascript">
				var timeout=null;
				var deadline="";
				$("#deadline").click(function(){
					var $this=$(this);
					if($(this).attr("check")=="check"){
						deadline="";
						$(this).parent().siblings(".prompt").stop().slideUp(360);
						$(this).attr("check","none");
						if(timeout!=null){
							window.clearTimeout(timeout);
						}
					}else{
						deadline=$(this).val();
						$(this).parent().siblings(".prompt").stop().slideDown(360);
		            	$(this).attr("check","check");
		            	timeout=window.setTimeout(startPrompt,3000);
					}
	            })
	            function startPrompt(){
	            	$("#deadline").parent().siblings(".prompt").stop().slideUp(360);
	            }
	            
	            $("#submit").click(function(){
	            	var loginName = $("#loginName").val();
	            	var password = $("#password").val();
	            	if(loginName==null || password==null){
	            		return;
	            	}
	            	var url = "userLogonAction";
	            	var args="loginName="+loginName+"&password="+password+"&deadline="+deadline+"&time="+new Date();
	            	$.post(url, args , function(data){
	            		var feedback = eval("("+data+")");
	            		if(feedback.message=="yes"){
	            			window.location.href="indexVisited";
	            		}else{
	            			$(".promptMessage").slideDown(360);
	            			setTimeout(function(){
	            				$(".promptMessage").slideUp(360);	
	            			},2000)
	            		}
	            	})
	            })
            </script>
			<div class="forg">
				<a href="#" class="forg-left">忘记了密码？</a>
				<a href="entryRegisterAction" class="forg-right">会员注册</a>
			<div class="clearfix"></div>
			</div>
		</div>
	</div>
<!-- newsletter -->
<div class="newsletter">
    <div class="container">
        <div class="col-md-6 w3agile_newsletter_left">
            <h3>简讯</h3>
            <p>baiHong 时装店，网上经营，在成都市也分布实体店经营。我们提供优质的服务，上门送货！</p>
        </div>
        <div class="col-md-6 w3agile_newsletter_right">
            <form action="#" method="post">
                <input type="email" name="Email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
                <input type="submit" value="预定会员" />
            </form>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
</body>
</html>