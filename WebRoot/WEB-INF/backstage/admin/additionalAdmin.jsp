<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 11/10/2016
  Time: 12:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js">
<head>
    <title>Title</title>
    <meta name="description" content="">
    <meta name="viewpoint" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AdminBg/css/reveal.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/animal.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/animal.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/previewImg.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/templatemo-style.css">

    <script src="${pageContext.request.contextPath}/backgroundPlug/AddRole/js/vendor/modernizr-2.6.2.min.js"></script>

    <style type="text/css">
        .contact-form input.reset {width: auto;color: white;background: #5cb48e;text-transform: uppercase;border: 0;
            outline: 0;margin-bottom: 0;padding: 12px 18px;margin-left:26%;
        }
        .contact-form input.button{margin-left:26%;}
        input[type="text"]{
            background: rgba(123,159,171,0.2);color:whitesmoke;border-radius:2px;border:1px solid whitesmoke;margin:0px;
        }
        input[type="password"]{
            background: rgba(123,159,171,0.2);color:whitesmoke;border-radius:2px;border:1px solid whitesmoke;margin:0px;
        }
        input[type="file"]{
            background: rgba(123,159,171,0.2);color:whitesmoke;border-radius:2px;border:1px solid whitesmoke; display:none;
        }
        #browseImg{
            color: white;background: rgba(111,221,221,0.3);;border: 0;outline: 0;margin-bottom: 0;padding: 12px 18px; border-radius: 6px;display:inline;height: 40.3%;line-height:40.3%;cursor:pointer;
        }
        .prompt{display:none ;font-weight:bold;color: #843534;padding:0px; margin:0px;}
        .responsePrompt{
            display: none;
            width:inherit;
            height: inherit;
            text-align: center;
            color: whitesmoke;
            position: absolute;
            background: rgba(0,0,0,0.4);
        }
        .updateData{
            width: 106px; height: 39px;line-height: 39px; text-align: center;background: #5CB48E;
            margin-top: 20px;
        }
        .navigate{position:relative;color: whitesmoke;font-size: 18px;font-weight: bold;font-family: inherit;left: 6em;background: rgba(223,215,204,0.3);
            border-radius: 3px;display:inline;
        }
        #updateDescription{
		    overflow: auto;
		    vertical-align: top;
		    position: relative;
		    height: 73%;
		    left: -0.2%;
		    bottom: -7.97%;
		    width: 99.92%;
		    resize: none;
		    border-radius: 2px;
		    border: none;
		    background: rgba(0,0,0,0.2);
		    color: black;
		}
    </style>
</head>
<body style="overflow:auto;">

    <div id="imageFlow"style="background:url('${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty1.jpg');position:fixed; width:100%;z-index:0;" >
        <div class="top" style="background:transparent;width:100%; ">
        </div>
        <div class="bank" >
            <a rel="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty7.jpg" title="Thiking" href="#" >思路决定出路</a>
            
            <a rel="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty8.jpg" title="Knowledge" href="#">书山有路勤为尽</a>
            
            <a rel="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty6.jpg" title="Diligent" href="#">学海无涯苦作舟</a>
            
            <a rel="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty5.jpg" title="Comfortable" href="#">city of gold</a>
            
            <a rel="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty4.jpg" title="Position" href="#">平淡的世界</a>
            
            <a rel="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty3.jpg" title="Empathy" href="#">精彩的人生</a>
            
            <a rel="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty2.jpg" title="Activity" href="#">活出不一样的自己</a>
            
            <a rel="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/beauty1.jpg" title="Peaceful" href="#">宁静致远方能运筹帷幄之中</a>
        </div>
        <div class="text" >
            <div class="title">
                Loading</div>
            <div class="legend">
                Please wait...</div>
        </div>
        <div class="scrollbar" >
            <img class="track" src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/track.jpg" alt="">
            <img class="arrow-left" src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/left.png" style="width: 4%;margin-top: -1.4%;" alt="">
            <img class="arrow-right" src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/right.png" style="width: 4%;margin-top: -1.4%;" alt="">
            <img class="bar" src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/images/bar.jpg" alt=""> </div>
    </div>
    <section class="wrapper">
        <!-- TOP HEADER -->
        <div class="top-header" style="background: rgba(0,0,0,0);">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <p class="phone-info"><a href="#">010 020 0340</a></p>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="social-icons">
                            <ul>
                                <li><a href="#" class="fa fa-facebook"></a></li>
                                <li><a href="#" class="fa fa-twitter"></a></li>
                                <li><a href="#" class="fa fa-linkedin"></a></li>
                                <li><a href="#" class="fa fa-dribbble"></a></li>
                                <li><a href="#" class="fa fa-rss"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- .top-header -->

        <div class="copyrights">Collect from </div>
        <div class="container" id="page-content">
            <div class="row">
                <div class="col-md-10 col-sm-12 content-holder">
                    <!-- CONTENT -->
                    <div id="menu-container">
                        <!-- 开始添加管理员 -->
                        <div id="menu-4" class="content contact-section" style="display:block">
                            <div class="row">
                                <!--  开始管理员的注册的界面 -->
                                <div class="col-md-8 col-sm-8" style="">
                                    <div class="box-content" style="background: rgba(0,0,0,0.5);">
                                        <h3 class="widget-title" style="color:whitesmoke">add Admin</h3>
                                        <div class="navigate" style="left:32%;">
                                            <!--    触发步骤一的显示界面 -->
                                        <span style="background: rgba(16,241,196,0.4);
										border-radius: 2px;cursor:pointer;" class="triggerStep1">
                                        <i class="fa fa-chevron-left"></i>
                                         	第一步
                                        <i class="fa fa-angle-double-right"></i>
                                        </span>
                                            <!--     触发步骤二的显示界面 -->
                                       	<span style="border-radius: 2px;cursor:pointer;margin-left:2%;" class="triggerStep2">
                                       	<i class="fa fa-angle-double-right"></i>
                                                                                              第二步
                                        <i class="fa fa-chevron-right"></i>
                                        </span>
                                        </div>

                                        <form class="contact-form" id="adminForm" name="adminForm"
                                              action="${pageContext.request.contextPath}/AdminServlet.servlet"
                                              method="post" enctype="multipart/form-data" style="overflow-x:hidden;">
                                            <div style="position:relative;width:100%;overflow:hidden;">
	                                            <div id="step1" style="position:relative;float:left;left:0px;width:100%;">
	                                                <fieldset style="height: 8.888%; font-weight:bold; color:#72D0EB">
	                                                    <div>
	                                                        <span><i class="fa fa-user" style="margin-right: 5px;"></i>管理员</span>
	                                                        <span style="display:none" class="spanCheck"><i class="fa fa-check-square-o"></i></span>
	                                                    </div>
	                                                    <div><!-- 管理员的登录名    name="adminname" -->
	                                                        <input type="text" name="adminname" id="adminname" autofocus="autofocus" autocomplete="off">
	                                                        <span class="prompt" style="margin-left: 6px;"></span>
	                                                    </div>
	                                                </fieldset>
	                                                <fieldset style="height: 8.888%;font-weight:bold; color:#72D0EB">
	                                                    <div>
	                                                        <span><i class="fa fa-unlock-alt" style="margin-right: 5px;"></i>密　码</span>
	                                                        <span style="display:none" class="spanCheck"><i class="fa fa-check-square-o"></i></span>
	                                                    </div>
	                                                    <div><!-- 对管理员的登陆密码    name="password" -->
	                                                        <input type="password" name="password" id="password1">
	                                                        <span class="prompt" style="margin-left: 6px;"></span>
	                                                    </div>
	                                                </fieldset>
	                                                <fieldset style="height: 8.888%;font-weight:bold; color:#72D0EB">
	                                                    <div>
	                                                        <span><i class="fa fa-unlock-alt" style="margin-right: 5px;"></i>确认密码</span>
	                                                        <span style="display:none" class="spanCheck"><i class="fa fa-check-square-o"></i></span>
	                                                    </div>
	                                                    <div>
	                                                        <input type="password"  id="password2">
	                                                        <span class="prompt" style="margin-left: 6px;"></span>
	                                                    </div>
	                                                </fieldset>
	                                                <fieldset style="height: 8.888%;font-weight:bold; color:#72D0EB">
	                                                    <span><i class="fa fa-camera-retro"></i>&nbsp;上传头像</span>
	                                                    <!--   开始图片上传 -->
	                                                    <!-- 上传头像，对input难看上传就行包装，事件标签 -->
	                                                    <br><br>
	                                                    <div id="browseImg">
	                                                        BrowseFile
	                                                    </div>
	                                                    <!-- 事件类标签触发隐藏的input标签-->
	                                                    <div><!-- 对管理员的上传头像    name="imgLocal" -->
	                                                        <input type="file" name="imgLocal" id="imageInput">
	                                                    </div>
	                                                    <!--   结束图片上传 -->
	                                                </fieldset>
	                                            </div>
	                                            <div id="step2" style="position:absolute;float:left;left:100%;width:100%;">
	                                                <span style="font-weight:bold; color:#72D0EB" class="big-link" data-reveal-id="myModal" data-animation="none"><i class="fa fa-star"></i>&nbsp;角色饰演</span>
	                                                <div style="width:100%;; height:200px;overflow-x: hidden;background: rgba(0,0,0,0)">
	                                                    <div class="show-role" id="show-role" style="width:102.1%; height: 200px; overflow-y: scroll; background: whitesmoke; overflow-x:hidden;background: rgba(0,0,0,0)">
	                                                        <table style="width:100%;background: rgba(0,0,0,0.2)">
	                                                            <tr style="text-algin:center;padding:3%; font-size:16px;">
	                                                                <c:forEach var="role" items="${requestScope.roleList}" varStatus="status">
	                                                                <td style="padding: 2%;text-align: center;">
	                                                                    <span class="role" check="false" style="border-radius: 3px;padding: 1px;" ><label style="color:whitesmoke;" roleId="${role.id}" >${role.name}</label></span>
	                                                                </td>
	                                                                <c:if test="${status.count%2==0}">
	                                                            </tr>
	                                                            <tr style="text-algin:center;padding:3%; font-size:18px;">
	                                                                </c:if>
	                                                                </c:forEach>
	                                                        </table>
	                                                    </div>
	                                                </div>
	                                                <fieldset style="font-weight:bold; color:#72D0EB">
	                                                    <!-- 对管理员的描述文本    name="description" -->
	                                                    <span><i class="fa fa-pagelines"></i>&nbsp;管理员说明</span>
		                                        		<textarea id="addDescription" name="description" cols="30" rows="4" placeholder="管理员说明..."
	                                                              style="background: rgba(0,0,0,0.3);border-radius:5px;"></textarea>
	                                                </fieldset>
	                                            </div>
	                                            <div style="clear:both;"></div>
                                            </div>
                                            <div style="position:relative;">
                                            <fieldset>
	                                            <input type="button" class="button" id="submit" value="提交">
	                                            <input type="reset" class="reset" value="重置">
	                                        </fieldset>
	                                        </div>
                                        </form>
                                    </div>
                                </div>
                                <!--  结束管理员的注册的界面 -->
                                <div class="col-md-4 col-sm-4">
                                    <div class="box-content" style="background: rgba(0,0,0,0.5);min-height:220px;">
                                        <div style="position:relative;min-height:220px;">
                                            <!-- 对管理员的描述文本 -->
                                            <h3 class="widget-title" style="font-weight:bold; color:#72D0EB"><i class="fa  fa-camera"></i>&nbsp;头像</h3>
                                            <!-- 上传图片预演显示 -->
                                            <div id="imagePreview" style="width:inherit;height: inherit;">
                                            </div>
                                            <div class="responsePrompt" id="fa-check" style="height: 100%;width: 100%;bottom: 0px;">
                                                <i class="fa fa-check" style="font-weight:bold; font-size:18px;position: relative;bottom:-51%;">保存成功</i>
                                            </div>
                                        </div>
                                        <div>
                                            <span class="prompt"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 结束添加管理员 -->
                        <!-- 开始更新管理员 -->
                        <div id="menu-2" class="content about-section">
                            <div class="row">
                                <div class="col-md-8 col-sm-8">
                                    <!-- 更新管理员的开始页面 -->
                                    <div class="box-content profile" style="background: rgba(0,0,0,0.5);">
                                        <div class="navigate" style="left:23%;" >
                                            <!--    触发步骤一的显示界面 -->
	                                        <span style="background: rgba(16,241,196,0.4);
											border-radius: 2px;cursor:pointer;" class="updateAdmin-Role" data-reveal-id="myModal" data-animation="none">
	                                        <i class="fa fa-chevron-left"></i>
	                                         	饰演角色
	                                        <i class="fa fa-chevron-right"></i>
	                                        </span>
                                        </div>
                                        <div class="profile-thumb" id="profile-thumb" style="margin-top: 2em;"><!-- 点击更新管理员翻页时检索数据库显示当前添加管理员的头像 -->
											<form id="updateAdminForm" name="updateAdminForm"
                                              action="${pageContext.request.contextPath}/AdminServlet.servlet"
                                              method="post" enctype="multipart/form-data">
                                            <!--   开始更新图片上传 -->
                                            <!-- 上传头像，对input难看上传就行包装，事件标签 -->
                                            <img id="previewUpdateHead" src="${pageContext.request.contextPath}/AdminServlet.servlet?method=showAdminHead" alt="">
                                            <!-- 事件类标签触发隐藏的input标签-->
                                            <div><!-- 对管理员的上传头像    name="imgLocal" -->
                                                <input type="file" name="imgLocal" id="inputUpdatHeadImg">
                                            </div>
                                            <!--   结束图片上传 -->
                                            </form>
                                            <div class="responsePrompt" style="top:88px;left:45px;">
                                                <i class="fa fa-check" style="font-weight:bold; font-size:18px;position: relative;top: 44%;">更新成功</i>
                                       		</div>
                                        </div>
                                        <div class="profile-content" style="background: rgba(225,225,225,0.6);border-radius: 3px;margin-top:3%;">
                                            <div id="controlUpdate" >
                                                <div style="min-height: 115px;position: relative;top: 10px;">
		                                        	<span style="font-weight: bold;display: inline-block;background: rgba(0,0,0,0.5);
														border-radius: 3px;padding: 1px;margin-left: 2px;color:white;cursor:pointer;" class="triggerIntroduce">Introduce</span>
                                                    &nbsp;&nbsp;<p class="introduce"id="introduce" style="display:block;" >没有该管理员的描述。。。</p>
                                                    <textarea id="updateDescription"style="height: 13%; width:100%;display:none;" name="message"  placeholder="角色描述.." autofocus="autofocus"></textarea>
                                                </div>
                                                <hr style="margin: 0px;">
                                                <div style="max-height:161px;position: relative;top:10px;">
		                                        	<span style="font-weight: bold;display: inline-block;background: rgba(0,0,0,0.5);border-radius: 3px;
														padding: 1px;margin-left: 2px;color:white;">Authority</span>
		                                        	<div style="width:100%;height:161px;overflow-x: hidden;background: rgba(0,0,0,0)">
												         <div class="authority" style="width: 104.2%; height:161px; overflow-y:auto;  overflow-x:auto;background: rgba(0,0,0,0)">
												             
												         </div>
												    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="updateData" class="updateData" style="border-radius: 3px;position: relative;left: -1.66%;bottom: 15.34%;"><a href="javascript:;" style="color: white;font-size: 16px;">更新管理员</a></div>
                                    </div>
                                    <!-- 更新角色的结束页面 -->
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <!--    开始检索数据库的权限分页显示的界面 -->
                                    <div class="box-content" style="background: rgba(0,0,0,0.3);">
                                        <h3 class="widget-title" style="font-size: 18px;font-weight: bold;display: inline-block;
										padding: 1px;margin-left: 2px;color:white;">管理员</h3>
                                        <div id="ergodicPagingAdmin">
                                            <ul style="min-height:142px;background: rgba(0,0,0,0.5);border-radius:3px;color:white;font-weight:bold;">
                                                <li>没有可选管理员。。。</li>
                                            </ul>
                                        </div>
                                        <div class="about-social" style="margin-left: 5.6px;">
                                            <ul>
                                                <li><a href="#" class="fa fa-arrow-left" id="previous"></a></li>
                                                <li><a href="#" class="fa" id="numBar">1</a></li>
                                                <li><a href="#" class="fa fa-arrow-right" id="next"></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--    结束检索数据库的权限分页显示的界面 -->
                                </div>
                            </div>
                        </div>
                        <!-- 结束更新管理员 -->
                    </div>
                </div>


                <div class="col-md-2 hidden-sm">
                    <nav id="nav" class="main-navigation hidden-xs hidden-sm">
                        <ul class="main-menu">
                            <li>
                                <a class="show-5 contactbutton" href="#"><i class="fa fa-user"></i>Add Admin</a>
                            </li>
                            <li>
                                <a class="show-2 aboutbutton" id="aboutbutton" href="#"><i class="fa fa-star-half-full"></i>setup Admin</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
	<!-- 开始更新管理员的角色弹出框页面 -->
	<div class="dialogSubject" style="display:none;background: rgba(255,255,255,0.7);height: 170px;width: 500px;position: fixed;top: 35%;left: 35%;
	z-index: 100;border-radius: 5px">
	    <div>
	        <div style="width:100%;height:100%;overflow-x: hidden;background: rgba(0,0,0,0)">
		         <div class="show-role-Update" style="width:102.6%; height:100%; overflow-y: scroll;  overflow-x:hidden;background: rgba(0,0,0,0)">
		             <table style="width:100%;">
		                 <tr style="text-algin:center;padding:3%; font-size:16px;">
		                     <c:forEach var="role" items="${requestScope.roleList}" varStatus="status">
		                     <td style="padding: 2%;text-align: center;">
		                         <span class="role" check="false" style="border-radius: 3px;padding: 2px;background: rgba(21,75,17,0.3);" ><label style="color:black;" roleId="${role.id}" >${role.name}</label></span>
		                     </td>
		                     <c:if test="${status.count%3==0}">
		                 </tr>
		                 <tr style="text-algin:center;padding:3%; font-size:18px;">
		                     </c:if>
		                     </c:forEach>
		             </table>
		         </div>
		     </div>
	    </div>
	</div>
	<div class="dialogBg" style="display:none;background:rgba(0,0,0,0.5);height:100%;width: 100%;position:fixed;z-index:99;bottom: 0px;">
	    <div>
	    </div>
	</div>
	<!-- 结束更新管理员的角色弹出框页面 -->
<!-- BEGIN JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/js/jquery.reveal.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AddRole/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AddRole/js/main.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/assets/jquery-file-upload/js/jquery.fileupload.js"></script>

<script type="text/javascript">
    $(function(){
    	var wW = parseInt(document.body.clientWidth)
    	var wH = parseInt(document.body.clientHeight);
    	var dW = parseInt($(".dialogSubject").width());
    	var dH = parseInt($(".dialogSubject").height());
    	$(".dialogSubject").css({"top":(((wH-dH)/2)+"px"),"left":(((wW-dW)/2)+"px")});
    	$(window).resize(function(){
    		var wW = parseInt(document.body.clientWidth)
	    	var wH = parseInt(document.body.clientHeight);
	    	var dW = parseInt($(".dialogSubject").width());
	    	var dH = parseInt($(".dialogSubject").height());
	    	$(".dialogSubject").css({"top":(((wH-dH)/2)+"px"),"left":(((wW-dW)/2)+"px")});
    	})
        //开始关于form表单的事件
        $(".triggerStep1").mouseover(function(){
            $(this).css("background","rgba(16,241,196,0.4)");
            $(this).siblings("span").css("background","rgba(0,0,0,0)");
            $("#step1").css({"position":"relative"});
            $("#step2").css({"position":"absolute"});
            $("#step1").stop().animate({"left":"0px"},360);
            $("#step2").stop().animate({"left":"100%"},360);
        });
        $(".triggerStep2").mouseover(function(){
            $(this).css("background","rgba(16,241,196,0.4)");
            $(this).siblings("span").css("background","rgba(0,0,0,0)");
            $("#step2").css({"position":"relative"});
            $("#step1").css({"position":"absolute"});
            $("#step2").stop().animate({"left":"0px"},360);
            $("#step1").stop().animate({"left":"-100%"},360);
        });
        $(".contact-form .role").click(function(){
            if($(this).attr("check")=="false"){
                $(this).css("background","rgba(16,241,196,0.4)");
                $(this).attr("check","true");
            }else if($(this).attr("check")=="true"){
                $(this).css("background","rgba(0,0,0,0)");
                $(this).attr("check","false");
            }
        });
        //1. 关于form，开始用户名失去焦点检验数据库是否有用户名重复
        //奇了怪有时候这里不显示就加$(tag)就灵了,这是一个大问题一定要注意！！！！！！！！！！！！！！！
        $("#adminname").focusout(function(){
            var adminname = $(this).val();
            //alert(adminname);
            var thisTag = $(this);//在post里面如果使用this，this一定要转型成普通的js标签;
            if(adminname.trim().length>=2){
                //alert(adminname.trim().length);
                var url = "${pageContext.request.contextPath}/AdminServlet.servlet";
                var args={"method":"verifiedAdminname","adminname":adminname,"time":new Date()};
                $.post(url,args,function(data){
                    //为什么this在post里面就不灵！因为：$(this)在post里面好像被转义了，转义成当前的post,因此this在这里指的就是post自己本身
                    //alert(data);
                    var object = eval("("+data+")");
                    if(object.message=="no"){
                        //alert(object.message);
                        thisTag.attr("check","false");//管理员名字是否符合规则真假值判断
                        thisTag.parent().siblings("div").find("span:eq(1)").hide(500);
                        thisTag.val("");
                        thisTag.siblings("span").text("管理员名重复")
                        thisTag.siblings("span").slideDown(500)
                        setTimeout(function(){
                            thisTag.siblings("span").slideUp(500);
                        },4000);
                    }else if(object.message=="yes"){
                        //alert(object.message);
                        thisTag.attr("check","true");//管理员名字是否符合规则真假值判断
                        thisTag.parent().siblings("div").find("span:eq(1)").slideDown(500);
                    }
                });
            }else{
                thisTag.parent().siblings("div").find("span:eq(1)").hide(500);
            }
        });
        //1. 关于form，结束用户名失去焦点检验数据库是否有用户名重复
        //2 开始密码文本输入后鼠标光标移出事件
        $("#password1").focusout(function(){
            var password1=$(this).val();
            var thisTag = $(this);
            if(password1.trim().length<5){
                $(this).attr("check","false");//管理员密码是否符合规则真假判断
                $(this).parent().siblings("div").find("span:eq(1)").hide(500);
                $(this).siblings("span").text("密码的长度不能小于5")
                $(this).siblings("span").slideDown(500);
                setTimeout(function(){
                    thisTag.siblings("span").slideUp(500);
                },4000);
            }else{
                $(this).attr("check","true");//管理员密码是否符合规则真假值判断
                $(this).parent().siblings("div").find("span:eq(1)").slideDown(500);
            }
        })
        $("#password2").focusout(function(){
            var password2=$(this).val();
            var password1=$("#password1").val();
            var thisTag = $(this);
            if(password1.trim().length!=0){
                if(password2!=password1){
                    $(this).attr("check","false");//管理员密码是否符合规则真假判断
                    $(this).parent().siblings("div").find("span:eq(1)").hide(500);
                    $(this).siblings("span").text("两次输入的密码不一致！")
                    $(this).siblings("span").slideDown(500);
                    setTimeout(function(){
                        thisTag.siblings("span").slideUp(500);
                    },4000);
                }else{
                    $(this).attr("check","true");//管理员密码是否符合规则真假值判断
                    $(this).parent().siblings("div").find("span:eq(1)").slideDown(500);
                }
            }
        });
        //2 结束密码文本输入后鼠标光标移出事件
        //结束关于form表单的事件
        //开始文件上传的事件操作
        $("#browseImg").click(function(){
            //1. 这里被点击时，把点击事件转交给id为（"#imgLocal"）
            $("#imageInput").trigger("click");
        });
        //2. 因此input的父标签，就知道他的孩子标签发生change事件(交换的是时间转移）
        $("#imageInput").parent().bind("change", function(){
            loadImageFile();//触发事件，加载图片
        });
        //开始 初始化单个选项单选值的所在框的宽度
        $(window).resize(function(){
        	$("#imagePreview").children().css("width","100%");
        	//$(".show-role").css("width",(parseInt($(".show-role").parent().width())+12.5)+"px");
        });
        //开始 初始化单个选项单选值的所在框的宽度
        //结束文件上传的事件操作
        //开始图片预演显示到窗口的加工函数
        var loadImageFile = (function () {
            //判断窗口加载的是否是图片文件
            if (window.FileReader) { //如果是图片文件
                //进行文件图片格式过滤
                var oPreviewImg = null, //预先图片文件
                        oFReader = new window.FileReader(), //创建窗口文件读取的类
                //这是一个正则表达式过滤文件
                        rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;
                //文件读取加载
                oFReader.onload = function (oFREvent) { //文件读取事件
                    if (!oPreviewImg) { //预先读取的文件不能为空
                        var newPreview = document.getElementById("imagePreview"); //在id为（"imagePreview"）添加图片标签对象
                        oPreviewImg = new Image();
                        oPreviewImg.style.width = (newPreview.offsetWidth).toString() + "px";
                        newPreview.appendChild(oPreviewImg); //结尾添加图片
                    }
                    oPreviewImg.src = oFREvent.target.result; //img的src结果内容就是oFREvent监听事件得到的文件地址
                };

                return function () { //检验函数，判断input的file上传是否是能匹配正则中，指定文件类型
                    var aFiles = document.getElementById("imageInput").files;
                    if (aFiles.length === 0) {
                        return;
                    }
                    if (!rFilter.test(aFiles[0].type)) {
                        alert("You must select a valid image file!"); return;
                    }
                    oFReader.readAsDataURL(aFiles[0]);
                }
            }
            if (navigator.appName === "Microsoft Internet Explorer") {
                return function () {
                    alert(document.getElementById("imageInput").value);
                    //imageInput上传文件的值，就是我新创建文件的src;
                    document.getElementById("imagePreview").filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById("imageInput").value;
                }
            }
        })();
        //结束图片预演显示到窗口加工函数
        //开始 form表单重置事件
        $(".reset").click(function(){
            $(".contact-form .role").css("background","rgba(0,0,0,0)");
            $(".contact-form .role").attr("check","false");
            $(".contact-form .spanCheck").hide(500);
        });
        //结束 form表单重置事件
        //开始form表单提交事件

        $("#submit").click(function(){
            var adminCheck = $("#adminname").attr("check");
            var repearCheck = $("#password2").attr("check");
            var pwdCheck = $("#password2").attr("check");
            if(adminCheck=="false" || $("#adminname").val().trim().length==0){
                $("#adminname").siblings("span").text("用户名格式错误")
                $("#adminname").siblings("span").slideDown(500);
                setTimeout(function(){
                    $("#adminname").siblings("span").slideUp(500);
                },4000);
                return;
            }
            if(repearCheck=="false" || $("#password2").val().trim().length==0){
                $("#password2").siblings("span").text("两次输入密码格式不一致")
                $("#password2").siblings("span").slideDown(500);
                setTimeout(function(){
                    $("#password2").siblings("span").slideUp(500);
                },4000);
                return ;
            }
            
            if(pwdCheck=="false" || $("#password1").val().trim().length==0){
                $("#password1").siblings("span").text("请按规定输入密码格式")
                $("#password1").siblings("span").slideDown(500);
                setTimeout(function(){
                    $("#password1").siblings("span").slideUp(500);
                },4000);
                return;
            }
            //防止重复提交表单
            $("#adminname").attr("check","false");
            $("#password2").attr("check","false");
            $("#password2").attr("check","false");
            
            var roleArray = new Array();
            for(var i= 0; i<$('.contact-form .role[check="true"] label').length;i++){
                var roleId = $($('.contact-form .role[check="true"] label')[i]).attr("roleId");
                roleArray.push(roleId);
            }
            var roleIds = roleArray.join(",");
            //alert(roleIds);
            ajaxFormFileUpload(roleIds);
        });
        //ajax异步提交表单数据文件
        function  ajaxFormFileUpload(roleIds){
            $.ajax({
                url:"${pageContext.request.contextPath}/AdminServlet.servlet?method=additionAdminInfo&roleIds="+roleIds,
                type:"POST",
                data:new FormData($("#adminForm")[0]),//form表单异步提交数据
                cache:false,//禁止缓存
                async:false,//异步开启
                processData:false,//进程数据false
                contentType:false,//已经声明属性enctype:"multipart/form-data",所以这里设置为false.
                dataType:"json",//返回数据格式json
                success:function(result){
                    //alert(result.message);
                    if(result.message=="yes"){
                        $(".responsePrompt").slideDown(500);
                        setTimeout(function(){
                            $(".responsePrompt").slideUp(500);
                        },4000);
                        
                    }else{
                        $(".responsePrompt").children().text("出错啦!");
                        $(".responsePrompt").slideDown(500);
                        setTimeout(function(){
                            $(".responsePrompt").slideUp(500);
                        },4000);
                    }
                }
            });
        }
        //结束form表单提交事件

        //开始更新页面的的操作
	        //1. 开始点击图片更新头像
	        $("#previewUpdateHead").click(function(){
	            $("#inputUpdatHeadImg").trigger("click");
	        });
	        $("#inputUpdatHeadImg").parent().bind("change",function(){
	            loadUpdateImageFile();
	        })
	        //开始图片预演显示到窗口的加工函数
	        var loadUpdateImageFile = (function () {
	            //判断窗口加载的是否是图片文件
	            if (window.FileReader) { //如果是图片文件
	                var  oFReader = new window.FileReader(), //创建窗口文件读取的类
	                //这是一个正则表达式过滤文件
	                        rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;
	                //文件读取加载
	                oFReader.onload = function (oFREvent) { //文件读取事件
	                    var previewHead = document.getElementById("previewUpdateHead"); //在id为（"imagePreview"）添加图片标签对象
	                    previewHead.src = oFREvent.target.result; //img的src结果内容就是oFREvent监听事件得到的文件地址
	                };
	                return function () { //检验函数，判断input的file上传是否是能匹配正则中，指定文件类型
	                    var aFiles = document.getElementById("inputUpdatHeadImg").files;
	                    if (aFiles.length === 0) {
	                        return;
	                    }
	                    if (!rFilter.test(aFiles[0].type)) {
	                        alert("You must select a valid image file!"); return;
	                    }
	                    oFReader.readAsDataURL(aFiles[0]);
	                }
	            }
	            if (navigator.appName === "Microsoft Internet Explorer") {
	                return function () {
	                    alert(document.getElementById("inputUpdatHeadImg").value);
	                    //imageInput上传文件的值，就是我新创建文件的src;
	                    document.getElementById("previewUpdateHead").filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById("inputUpdatHeadImg").value;
	                }
	            }
	        })();
	        //结束图片预演显示到窗口加工函数
	        //结束点击图片的更新头像的操作
        //结束更新页面的操作
        
        //开始角色显示的弹出框
        $(".updateAdmin-Role").click(function(){
        	$(".dialogBg").show();
        	$(".dialogSubject").slideDown(200);
        	$(".dialogBg").bind("click",function(){
        		$(".dialogBg").hide();
        		$(".dialogSubject").slideUp(200);
        	})
        });
        //结束角色显示的弹出框
        
        //开始分页的数据显示的操作
        var finalPage=1;//初始化最终页
        var currentPage=1;//初始化当前页
        $('.aboutbutton').click(function(){
        	var url="${pageContext.request.contextPath}/AdminServlet.servlet";
	        var args ={"method":"pagingShowAdmin","time":new Date()};
	        paginationAdminCommon(url , args)
        })
        
        $('#previous').click(function(){
        	//alert(currentPage)
        	if(currentPage!=1){
        		$(".introduce").text("");
	       		$(".authority").children().remove();
	        	var url="${pageContext.request.contextPath}/AdminServlet.servlet";
	        	var args ={"method":"pagingShowAdmin","indexBar":currentPage-1,"time":new Date()};
	        	paginationAdminCommon(url , args);
	        }
        })
        $('#next').click(function(){
        	//alert(currentPage)
        	if(currentPage!=finalPage){
        		$(".introduce").text("");
	       		$(".authority").children().remove();
	        	var url="${pageContext.request.contextPath}/AdminServlet.servlet";
	        	var args ={"method":"pagingShowAdmin","indexBar":currentPage+1,"time":new Date()};
	        	paginationAdminCommon(url , args);
	        }
        })
        
        function paginationAdminCommon(url , args){
	    	$.post(url , args , function(data){
	           	var dataObject = eval("("+data+")");
	           	//alert(dataObject);
	           	if(dataObject.length==1){
	           		if("error"==dataObject.error){
	           			$("#ergodicPagingAdmin ul li").eq(0).text("外太空访问数据断了...")
	           		}
	       		}else{
	       			currentPage=dataObject.currentPage;
	       			$("#numBar").text(currentPage);
	       			finalPage=dataObject.totalPage;

	       			$("#ergodicPagingAdmin ul").html("");
	       			var adminList = dataObject.adminList;
	       			for(var i = 0 ; i<adminList.length; i++){
	       				var liTag = $('<li style="text-align:center;position: relative;margin:10px;bottom:-5px;cursor:pointer;">'+
	       				'<a style="background: rgba(255,255,255,0.5);color: black;border-radius: 5px;font-size: 16px;">'+
	       				'<i class="fa fa-smile-o"style="margin-right:2px;"></i>'+adminList[i].adminname+'</a></li>');
	       				//JSON.stringify(roleList[i])是json对象转化为为本字符串
	       				//eval("json格式文本"),json格式字符串文本转化为json对象
	       				$(liTag).attr('admin',JSON.stringify(adminList[i]));//json对象转字符
	       				$(liTag).attr('adminId',adminList[i].id);//json对象转字符
	       				$("#ergodicPagingAdmin ul").append(liTag);
						
	       				$(liTag).click(function(){
	       					
	       					$(".introduce").text("");
	       					$(".authority").html("");
	       					$(this).siblings("li").attr("check","false");
	       					$(this).attr("check","true");
	       					$(this).siblings("li").children("a").css({"background":"rgba(255,255,255,0.5)","color":"black"});
	       					$(this).children("a").css({"background":"rgba(16,241,196,0.4)","color":"white"});
				    		var admin = $(this).attr("admin");
				    		var adminObject=eval("("+admin+")");
			    			if(adminObject.imgLocal.trim().length>5){
				    			$('img[id="previewUpdateHead"]').attr("src","${pageContext.request.contextPath}/AdminServlet.servlet?method=showAdminHead&adminId="+adminObject.id);
				    		}else{
				    			$('img[id="previewUpdateHead"]').attr("src","${pageContext.request.contextPath}/backgroundPlug/AddRole/images/IMG_0076.JPG");
				    		}
				    		
				    		$('img[id="previewUpdateHead"]').attr("adminId", adminObject.id);
				        	
				        	if(adminObject.description.trim().length!=0){
				        		$(".introduce").text(adminObject.description);
				        	}else{
				        		$(".introduce").text("没有该管理员的描述");
				        	}
				        	var roleSet = adminObject.roleSet;
				        	for(var i=0;i<roleSet.length;i++){      							
			           			//这样直接jquery创建一个自己想创建的标签
			           			var tag = $('<span style="position: relative;background: rgba(59,91,142,0.6);border-radius: 3px;display: inline-block;margin: 3%;">'+
						           			'<a href="javascript:;"style="color: whitesmoke;font-weight: bold;padding: 3px; cursor:pointer;">'
						           			+roleSet[i].name+'</a>'+
						           			'</span>');
			           			$(tag).attr("roleId", roleSet[i].id);
			           			$(".authority").append(tag);
			           			//临时标签创建绑定临时事件 
			           			$(tag).bind("click",function(){
			           				$(this).remove();
			           			});
				           }
				    	});
	       			}
	       		}
	        });
    	}
        //结束分页的数据显示的操作
        
        //开始添加角色的操作
        $('.role').click(function(){
        var roleId = $(this).children("label").attr("roleId")
        var roleName = $(this).children("label").text();
        var aTags = $(".authority span a");
        for(var i = 0 ; aTags!=null && i<aTags.length;i++){
        	if(roleName==$(aTags[i]).text()){
        		return;
        	}
        }
        	//alert(roleId+"////"+roleName);
        	//这样直接jquery创建一个自己想创建的标签
           var tag = $('<span style="position: relative;background: rgba(59,91,142,0.6);border-radius: 3px;display: inline-block;margin: 3%;">'+
	           			'<a href="javascript:;"style="color: whitesmoke;font-weight: bold;padding: 3px; cursor:pointer;">'
	           			+roleName+'</a>'+
	           			'</span>');
         	$(tag).attr("roleId", roleId);
         	$(".authority").append(tag);
         	//临时标签创建绑定临时事件 
         	$(tag).bind("click",function(){
         		$(this).remove();
         	});
        });
        
      //结束添加角色的操作
      //开始描述框与文本的切换
      
      $(".triggerIntroduce").click(function(){
		var pTag = document.getElementById("introduce");
		//alert(pTag.style.display=="block")
		if(pTag.style.display=="block"){
			$("#introduce").hide(350);
			$("#updateDescription").slideDown(500);
		}else{
			$("#introduce").show(500);
			$("#updateDescription").slideUp(350);
		}
      });
      $("#updateDescription").focusout(function(){
     // alert();
      if($(this).val().trim().length!=0){
      	$("#introduce").text($(this).val());
      }else{
      	$("#introduce").text("没有该管理员的描述。。。");
      }
      	
      	$(this).slideUp(350);
      	$("#introduce").show(500);
      });
      //开始更新的操作
      	$("#updateData").click(function(){
      		
      		var adminId= $('#ergodicPagingAdmin ul li[check="true"]').attr("adminId");
      		if(adminId.trim().length!=0){
	      		var description = "";
	      		if($("#updateDescription").val().trim().length!=0){
	      			description=$("#updateDescription").val();
	      		}else{
	      			description=$("#introduce").text();
	      		}
	      		var roleArray = new Array();
	      		var tagPans = $(".authority").children("span");
	      		for(var i = 0 ; i<tagPans.length; i++){
	      			roleArray.push($(tagPans[i]).attr("roleId"));
	      		}
	      		var roleIds = roleArray.join(",");
	      		$.ajax({
	      			url:"${pageContext.request.contextPath}/AdminServlet.servlet?method=updateAdminInfo&roleIds="+roleIds+"&description="+description+"&id="+adminId,
	                type:"POST",
	                data:new FormData($("#updateAdminForm")[0]),//form表单异步提交数据
	                cache:false,//禁止缓存
	                async:false,//异步开启
	                processData:false,//进程数据false
	                contentType:false,//已经声明属性enctype:"multipart/form-data",所以这里设置为false.
	                dataType:"json",//返回数据格式json
	                success:function(result){
	                    //alert(result.message);
	                    if(result.message=="yes"){
	                        $(".responsePrompt").slideDown(500);
	                        setTimeout(function(){
	                            $(".responsePrompt").slideUp(500);
	                        },4000);
	                    }else{
	                        $(".responsePrompt").children().text("出错啦!");
	                        $(".responsePrompt").slideDown(500);
	                        setTimeout(function(){
	                            $(".responsePrompt").slideUp(500);
	                        },4000);
	                    }
	                }
	      		})
      		}
      	});
      //结束更新的操作
    });
</script>
</body>
</html>