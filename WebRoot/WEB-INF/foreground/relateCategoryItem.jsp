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
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/inlineConsultPlug/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/font-awesome.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/MyStyle/relateCategoryStyle.css" type="text/css" media="all" />
    <style type="text/css">
        
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
    </script>
    <!--flex slider-->

    <script src="${pageContext.request.contextPath}/foregroundPlug/js/imagezoom.js"></script>
    <!-- //js -->

</head>

<body>
<div class="header-top-w3layouts">
    <div class="container">
        <div class="col-md-6 logo-w3">
            <a href="#"><img src="${pageContext.request.contextPath}/foregroundPlug/images/logo2.png" alt=" " />
            	<h1 style="left:30px;">baiHoo</h1>
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
		$(".userLogon").parent().mouseleave(function(){
			$(this).find(".userLogon").hide();
			$(".userLogon").attr("check","false");
		})
	</script>
</div>
<!-- //导航栏 -->
<div class="parcelHidden">
	<div class="myScrollDiv" >
	  	<div class="pull" style="position:absolute;">
			<h3><i class="fa fa-arrow-circle-o-right" style="color:wheat;"></i></h3>
			<form action="javascript:;" style="display:none;">
				<!-- 当前页导航头的下拉选项的id,第一次网页跳转过来就有 -->
				<input type="text" value="${request.categoryId}" id="navCategoryId"/>
			</form>
		</div>
		<s:iterator var="subdivis" value="#request.subdivisCatevoryList">
		<div class="w3ls_dresses_grid_left_grid test">
			<h3>${subdivis.name}</h3>
				<div class="w3ls_dresses_grid_left_grid_sub" style="width:90%;">
					<div class="myEcommerce_style myEcommerce_color">
						<ul>
						<s:iterator var="continueSubdivis" value="#subdivis.subCategorys">
						<li style="float:left;margin-left:8px;"><a href="javascript:;" style="color:white;" categoryId="${continueSubdivis.cid}"><i style="background:white"></i>${continueSubdivis.name}</a></li>
						</s:iterator>
						<br style="clear:both;"/>
						</ul>
					</div>
			 </div>
		</div>
		</s:iterator>
		<div class="w3ls_dresses_grid_left_grid">
			<h3>款式 尺码</h3>
			<div class="w3ls_dresses_grid_left_grid_sub" style="width:90%;">
				<div class="myEcommerce_style myEcommerce_size">
					<ul>
						<s:iterator var="myModel" value="#request.modelCategoryList">
						<li style="float:left;margin-left:8px;"><a href="#"style="color:white;" categoryId="${myModel.cid}"><i style="background:white"></i>${myModel.name}</a></li>
						</s:iterator>
						<br style="clear:both;"/>
					</ul>
				</div>
			</div>
		</div>
		<div class="w3ls_dresses_grid_left_grid" style="padding-bottom:1.5em;">
			<h3>价格 区间</h3>
			<div class="w3ls_dresses_grid_left_grid_sub" style="width:90%;">
				<div class="ecommerce_price">
					<div style="float:left;">
						<input type="text" id="lowPrice"style="color:black"/>
					</div>
					<div style="float:left;">
						<i class="fa fa-arrows-h" style="font-size: 25px;padding: 5px;"></i>
					</div>
					<div style="float:left;">
						<input type="text" id="heightPrice" style="color:black"/>
					</div>
					<br style="clear:both;"/>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="content" id="content" style="min-height:800px; padding:0px;">
	<div id="container" style="position:absolute;z-index:-1;width:100%;">
		<div class="anitOut" id="anitOut" style="width:100%;min-height:800px;"></div>
		
	</div>
    <div class="container main-Containers" style="width:1280px;padding-top:80px;padding-bottom:50px;">
        <div class="col-lg-15 col-sm8">
            <div class="women-set1">
            	<s:iterator var="product" value="#request.productList" status="status">
                <div class="col-md-3 women-grids wp1 animated wow slideInUp" data-wow-delay=".5s">
                    <a href="singleProductProfileAction?productId=${product.id}"><div class="product-img">
                        <img src="showProductImgAction?id=${product.id}&iconurl=${product.firstImgUrl}" alt="" />
                        <div class="p-mask">
                            <form action="javascript:;" method="post">
                                <input type="hidden" name="productId" value="${product.id}" />
								<input type="hidden" name="productQuntity" productId="${product.id}" value="1" />
								<input type="hidden" name="productName" value="${product.name}" />
								<input type="hidden" name="productPrice" value="${product.salePrice}" />
                                <button type="submit" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>添加购物车</button>
                            </form>
                        </div>
                    </div></a>
                    <i class="fa fa-star yellow-star" aria-hidden="true"></i>
                    <i class="fa fa-star yellow-star" aria-hidden="true"></i>
                    <i class="fa fa-star yellow-star" aria-hidden="true"></i>
                    <i class="fa fa-star yellow-star" aria-hidden="true"></i>
                    <i class="fa fa-star gray-star" aria-hidden="true"></i>
                    <h4>${product.name}</h4>
					<h5>￥${product.salePrice}</h5>
                </div>
                </s:iterator>
            	
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!--  开始分页的排版-->
 <div class="pagination" id="pagination" style="">
 	<div style="height:20px;text-align:center;background:#19a2de;color:white;font-weight:bolder;font-size:22px;"></div>
	<div class="paging" style="">
		<div class="section recordPage"style="">
           	<ul>
	           	<li style="color:white;pointer-events:none;"><span class="currentPage">1</span> / <span class="totalPage">12</span></li>
	           	<li style=""><a href="javascript:;" class="current" style="font-weight:bolder;">←</a></li>
           		<li style=""><a href="javascript:;" class="current">1</a></li>
           		<li style=""><a href="javascript:;" class="current">2</a></li>
           		<li style=""><a href="javascript:;" class="current">3</a></li>
           		<li style=""><a href="javascript:;" class="current" style="font-weight:bolder;" >→</a></li>
	           	<li style="background:transparent;">
		           	<input   type="text" name="gotoNum" id="gotoNum" placeholder="goto" class="placeholder" autocomplete="off" />
           		    <input  type="submit" id="goto"  value="go" />
	           		<br style="clear:both;"/>
	           	</li>
	            <br style="clear:both;"/>
           	</ul>  
		</div>
	</div>   	
</div>
<!--  结束分页的排版-->	        
<script type="text/javascript">
    $(document).ready(function () {
		//开始购物车选项
        $("button.w3ls-cart").click(function(){
            var $this=$(this);
            //1. 显示购物车
            $(".md-overlay").show();
            $(".shoppingCart").show(260);
            //2. 获取购物产品的id给购物项
            var productId = $(this).siblings("input[name=productId]").val();
            $('#shoppingProduct').val(productId);
            //3. 异步获取数据显示该产品的基本信息
            var url = "singleShoppingItemProfile";
            var args = "productId="+productId;
            $.post(url , args , function(data){
            	var shoppingItemParam = eval("("+data+")");
            	var product = shoppingItemParam.product;
            	$(".shopItem").find(".showImg").css({"background":"url(showProductImgAction?id="+product.id+"&iconurl="+product.firstImgUrl+")","background-size":"cover"});
            	$(".shopItem").find("strong").text("￥ "+product.salePrice);
            	$(".shopItem").find(".salePrice").find("input").val(product.salePrice);
            	$(".shopItem").find(".productName").text(product.name);
            	$(".shopItem").find(".repertory").find("span").text(product.quantity);
            	//展现总价格
            	$(".totalPrice .showPrice").val(product.salePrice);
            	var colorList = shoppingItemParam.colorList;
            	var sizeList = shoppingItemParam.sizeList;
            	//alert(colorList[0].name);
            	var colorLiNode = $(".myColor .ecommerce_color ul li");
            	//克隆出一个颜色节点
            	var colorLi = $(colorLiNode[0]).clone(true);
            	//去除老的节点，添加第一个克隆节点
            	$(".myColor .ecommerce_color ul").html("");//在第一个的基础上进行复制克隆包括事件
            	colorLi.hide();//第一个隐藏
            	$(".myColor .ecommerce_color ul").append(colorLi);
            	
            	for(var i = 0 ; i<colorList.length; i++){
            		var color = colorList[i];
            		colorLi = $(colorLiNode[0]).clone(true);//继续克隆
            		colorLi.attr("categoryId" , color.cid);
            		colorLi.text(color.name);
            		colorLi.show();//往后的显示
            		$(".myColor .ecommerce_color ul").append(colorLi);
            	}
            	 //选中产品颜色处理结果
		        $(".ecommerce_color ul").find("li").click(function(){
		        	var categoryId = $(this).attr("categoryId");
		        	var sizeCId = $(".ecommerce_size").attr("selectSize");
		        	if(categoryId.trim().length!=0){
		        		$(".ecommerce_color").attr("selectColor",categoryId);
		        		$(".ecommerce_color ul").find("li").css({"background":"rgba(0,0,0,0.1)","color":"black"});
		        		$(this).css({"background":"#58c9f3","color":"white"});
		        		$("#quantity").val("1");
		        	}
		        	
		        })
            })
        });
        //选中产品大小处理结果
        $(".ecommerce_size ul").find("li").click(function(){
        	var categoryId = $(this).attr("categoryId");
        	var colorCId = $(".ecommerce_color").attr("selectColor");
        	if(categoryId.trim().length!=0){
        		$(".ecommerce_size").attr("selectSize",categoryId);
        		$(".ecommerce_size ul").find("li").css({"background":"rgba(0,0,0,0.1)","color":"black"});
        		$(this).css({"background":"#58c9f3","color":"white"});
        		$("#quantity").val("1");
        	}
        	
        })
        //购物项中点击 减去购买数量
        $(".quantityMinus").click(function(){
        	var oldVal = parseInt($("#quantity").val());
        	if(oldVal>1){
        		var buyQuantity = oldVal-1;
        		$("#quantity").val(buyQuantity);
        		$(".totalPrice .showPrice").val(buyQuantity*parseFloat($(".shopItem").find(".salePrice").find("input").val()));
        	}
        })
        //购物项中点击 增加购买数量
        $(".quantityPlus").click(function(){
        	var oldVal = parseInt($("#quantity").val());
        	if(oldVal==5){
       			return;
       		}
       		var buyQuantity = oldVal+1;
       		$("#quantity").val(buyQuantity);
       		$(".totalPrice .showPrice").val(buyQuantity*parseFloat($(".shopItem").find(".salePrice").find("input").val()));
        })
        //添加购物项到购物车
        $("button.addShoppingItem").click(function(){
        	var buyQuantity = parseInt($("#quantity").val());
        	buyQuantityMinusAndPlus(buyQuantity);
        })
        function buyQuantityMinusAndPlus(buyQuantity){
        	//1.点击时判断颜色和尺寸产品是否被选中
        	var sizeCId = $(".ecommerce_size").attr("selectSize");
        	var colorCId = $(".ecommerce_color").attr("selectColor");
        	var productId = $('#shoppingProduct').val();
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
			            	//展现总价格
	            			$(".totalPrice .showPrice").val(buyQuantity*parseFloat(message.singlePrice));
	            			$(".myQuantity h4").text("亲! 已添加购物车成功!")
	            			$(".myQuantity h4").slideDown(260);
	            			setTimeout(function(){
	            				$(".myQuantity h4").slideUp(360);
	            				$(".myQuantity h4").text("亲! 请选择颜色和尺码!");
	            			},3000);
		            	}
		            })
        		}
        	}else{
        		$(".myQuantity h4").slideDown(360);
        		setTimeout(function(){
      				$(".myQuantity h4").slideUp(360);
      			},3000);
        	}
        }
        //关于购物车的覆盖隐藏
        $(".md-overlay").click(function(){
            $(".md-overlay").hide();
            $(".shoppingCart").hide(160);
            $("#quantity").val("1");
            $(".ecommerce_color ul").find("li").css({"background":"rgba(0,0,0,0.1)","color":"black"});
            $(".ecommerce_size ul").find("li").css({"background":"rgba(0,0,0,0.1)","color":"black"});
            
            $(".ecommerce_size").attr("selectSize","");
        	$(".ecommerce_color").attr("selectColor","");
        })
        //结束购物车选项
        
        
        //1开始侧边栏选项参数的显示和隐藏
   	  	$(".pull h3").mouseover(function(){
	   	 	if($(this).attr("check")=="false" || $(this).attr("check")==undefined){
	   	 		$(this).parents(".parcelHidden").stop().animate({left:0},300);
	   	 		$(this).attr("check","true");
	   	 	}
          	$(this).css("color","#72d0eb");
          });
          $(".pull h3").click(function(){
          	if($(this).attr("check")=="false" || $(this).attr("check")==undefined){
		   	 		$(this).parents(".parcelHidden").stop().animate({left:0},300);
		   	 		$(this).attr("check","true");
		   	 		$(this).css("color","#72d0eb");
		   	 	}else{
		   	 		$(".pull h3").css("color","white");
		           	$(".pull h3").attr("check","false");
		           	$(this).parents(".parcelHidden").stop().animate({left:-351},300);
		   	 	}
         	});
         	//隐藏
          $(".parcelHidden").mouseleave(function(){
          	$(".pull h3").css("color","white");
          	$(".pull h3").attr("check","false");
          	$(this).stop().animate({left:-351},300);
          });
 		  //结束侧边栏选项参数的显示和隐藏
	 	//开始——装饰分页条，与开始获取事件值
	 	
	    $(".recordPage ul li").mouseover(function(){
	    	$(".recordPage ul li").css({"padding":"0 15",})
	    }); 
	    $(".recordPage ul li").mouseout(function(){
	    	$(".recordPage ul li").css({"padding":"0 15",});
	    });
	    $("#goto").hover(
                   function() {
                       $(this).css({"background":"black","color":"white"})
                   },
                   function() {
                       $(this).css({"background":"#72d0eb","color":"white"})
                   }
           ); 
           
      //结束——装饰分页条，与开始获取事件值
      
      //开始——侧边栏包装，在固定的范围固定定位，超了某个范围就绝对定位
		var pTop = $('.parcelHidden').offset().top;
		var pHeight = $('.parcelHidden').height();;
		var pBottom=$('#pagination').offset().top;//该div顶部距离窗口的距离
	    $(window).scroll(function(e) {
			var win_s=$(window).scrollTop();
	        if((win_s+pTop+pHeight+50)>=pBottom){
				$('.parcelHidden').css({"position":"absolute","top":(pBottom-50-pHeight)+"px"});
			}else{
			 	$('.parcelHidden').css({"position":"fixed","top":pTop+"px"});
			}
	    }); 
	   //结束——侧边栏包装，在固定的范围固定定位，超了某个范围就绝对定位
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
                <li><a href="icons.html">友情 链接 </a></li>
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
<div class="md-overlay" style="background:transparent;position: fixed;height: 100%;width: 100%;top: 0px;display:none"></div><!-- the overlay element -->
<div class="md2-overlay" style="background:transparent;position: fixed;height: 100%;width: 100%;top: 0px;display:none"></div><!-- the overlay element -->
<!-- //overly 覆盖页面 -->
<!-- 在线服务代码 开始 -->
<div class="main-im">
	<div id="open_im" class="open-im">&nbsp;</div>
	<div class="im_main" id="im_main">
		<div id="close_im" class="close-im"><a href="javascript:void(0);" title="点击关闭">&nbsp;</a></div>
		<a href="javascript:;" class="im-qq qq-a QQInline" title="在线QQ客服">
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
    <iframe class="handlderBox" id="iframeBox" style="width:100%;height:577px;border:none;border-radius:5px;" src="customerServiceConsultAction?userName=${sessionScope.user.username}&userId=${sessionScope.user.id}"></iframe>
</section>
<!-- 在线服务代码 结束 -->
<!-- cart-css-->
<div class="shoppingCart" style="" >
   <div class="hander">
    <h3 style="cursor: move;width: 100%;background: #72d0eb;height: 36px;top:0px">我的购物</h3>
    <span class="handlerClose"><i class="fa  fa-times"></i></span>
   </div>
    <div>
	    <div class="showShopItem" style="background:#ECECEC;">
            <div class="shopItem" style="width:inherit;height:160px;">
            	<div class="parcelShowImg">
                	<div class="showImg" style="width:175px;height:160px;">
                </div>
                </div>
                <div class="salePrice" style="width:295px;float:left;">
                	<h4 style="text-align: left;margin: 5px;">专柜售价:</h4><strong style=""> <i class="fa fa-cny"></i>999.99</strong>
                	<input type="hidden" value=""/>
                </div>
                <div style="width: 295px;float: left;background: rgba(225,225,225,0.8);border-radius: 3px;margin: 0 10;">
                	<h3 class="productName" style="width: 100%;text-align: left;margin-left: 5px;">xiushenku</h3>
                	<div class="repertory">库存(<span style="font-size:16px;"> 999 </span>)件</div>
                </div>
                <div style="cleart:both;"></div>
            </div>
            <div class="shopItemParam" style="width:100%;float:left;">
                <div class="mySize" style="width: 85%;margin: auto;">
					<h4>选择尺码</h4>
					<div class="" style="padding:0px; border:none;">
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
				<div class="myColor" style="width: 85%;margin: auto;">
					<h4>选择颜色</h4>
					<div class=""style="padding:0px; border:none;">
						<div class="ecommerce_color" selectColor="">
							<ul>
								<li style="float:left;  margin-left:5px;" categoryId="">color</li>
								<br style="clear:both;"/>
							</ul>
						</div>
					</div>
				</div>
            </div>
            <br style="clear:both;">
        </div>
	    <div class="myQuantity" >
			<div class="" style="padding:0px; border:none;">
				<div class="ecommerce_quantity" style="display:inline-block;margin:10 25; float:right;">
					<!-- 隐藏的产品的信息记录是购买的那个产品 -->
					<input type="hidden" id="shoppingProduct" value=""/>
					
					<div style="float: left;cursor: pointer;text-align: center;background: dodgerblue; padding: 5px;font-size: 25px;" class="quantityMinus">
						<a href="javascript:;" style="color: white;">－</a>
					</div>
					<div style="float:left;position: relative;">
						<input type="text" class="quantity" id="quantity" style="color:#000000;" value="1"  disabled="disabled"/>
					</div>
					<div style="float: left;cursor: pointer;text-align: center;background: dodgerblue;padding: 5px;font-size: 25px;"  class="quantityPlus">
						<a href="javascript:;" style="color: white;">＋</a>
					</div>
					<br style="clear:both;"/>
				</div>
				<h4 style="padding: 0px;margin: 10 25;color:#ff6600;display:none;">
					亲! 请选择颜色和尺码!
				</h4>
				<br style="clear:both;"/>
			</div>
		</div>
	    <div class="totalPrice">
	        <div style="color:#b31d04;">
	            <button class="addShoppingItem"><a href="javascript:;" style="color:white">添加购物车</a></button>
	        </div>
	    </div>
	</div>
</div>
	<!-- 动态拖拽js -->
	<script src="${pageContext.request.contextPath}/foregroundPlug/js/cav.js"></script>
	<script src="${pageContext.request.contextPath}/foregroundPlug/js/getStart.js"></script>
	<script src="${pageContext.request.contextPath}/foregroundPlug/js/drag.js"></script>
	
	<script type="text/javascript">
		$(function(){
			//开始购物车拖拽
			$('.shoppingCart').each(function(){
				$(this).dragging({
					move : 'both',
					randomPosition : true ,
					hander:'.hander'
				});
				$('.shoppingCart').parent().css({"overflow":"auto"})
				$('.shoppingCart').css({"position":"fixed","top":"25%","left":"33.333%","zIndex":"999"});
			}); 
			//结束购物车拖拽
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
			//结束客服拖拽
			//开始窗口div默认的自适应参数信息
	  			//开始几何背景初始化
				$("#anitOut").children().css({"height":$("#container").parent().height()+"px"});
				//结束几何背景初始化
				
				//开始分页显示条居中
				var pWidth = $('#pagination').find(".recordPage").width();
				var wWidth = parseInt(document.body.clientWidth);
				$('#pagination').find(".recordPage").css({"left":(pWidth<wWidth ? (wWidth-pWidth)/2 : 0)+"px"});
				//结束开始分页显示条居中
				
				//开始 div.main-Containers 对窗口的自适应
				var mWidth = $(".main-Containers").width();
				if(wWidth <= mWidth){
					$(".main-Containers").css({"width":"auto"});
				}
				//结束 div.main-Containers 对窗口的自适应
			//结束窗口div默认的自适应参数信息
			$(window).resize(function(){
				//重置开始客服拖拽
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
				//重置结束客服拖拽
				
				//重置开始购物车拖拽
				$('.shoppingCart').each(function(){
					$(this).dragging({
						move : 'both',
						randomPosition : true ,
						hander:'.hander'
					});
					$('.shoppingCart').parent().css({"overflow":"auto"})
					$('.shoppingCart').css({"position":"fixed","top":"25%","left":"33.333%","zIndex":"999"});
				}); 
				//重置结束购物车拖拽
				
				 //开始几何背景重画
				 C();
				 var h = [
					["#002c4a", "#005584"],
					["#35ac03", "#3f4303"],
					["#ac0908", "#cd5726"],
					["18bbff", "#00486b"]
				 ];
				 function changeC(){J(h[2]).set();}
				 $("#anitOut").children().css({"height":($("#container").parent().height())+"px","width":($("#container").parent().width())+"px"});
				 //结束几何背景重画
				 
		  		//开始分页显示条居中
				var pWidth = $('#pagination').find(".recordPage").width();
				var wWidth = $(window).width();
				$('#pagination').find(".recordPage").css({"left":(pWidth<wWidth ? (wWidth-pWidth)/2 : 0)+"px"});
				//结束分页显示条居中
				
				//开始重置 div.main-Containers 对窗口的自适应
				var mWidth = $(".main-Containers").width();
				if(wWidth <= mWidth){
					$(".main-Containers").css({"width":"auto"});
				}else{
					$(".main-Containers").css({"width":"1280px"});
				}
				//结束重置 div.main-Containers 对窗口的自适应
			})
			$(".QQInline").click(function(){
				$('.main-chatBox').show(360);
			});
			$(".shoppingCart").find(".handlerClose").click(function(){
				$(".parcelHidden").css({"zIndex":"1"});
				$(".md-overlay").hide();
				$("#quantity").val("1");
				$(".ecommerce_color ul").find("li").css({"background":"rgba(0,0,0,0.1)","color":"black"});
            	$(".ecommerce_size ul").find("li").css({"background":"rgba(0,0,0,0.1)","color":"black"});
				$(".ecommerce_size").attr("selectSize","");
        		$(".ecommerce_color").attr("selectColor","");
				$(this).parent().parent().hide(360);
			});
			$('.main-chatBox').find(".handlerClose").click(function(){
				$(".parcelHidden").css({"zIndex":"1"});
				//开始获取iframe中的元素并关闭
				$("#iframeBox").contents().find("button.md-close").trigger("click");
				//结束获取iframe中的元素并关闭
				$(this).parent().parent().hide(360);
			});
		})
	</script>
<!-- //cart-css -->
</body>
</html>