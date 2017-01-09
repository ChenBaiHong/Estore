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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/inlineConsultPlug/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/font-awesome.min.css" type="text/css" media="all" />
	<style type="text/css">
		.w3ls_dresses_grid_left_grid_sub ul li{
			margin:0px;
		    float: left;
		    padding: 10px;
		    background: rgba(0,0,0,0.2);
		    font-weight: bold;
		    margin-left: 20px;
		    color:black;
		    margin-top:5px;
		}
		.w3ls_dresses_grid_left_grid h3{
		    font-size: 22px;
		    margin-bottom: 15px;
		}
		#buyQuantity{
		    width: 69px; height: 36px;position: relative;text-align:center; font-weight:bold; font-size:19px; border:none;
		    box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 1);          	
		}
		.immediateBuy{
		    width: 28%;
		    font-weight: 300;
		    padding: 0.6em 0;
		    -webkit-transition: .5s all;
		    -moz-transition: .5s all;
		    -o-transition: .5s all;
		    -ms-transition: .5s all;
		    transition: .5s all;
		    display: inline-block;
		    background: #b31d04;
		    outline: none;
		    border: 1px solid #b31d04;
		    color: #fff;
		}.immediateBuy:hover{
		    background: #ff6600;
		    border-color:#ff6600;
		}
		.promptMessage {
		    display: inline-block;
		    position: relative;
		    margin: 5px;
		    margin-left:0px;
		    padding: 5px;color:#b31d04;
		    box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 1);   
		}

	</style>
	<!--// css -->

    <script src="${pageContext.request.contextPath}/backgroundPlug/easyformPlug/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/inlineConsultPlug/js/myConsult.js"></script>
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
       $(window).resize(function(){
       	//$(".promptMessage").css("left","43.5%");
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

<div class="products">
    <div class="container">
        <div class="single-page">
            <div class="single-page-row" id="detail-21">
                <div class="col-md-6 single-top-left">
                    <div class="flexslider">
                        <ul class="slides">
                        	<s:iterator var="iconName" value="#request.product.imgUrlList">
                            <li data-thumb="showProductImgAction?id=${product.id}&iconurl=${iconName}">
                                <div class="thumb-image detail_images"> <img src="showProductImgAction?id=${product.id}&iconurl=${iconName}" data-imagezoom="true" class="img-responsive" alt=""> </div>
                            </li>
                            </s:iterator>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 single-top-right">
                    <h3 class="item_name"> ${product.name}</h3>
                    <p> </p>
                    <div class="single-rating">
                        <ul>
                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                            <li class="rating">20 评论 </li>
                            <li><a href="#">联系客服</a></li>
                        </ul>
                    </div>
                    <div class="single-price">
                        <ul>
                            <li style="color:#b31d04;">限时促销 ￥${product.salePrice}</li>
                            <li><del><fmt:formatNumber value="${product.salePrice*1.1}" pattern="#0.00"/></del></li>
                            <li><span class="w3off">优惠 10%</span></li>
                            <li><a href="#"><i class="fa fa-gift" aria-hidden="true"></i>优惠券</a></li>
                            <li><a href="#"><i class="fa fa-th-list" aria-hidden="true"></i>库存 ${product.quantity} 件</a></li>
                        </ul>
                    </div>
                    <div class="w3ls_dresses_grid_left_grid" >
						<h3>选择颜色</h3>
						<div class="w3ls_dresses_grid_left_grid_sub" style="width:90%;padding:0px; border:none;">
							<div class="ecommerce_color" selectColor="">
								<ul>
									<s:iterator var="mycolor" value="#request.colorList">
									<li style="float:left;" categoryId="${mycolor.cid}"><i style="background:white"></i>${mycolor.name}</li>
									</s:iterator>
									<br style="clear:both;"/>
								</ul>
							</div>
						</div>
					</div>
                    <div class="w3ls_dresses_grid_left_grid" >
						<h3>选择尺码</h3>
						<div class="w3ls_dresses_grid_left_grid_sub" style="width:90%;padding:0px; border:none;">
							<div class="ecommerce_size" selectSize="">
								<ul>
									<s:iterator var="myModel" value="#request.modelCategoryList">
									<li style="float:left;" categoryId="${myModel.cid}"><i style="background:white"></i>${myModel.name}</li>
									</s:iterator>
									<br style="clear:both;"/>
								</ul>
							</div>
						</div>
					</div>
                    <div class="w3ls_dresses_grid_left_grid" >
						<h3>购买数量</h3>
						<div class="w3ls_dresses_grid_left_grid_sub" style="width:90%;padding:0px; border:none;">
							<div class="ecommerce_quantity">
								<div style="float: left;cursor: pointer;text-align: center;background: dodgerblue; padding: 5px;font-size: 25px;" class="quantityMinus">
									<a href="javascript:;" style="color: white;">－</a>
								</div>
								<div style="float:left;">
									<input type="text" id="buyquantity" value="1"style="color:black" disabled="disabled"/>
								</div>
								<div style="float: left;cursor: pointer;text-align: center;background: dodgerblue;padding: 5px;font-size: 25px;"  class="quantityPlus">
									<a href="javascript:;" style="color: white;">＋</a>
								</div>
								<br style="clear:both;"/>
							</div>
						</div>
					</div>
                    <p class="single-price-text"></p>
                    <form action="javascript:;" method="post">
						<input type="hidden" name="productId" value="${product.id}" />
						<input type="hidden" name="productQuntity" productId="${product.id}" value="1" />
						<input type="hidden" name="productName" value="${product.name}" />
						<input type="hidden" name="productPrice" value="${product.salePrice}" />
						<button type="submit" class="w3ls-cart addShoppingItem" style="margin-top:5px;"><i class="fa fa-cart-plus" aria-hidden="true"></i>添加购物车</button>
						<button type="submit" class="immediateBuy" style="margin-top:5px;"><i class="fa fa-cny" aria-hidden="true"></i>立即购买</button>
					</form>
                    <button class="w3ls-cart w3ls-cart-like" style="margin-top:5px;margin-left:0px"><i class="fa fa-heart-o" aria-hidden="true"></i> 添加最爱</button>
                	<h4 class="promptMessage">
						亲! 请选择颜色和尺码哦(⊙o⊙)!
					</h4>
                </div>
                
                <div class="clearfix"> </div>
            </div>
        </div>

        <!-- collapse-tabs -->
        <div class="collpse tabs">
            <h3 class="w3ls-title">关于宝贝</h3>
            <div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <i class="fa fa-file-text-o fa-icon" aria-hidden="true"></i>图文 描述 <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                        	<ul style="list-style:none">
                        		<s:iterator var="paramImg" value="#request.product.imgParamList" status="status">
                                 <li style="float:left;" >
                                     <img src="showProductImgAction?id=${product.id}&iconurl=${paramImg}" >
                                 </li>
                               </s:iterator>
                               <div style="clear:both;"></div>
                        	</ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <i class="fa fa-check-square-o fa-icon" aria-hidden="true"></i> 评论(无)<span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //collapse -->
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function () {
		//选中产品大小处理结果
        $(".ecommerce_size ul").find("li").click(function(){
        	var categoryId = $(this).attr("categoryId");
        	var colorCId = $(".ecommerce_color").attr("selectColor");
        	if(categoryId.trim().length!=0){
        		$(".ecommerce_size").attr("selectSize",categoryId);
        		$(".ecommerce_size ul").find("li").css({"background":"rgba(0,0,0,0.2)","color":"black"});
        		$(this).css({"background":"rgba(0,0,0,0.6)","color":"white"});
        		$("#quantity").val("1");
        	}
        	if(colorCId.trim().length!=0){
        		$(".promptMessage").slideUp(360);
        	}else{
        		$(".promptMessage").slideDown(360);
        	}
        })
         //选中产品颜色处理结果
        $(".ecommerce_color ul").find("li").click(function(){
        	var categoryId = $(this).attr("categoryId");
        	var sizeCId = $(".ecommerce_size").attr("selectSize");
        	if(categoryId.trim().length!=0){
        		$(".ecommerce_color").attr("selectColor",categoryId);
        		$(".ecommerce_color ul").find("li").css({"background":"rgba(0,0,0,0.2)","color":"black"});
        		$(this).css({"background":"rgba(0,0,0,0.6)","color":"white"});
        		$("#quantity").val("1");
        	}
        	if(sizeCId.trim().length!=0){
        		$(".promptMessage").slideUp(360);
        	}else{
        		$(".promptMessage").slideDown(360);
        	}
        })
        //购物项中点击 减去购买数量
        $(".quantityMinus").click(function(){
        	var oldVal = parseInt($("#buyquantity").val());
        	if(oldVal>1){
        		var buyQuantity = oldVal-1;
        		$("#buyquantity").val(buyQuantity);
        	}
        })
        //购物项中点击 增加购买数量
        $(".quantityPlus").click(function(){
        	var oldVal = parseInt($("#buyquantity").val());
        	if(oldVal==5){
        		return;
        	}
       		var buyQuantity = oldVal+1;
       		$("#buyquantity").val(buyQuantity);
        });
        //添加购物项到购物车
        $("button.addShoppingItem").click(function(){
        	var buyQuantity = parseInt($("#buyquantity").val());
        	buyQuantityMinusAndPlus(buyQuantity);
        })
        function buyQuantityMinusAndPlus(buyQuantity){
        	//1.点击时判断颜色和尺寸产品是否被选中
        	var sizeCId = $(".ecommerce_size").attr("selectSize");
        	var colorCId = $(".ecommerce_color").attr("selectColor");
        	var productId = $('input[name=productId]').val();
        	if(sizeCId.trim().length!=0 && colorCId.trim().length!=0 && productId.trim().length!=0){
        		if(buyQuantity<=0){
        			return;
        		}else{
        			var url = "additionShoppingItemAction"
		            var args="buyQuantity="+buyQuantity+"&productId="+productId+"&colorCId="+colorCId+"&sizeCId="+sizeCId+"&time="+new Date();
		            $.post(url , args , function(data){
		            	var  message =eval("("+data+")");
		            	if(message.shoppingCart == "yes"){
		            		$("#quantity").val(buyQuantity);
	            			$(".promptMessage").text("亲! 已添加购物车成功!")
	            			$(".promptMessage").slideDown(260);
	            			setTimeout(function(){
	            				$(".promptMessage").slideUp(360);
	            				$(".promptMessage").text("亲! 请选择颜色和尺码哦(⊙o⊙)!");
	            			},3000);
		            	}
		            })
        		}
        	}else{
        		$(".promptMessage").slideDown(360);
        	}
        }
	});
</script>
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
<!-- overly 覆盖页面 -->
<div class="md2-overlay" style="background:transparent;position: fixed;height: 100%;width: 100%;top: 0px;display:none"></div><!-- the overlay element -->
<!-- //overly 覆盖页面 -->
<!-- 在线服务代码 开始 -->
<div class="main-im">
	<div id="open_im" class="open-im">&nbsp;</div>
	<div class="im_main" id="im_main">
		<div id="close_im" class="close-im"><a href="javascript:void(0);" title="点击关闭">&nbsp;</a></div>
		<a href="javascript:;" target="_blank" class="im-qq qq-a QQInline" title="在线QQ客服">
			<div class="qq-container"></div>
			<div class="qq-hover-c"><img class="img-qq" src="${pageContext.request.contextPath}/inlineConsultPlug/images/qq.png"></div>
			<span> QQ在线咨询</span>
		</a>
		<div class="im-tel">
			<div>售前咨询热线</div>
			<div class="tel-num">13678005440</div>
			<div>售后咨询热线</div>
			<div class="tel-num">13678005440</div>
		</div>
		<div class="im-footer" style="position:relative">
			<div class="weixing-container">
				<div class="weixing-show">
					<div class="weixing-txt">微信扫一扫<br>关注时尚购物</div>
					<img class="weixing-ma" src="${pageContext.request.contextPath}/inlineConsultPlug/images/img.png">
					<div class="weixing-sanjiao"></div>
					<div class="weixing-sanjiao-big"></div>
				</div>
			</div>
			<div class="go-top"><a href="javascript:;" title="返回顶部"></a> </div>
			<div style="clear:both"></div>
		</div>
	</div>
</div>
<section class="main-chatBox" style="position:fixed;display:none;width:700px;height:577px;">
	<div class="hander">
		<h3 style="cursor: move;border-radius:5px;background: #72d0eb;padding: 6 0 7 0;position: absolute;width: 100%;-webkit-border-bottom-left-radius:0px;-webkit-border-bottom-right-radius:0px;">咨询客服</h3>
		<span class="handlerClose" style="position: absolute;font-size: 40px;right: 0px;z-index: 2;background: #dddddd;padding: 0 5;color:white;-webkit-border-top-right-radius: 5px;cursor: pointer;"><i class="fa  fa-times"></i></span>
	</div>
    <iframe class="handlderBox" style="width:100%;height:577px;border:none;border-radius:5px;" src="customerServiceConsultAction?userName=${sessionScope.user.username}&userId=${sessionScope.user.id}"></iframe>
</section>
<!-- 在线服务代码 结束 -->
<!-- 动态拖拽js -->
	<script src="${pageContext.request.contextPath}/foregroundPlug/js/drag.js"></script>
	<script type="text/javascript">
		$(function(){
			//开始客服拖拽
			$('.main-chatBox').each(function(){
				$(this).dragging({
					move : 'both',
					randomPosition : true ,
					hander:'.hander'
				});
				$('.main-chatBox').parent().css({"overflow":"auto"});
				var widthW = parseInt(document.body.clientWidth);
				var widthB = parseInt($('.main-chatBox').width());
				var heightW = parseInt(document.body.clientHeight);
				var heightB = parseInt($('.main-chatBox').height());
				var d_valueW = widthW-widthB;
				var d_valueH = heightW-heightB;
				$('.main-chatBox').css({"position":"fixed","top":""+(heightW<=heightB ? 0 :(d_valueH/2))+"px","left":""+(widthW<=widthB ? 0 :(d_valueW/2))+"px","zIndex":"999"});
			}); 
			$(window).resize(function(){
				$('.main-chatBox').each(function(){
					$(this).dragging({
						move : 'both',
						randomPosition : true ,
						hander:'.hander'
					});
					$('.main-chatBox').parent().css({"overflow":"auto"});
					var widthW = parseInt(document.body.clientWidth);
					var widthB = parseInt($('.main-chatBox').width());
					var heightW = parseInt(document.body.clientHeight);
					var heightB = parseInt($('.main-chatBox').height());
					var d_valueW = widthW-widthB;
					var d_valueH = heightW-heightB;
					$('.main-chatBox').css({"position":"fixed","top":""+(heightW<=heightB ? 0 :(d_valueH/2))+"px","left":""+(widthW<=widthB ? 0 :(d_valueW/2))+"px","zIndex":"99"});
				}); 
			})
			//结束客服拖拽
			$(".QQInline").click(function(){
				$(".md2-overlay").show();
				$('.main-chatBox').show(360);
			});
			$(".handlerClose").click(function(){
				$(".md2-overlay").hide();
				$('.main-chatBox').hide(360);
				//开始获取iframe中的元素并关闭
				$("#iframeBox").contents().find("button.md-close").trigger("click");
				//结束获取iframe中的元素并关闭
			});
		})
	</script>
</body>
</html>