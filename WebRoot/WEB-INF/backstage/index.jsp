<%--
  Created by IntelliJ IDEA.
  User: ChenBaiHong
  Date: 9/23/2016
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!--开始Meta-->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content="ChenBaiHong"/>
    <!--结束Meta-->
    <title>后台管理员操作界面</title>
    <!--开始引入css stylesheet-->
    <!-- BOOTSTRAP CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- 特色风格的字体 图标 CSS样式 -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/font-awesome/css/font-awesome.css"rel="stylesheet"/>
    <!-- 基本主题的 CSS 样式 -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style.css"rel="stylesheet"/>
    <!--结束引入css stylesheet-->
</head>
<body>
<!--开始-->
<section id="container">
    <!--开始页头-->
    <header class="header white-bg"><!--页头白色背景-->
        <!--侧边列切换键按钮-->
        <div class="sidebar-toggle-box">
            <div  data-placement="right" class="fa fa-bars tooltips"></div>
        </div>
        <!--侧边列切换键按钮 结束-->
        <a href="#" class="logo">BaiHong<span>BackstageAdmin</span></a>
        <!-- 开始标题导航 -->
        <nav class="nav notify-row" id="top_menu">
            <ul class="nav top-menu">
                <!-- 开始收件通知栏 -->
                <li class="dropdown" id="header_inbox_bar">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-envelope-o">
                        </i><!--只有超级管理员和老板才能接受来自客户发送的邮件消息-->
                        <span class="badge bg-important">1</span>
                    </a>
                    <ul class="dropdown-menu extended inbox">
                        <li class="notify-arrow notify-arrow-blue"></li>
                        <li>
                            <p class="blue">你有1条消息</p>
                        </li>
                        <li><a href="#"> <span class="photo">
                            <img alt="avatar" src="${pageContext.request.contextPath}/backgroundPlug/img/avatar-mini.jpg">
                        </span><span class="subject">11
                            <span class="from">ChenBaiHong</span>
                            <span class="time">刚刚</span>
                        </span><span>
                            Hello！这儿有一条消息
                        </span></a></li>
                    </ul>
                </li>
                <!--结束收件通知烂-->
                <!--开始订单通知通知栏 ， 主要接受来自客户下的订单通知-->
                <li id="header_notification_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-bell-o"></i>
                        <span class="badge bg-warning">7</span>
                    </a>
                    <ul class="dropdown-menu extended notification">
                        <li class="notify-arrow notify-arrow-blue"></li>
                        <li><p class="blue">7</p></li>
                    </ul>
                </li>
                <!--结束订单栏通知-->
            </ul>
        </nav>
        <!--结束标题导航-->
        <!--开始用户登录下拉菜单-->
        <div class="top-nav">
            <ul class="nav pull-right top-menu">
                <li>
                    <input type="text" class="form-control search" placeholder="Search">
                </li>
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <img alt="" src="">
                        <span class="username">
                            ${admin.adminname}
                        </span>
                        <b class="caret"></b><!--caret:插入号；插入符号；脱字符-->
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <li class="log-arrow-up"></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/WEB-INF/backstage/admin/adminProfile.jsp" target="main">
                                <i class="fa fa-suitcase"></i>
                                管理员信息
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" onclick="logonQuit()">
                                <i class="fa fa-key"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--结束用户登录拉-->
    </header>
    <!--结束 页头-->
    <!--开始布局侧边栏-->
    <aside>
        <div id="sidebar" class="nav-collapse">
            <ul class="sidebar-menu" id="nav-accordion"><!--accordion:手风琴-->
                <li>
                    <a href="${pageContext.request.contextPath}/BackstageLogonServlet.servlet?method=defaultMain" class="active" target="main">
                        <i class="fa fa-dashboard"></i><!--dashboard:仪表盘-->
                        <span>仪表盘</span>
                    </a>
                </li>
                <!--登陆管理员的名字  开头-->
                <li>
                    <a href="javascript:;">
                        <i class="fa fa-user"></i>
                        <span>
                            ${admin.adminname}
                        </span>
                    </a>
                </li>
                <!--登陆管理员的名字 结尾-->
                <!--开始登录超级管理员的操作 开头-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-users"></i>
                        <span>超级管理员</span>
                    </a>
                    <ul class="sub">
                        <li class="sub-menu">
                            <a href="javascript:;">
                                管理员操作
                            </a>
                            <ul class="sub">
                                <li>
                                    <a href="javascript:;" id="ergodicAdmin" target="main">
                                        查看管理员
                                    </a>
                                    <div style="width: 100px; height: 20px; background:transparent; display:none">
                                        <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                                    </div>
                                </li>
                                <li>
                                    <a href="javascript:;" id="addictionAdmin" target="main">
                                        添加管理员
                                    </a>
                                    <div style="width: 100px; height: 20px; background:transparent; display:none">
                                        <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                角色操作
                            </a>
                            <ul class="sub">
                                <li>
                                    <a href="javascript:;" id="ergodicRole" target="main">
                                        查看角色
                                    </a>
                                    <div style="width: 100px; height: 20px; background:transparent; display:none">
                                        <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                                    </div>
                                </li>
                                <li>
                                    <a href="javascript:;" target="main" id="allocationRole">
                                        添加角色
                                    </a>
                                    <div style="width: 100px; height: 20px; background:transparent; display:none">
                                        <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                权限操作
                            </a>
                            <ul class="sub">
                                <li>
                                    <a href="javascript:;" id="searchPrivilege"target="main">
                                        查看权限
                                    </a>
                                    <div style="width: 100px; height: 20px; background:transparent; display:none" class="div prompt">
                                        <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                                    </div>
                                </li>
                                <li><%--${pageContext.request.contextPath}/BackstageLogonServlet?method=allocationPrivilege--%>
                                    <a href="javascript:;"  target="main" id="allocationPrivilege">
                                        数据库分配权限
                                    </a>
                                    <div style="width: 100px; height: 20px; background:transparent; display:none" class="prompt div">
                                        <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <!--结束登录超级管理员的操作 结尾-->
                <!--开始产品品牌的管理操作 开头-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>
                            产品品牌
                        </span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="javascript:;"  target="main" id="searchBrand">
                                查看品牌
                            </a>
                            <div style="width: 100px; height: 20px; background:transparent; display:none" class="prompt div">
                                <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                            </div>
                        </li>
                        <li>
                            <a href="javascript:;"  target="main" id="allocationBrand">
                                添加品牌
                            </a>
                            <div style="width: 100px; height: 20px; background:transparent; display:none" class="prompt div">
                                <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                            </div>
                        </li>
                    </ul>
                </li>
                <!--结束产品品牌的管理操作 结尾-->
                <!--开始产品类别的管理操作 开头-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>
                            管理分类
                        </span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="javascript:;"  target="main" id="handlerCategory">
                                操作分类
                            </a>
                            <div style="width: 100px; height: 20px; background:transparent; display:none" class="prompt div">
                                <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                            </div>
                        </li>
                    </ul>
                </li>
                <!--结束产品类别的管理操作 结尾-->
                <!--开始产品的管理操作  开头-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-list-alt"></i>
                        <span>
                            产品管理
                        </span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="javascript:;"  target="main" id="searchProduct">
                                查看产品
                            </a>
                            <div style="width: 100px; height: 20px; background:transparent; display:none" class="prompt div">
                                <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                            </div>
                        </li>
                        <li>
                            <a href="javascript:;"  target="main" id="allocationProduct">
                                添加产品
                            </a>
                            <div style="width: 100px; height: 20px; background:transparent; display:none" class="prompt div">
                                <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                            </div>
                        </li>
                    </ul>
                </li>
                <!--结束产品的管理操作  结尾-->
                <!--开始订单管理 开头-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-shopping-cart"></i>
                        <span>
                            订单管理
                        </span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="${pageContext.request.contextPath}/OrdersServlet?method=waitHandlerOrder" target="main">
                                待处理订单
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/OrdersServlet?method=alreadyHandlerOrder" target="main">
                                已发货订单
                            </a>
                        </li>
                    </ul>
                </li>
                <!--结束订单管理 结尾-->
                <!--开始用户的邮箱发送邮件-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-envelope"></i>
                        <span>
                            邮件消息
                        </span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="${pageContext.request.contextPath}/UserServlet?method=colonySendEmail" target="main">
                                客户群发邮件
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/UserServlet?method=searchUserEmail" target="main">
                                搜索客户发送邮件
                            </a>
                        </li>
                    </ul>
                </li>
                <!--结束用户的邮箱发送邮件-->
               
                <!--开始数据备份操作-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>
                            数据备份管理
                        </span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="${pageContext.request.contextPath}/DataBackupServlet?method=backupData" target="main">
                                备份数据
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/DataBackupServlet?recoverData" target="main">
                                数据恢复
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 开始客服中心聊天 -->
                <li style="background:">
                    <a href="javascript:;"  target="main" id="entryCustmerService" style="background: rgba(114,208,235,0.15);font-weight: bold;font-size: 14px;border-radius:4px;color:white">
          				<i class="fa fa-comments"></i>             
                        <span>客服中心</span>
                        <span class="label label-info span-sidebar">7</span>
                    </a>
                    <div style="width: 100px; height: 20px; background:transparent; display:none" class="prompt div">
                        <p style="margin-left: 15px; color:#86e1de; font-weight: bold;">权限不足</P>
                    </div>
                </li>
                <!-- 结束客服中心聊天 -->
            </ul>
        </div>
    </aside>
    <!--结束侧边栏布局-->
    <!--开始主页面布局-->
    <section id="main-content">
        <iframe src="${pageContext.request.contextPath}/BackstageLogonServlet.servlet?method=defaultMain" name="main"  width="100%" height="100%"></iframe>
    </section>
    
</section>
<!--结束selection-->
<!--开始引入js插件-->
<!-- 1.引入JQuery插件，必须是开头第一一个，因为现在的流行插件都是基于jQuery-->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery-3.1.1.min.js" ></script><!-- BASIC JQUERY 1.8.3 LIB. JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDIN JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/respond.min.js" ></script><!-- RESPOND JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/common-scripts.js"></script><!-- BASIC COMMON JS -->
<script type="text/javascript">
    $(function(){
        var brandData=null;
       var timer = setInterval(intervalTime, 1500);
        //添加权限点击事件，判断当前管理员是否具有权限,备注此权限只有超级管理员
        $("#allocationPrivilege").click(function(){
            var url = "${pageContext.request.contextPath}/PrivilegeServlet.servlet";
            var args={"method":"detectionPrivilege","time":new Date()};
            $.post(url , args , function(data){
                var object = eval("("+data+")");
                var various = object.authorityMessage;
                if("no"==various){
                    clearInterval(timer);
                    $('div[class="prompt div"]').children().text("权限不足！")
                    $('div[class="prompt div"]').show(500);
                    timer = setInterval(intervalTime, 1500);
                }else if("yes"==various){
                    <%--"${pageContext.request.contextPath}/BackstageLogonServlet?method=allocationPrivilege"--%>
                    window.location.target="main";
                    main.location.href="${pageContext.request.contextPath}/BackstageLogonServlet.servlet?method=allocationPrivilege";
                }else if("error"==various){
                    window.location.href="${pageContext.request.contextPath}/500.jsp";
                }else if("noIdentity"==various){
                	clearInterval(timer);
                	$('div[class="prompt div"]').children().text("请先登录！")
                    $('div[class="prompt div"]').show(500);
                    timer = setInterval(intervalTime, 1500);
                }
            })
            return false;
        });
        function intervalTime() {
            $('div[class="prompt div"]').hide(500);
        }
        //查看权限点击事件，判断当前管理员是否具有查看权限，具备就跳转到查看权限的界面
        $("#searchPrivilege").click(function(){
            var url = "${pageContext.request.contextPath}/PrivilegeServlet.servlet";
            var args={"method":"findAllPrivilegeCheck","time":new Date()};
            IsHaveAuthority(url,args,"searchPrivilege",$(this).siblings("div"))
        });
        //查看角色点击事件，判断当前管理员是否具查看角色的权限，具有就跳转查看角色的界面
        $("#ergodicRole").click(function(){
            var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
            var args={"method":"findAllRoleCheck","time":new Date()};
            IsHaveAuthority(url,args,"ergodicRole",$(this).siblings("div"))
        });
        //添加角色点击事件，判断当前管理员是否具有添加权限的权限，具备跳转添加角色的界面
        $("#allocationRole").click(function(){
            //${pageContext.request.contextPath}/RoleServlet?method=addRole
            var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
            var args={"method":"addRoleCheck","time":new Date()};
            IsHaveAuthority(url,args,"additionalRole",$(this).parent().children().eq(1));
        });
        //添加管理员点击事件，判断当前管理员是否具备该添加其他管理员的权限，具备跳转到添加管理员的界面
        $("#addictionAdmin").click(function(){
            //${pageContext.request.contextPath}/AdminServlet
            var url = "${pageContext.request.contextPath}/AdminServlet.servlet";
            var args={"method":"addAdminCheck","time":new Date()};
            IsHaveAuthority(url,args,"addAdminTarget",$(this).parent().children().eq(1));
        });
		//查看管理员点击事件，判断当前管理员是否具查看其他管理员的权限，具有就跳转查看管理员的界面
        $("#ergodicAdmin").click(function(){
            var url = "${pageContext.request.contextPath}/AdminServlet.servlet";
            var args={"method":"findAllAdminCheck","time":new Date()};
            IsHaveAuthority(url,args,"ergodicAdmin",$(this).siblings("div"))
        });
        //添加品牌点击事件，判断当前管理员是否具备该添加分类的权限，具备跳转到添加品牌的界面
        $("#allocationBrand").click(function(){
            var url = "addBrandCheckAction";
            var args={"time":new Date()};
            IsHaveAuthorityAction(url,args,"addBrandCheckTarget",$(this).parent().children().eq(1));
        });
		//查看品牌点击事件，判断当前管理员是否具查看分欸权限，具有就跳转查看品牌的界面
        $("#searchBrand").click(function(){
            var url = "searchBrandCheckAction";
            var args={"time":new Date()};
            IsHaveAuthorityAction(url,args,"searchBrandTarget",$(this).siblings("div"))
        });
        //添加产品点击事件，判断当前管理员是否具备该添加产品的权限，具备跳转到添加产品的界面
        $("#allocationProduct").click(function(){
            var url = "addProductCheckAction";
            var args={"time":new Date()};
            IsHaveAuthorityAction(url,args,"addProductCheckTarget",$(this).parent().children().eq(1));
        });
		//查看产品点击事件，判断当前管理员是否具查看查看产品的权限，具有就跳转查看分类的界面
        $("#searchProduct").click(function(){
            var url = "searchProductCheckAction";
            var args={"time":new Date()};
            IsHaveAuthorityAction(url,args,"searchProductTarget",$(this).siblings("div"));
        });
        //添加分类点击事件，判断当前管理员是否具备该添加分类的权限，具备跳转到添加分类的界面
        $("#handlerCategory").click(function(){
        	var url = "handlerCategoryCheckAction";
            var args={"time":new Date()};
            IsHaveAuthorityAction(url,args,"handlerCategoryTarget",$(this).siblings("div"));
        });
        //添加进入客服点击事件，判断当前管理员是否具备该添加分类的权限，具备跳转到客服服务的界面
        $("#entryCustmerService").click(function(){
        	var url = "entryCustmerServiceAction";
            var args={"time":new Date()};
            IsHaveAuthorityAction(url,args,"entryCustmerServiceTarget",$(this).siblings("div"));
        });
        function IsHaveAuthority(url,args,targetArguments,divPrompt){
            $.post(url , args , function(data){
                //alert(data)
                var object = eval("("+data+")");
                var various = object.authorityMessage;
                if("no"==various){
                    divPrompt.show(500);
                    setTimeout(function(){
                        divPrompt.hide(500);
                    }, 2000);
                }else if("yes"==various){
                    main.location.href=url+"?method="+targetArguments;
                }else if("noIdentity"==various){
                    divPrompt.children().text("请登录身份")
                    divPrompt.show(500);
                    setTimeout(function(){
                        divPrompt.hide(500);
                    }, 2000);
                }else if("noCheck"==various){
                    divPrompt.children().text("无法检查")
                    divPrompt.show(500);
                    setTimeout(function(){
                        divPrompt.hide(500);
                    }, 2000);
                }else if("error"==various){
                    top.location.href="${pageContext.request.contextPath}/500.jsp";
                }
            })
        }
        function IsHaveAuthorityAction(url,args,targetArguments,divPrompt){
            $.post(url , args , function(data){
                //alert(data);
                var object = eval("("+data+")");
                var various = object.authorityMessage;
                if("ban"==various){
                    divPrompt.show(500);
                    setTimeout(function(){
                        divPrompt.hide(500);
                    }, 2000);
                }else if("pass"==various){
                    main.location.href=targetArguments;
                }else if("noIdentity"==various){
                    divPrompt.children().text("请登录身份")
                    divPrompt.show(500);
                    setTimeout(function(){
                        divPrompt.hide(500);
                    }, 2000);
                }
            })
        }
    });
    function logonQuit(){
        var result = confirm("你确定退出吗？");
        if(result==true){
            top.location.href="${pageContext.request.contextPath}/BackstageLogonServlet.servlet?method=adminLogon";
        }
    }
    //knob:旋纽；按钮；门把，拉手
    $(".knob").knob();
</script>
<!-- 结束引入js插件 -->
</body>
</html>
