<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 10/27/2016
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<meta charset="UTF-8">
	<link id="clink" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/css/style-blue.css" title="style" rel="stylesheet" type="text/css" media="screen" />
	<!-- 全屏弹出框css样式 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/style.css" media="screen" />
	<!-- 日期css样式 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/pikaday.css"  />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/site.css" />
	<!-- easyUI Form表单的css样式 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/easyform.css">

	<style type="text/css">
		.productContent {position: relative;z-index: 1;max-width:1667px; min-width:561px; margin: auto;}

		ul.slides{padding:0px;position:relative;width:310px; height:310px; margin:auto;overflow-y:hidden;}


		div.form-div {position: relative;background-color: rgba(0, 0, 0, 0.37);border-radius: 3px;border: 1px solid #aaa;margin: auto;
			font-size: 12px;box-shadow: inset 0px 0px 10px rgba(255,255,255,0.5), 0px 0px 15px rgba(75,75,75,0.3);}

		/*  	.form-div #reg-form #step1 ,#step6{position:relative;float:left;} */

		.form-div #reg-form .containProfile{position:relative;float:left;}

		section{padding:0 5;}

		#step1 div {float: left;padding: 10 15;}

		#step2 div{float:left;padding: 10 15;}

		#step3 div{float:left;padding: 10 15;}

		#step4 div{float:left;padding: 10 15;}

		input[type='text'] {border-radius: 3px;box-shadow: inset 0px 1px 0.1px #eee;padding: 10px;border: 1px solid #D4D4D4;color: #333333;background: rgba(225,225,225,0.5);font-size: 14px;}

		input[type="text"]:focus{border: 1px solid #50afeb;outline: none;}

		input[type="button"], input[type="submit"],input[type="reset"] {padding: 7px 15px;background-color: #3c6db0;text-align: center;
			border-radius: 5px;overflow: hidden;min-width: 80px;border: none;color: #FFF;box-shadow: 1px 1px 1px rgba(75, 75, 75, 0.3);}

		#reg-form section div label{font-weight: bold;color:white;font-size:15px;}

		select {text-align: center;border: none;border-radius: 3px;background: rgba(225,225,225,0.5);color: black;padding: 10px;width: 180px;}

		input[type="button"], input[type="submit"],input[type="reset"]{font-size:16px ;}

		input[type="button"]:hover, input[type="submit"]:hover,input[type="reset"]:hover { background-color: #5a88c8;}

		input[type="button"]:active, input[type="submit"]:active,input[type="reset"]:active {background-color: #5a88c8;}

		textarea{border-radius: 3px;box-shadow: inset 0 2px 5px #eee;font-size: 16px;padding: 5px;border: 1px solid #D4D4D4;color: #333333;-top: 5px;resize: none;background: rgba(225,225,225,0.5);}

		textarea:focus{border: 1px solid #50afeb;outline: none;}

		#updateImg,#deleteImg{background: #5CB48E;position: relative;font-size: 15px;padding: 6px;color: white;margin: 45px;top:11px; cursor:pointer;}

		.aboutImg {display: none;background: rgba(0,0,0,0.5);position: relative;bottom: 105px;width: 310px;height: 40px;z-index: 5;margin: auto;}

		.addictionImg {font-size: 18px;padding: 4px;color: white;border-radius: 3px;cursor: pointer;}

		.addImg{display: block;padding: 10 0;text-align:center;};

		.addImg h4{font-family: 宋体;color: white;margin: 0px;font-size: 18px;padding-bottom: 5px;}

		.article-img {position: relative;}
		/* Browser Resets */
		.flex-container a:active,
		.flexslider a:active,
		.flex-container a:focus,
		.flexslider a:focus  {outline: none;}
		.slides,
		.flex-control-nav,
		.flex-direction-nav {margin: 0; padding: 0; list-style: none;}

		/* FlexSlider Necessary Styles
        *********************************/
		.flexslider {margin: 0; padding: 0;}
		.flexslider .slides > li {display: none; -webkit-backface-visibility: hidden;} /* Hide the slides before the JS is loaded. Avoids image jumping */
		.flexslider .slides img {width: 100%; display: block;}
		.flex-pauseplay span {text-transform: capitalize;}

		/* Clearfix for the .slides element */
		.slides:after {content: "."; display: block; clear: both; visibility: hidden; line-height: 0; height: 0;}
		html[xmlns] .slides {display: block;}
		* html .slides {height: 1%;}

		/* No JavaScript Fallback */
		/* If you are not using another script, such as Modernizr, make sure you
         * include js that eliminates this class on page load */
		.no-js .slides > li:first-child {display: block;}


		/* FlexSlider Default Theme
        *********************************/
		.flexslider {margin: 0; position: relative; zoom: 1; color:#fff;}
		.mainslide{margin-bottom:10px;}
		.postslide{overflow:hidden;position:relative;}
		article ul.slides li{padding:0;margin:0;}
		article ul.flex-direction-nav{height:0;}
		.flex-viewport {max-height: 2000px; -webkit-transition: all 1s ease; -moz-transition: all 1s ease; transition: all 1s ease;}
		.loading .flex-viewport {max-height: 300px;}
		.flexslider .slides {zoom: 1;}

		.carousel li {margin-right: 5px}

		.flex-title{
			position:absolute;
			top:55px;
			right:25px;
			padding:0 20px;
			font-size:4.8em;
			line-height:1.4em;
		}
		/* Direction Nav */
		.flex-direction-nav a {width: 30px; height: 40px; margin: -20px 0 0; display: block; background: url(${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/images/bg_direction_nav.png) no-repeat 0 0; position: absolute; top: 50%; cursor: pointer; text-indent: -9999px; opacity: 0; -webkit-transition: all .3s ease;}
		.flex-direction-nav .flex-next {background-position: 100% 0; right: -36px; }
		.flex-direction-nav .flex-prev {left: -36px;}
		.flexslider:hover .flex-next {opacity: 0.8; right: 5px;}
		.flexslider:hover .flex-prev {opacity: 0.8; left: 5px;}
		.flexslider:hover .flex-next:hover, .flexslider:hover .flex-prev:hover {opacity: 1;}
		.flex-direction-nav .disabled {opacity: .3!important; filter:alpha(opacity=30); cursor: default;}

		/* Control Nav */
		.flex-control-nav {width: 100%; position: absolute; bottom: 0; text-align: center;}
		.flex-control-nav li {margin: 0 6px 10px 6px; display: inline-block; zoom: 1; *display: inline;}
		.flex-control-paging li a {width: 20px; height: 10px; display: block; cursor: pointer; text-indent: -9999px; border:1px solid #fff; transition:background 0.3s; -moz-transition:background 0.3s; -webkit-transition:background 0.3s; -o-transition:background 0.3s;}
		.flex-control-paging li a:hover { background: #fff; border:1px solid;}
		.flex-control-paging li a.flex-active { background: #fff; border:1px solid;}

		.flex-control-thumbs {margin: 5px 0 0; position: static; overflow: hidden;}
		.flex-control-thumbs li {width: 25%; float: left; margin: 0;}
		.flex-control-thumbs img {width: 100%; display: block; opacity: .7; cursor: pointer;}
		.flex-control-thumbs img:hover {opacity: 1;}
		.flex-control-thumbs .active {opacity: 1; cursor: default;}

		@media screen and (max-width: 860px) {
			.flex-direction-nav .flex-prev {opacity: 1; left: 0;}
			.flex-direction-nav .flex-next {opacity: 1; right: 0;}

			.flex-title{
				font-size:3.6em;
				line-height:50px;
			}
		}
		@media screen and (max-width: 640px) {
			.flexslider{
				margin-top:50px;
			}
			.postslide{
				margin-top:0;
			}
			.flex-title{
				top:-40px;
				left:0;
				font-size:2.4em;
				line-height:40px;
				display:block;
				width:100%;
			}
		}
		
		.multiCategory {background: rgba(225,225,225,0.7);border-radius: 6px;float: left;width: 177px;padding: 10px;margin-left: 3px;}
		.multiCategory div {height:25px;text-align:center;line-height:25px;}
		.multiCategory div span{color:red;font-weight:bold;cursor:pointer;}

		.tree {
			min-height:20px;
			padding:19px;
			margin-bottom:20px;
			background-color:#fbfbfb;
			border:1px solid #999;
			-webkit-border-radius:4px;
			-moz-border-radius:4px;
			border-radius:4px;
			-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
			-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
			box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
			margin-top:57px;
		}
		.tree li {
			list-style-type:none;
			margin:0;
			padding:10px 5px 0 5px;
			position:relative
		}
		.tree li::before, .tree li::after {
			content:'';
			left:-20px;
			position:absolute;
			right:auto
		}
		.tree li::before {
			border-left:1px solid #999;
			bottom:50px;
			height:100%;
			top:0;
			width:1px
		}
		.tree li::after {
			border-top:1px solid #999;
			height:20px;
			top:25px;
			width:25px
		}
		.tree li span {
			-moz-border-radius:5px;
			-webkit-border-radius:5px;
			border:1px solid #999;
			border-radius:5px;
			display:inline-block;
			padding:3px 8px;
			text-decoration:none
		}
		.tree li.parent_li>span {
			cursor:pointer
		}
		.tree li > span {
			cursor:pointer
		}
		.tree>ul>li::before, .tree>ul>li::after {
			border:0
		}
		.tree li:last-child::before {
			height:30px
		}
		.tree li.parent_li>span:hover, .tree li.parent_li>span:hover+ul li span {
			background:rgba(225, 225, 225, 0.37);
			border:1px solid #94a0b4;
			color:#000
		}
		.tree{background-color: rgba(0, 0, 0, 0.57);border-radius: 3px;border: 1px solid #aaa; color:white;
			box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.3);
		}

		.rightClickdialog{
			height:60px; width:100px; position:absolute;left:0px; top:0px;border:0.7px solid white;background:#595555;z-index:9999;display:none;text-align:center;
		}
	</style>
</head>
<body id="containsJs" style="width:100%;height:100%;background:url('${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty1.jpg'); background-attachment:fixed;">
<html lang="en" class="no-js">
<body>
<div class="md-modal md-effect-16" id="modal-16">
	<div class="md-content" style="background: rgba(0,0,0,0.3)">
		<h3 style="background: rgba(0,0,0,0.2);"></h3>
		<div>
			<div>
				<div class="panel-body">
					<div style="font-size:22px; text-align:center; font-weight:bold ; color:white;">
						更新成功
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tree well">
		<ul>
			<s:iterator var="category" value="#request.categoryList">
				<li>
					<span categoryId="${category.cid}" class="category" profile="${category.profile}" isExist="false">${category.name }</span>
				</li>
			</s:iterator>
		</ul>
	</div>
</div>
<div class="rightClickdialog">
	<span style="color:white; font-weight:bold ;" categoryId=""></span>
	<button class="addProd_Cate" style="font-size:12px;border-radius:0px; position:relative; width:100%;bottom:-8px;">设置该类别</button>
</div>
<div class="productContent">
	<div class="form-div">
		<form id="reg-form" action="javascript:;" method="post">
			<input type="hidden" name="id" value="${request.product.id}">
			<input type="hidden" id="iconurl" name="iconurl" value="${request.product.iconurl}">
			<div class="myContanier" style="display:block;">
				<div class="MyCol" style="width:552px;float:left;position:relative;">
					<section>
						<div class="addImg">
							<h3 style="color: white;text-align: center;font-size: 24px;">产品图</h3>
							<span class="addictionImg" style="background: #5CB48E;display:none;" dependFileId="fileList">添加图片</span>
						</div>
						<div class="article-img article-prodImg">
							<div class="flexslider mainslide" style="background-color:transparent; height:365px;">
								<ul class="slides" style="">
									<s:iterator var="iconName" value="#request.product.imgUrlList" status="status">
										<li style="width:310px; height:150px;" productImg="${product.id},${iconName}">
											<img src="showProductImgAction?id=${product.id}&iconurl=${iconName}" style="width:310px;" alt="">
										</li>
									</s:iterator>
								</ul>
							</div>
							<div class="aboutImg" style="">
								<span id="updateImg" class="updateImg" style="background: #5CB48E;">更新</span>
								<span id="deleteImg" class="deleteImg" style="background: #D2CCB2;">删除</span>
								<div class="fileWrapper" mapping="iconurl">
									<input id="fileList" token="update" productId="${request.product.id}" name="fileList" type="file" style="display:none;"/>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="containProfile MyCol" style="width:561px;">
					<h3 style="color: white;text-align: center;font-size: 24px;">修改产品</h3>
					<section id="step1">
						<div>
							<label>产品名字</label>
							<input name="name" type="text" id="name" autocomplete="off" value="${request.product.name}"
								   data-easyform="real-time;ajax:ajax_demo(1);"
								   data-message="产品名字不能为空"
								   data-message-ajax="用户名已存在!"
								   data-easytip="position:top;class:easy-blue;" initName="${request.product.name}">
						</div>
						<div>
							<label>产品品牌</label>
							<select  name="brandId">
								<option value="${request.product.brand.id}">&ndash; 选择产品品牌&ndash;</option>
								<s:iterator var="brand" value="#request.brandList">
									<option value="${brand.id }">${brand.name}</option>
								</s:iterator>
							</select>
						</div>
						<br class="clear" style="clear:both;">
					</section>
					<section id="step2">
						<div>
							<label>产品来源</label>
							<input name="produceLocal" type="text" id="produceLocal" autocomplete="off" value="${request.product.produceLocal}"
								   data-easyform="real-time;ajax:ajax_demo(4);"
								   data-message="请填写产品来源地"
								   data-message-ajax="产品来源地是必填项"
								   data-easytip="class:easy-blue;">
						</div>
						<div>
							<label>产品公司</label>
							<input name="productCompany" type="text" id="productCompany" autocomplete="off" value="${request.product.productCompany}"
								   data-easyform="real-time;ajax:ajax_demo(5);"
								   data-message="请填写产品公司"
								   data-message-ajax="产品公司是必填项"
								   data-easytip="class:easy-blue;position:bottom;">

						</div>
						<br class="clear" style="clear:both;">
					</section>
					<section id="step3">
						<div>
							<label>进口价格</label>
							<input name="inletPrice" type="text" id="inletPrice" autocomplete="off" value="${request.product.inletPrice}"
								   data-easyform="real-time;ajax:ajax_demo(2);"
								   data-message="请填写进口价格"
								   data-message-ajax="进口价格必须是数字并不能小于0"
								   data-easytip="class:easy-blue;">
						</div>
						<div>
							<label>零售价格</label>
							<input name="salePrice" type="text" id="salePrice" autocomplete="off" value="${request.product.salePrice}"
								   data-easyform="real-time;ajax:ajax_demo(3);"
								   data-message="请填写零售价格"
								   data-message-ajax="零售价格必须是数字并不能小于0"
								   data-easytip="class:easy-blue;">
						</div>
						<br class="clear" style="clear:both;">
					</section>
					<section id="step4">
						<div>
							<label>产品数量</label>
							<input name="quantity" type="text" id="quantity" autocomplete="off" value="${request.product.quantity}"
								   data-easyform="real-time;ajax:ajax_demo(6);"
								   data-message="请填写产品数量"
								   data-message-ajax="产品数量必须是正整数"
								   data-easytip="class:easy-blue;position:bottom;">
						</div>
						<div class="step">
							<div class="flow-element" style="margin-right: 0px;float: none;padding: 0px;">
								<label for="datepicker">进口日期</label>
								<input style="margin: 0px;padding: 10px;" type="text" id="datepicker" name="inletDate" autocomplete="off" value="${request.product.inletDate}"
									   data-easyform="real-time;ajax:ajax_demo(8);"
									   data-message="进口日期不能为空"
									   data-easytip="class:easy-blue;position:bottom;">
							</div>
						</div>
						<br class="clear" style="clear:both;">
					</section>
					<section style="padding-top:10px;">
						<div class="step"style="float:left;padding:0 15;width:51%;">
							<label style="position:relative;vertical-align:top;">产品备注</label>
										     <textarea id="description" name="description" style="height:75px;width:180px;padding:0px"
													   data-easyform="real-time;ajax:ajax_demo(7);"
													   data-message="你还没有描述该产品"
													   data-message-ajax="你还没有描述该产品"
													   data-easytip="class:easy-blue;">${request.product.description}</textarea>
						</div>
						<div style="float:left;padding:0 10;">
							<div id="cid" style="float:left;cursor:pointer;">
								<label style="font-weight: bold;color:white;font-size:15px;">产品类别</label>
							</div>
							<div class="multiCategory" style="">
								<div><a style="color:black">---选择类别---</a></div>
								<s:iterator var="category" value="#request.product.categorySet">
									<div><a>${category.name}</a> <span categoryId="${category.cid}">X</span></div>
								</s:iterator>
							</div>
							<br style="clear:both;"/>
						</div>
						<br style="clear:both;"/>
					</section>
				</div>
				<input type="hidden" id="paramIconurl" name="paramIconurl" value="${request.product.paramIconurl}">
				<div class="MyCol" style="width:552px;float:left;position:relative;">
					<section>
						<div class="addImg" style="display:block;">
							<h3 style="color: white;text-align: center;font-size: 24px;">产品参数图</h3>
							<span class="addictionImg" style="background: #5CB48E;display:none;" dependFileId="paramFileList">添加图片</span>
						</div>
						<div class="article-img article-paramImg">
							<div class="flexslider mainslide" style="background-color:transparent; height:365px;">
								<ul class="slides" style="">
									<s:iterator var="paramImg" value="#request.product.imgParamList" status="status">
										<li style="width:310px; height:150px;" productImg="${product.id},${paramImg}">
											<img src="showProductImgAction?id=${product.id}&iconurl=${paramImg}" style="width:310px;" alt="">
										</li>
									</s:iterator>
								</ul>
							</div>
							<div class="aboutImg">
								<span id="updateImg" class="updateImg" style="background: #5CB48E;">更新</span>
								<span id="deleteImg" class="deleteImg" style="background: #D2CCB2;">删除</span>
								<div class="fileWrapper" mapping="paramIconurl">
									<input id="paramFileList" token="update" productId="${request.product.id}" name="paramFileList" type="file" style="display:none;"/>
								</div>
							</div>
						</div>
					</section>
				</div>
				<br class="clear" style="clear:both;">
			</div>
			<hr style="border: 0.5px solid rgba(0,0,0,0.3);">
			<div style="position:relative;width:100%;">
				<div style="width: 50%;position: relative;margin: auto;">
					<input value="更新" type="submit" id="submit" style="width: 80px;height: 39px;background: #5CB48E;float:left;">
					<input value="删除" type="reset" style="width: 80px;height: 39px;background: #D2CCB2;float:right;">
					<br class="clear" style="clear:both;">
					<button class="md-trigger" data-modal="modal-16" style="display:none"></button>
				</div>
			</div>
		</form>
	</div>
	<!-- 显示日期的插件 -->
	<div class="flow-element" style="position: fixed;left: 38%;top: 46%;z-index:5;">
		<div id="container"></div>
	</div>
	<!-- //显示日期的插件 -->
</div>

<div class="md-overlay" style="background: rgba(0,6,2,0.7);z-index:3"></div><!-- the overlay element -->
<script>
	var polyfilter_scriptpath = '/js/';
</script>
</body>
</html>

<!-- 日期js插件 -->
<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/js/pikaday.js"></script>
<!-- 全屏的弹出框的js样式 -->
<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/js/index.js"></script>
<!-- 必不可少的jQuery文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/jquery-2.1.0.min.js"></script>
<script id="jquery-flexslider" src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/scripts/jquery.flexslider.js" type="text/javascript"></script>
<!-- easyUI form 表单的js样式 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/easyform.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/js/jquery.form.js"></script><!-- form表单插件异步提交数据 -->
<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/ajaxfileupload.js"></script>
<script type="text/javascript">
	$('div.flexslider').flexslider({
		slideshowSpeed: 3000, // 自动播放速度毫秒
		pauseOnHover: true
	});

	var widthW = parseInt($(window).width());
	var widthB = parseInt($('.productContent').width());
	var heightW = parseInt($(window).height());
	var heightB = parseInt($('.productContent').height());
	var d_valueW = widthW-widthB;
	var d_valueH = heightW-heightB;
	$('.productContent').css({"top":""+(heightW<=heightB ? 0 :(d_valueH/2))+"px"});
	$(window).resize(function(){
		var widthW = parseInt($(window).width());
		var widthB = parseInt($('.productContent').width());
		var heightW = parseInt($(window).height());
		var heightB = parseInt($('.productContent').height());
		var d_valueW = widthW-widthB;
		var d_valueH = heightW-heightB;
		$('.productContent').css({"top":""+(heightW<=heightB ? 0 :(d_valueH/2))+"px"});
	});
	$(".md-overlay").click(function(){
		$(".rightClickdialog").hide();//隐藏右击弹窗
	});
	//开始初始化判断，是否显示添加图片按钮
	var len=$(".article-prodImg ul.slides li").length;
	if(len<6){
		$(".article-prodImg").siblings(".addImg").find("span.addictionImg").show();
	}else{
		$(".article-prodImg").siblings(".addImg").find("span.addictionImg").hide();
	}
	var leng=$(".article-paramImg ul.slides li").length;
	if(leng<6){
		$(".article-paramImg").siblings(".addImg").find("span.addictionImg").show();
	}else{
		$(".article-paramImg").siblings(".addImg").find("span.addictionImg").hide();
	}
	//结束初始化判断，是否显示添加图片按钮
	var picker = new Pikaday(
			{
				field: document.getElementById('datepicker'),
				firstDay: 1,
				minDate: new Date(2000, 0, 1),
				maxDate: new Date(2020, 12, 31),
				yearRange: [2000, 2020],
				bound: true,
				container: document.getElementById('container'),
			});
	$(document).ready(function ()
	{
		var v = $('#reg-form').easyform();
		v.is_submit = false;

	});
	function ajax_demo(p){
		$("#uid").trigger("easyform-ajax", false);
	}
	//开始图片更新项，控制整个图片项是否更新成功
	$("div.article-prodImg").mouseover(function(){
		$(this).find('.aboutImg').stop().slideDown(360);
	});
	//开始参数图片更新项，控制整个图片项是否更新成功
	$("div.article-paramImg").mouseover(function(){
		$(this).find('.aboutImg').stop().slideDown(360);
	});
	//开始更新图片
	$("span.updateImg").click(function(){
		$(this).siblings(".fileWrapper").find("input[type=file]").attr("token","update");
		$(this).siblings(".fileWrapper").find("input[type=file]").trigger("click");
	});
	//开始添加图片更新数据库
	$(".addictionImg").click(function(){
		var fileId = $(this).attr("dependFileId");
		$("#"+fileId).attr("token","addiction");
		$("#"+fileId).trigger("click");
	})
	$(".fileWrapper").change(function(){
		var $this=$(this);
		var mapping=$(this).attr("mapping");
		var $flexslider=$(this).parent().siblings(".flexslider");
		var $uFile = $(this).children();
		if($uFile.attr("token")=="update"){
			var productImg=$flexslider.find("li.flex-active-slide").attr("productImg");
			var proInfo = productImg.split(",");
			$.ajaxFileUpload({
				url:"updateProductImgAction?id="+proInfo[0]+"&"+mapping+"="+proInfo[1],
				secureuri:false,
				fileElementId:$uFile.attr("id"),
				dataType:"json",//返回数据格式json
				success:function(result){
					var message=eval("("+result+")")
					if(message.message=="success"){
						$flexslider.find("li.flex-active-slide").children("img").attr("src","showProductImgAction?id="+proInfo[0]+"&"+mapping+"="+message.fileName);
						$flexslider.find("li.flex-active-slide").attr("productImg",proInfo[0]+","+message.fileName);
						$("#"+mapping).attr("value",message.mapping);
					}
				}
			});
		}else if($uFile.attr("token")=="addiction"){
			var productId=$uFile.attr("productId");
			$.ajaxFileUpload({
				url:"updateProductImgAction?id="+productId,
				secureuri:false,
				fileElementId:$uFile.attr("id"),
				dataType:"json",//返回数据格式json
				success:function(result){
					var message=eval("("+result+")")
					if(message.message=="success"){
						$("#"+mapping).attr("value",message.mapping);
						//alert(message.message+","+message.fileName);
						$flexslider.find("ol.flex-control-nav").remove();
						$flexslider.find("ul.flex-direction-nav").remove();
						$flexslider.find("li.flex-active-slide").removeClass("flex-active-slide");
						//克隆体
						var flexslider = $flexslider.clone();
						var liTag = $('<li style="width:310px; height:150px;" productImg="'+productId+','+message.fileName+'">'
								+'<img src="showProductImgAction?id='+productId+'&iconurl='+message.fileName+'" style="width:310px;" alt="">'
								+'</li>');
						flexslider.children("ul.slides").append(liTag);
						//移除本体
						$flexslider.remove();
						//重新插入克隆体
						$this.parent().before(flexslider);
						flexslider.flexslider({
							slideshowSpeed: 3000, // 自动播放速度毫秒
							pauseOnHover: true
						});
						var len=$this.parent().siblings(".flexslider").find("ul.slides li").length;
						if(len<6){
							$this.parent().parent().siblings("div.addImg").find("span.addictionImg").slideDown(360);
						}else{
							$this.parent().parent().siblings("div.addImg").find("span.addictionImg").slideUp(360);
						}
					}
				}
			});
		}
	});

	//开始删除图片的更新数据库
	$("span.deleteImg").click(function(){
		var $this=$(this);
		var mapping=$(this).siblings(".fileWrapper").attr("mapping");
		var $flexslider=$(this).parent().siblings(".flexslider");
		var productImg=$flexslider.find("li.flex-active-slide").attr("productImg");
		var proInfo = productImg.split(",");

		$.ajaxFileUpload({
			url:"updateProductImgAction?id="+proInfo[0]+"&"+mapping+"="+proInfo[1],
			secureuri:false,
			dataType:"json",//返回数据格式json
			success:function(result){
				var message=eval("("+result+")")
				//alert(result);
				if(message.message=="success"){
					$("#"+mapping).attr("value",message.mapping);
					$flexslider.find("li.flex-active-slide").remove();
					$flexslider.find("ol.flex-control-nav").remove();
					$flexslider.find("ul.flex-direction-nav").remove();
					var flexslider = $flexslider.clone();
					$flexslider.remove();
					$this.parent().before(flexslider);
					flexslider.flexslider({
						slideshowSpeed: 3000, // 自动播放速度毫秒
						pauseOnHover: true
					});
					var len=$this.parent().siblings(".flexslider").find("ul.slides li").length;
					if(len<6){
						$this.parent().parent().siblings("div.addImg").find("span.addictionImg").slideDown(360);
					}else{
						$this.parent().parent().siblings("div.addImg").find("span.addictionImg").slideUp(360);
					}
				}
			}
		});
	});
	//结束删除图片更新数据库

	$("div.article-prodImg").mouseout(function(){
		$(this).find('.aboutImg').stop().slideUp(360);
	});
	$("div.article-paramImg").mouseout(function(){
		$(this).find('.aboutImg').stop().slideUp(360);
	});
	var judge=true;
	function ajax_demo(p)
	{
		if(p==1){
			var name = $("#name").val();
			name = name.trim();
			var initName = $("#name").attr("initName");
			if(initName==name){
				$("#name").trigger("easyform-ajax", true);
				judge=true;
				return;
			}
			//alert(name);
			var url="verifyDuplicateAction";
			var args = "name="+name+"&time="+new Date();
			$.post(url , args , function(data){
				//alert(data);
				var message = eval("("+data+")");
				if(message.message=="no"){
					$("#name").trigger("easyform-ajax", false);
					judge=false
				}else{
					$("#name").trigger("easyform-ajax", true);
					judge=true;
				}
			})
		}if(p==2){
		var inletPrice = $("#inletPrice").val();
		if(isNaN(inletPrice) || inletPrice<0){//如果不是数字，就是true
			$("#inletPrice").trigger("easyform-ajax", false);
			judge=false;
		}else{//是数字即使false
			$("#inletPrice").trigger("easyform-ajax", true);
			judge=true
		}
	}if(p==3){
		var salePrice = $("#salePrice").val();
		if(isNaN(salePrice) || salePrice<0){//如果不是数字，就是true
			$("#salePrice").trigger("easyform-ajax", false);
			judge=false
		}else{//是数字即使false
			$("#salePrice").trigger("easyform-ajax", true);
			judge=true;
		}
	}if(p==4){
		var produceLocal = $("#produceLocal").val();
		if(produceLocal.trim().length==0){
			judge=false;
		}else{
			judge=true;
		}
	}if(p==5){
		var productCompany = $("#productCompany").val();
		if(productCompany.trim().length==0){
			judge=false;
		}else{
			judge=true;
		}
	}if(p==6){
		var quantity = $("#quantity").val();
		if(isNaN(quantity)|| quantity<0){//如果不是数字，就是true
			$("#quantity").trigger("easyform-ajax", false);
			judge=false;
		}else{//是数字即使false
			$("#quantity").trigger("easyform-ajax", true);
			judge=true
		}
	}if(p==7){
		var description = $("#description").val();
		if(description.trim().length==0){
			judge=false;
		}else{
			judge=true;
		}
	}
	}
	var categorys=new Array();//储存所有的分类 id
	//开始在页面加载想数组里添加该产品原有的分类类别
	var $spans = $(".multiCategory").find("span");
	for(var i = 0 ; i<$spans.length;i++){
		var categoryId =$($spans[i]).attr("categoryId");
		if(categoryId.trim().length!=0){
			categorys.push(categoryId);
		}
	}
	//结束在页面加载想数组里添加该产品原有的分类类别
	$("#submit").click(function(){
		var categoryId = categorys.join(",");
		//alert(categoryId);
		if(judge){
			$.ajax({
				url:"updateProductFormAction?categoryId="+categoryId,
				type:"POST",
				data:new FormData($("#reg-form")[0]),//form表单异步提交数据
				cache:false,//禁止缓存
				async:false,//异步开启
				processData:false,//进程数据false
				contentType:false,//已经声明属性enctype:"multipart/form-data",所以这里设置为false.
				dataType:"json",//返回数据格式json
				success:function(result){
					var message = eval("("+result+")")
					if(message.message=="success"){
						//更新成功重新初始化分类类型的数组参数
						$("#name").attr("initName",$("#name").val())
						$("div.md-content").show();
						$("div.tree").hide();
						$("button.md-trigger").trigger("click");
						setTimeout(function(){
							$("button.md-close").trigger("click");
						},3000)
					}
				}
			});
		}
	});
	/* *****************************************************************
	 开始选择产品类别
	 ********************************************************************/

	//清空不绑定父节点
	$("#clearly").click(function(){
		$("input#categoryId").attr("categoryId","");
		$("input#categoryId").val("");
	});
	$("#cid").click(function(){
		$("div.md-content").hide();
		$("div.tree").show();
		$("button.md-trigger").trigger("click");
	})
	$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
	$('.tree li.parent_li > span').on('click', function (e) {
		treeConstructFunction($(this));
	});
	$('.tree li > span').click(function(){
		var $this=$(this);
		cycleTreeFunction($this);
	});
	//开始鼠标右击事件，消除浏览器默认鼠标右击事件
	$('.tree li > span').contextmenu(function(){
	 return false;
	 });
	 $(document).contextmenu(function(){//消除当前页面的默认右击事件显示菜单栏事件
	 return false;
	 }); 
	$('.tree li > span').mousedown(function(e){
		var $this=$(this);
		if(e.which==3){
			$(".rightClickdialog").css('left',e.pageX).css('top',e.pageY);
			$(".rightClickdialog").show();
			$(".rightClickdialog").find("span").text($this.text());
			$(".rightClickdialog").find("span").attr("categoryId",$this.attr("categoryId"));
		}
	});
	//删除分类类型,为此绑定点击事件
	$(".multiCategory").find("span").bind("click",function(){
		var $this=$(this);
		var categoryId = $this.attr("categoryId");
		if(categoryId.trim().length!=0){
			for(var i=0 ; i<categorys.length;i++){
				if(categorys[i]==categoryId){
					categorys[i]=categorys[categorys.length-1];//最后的分类Id,覆盖当前要删除的分类Id对应的下标;以此就删除数组中的不需要的分类Id
					categorys.pop();//删除最后的一个元素
					break;
				}
			}
		}
		$(this).parent().remove();
	});
	//为产品表人性化显示分类参数
	$(".addProd_Cate").click(function(){
		var $this=$(this);
		var categoryId = $this.siblings("span").attr("categoryId");
		if(categoryId.trim().length!=0){
			for(var i=0 ; i<categorys.length;i++){
				if(categorys[i]==categoryId){
					return;
				}
			}
			var displayCategory=$('<div><a>'+$this.siblings("span").text()+'</a> <span categoryId="'+categoryId+'">X</span></div>');
			//删除某个不需要的分类Id
			displayCategory.find("span").bind("click",function(){
				var cId = $(this).attr("categoryId");
				for(var i= 0 ; i<categorys.length;i++){
					if(categorys[i]==cId){
						categorys[i]=categorys[categorys.length-1];//最后的分类Id,覆盖当前要删除的分类Id对应的下标;以此就删除数组中的不需要的分类Id
						categorys.pop();//删除最后的一个元素
						break;
					}
				}
				$(this).parent().remove();
			});
			$(".multiCategory").append(displayCategory);
			categorys.push(categoryId);//添加分类
		}
	});
	//结束鼠标右击事件
	$('.tree').click(function(){
		$(".rightClickdialog").hide(260);//隐藏右击后的弹出框
	})
	function cycleTreeFunction($this){
		var categoryId = $this.attr("categoryId");
		$("input#categoryId").attr("categoryId",categoryId);
		$("input#categoryId").val($this.text());
		//防止重复数据提交请求，判断是否父节点下孩子节点是否已经向数据库请求显示过
		if($this.attr("isExist")=="false"){
			var url="fetchSubcategoryAction";
			var args={"cid":categoryId,"time":new Date()};
			$.post(url , args , function(data){
				var subcategorys=eval("("+data+")");
				if(subcategorys.length!=0){
					var ulTag = $("<ul></ul>");
					for(var i = 0; i<subcategorys.length;i++){
						var liTag = $("<li></li>");
						var spanTag = $('<span categoryId='+subcategorys[i].cid+' profile="'+subcategorys[i].profile+'" class="category" isExist="false">'+subcategorys[i].name+'</span>')
						//绑定事件
						spanTag.bind("click",function(){
							var $this=$(this);
							cycleTreeFunction($this);
						});
						liTag.append(spanTag);
						ulTag.append(liTag);
					}
					$this.after(ulTag);
					$this.attr("isExist","true");//数据库遍历出这个父节点的子类，下次在被点击就不用显示
					$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
					$('.tree li.parent_li > span').on('click', function (e) {
						treeConstructFunction($(this));//给创建的后期绑定事件
					});
					$('.tree li > span').contextmenu(function(){
						return false;
					});
					//重新绑定鼠标右击事件
					$('.tree li > span').mousedown(function(e){
						var $this=$(this);
						if(e.which==3){
							$(".rightClickdialog").css('left',e.pageX).css('top',e.pageY);
							$(".rightClickdialog").show();
							$(".rightClickdialog").find("span").text($this.text());
							$(".rightClickdialog").find("span").attr("categoryId",$this.attr("categoryId"));
						}
					});
				}
			});
		}
	}
	//循环给树结构添加时间，是否可见是否不可见，这里应该是有图片但没有
	function treeConstructFunction($this){
		var children = $this.parent('li.parent_li').find(' > ul > li');
		if (children.is(":visible")) {
			children.hide('fast');
			$this.attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
		} else {
			children.show('fast');
			$this.attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
		}
		e.stopPropagation();
	}
	/* *****************************************************************
	 结束选择产品类别
	 ********************************************************************/
</script>
</body>
</html>
