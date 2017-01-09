<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 10/18/2016
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<title></title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AdminBg/ergodicAdmin/css/normalize.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AdminBg/ergodicAdmin/css/font-awesome.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AdminBg/ergodicAdmin/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AdminBg/ergodicAdmin/css/templatemo-style.css">
	<script src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/ergodicAdmin/js/vendor/modernizr-2.6.2.min.js"></script>
	<style type="text/css">
		.dialogSubject{display:none;background: rgba(255,255,255,0.5);height:20%;width: 20%;position:fixed;bottom:35%;left:35%;
			z-index:100;border-radius:5px;
		}
		.dialogBg{display:none;background:rgba(0,0,0,0.5);height:100%;width: 100%;position:fixed;z-index:99;bottom: 0px;
		}
		.isureDeleteData,.cancelDeleteData{width: 22%;height: 19%;line-height: 19%;text-align: center;background: #5CB48E;border: none;border-radius: 5px;
			font-size: 18px;margin-left: 18%;margin-top: 3%;
		}
		.subscribe-form #subscribe-text { width: 100%; padding: 10px; background: transparent; border: 1px solid #fff; outline: 0;}

	</style>
</head>
<body>
<div class="content-bg"></div>
<div class="bg-overlay"></div>

<!-- SITE TOP -->
<div class="site-top" style="background: rgba(0,0,0,0.3);">
	<div class="site-header clearfix">
		<div class="container">
			<div class="social-icons pull-right">
				<ul>
					<li><a href="#" class="fa fa-facebook"></a></li>
					<li><a href="#" class="fa fa-twitter"></a></li>
					<li><a href="#" class="fa fa-behance"></a></li>
					<li><a href="#" class="fa fa-dribbble"></a></li>
					<li><a href="#" class="fa fa-google-plus"></a></li>
				</ul>
			</div>
		</div>
	</div> <!-- .site-header -->
	<div class="site-banner">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8 text-center">
					<h2>将进酒 <span class="blue">李白</span><span class="green">唐</span></h2>
					<p >君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来，烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。
						与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不愿醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌，五花马，千金裘，呼儿将出换美酒，与尔同销万古愁</p>
				</div>
			</div>
			<div class="row">
				<form action="javascript:;" method="post" class="subscribe-form">
					<fieldset class="col-md-offset-4 col-md-3 col-sm-8">
						<input type="text" id="subscribe-text" placeholder="Enter search Admin" autocomplete="off">
					</fieldset>
					<fieldset class="col-md-5 col-sm-4">
						<input type="submit" id="subscribe-submit" class="button white" value="searchAdmin">
					</fieldset>
				</form>
			</div>
		</div>
	</div> <!-- .site-banner -->
</div> <!-- .site-top -->

<!-- MAIN POSTS -->
<div class="main-posts">
	<div class="container">
		<div class="row">
			<div class="blog-masonry masonry-true">
				<c:forEach var="admin" items="${requestScope.adminPageBean.adminList}">
					<div class="post-masonry col-md-4 col-sm-6 AdminProfile">
						<div class="post-thumb">
							<!-- 显示的管理员头像    imgLocal-->
							<img class="imgLocal" imgLocal="neiborhood" src="${pageContext.request.contextPath}/AdminServlet.servlet?method=showAdminHead&adminId=${admin.id}" alt="">
							<div class="title-over">
								<h4><a href="#">${admin.adminname}</a></h4>
							</div>
							<div class="post-hover text-center" style="background: rgba(0,0,0,0.7);">
								<span style="margin-left:88%;cursor:pointer;" class="deleteAdmin" adminId="${admin.id}"><i class="fa fa-times" style="color:red ; font-size:24px;"></i></span>
								<div class="inside" >
									<div style="background: rgba(225,225,255, 0.3) ; border-radius:3px; width:80%; margin:auto;" class="alterName">
	                                    <span style="margin:0px; font-size:15px; font-weight:bold;">管理员
	                                    	<span style="margin:5px; display:inline;font-size:15px; font-weight:bold;" class="adminname">${admin.adminname}</span>
	                                    </span>
										<input type="text" class="adminName" placeholder="${admin.adminname}"
											   style="border-radius:3px; display:none; background:rgba(0,0,0,0.3); border:none ; padding:2px; margin:auto; margin-top:5px;">

									</div>
									<div style="background: rgba(225,225,255, 0.3) ; border-radius:3px; width:80%; margin:auto;margin-top:10px;" >
										<span style="margin:0px; font-size:15px; font-weight:bold;">权限角色</span>
										<!-- 管理员的角色   roleSet-->
										<div style="background:rgba(0,0,0,0.2);padding:5px;" class="roleSet">
											<c:forEach var="role" items="${admin.roleSet}">
												<span style="display:inline-block; margin-left:5px;font-weight:bold;"><a href="#">${role.name}</a></span>
											</c:forEach>
										</div>
									</div>
									<div style="background: rgba(225,225,255, 0.3) ;  width:80%; margin:auto;" >
										<span style="margin:0px; font-size:15px; font-weight:bold;">管理员描述</span>
										<!-- 管理员的描述 description -->
										<div style="background:rgba(0,0,0,0.2);padding:5px;" class="description">
												${admin.description}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<!-- FOOTER -->
<footer class="site-footer">
	<input type="hidden" id="currentPage" value="${requestScope.adminPageBean.currentPage }">
	<input type="hidden" id="finalPage" value="${requestScope.adminPageBean.totalPage }">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<div class="social-icons">
					<ul>
						<li><a href="javascript:;" class="fa fa-arrow-left" id="previous"></a></li>
						<c:forEach var="i" items="${requestScope.adminPageBean.pagingBar}">
							<li><a href="javascript:;" class="fa NumBar" >${i}</a></li>
						</c:forEach>
						<li><a href="javascript:;" class="fa fa-arrow-right" id="next"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">
				<p class="copyright-text">Copyright &copy; 2084 Company Name</p>
			</div>
		</div>
	</div>
</footer>
<!-- 开始更新管理员的角色弹出框页面 -->
<div class="dialogSubject">
	<div style="height: 65%;
	background: rgba(0,0,0,0.5);
	margin: auto;
	text-align: center;
	">
		<h3 style="font-size: 22px;color: beige;height:36px; line-height:36px;" id="alertMessage">你确定删除该管理员吗？</h3>
		<i class="fa fa-check"  id="successfully" style="font-size: 757%;color: beige; display:none"></i>
		<i class="fa fa-times" id="deleteFail" style="font-size: 757%;color: beige;display:none"><span style="font-size: 22px;color: beige;"></span></i>
	</div>
	<button id="isureDeleteData" class="isureDeleteData"style="">确定</button>
	<button id="cancelDeleteData" class="cancelDeleteData">取消</button>
</div>
<div class="dialogBg"></div>
<!-- 结束更新管理员的角色弹出框页面 -->
<%-- <script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery-3.1.1.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/ergodicAdmin/js/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/ergodicAdmin/js/jquery-1.10.2.min.js"><\/script>')</script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/ergodicAdmin/js/min/plugins.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/ergodicAdmin/js/min/main.min.js"></script>

<!-- Preloader -->
<script type="text/javascript">
	$(function(){
		//开始分页的操作
		var finalPage=parseInt($("#finalPage").val());
		var currentPage =parseInt($("#currentPage").val());
		$('#previous').click(function(){
			if(currentPage!=1){
				paginationAdminCommon(currentPage-1);
			}
		})
		$('.NumBar').click(function(){
			$('.NumBar').css({"background":"rgba(0,0,0,0)","color":"white"});
			$(this).css({"background":"white","color":"black"})
			paginationAdminCommon(parseInt($(this).text()))
		})
		$('#next').click(function(){
			if(currentPage!=finalPage){
				paginationAdminCommon(currentPage+1);
			}
		})
		function paginationAdminCommon(displayPage){
			$.ajax({
				url:"${pageContext.request.contextPath}/AdminServlet.servlet?method=pagingShowAdmin&indexBar="+displayPage+"&pageSize="+6,
				type:"POST",
				cache:false,//禁止缓存
				async:false,//异步开启
				processData:false,//进程数据false
				contentType:false,//已经声明属性enctype:"multipart/form-data",所以这里设置为false.
				dataType:"json",//返回数据格式json
				success:function(dataObject){
					//alert(dataObject.adminList)
					var adminProfiles = $('.AdminProfile');
					var adminList = dataObject.adminList;
					if(dataObject.error=="error"){
						$(".dialogBg").show();
						$(".dialogSubject").slideDown(500);
						$("#deleteFail").children("span").text("未知错误！检修中。。。");
						$("#deleteFail").show(500)
						setTimeout(function(){
							$(".dialogBg").hide();
							$(".dialogSubject").slideUP();
							$("#deleteFail").children("span").hide();
							$("#deleteFail").hide()
						},3000);
						return;
					}
					if((adminProfiles.length-adminList.length)==0){
						for(var i = 0 ; i<adminList.length;i++){
							pagingPlugAdmin($(adminProfiles[i]), adminList[i]);
							$(adminProfiles[i]).show(500);
						}
					}else{
						var numArr = new Array();//记录当前的下标
						for(var i = 0 ; i<adminList.length;i++){
							pagingPlugAdmin($(adminProfiles[i]), adminList[i]);
							$(adminProfiles[i]).show(500);
							numArr[i]=i;//记录当前下标值
						}
						for(var i = 0 ; i<adminProfiles.length;i++){
							if(numArr[i]==i){
								continue;
							}else{
								$(adminProfiles[i]).hide(500);
							}
						}
					}
					var pagingBar = dataObject.pagingBar;
					var aNumBar = $(".NumBar")
					for(var i = 0 ; i<pagingBar.length;i++){
						$(aNumBar[i]).text(pagingBar[i]);
					}
					currentPage=dataObject.currentPage;
					finalPage=dataObject.totalPage;
					var numBars = $('.NumBar');
					for(var i = 0;i<numBars.length;i++){
						if(parseInt($(numBars[i]).text())==currentPage){
							$('.NumBar').css({"background":"rgba(0,0,0,0)","color":"white"});
							$(numBars[i]).css({"background":"white","color":"black"})
							break;
						}
					}
				}
			});
		}

		function pagingPlugAdmin(AdminProfileTag , AdminProfileData){
			var id = AdminProfileData.id;
			var adminname = AdminProfileData.adminname;
			var description = AdminProfileData.description;
			var roleSet = AdminProfileData.roleSet;
			AdminProfileTag.find("img.imgLocal").attr("src","${pageContext.request.contextPath}/AdminServlet.servlet?method=showAdminHead&adminId="+id);
			AdminProfileTag.find("div.title-over").children("h4").children().text(adminname);
			AdminProfileTag.find("span.deleteAdmin").attr("adminId",id);
			AdminProfileTag.find("span.adminname").text(adminname);
			AdminProfileTag.find("input.adminName").attr("placeholder",adminname);
			AdminProfileTag.find("div.roleSet").html("");
			for(var i = 0 ; i<roleSet.length;i++){
				var tag=$('<span style="display:inline-block; margin-left:5px;font-weight:bold;"><a href="#">'+roleSet[i].name+'</a></span>');
				AdminProfileTag.find("div.roleSet").append(tag);
			}
			AdminProfileTag.find("div.description").text(description);
		}
		//结束分页的数据显示的操作
		//开始搜索事件
		$('#subscribe-text').keyup(function(){
			var retrievalValue = $(this).val();
			//alert(retrievalValue);
			if(retrievalValue.trim().length!=0){
				$.ajax({
					url:"${pageContext.request.contextPath}/AdminServlet.servlet?method=retrievalAdmin&retrievalValue="+retrievalValue,
					type:"POST",
					cache:false,//禁止缓存
					async:false,//异步开启
					processData:false,//进程数据false
					contentType:false,//已经声明属性enctype:"multipart/form-data",所以这里设置为false.
					dataType:"json",//返回数据格式json
					success:function(dataObject){
						//alert(dataObject.length)
						var adminProfiles = $('.AdminProfile');
						var adminList = dataObject;

						if((adminProfiles.length-adminList.length)==0){
							for(var i = 0 ; i<adminList.length;i++){
								pagingPlugAdmin($(adminProfiles[i]), adminList[i]);
								$(adminProfiles[i]).show(500);
							}
						}else{
							var numArr = new Array();//记录当前的下标
							for(var i = 0 ; i<adminList.length;i++){
								pagingPlugAdmin($(adminProfiles[i]), adminList[i]);
								$(adminProfiles[i]).show(500);
								numArr[i]=i;//记录当前下标值
							}
							for(var i = 0 ; i<adminProfiles.length;i++){
								if(numArr[i]==i){
									continue;
								}else{
									$(adminProfiles[i]).hide(500);
								}
							}
						}
					}
				});
			}else{
				paginationAdminCommon(currentPage)
			}
		});
		//开始刪除操作
		$(".deleteAdmin").click(function(){
			var thisDelete = $(this);
			$(".dialogBg").show();
			$(".dialogSubject").slideDown(500);
			$("#isureDeleteData").bind("click",function(){
				deleteAdminFunction(thisDelete);
				$("#isureDeleteData").unbind("click");
			});
		});
		$("#cancelDeleteData").click(function(){
			$(".dialogBg").slideUp();
			$(".dialogSubject").slideUp(100);
		});

		function deleteAdminFunction(currentTag){
			//alert(currentTag.attr("adminId"));
			$.ajax({
				url:"${pageContext.request.contextPath}/AdminServlet.servlet?method=deleteAdmin&adminId="+currentTag.attr("adminId"),
				type:"POST",
				cache:false,//禁止缓存
				async:false,//异步开启
				processData:false,//进程数据false
				contentType:false,//已经声明属性enctype:"multipart/form-data",所以这里设置为false.
				dataType:"json",//返回数据格式json
				success:function(object){
					//alert(object);
					var variable = object.authorityMessage;
					if("yes"==variable){
						$("#alertMessage").hide();
						$("#successfully").show(500);
						currentTag.parent().parent().parent().hide();
						setTimeout(function(){
							$("#alertMessage").show();
							$("#successfully").hide()
							$(".dialogBg").slideUp();
							$(".dialogSubject").slideUp(100);
						},3000);
						paginationAdminCommon(currentPage);
					}else if("no"==variable){
						$("#alertMessage").hide();
						$("#deleteFail").children("span").text("未知错误！检修中。。。");
						$("#deleteFail").show(500);
						setTimeout(function(){
							$("#alertMessage").show();
							$("#deleteFail").hide()
							$(".dialogBg").slideUp();
							$(".dialogSubject").slideUp(100);
						},3000);
					}else if("noIdentity"==variable){
						$("#alertMessage").hide();
						$("#deleteFail").children("span").text("请登录管理员身份");
						$("#deleteFail").show(500);
						setTimeout(function(){
							$("#alertMessage").show();
							$("#deleteFail").hide()
							$(".dialogBg").slideUp();
							$(".dialogSubject").slideUp(100);
						},3000);
					}else if("noAuthotity"==variable){
						$("#alertMessage").hide();
						$("#deleteFail").children("span").text("权限不足");
						$("#deleteFail").show(500);
						setTimeout(function(){
							$("#alertMessage").show();
							$("#deleteFail").hide()
							$(".dialogBg").slideUp();
							$(".dialogSubject").slideUp(100);
						},3000);
					}else if("dataBindingError"==variable){
						$("#alertMessage").hide();
						$("#deleteFail").children("span").text("不能针对当前用户删除");
						$("#deleteFail").show(500);
						setTimeout(function(){
							$("#alertMessage").show();
							$("#deleteFail").hide()
							$(".dialogBg").slideUp();
							$(".dialogSubject").slideUp(100);
						},3000);
					}
				}
			});
		}
		//结束删除操作


		//开始修改管理员的名字
		$(".adminname").parent().mouseover(function(){
			$(this).siblings("input").show(500);
		});
		$(".adminName").focusout(function(){
			var adminId = $(this).parents("div.inside").siblings("span.deleteAdmin").attr("adminId");
			//alert("管理员的id是："+adminId);
			var thisTag = $(this);
			$(this).hide(500);
			var alterName = $(this).val();
			if(alterName.trim().length!=0){
				$.ajax({
					url:"${pageContext.request.contextPath}/AdminServlet.servlet?method=alterAdminName&adminId="+adminId+"&newName="+alterName,
					type:"POST",
					cache:false,//禁止缓存
					async:false,//异步开启
					processData:false,//进程数据false
					contentType:false,//已经声明属性enctype:"multipart/form-data",所以这里设置为false.
					dataType:"json",//返回数据格式json
					success:function(object){
						//alert(object.message);
						if(object.message=="yes"){
							thisTag.parents("div.post-hover").siblings("div.title-over").children("h4").children().text(alterName);
							thisTag.siblings("span").find("span.adminname").text(alterName);
							thisTag.attr("placeholder",alterName);
						}else if(object.message=="oneself"){
							setTimeout(function(){
								top.window.href="${pageContext.request.contextPath}/BackstageLogonServlet?method=adminLogon";
							},2000);
						}
					}
				});
			}
		});
	});
</script>
</body>
</html>
<!--
alert(finalPage+currentPage);
var adminProfiles = $('.AdminProfile');
alert(adminProfiles.length);
testPagingPlugAdmin($(adminProfiles[1])); -->



<!--  function testPagingPlugAdmin(AdminProfileTag){
alert(AdminProfileTag.find("img.imgLocal").attr("imgLocal"));
alert(AdminProfileTag.find("div.title-over").children("h4").children().text());
alert(AdminProfileTag.find("span.deleteAdmin").attr("adminId"));
alert(AdminProfileTag.find("input.adminName").attr("placeholder"));
alert(AdminProfileTag.find("div.roleSet").children("span").length);
alert(AdminProfileTag.find("div.description").text());

var url = "${pageContext.request.contextPath}/AdminServlet.servlet";
var args = {"method":"alterAdminName","adminId":adminId,"newName":alterName,"time":new Time()};
$.post(url , args , function(data){
alert(data);
})
} -->