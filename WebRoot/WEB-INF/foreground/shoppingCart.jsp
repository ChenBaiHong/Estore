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
    <!-- css -->
    <link href="${pageContext.request.contextPath}/foregroundPlug/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/inlineConsultPlug/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/font-awesome.min.css" type="text/css" media="all" />
    <style type="text/css">
 	.shoppingTable{
	    width: 66.666%;
	    margin: auto;
	    background: rgba(225,225,225,0.6);border-radius: 3px;
    }
   .shoppingTable .container_shopping .goodsInfoHead div{
   		float:left;
   		display:inline-block;
   		width:12.5%;
   		height:50px;
   		text-align:center;
   		line-height:50px;
   		border:0.3px solid rgba(225,225,225,0.3);
   		font-family:华文中宋;
   		font-weight:200;
   		font-size:20px;
   }
   .shoppingTable .container_shopping .goodsInfoBody{
   		color: #0057b1;font-size: 18px;
   }
   .shoppingTable .container_shopping .goodsInfoBody .myFo{
   		float:left;
   }
   .shoppingTable .container_shopping .goodsInfoBody .goodsImg , .goodsName{
   		display:inline-block;
   		border:0.3px solid rgba(0,0,0,0.05);
   		height:150px;
   		width:12.5%;
   }
   .shoppingTable .container_shopping .goodsInfoBody .goodsItem{
   		display:inline-block;
   		width:75%;
   }
   .shoppingTable .container_shopping .goodsInfoBody .goodsItem .myFo{
   		display:inline-block;
   		height:75px;
   		text-align:center;
   		line-height:75px;
   		border:0.3px solid rgba(0,0,0,0.05);
   		width:16.6666%;
   }
   .singlePrice ,.subtotal{
   		color:#b31d04;
   }
	.goodsItem .myFo .buyQuantity{
	    width: 60px;text-align: center;border: none; height:33px; margin:0 5;
	    box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.3);
	    vertical-align:text-top;
	}
    .delete span{
    	background:dodgerblue;
    	padding:5px;
    	color:white;
    }
    .delete span:hover{
    	background:black;
    	color:white;
    	-webkit-transition: .5s all;
	    -moz-transition: .5s all;
	    -o-transition: .5s all;
	    -ms-transition: .5s all;
	    transition: .5s all;
    }
    
    .md-overlay {position: fixed;width: 100%;height: 100%;visibility: hidden;top: 0;left: 0;z-index: 1000;opacity: 0;background: rgba(0,0,0,0.3);
            -webkit-transition: all 0.3s;-moz-transition: all 0.3s;transition: all 0.3s;}
    </style>
    <!--// css -->
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
</div>
<!-- //导航栏 -->

<div class="container cart" style="width:100%;padding:50 0 100 0;
background:url(${pageContext.request.contextPath}/foregroundPlug/images/crossword.png)repeat scroll 0 0 #2E73BA;">
    <div style="">
    <div class="shoppingTable">
    	<div class="container_shopping">
	        <div class="goodsInfoHead">
	        	<div>商品</div>
	        	<div>名字</div>
	        	<div>颜色</div>
	        	<div>尺寸</div>
	        	<div>单价</div>
	        	<div>数量</div>
	        	<div>小计</div>
	        	<div>操作</div>
	        	<br style="clear:both;"/>
	        </div>
	        <div class="goodsInfoBody">
	        	<s:iterator var="sessionCart" value="#request.sessionCartList">
		        	<div class="goods" style="margin:15 0;">
			        	<div class="myFo goodsImg">
			        		<a href="singleProductProfileAction?productId=${sessionCart.product.id}">
			        		<div style="background:url(showProductImgAction?id=${sessionCart.product.id}&iconurl=${sessionCart.product.firstImgUrl});background-size:cover;height:148px; margin:auto;"></div>
			        		</a>
			        	</div>
			        	<div class="myFo goodsName" style="text-align:center;line-height: 150px;font-family: 宋体;font-weight: bold;">
			        		${sessionCart.product.name}
			        	</div>
			        	<div class="myFo goodsItem">
			        		<s:iterator var="shoppingItem" value="#sessionCart.shoppingItemList">
				        	<div class="shoppingItem">
					        	<div class="myFo color">${shoppingItem.color}</div>
					        	<div class="myFo size">${shoppingItem.size}</div>
					        	<div class="myFo singlePrice">￥ ${shoppingItem.product.salePrice}</div>
					        	<div class="myFo quantityCol">
					        		<div style="display: inline-block;width:134px;">
						        		<div style="float:left;cursor:pointer;" class="quantityMinus">
											<a href="javascript:;" style="font-size: 22px;padding: 2 5;color: white;background-color: dodgerblue;">－</a>
										</div>
										<div style="float:left;position: relative;top:21px;">
											<input type="text" class="buyQuantity" style="color:#000000;" singlePrice="${shoppingItem.product.salePrice}" attrVal="${shoppingItem.buyQuantity}" value="${shoppingItem.buyQuantity}" disabled="disabled"/>
										</div>
										<div style="float:left;cursor:pointer;" class="quantityPlus">
											<a href="javascript:;" style="font-size: 22px;padding: 2 5;color: white;background-color: dodgerblue;">＋</a>
										</div>
										<br style="clear:both;"/>
									</div>
					        	</div>
					        	<input type="hidden" class="colorCId" value="${shoppingItem.colorCId}">
					        	<input type="hidden" class="sizeCId" value="${shoppingItem.sizeCId}">
					        	<input type="hidden" class="productId" value="${shoppingItem.productId}">
					        	<div class="myFo subtotal">￥ ${shoppingItem.subtotal}</div>
					        	<div class="myFo delete"><span>取消购买</span></div>
					        	<br style="clear:both;"/>
				        	</div>
				        	</s:iterator>
			        	</div>
			        	<br style="clear:both;"/>
			        </div>
		        </s:iterator>
	        </div>
        </div>
        <dl id="giftItems" class="hidden" style="display: none;">
        </dl>
        <div class="total" style="height: 45px;line-height: 45px;">
            <em id="promotion"></em>
            <em style="color:#ff6600;margin-left:55.5%;">
               	 登录后确认是否享有优惠
            </em>
            <span style="margin-left:2%;color:#666666;">  赠送积分: <em id="effectivePoint" style="color:#ff6600;">0</em></span>
           <span style="margin-left:2%;color:#666666;"> 商品金额: 
	           <strong id="effectivePrice" style="color:#ef0101;font-size:25px;">
		           	<s:if test="#request.effectivePrice!=null">
		           		￥${request.effectivePrice} 元
		           	</s:if>
		           	<s:else>
		           		￥0.00 元
		           	</s:else>
	           </strong>
           </span>
        </div>
        <div class="bottom" style="height:40px;margin-top:13px; margin-left:81%;">
            <a href="javascript:;" id="clear" class="clear">清空购物车</a>
            <a href="javascript:;" id="submit" class="submit" style="padding: 10px;color: #ffffff;background-color: #b31d04;">提交订单</a>
        </div>
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
<div class="md-overlay"></div><!-- the overlay element -->
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

<!-- js引入文件 -->
<script src="${pageContext.request.contextPath}/backgroundPlug/easyformPlug/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/inlineConsultPlug/js/myConsult.js"></script>
<script src="${pageContext.request.contextPath}/foregroundPlug/js/bootstrap.js"></script>
<!-- 动态拖拽js -->
<script src="${pageContext.request.contextPath}/foregroundPlug/js/drag.js"></script>
<script type="text/javascript">
    $(function(){
        //开始导航栏显示和隐藏
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
        //结束导航栏显示和隐藏
        //开始判断用户是否是登陆或没登陆状态
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
        //结束判断用户是否是登陆或没登陆状态
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
        //购物表布局自适应
        if(parseInt($(window).width())<=1260){
            $(".shoppingTable").css("width","100%");
        }else{
            $(".shoppingTable").css("width","66.666%");
        };
        var qW =parseFloat($(".quantityCol").children().width());
        var qC_W = parseFloat($(".quantityCol").width());
        if(134>=qC_W){
            $(".quantityCol").children().css("width","auto");
            $(".quantityMinus").hide();
            $(".quantityPlus").hide();
            $(".buyQuantity").removeAttr("disabled");
        }else{
            $(".quantityCol").children().css("width","134px");
            $(".quantityMinus").show();
            $(".quantityPlus").show();
            $(".buyQuantity").attr("disabled","disabled");
        }
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
            ////购物表布局自适应
            if(parseInt($(window).width())<=1260){
                $(".shoppingTable").css("width","100%");
            }else{
                $(".shoppingTable").css("width","66.666%");
            };
            qW =parseFloat($(".quantityCol").children().width());
            qC_W = parseFloat($(".quantityCol").width());
            //(qW+(parseFloat($(".quantityPlus").width())*2))>=qC_W
            if(134>=qC_W){
                $(".quantityCol").children().css("width","auto");
                $(".quantityMinus").hide();
                $(".quantityPlus").hide();
                $(".buyQuantity").removeAttr("disabled");
            }else{
                $(".quantityCol").children().css("width","134px");
                $(".quantityMinus").show();
                $(".quantityPlus").show();
                $(".buyQuantity").attr("disabled","disabled");
            }
        })
        //结束客服拖拽
        $(".QQInline").click(function(){
            $(".md-overlay").css({"visibility":"visible"});
            $(".main-chatBox").css({"zIndex":"1001"});
            $('.main-chatBox').show(360);
            
        });
        $(".handlerClose").click(function(){
            $(".md-overlay").css({"visibility":"hidden"});
             $(".main-chatBox").css({"zIndex":"auto"});
            $('.main-chatBox').hide(360);
            //开始获取iframe中的元素并关闭
			$("#iframeBox").contents().find("button.md-close").trigger("click");
			//结束获取iframe中的元素并关闭
        });
        /**
         * 开始购物订单的选项操作
         */
            //购物项中点击 减去购买数量
        $(".quantityMinus").click(function(){
            var $this = $(this);
            var buyQuantity =$this.parent().find("input.buyQuantity").val();
            buyQuantityMinusAndPlus(buyQuantity-1 , $this);
        });
        //购物项中点击 增加购买数量
        $(".quantityPlus").click(function(){
            var $this = $(this);
            var buyQuantity =parseInt($this.parent().find("input.buyQuantity").val());
            if((buyQuantity)==5){
                return;
            }
            buyQuantityMinusAndPlus(buyQuantity+1 , $this);
        });
        //点击取消购买产品
        $(".delete").click(function(){
            var $this = $(this);
            var colorCId = $this.parents(".shoppingItem").find("input.colorCId").val();
            var sizeCId = $this.parents(".shoppingItem").find("input.sizeCId").val();
            var productId = $this.parents(".shoppingItem").find("input.productId").val();
            var url = "deleteShoppingItemAction"
            var args="productId="+productId+"&colorCId="+colorCId+"&sizeCId="+sizeCId+"&time="+new Date();
            $.post(url , args , function(data){
                var  message =eval("("+data+")");
                if(message.shoppingCart=="yes"){
                    if(parseInt($this.parents(".shoppingItem").siblings(".shoppingItem").length)==0){
                        $this.parents(".goods").remove();
                    }else{
                        $this.parents(".shoppingItem").remove();
                    }
                    $("#effectivePrice").text("￥ "+message.effectivePrice);
                }
            })
        });
        //文本框输入值
        $("input.buyQuantity").blur(function(){
            var buyQuantity;
            var $this = $(this);
            if(!isNaN($(this).val())){
                var buyQuantity = parseInt($(this).val());
                if(buyQuantity%1==0 && buyQuantity<6){
                    buyQuantityMinusAndPlus(buyQuantity, $this);
                }else{
                    var attrVal = $this.parents(".shoppingItem").find("input.buyQuantity").attr("attrVal");
                    $this.parents(".shoppingItem").find("input.buyQuantity").val(attrVal);
                }
            }else{
                var attrVal = $this.parents(".shoppingItem").find("input.buyQuantity").attr("attrVal");
                $this.parents(".shoppingItem").find("input.buyQuantity").val(attrVal);
            }
        });
        function buyQuantityMinusAndPlus(buyQuantity , $this){
            //1.点击时判断颜色和尺寸产品是否被选中
            var colorCId = $this.parents(".shoppingItem").find("input.colorCId").val();
            var sizeCId = $this.parents(".shoppingItem").find("input.sizeCId").val();
            var productId = $this.parents(".shoppingItem").find("input.productId").val();
            if(sizeCId.trim().length!=0 && colorCId.trim().length!=0 && productId.trim().length!=0){
                if(buyQuantity<=0){
                    return;
                }else{
                    var url = "additionShoppingItemAction"
                    var args="buyQuantity="+buyQuantity+"&productId="+productId+"&colorCId="+colorCId+"&sizeCId="+sizeCId+"&time="+new Date();
                    $.post(url , args , function(data){
                        //alert(data);
                        var  message =eval("("+data+")");
                        if(message.shoppingCart=="yes"){
                            $this.parents(".shoppingItem").find("input.buyQuantity").val(buyQuantity);
                            $this.parents(".shoppingItem").find("input.buyQuantity").attr("attrVal",buyQuantity);
                            //展现总价格
                            $this.parents(".shoppingItem").find(".subtotal").text("￥ "+buyQuantity*parseFloat(message.singlePrice));
                            $("#effectivePrice").text("￥ "+message.effectivePrice);
                        }
                    })
                }
            }
        }
    })
</script>
</body>
</html>