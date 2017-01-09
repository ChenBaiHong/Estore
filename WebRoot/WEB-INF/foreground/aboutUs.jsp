<%--
  Created by IntelliJ IDEA.
  User: ChenBaiHong
  Date: 10/23/2016
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
        .shoppingCart{background: rgba(225,225,225,1);border: none;height: 250px;width: 400px;position: fixed;top: 10%;left: 55%;
            box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 1);border-radius: 3px;display:none;
        }
        .shoppingCart h3{position:relative;top:9px;}
        .shopItem{height: 25px;line-height: 25px;text-align: center;position:relative;top:5px;margin:5 0;}
        .shopItemName{width:37.3%;float:left;font-size:20px;overflow:hidden;height:25px;}
        .shopItemQuantity{width:13.3%;float:left;}
        .shopItemQuantity input{width:50px;height:100%;border:none; text-align:center;
            box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.3);border-radius: 3px;
        }
        .shopItemPrice{width:46.3%;float:left;font-size:20px;}
        .shopItemPrice i{font-size: 25px;position:absolute; right:166px;cursor:pointer;}
        .shopItemPrice span{ left: 1px;position: relative;}
        .totalPrice div{width:56%;float:left;font-size:20px;font-weight:bold;position:relative;left:23px;bottom:-9px;}
        .totalPrice i{font-size: 25px;position:relative; margin:0 15;}
        .totalPrice input{background: transparent;border: none;width: 125px;}

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

<!-- 导航栏 -->
<div class="header-bottom-w3ls">
	<div class="container">
		<div class="col-md-5 navigation-agileits">
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
		<div class="col-md-2 cart-wthree" style="min-width:156px;">
			<div >
				<div class="logonUser" style="cursor:pointer;">
					<i class="fa fa-user" aria-hidden="true"></i><span
					style="font-size: 16px;font-weight: bold;padding: 5px;color: #561e9d;box-shadow: inset 0px 0px 10px rgba(225,225,225,0.07), 0px 0px 15px rgba(0,0,0,0.5);
					border-radius: 50px;margin-left: 5px;">${sessionScope.user!=null ? sessionScope.user.username : "未登录"}</span>
				</div>
				<s:if test="#session.user!=null">
				<div class="userLogon" style="display:none;position: absolute;background: white;min-width: 200px;min-height: 96px;border-radius: 5px;margin-top: 5px;
					box-shadow: inset 0px 0px 10px rgba(255,255,255,0.5), 0px 0px 15px rgba(75,75,75,0.3);z-index:1;">
					<div>
						<div style="width: 84%;margin-left: 15%;">
							<p style="font-weight: bolder;padding-top: 5px;">${sessionScope.user.username}</p>
							<p style="color:#c2c2c2;">${sessionScope.user.email}</p>
							<a href="userProfileAction?id="${user.id}>我的信息</a>
						</div>
					</div>
					<div style="text-align: center;border-top-style: solid;border-top-width: 0.5px;border-top-color: #dddddd;font-weight:bolder;"><a href="javascript:;" class="logout">注 销</a></div>
				</div>
				</s:if>
				<s:else>
				<div class="userLogon" style="display:none;position: absolute;background: white;min-width:120px;min-height: 50px;border-radius: 5px;margin-top: 5px;
					box-shadow: inset 0px 0px 10px rgba(255,255,255,0.5), 0px 0px 15px rgba(75,75,75,0.3);z-index:1;">
					<div style="text-align: center; margin-top: 5px;">
						<a style="display: block;font-weight: bold;" href="userGoLogonAction">登 陆</a>
					</div>
					<div style="text-align: center;border-top-style: solid; border-top-width: 0.5px;border-top-color: #dddddd;">
						<a style="display:block ; font-weight:bolder;" href="entryRegisterAction">注 册</a>
					</div>
				</div>
				</s:else>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<script type="text/javascript">
		$(".logout").click(function(){
		 	var url="userLogoutAction";
		 	var args="time="+new Date();
		 	$.post(url , args , function(data){
		 		var feedback = eval("("+data+")");
		 		if(feedback!=undefined && feedback.message=="yes"){
		 			window.location.href="indexVisited";
		 		}
		 	});
		})
		$(".logonUser").click(function(){
			var judge = $(".userLogon").attr("check");
			if(judge=="false" || judge==undefined){
				$(".userLogon").show();
				$(".userLogon").attr("check","true");
			}else{
				$(".userLogon").hide();
				$(".userLogon").attr("check","false");
			}
		});
		$(".userLogon").mouseleave(function(){
			$(this).hide();
			$(".userLogon").attr("check","false");
		})
	</script>
</div>
<!-- //导航栏 -->

<div class="sub-banner">
    <div class="flexslider mainslide" style="position: absolute;top: 0px;z-index: -1;height: 580px;overflow: hidden;">
        <ul class="slides">
            <s:iterator var="iconName" value="#request.background.imgUrlList">
                <li>
                    <div>
                        <img src="showProductImgAction?id=${background.id}&iconurl=${iconName}" style="min-height:580px;"/>
                    </div>
                </li>
            </s:iterator>
        </ul>
    </div>
</div>
<!--flex slider-->
   <script defer src="${pageContext.request.contextPath}/foregroundPlug/js/jquery.flexslider.js"></script>
   <script>
       // Can also be used with $(document).ready()
       $(window).load(function() {
           $('div.flexslider').flexslider({
	          slideshowSpeed: 3000, // 自动播放速度毫秒
	          pauseOnHover: true
	       });
	      $("ol.flex-control-thumbs").hide();
       });
   </script>
<!--flex slider-->
<div class="about">
    <div class="container">
        <h3>关于 我们</h3>
        <div class="about-info">
            <div class="col-md-8 about-grids">
                <h4>我们的新品集合</h4>
                <p>春季秋款新品上市，火热促销中</p>
                <div class="about-w3ls-row">
                <script type="text/javascript">
						 $(window).load(function() {
							$("#flexiselDemo3").flexisel({
								visibleItems:2,
								animationSpeed: 1000,
								autoPlay: false,
								autoPlaySpeed: 3000,    		
								pauseOnHover: true,
								enableResponsiveBreakpoints: true,
								responsiveBreakpoints: { 
									portrait: { 
										changePoint:480,
										visibleItems:2
									}, 
									landscape: { 
										changePoint:640,
										visibleItems:2
									},
									tablet: { 
										changePoint:768,
										visibleItems:2
									}
								}
							});
							
						});
				</script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/foregroundPlug/js/jquery.flexisel.js"></script> 
                    <ul id="flexiselDemo3">
                    	<s:iterator var="imgName" value="#request.containNew.imgUrlList">
                        <li>
                            <img src="showProductImgAction?id=${containNew.id}&iconurl=${imgName}" class="img-responsive" alt="" />
                        </li>
                    	</s:iterator>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="col-md-4 about-grids">
                <h4>我们 优势</h4>
                <div class="pince">
                    <div class="pince-left">
                        <h5>01</h5>
                    </div>
                    <div class="pince-right">
                        <p>匠心独造打造国际知名品牌</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="pince">
                    <div class="pince-left">
                        <h5>02</h5>
                    </div>
                    <div class="pince-right">
                        <p>我们的诚诺就是我们的服务</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="pince">
                    <div class="pince-left">
                        <h5>03</h5>
                    </div>
                    <div class="pince-right">
                        <p>因为专注，所以我们更专业</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="pince">
                    <div class="pince-left">
                        <h5>04</h5>
                    </div>
                    <div class="pince-right">
                        <p>柏宏高端品牌奢侈店</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>

<!-- //about -->
<!-- about-bottom -->
<div class="about-bottom" style="background: url(${pageContext.request.contextPath}/backgroundPlug/AddRole/images/9.jpg) no-repeat 0px 0px;
    background-size: cover;padding: 100px 0;background-attachment: fixed;">
    <div class="container">
        <h3> 折扣 <span>50%</span></h3>
        <h4>女士配饰</h4>
        <a href="Jewellery.html">Shop Now</a>
    </div>
</div>
<!-- //about-bottom -->
<!--team-->
<div class="team" id="team">
    <div class="container">
        <h3>我们的团队</h3>
        <div class="team-grids">
        	<s:iterator var="manager" value="#request.adminList">
            <div class="col-md-3 team-grid">
                <div class="team-img">
                    <img src="${pageContext.request.contextPath}/AdminServlet.servlet?method=showAdminHead&adminId=${manager.id}" class="img-responsive" alt=" " />
                    <figcaption class="overlay">
                        <div class="social-icon">
                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        </div>
                    </figcaption>
                </div>
                <h4>${manager.adminname}</h4>
                <h5>${manager.description}</h5>
            </div>
            </s:iterator>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--team-->

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
<!-- //newsletter -->
<div class="footer">
    <div class="container">
        <div class="col-md-3 footer-grids fgd1">
            <a href="index.html"><img src="${pageContext.request.contextPath}/foregroundPlug/images/logo2.png" alt=" " /><h3>时尚购<span></span></h3></a>
            <ul>
                <li>1234k 青羊区, 4号 街区,</li>
                <li>成都市.</li>
                <li><a href="mailto:info@example.com">2264828608@qq.com</a></li>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
            </ul>
        </div>
        <div class="col-md-3 footer-grids fgd2">
            <h4>详情信息</h4>
            <ul>
                <li><a href="contact.html">联系 我们</a></li>
                <li><a href="icons.html">友情 链接</a></li>
                <li><a href="typography.html">时装 设计</a></li>
                <li><a href="faq.html">其 他</a></li>
            </ul>
        </div>
        <div class="col-md-3 footer-grids fgd3">
            <h4>商 品</h4>
            <ul>
                <li><a href="jewellery.html">珠宝 饰品</a></li>
                <li><a href="cosmetics.html">化 妆 品</a></li>
                <li><a href="Shoes.html">鞋 子</a></li>
                <li><a href="deos.html">其 他</a></li>
            </ul>
        </div>
        <div class="col-md-3 footer-grids fgd4">
            <h4>我的账户</h4>
            <ul>
            	<li><a href="userGoLogonAction">会员 登陆</a></li>
				<li><a href="entryRegisterAction">会员 注册</a></li>
                <li><a href="recommended.html"> 推 荐  </a></li>
                <li><a href="payment.html"> 支 付 </a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
        <p class="copy-right">2016.BaiHong DreamWorker<a target="_blank" href="http://sc.chinaz.com/moban/">柏宏梦想创作</a></p>
    </div>
</div>
</body>
</html>