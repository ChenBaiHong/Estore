<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 12/14/2016
  Time: 9:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/style.css" media="screen" type="text/css" />
    <!-- ========== Css Files ========== -->
    <link href="${pageContext.request.contextPath}/customerServicePlug/css/root.css" rel="stylesheet">
    <style type="text/css">
        form {  margin: 0;  }
        textarea {  display: block;  }
        .content {  padding-top: 0px;  margin-left: 0px;  }
        .mailbox-inbox li .label-danger {  background: #ef4836;  border-radius: 10px;  }
        .conv{  max-height: 700px;  overflow-y: auto;  }
        .conv .float-left{  float:left;  width: 90%;  }
        .conv .float-right{  float: right;  width: 90%;  list-style: none;  }
        .conv li.float-right{  padding-left:0px;  padding-right:70px;  }
        .chat .conv li.float-right .img {  right: -70px;  left: auto;  }
        .conv .myClear{  clear: both;  }
    </style>
    <!-- ========== js Files ========== -->
    <script charset="utf-8" src="${pageContext.request.contextPath}/customerServicePlug/kindeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customerServicePlug/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customerServicePlug/js/bootstrap/bootstrap.min.js"></script>
    <script>
        var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[name="content"]', {
                resizeType : 0,
                allowPreviewEmoticons : false,
                allowImageUpload : true,
                items : [
                    'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                    'insertunorderedlist', '|', 'emoticons', 'image', 'link']
            });
        });
        setTimeout(function(){
            $(".ke-container").css({"width":"100%","border-left-style":"none","border-right-style":"none"});
        },200);
        $(window).resize(function(){
            $(".ke-container").css({"width":"100%","border-left-style":"none","border-right-style":"none"});
        })
    </script>

</head>
<body>
<html lang="en" class="no-js">
<body>
    <div class="md-modal md-effect-16" id="modal-16">
        <div class="md-content">
            <h3>Modal Dialog</h3>
            <div>
                <p>This is a modal window. You can do the following things with it:</p>
                <button class="md-close">Close me!</button>
            </div>
        </div>
    </div>
    <div class="myMainContent">
        <!-- START CONTENT -->
        <div class="content">
            <!-- Start Page Header -->
            <div class="page-header">
                <h1 class="title">客服中心</h1>
                <ol class="breadcrumb">
                    <li class="active">共有 <span class="label label-danger">5</span> 个未处理消息</li>
                </ol>
                <!-- Start Page Header Right Div -->
                <div class="right">
                    <a href="#" class="btn btn-danger"><i class="fa fa-pencil"></i> 客服咨询</a>
                </div>
                <!-- End Page Header Right Div -->
            </div>
            <!-- End Page Header -->
            <!-- //////////////////////////////////////////////////////////////////////////// -->
            <!-- START CONTAINER -->
            <div class="container-mail">
                <!-- Start Mailbox -->
                <div class="mailbox clearfix">
                    <!-- Start Mailbox Menu -->
                    <div class="mailbox-menu">
                        <ul class="menu">
                            <li><a href="#"><i class="fa fa-inbox"></i> 用户中心</a></li>
                            <li><a href="#"><i class="fa fa-flag-o"></i> 会员用户</a></li>
                            <li><a href="#"><i class="fa fa-paper-plane-o"></i>订单客户</a></li>
                            <li><a href="#"><i class="fa fa-trash"></i> 退出客服</a></li>
                        </ul>
                    </div>
                    <!-- End Mailbox Menu -->
                    <!-- Start Mailbox Container -->
                    <div class="container-mailbox">
                        <!-- Start Mailbox Inbox -->
                        <div class="col-lg-3 col-md-4 padding-0" style="padding-left: 0px;padding-right: 0px;">
                        	<div style="width:100% ;position:relative;">
		                        <div class="mailbox-menu">
			                        <ul class="menu">
			                            <li class="logonUser" style="float:left; border:none;">
				                            <a href="#" style="background:rgba(114,208,235,0.5);border-radius:22px;"><i class="fa  fa-comment"></i>登陆用户
				                            <span class="label label-danger" style="border-radius: 99px;top: -5px;position: relative;">5</span>
				                            </a>
			                            </li>
			                            <li class="tempUser" style="float:right; border:none;">
				                            <a href="#" style="border-radius:22px;"><i class="fa  fa-comment"></i>访问游客
				                            <span class="label label-danger" style="border-radius: 99px;top: -5px;position: relative;">5</span>
				                            </a>
			                            </li>
			                        	<li style="clear:both;border:none;"></li>
			                        </ul>
			                        <ul class="mailbox-inbox" style="margin-bottom:0px;">
			                        	<li class="search">
		                                    <form>
		                                        <input type="text" class="mailbox-search" id="mailboxsearch" placeholder="搜索用户" autocomplete="off">
		                                        <span class="searchbutton"><i class="fa fa-search"></i></span>
		                                    </form>
		                                </li>
			                        </ul>
			                    </div>
		                    </div>
                        	<div class="" style="width:100% ;position:relative;">
	                            <ul class="mailbox-inbox logonUserList" style="max-height: 842px;overflow: auto;float: left;width: 100%;position: relative;left: 0;">
	                                
	                                <li>
	                                    <a href="#" class="item clearfix">
	                                        <span class="label label-danger">5</span>
	                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg.png" alt="img" class="img">
	                                        <span class="from">Jonathan Doe</span>
	                                        Hello, m8 how is goin ?
	                                        <span class="date">22 May</span>
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="#" class="item clearfix">
	                                        <span class="label label-danger">5</span>
	                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg.png" alt="img" class="img">
	                                        <span class="from">Jonathan Doe</span>
	                                        Hello, m8 how is goin ?
	                                        <span class="date">22 May</span>
	                                    </a>
	                                </li>
	                            </ul>
	                            <ul class="mailbox-inbox tempUserList" style="max-height: 842px;overflow: auto;float: left;width: 100%;position: absolute;left: -100%;">
	                                <li>
	                                    <a href="#" class="item clearfix">
	                                        <span class="label label-danger">5</span>
	                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg2.png" alt="img" class="img">
	                                        <span class="from">Jonathan Doe</span>
	                                        Hello, m8 how is goin ?
	                                        <span class="date">22 May</span>
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="#" class="item clearfix">
	                                        <span class="label label-danger">5</span>
	                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg2.png" alt="img" class="img">
	                                        <span class="from">Jonathan Doe</span>
	                                        Hello, m8 how is goin ?
	                                        <span class="date">22 May</span>
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="#" class="item clearfix">
	                                        <span class="label label-danger">5</span>
	                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg2.png" alt="img" class="img">
	                                        <span class="from">Jonathan Doe</span>
	                                        Hello, m8 how is goin ?
	                                        <span class="date">22 May</span>
	                                    </a>
	                                </li>
	                            </ul>
	                            <div style="clear:both;"></div>
                            </div>
                        </div>
                        <!-- 开始 javascript做登陆用户和临时的之间的来回切换 -->
                        <script type="text/javascript">
                        	$(".logonUser").click(function(){
                        		var $this= $(this);
                        		$this.children().css("background","rgba(114,208,235,0.5)");
                        		$(".tempUser").children().css("background","white");
                        		$(".logonUserList").css("position","relative");
                        		$(".tempUserList").css("position","absolute");
                        		$(".logonUserList").stop().animate({"left":"0px"},360);
                        		$(".tempUserList").stop().animate({"left":"-100%"},360);
                        	})
                        	$(".tempUser").click(function(){
                        		var $this= $(this);
                        		$this.children().css("background","rgba(114,208,235,0.5)");
                        		$(".logonUser").children().css("background","white");
                        		$(".logonUserList").css("position","absolute");
                        		$(".tempUserList").css("position","relative");
                        		$(".logonUserList").stop().animate({"left":"-100%"},360);
                        		$(".tempUserList").stop().animate({"left":"0px"},360);
                        	})
                        </script>
                        <!-- 结束 javascript做登陆用户和临时的之间的来回切换 -->
                        <!-- End Mailbox Inbox -->
                        <!-- Start Chat -->
                        <div class="chat col-lg-9 col-md-8 padding-0" style="padding-right: 0px;padding-left: 0px;">
                            <!-- Start Title -->
                            <div class="title">
                                <h1>用户激活官网邮箱 <small>( BaiHong.Chen@yahoo.com )</small></h1>
                                <div class="btn-group" role="group" aria-label="...">
                                    <button type="button" class="btn btn-icon btn-sm btn-light"><i class="fa fa-share"></i></button>
                                    <button type="button" class="btn btn-icon btn-sm btn-light"><i class="fa fa-star-o"></i></button>
                                    <button type="button" class="btn btn-icon btn-sm btn-light"><i class="fa fa-trash"></i></button>
                                </div>
                            </div>
                            <!-- End Title -->
                            <!-- Start Conv -->
                            <ul class="conv">
                                <li class="float-right" style="display: none">
                                    <div style="float: right;display: inline-block; position: relative" class="show-message">
                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg.png" alt="img" class="img">
                                        <div class="ballon color2 selfRight-Message"></div>
                                    </div>
                                    <div class="myClear"></div>
                                </li>
                                <li class="float-left" style="display: none">
                                    <div>
                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg3.png" alt="img" class="img">
                                        <p class="ballon color1 left-Message"></p><br>
                                    </div>
                                </li>
                                <li class="float-left" >
                                    <div>
                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg3.png" alt="img" class="img">
                                        <p class="ballon color1">Problems look mighty small from 150 miles up.</p><br>
                                        <!--<p class="addition"><i class="fa fa-file-o"></i><b>Index.psd</b> - 32 MB - <a href="#">Download</a></p>-->
                                    </div>
                                </li>
                                <li class="float-right" >
                                    <div style="float: right;display: inline-block; position: relative">
                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg.png" alt="img" class="img">
                                        <p class="ballon color2">Here ༼ つ ◕_◕ ༽つ</p><br>
                                    </div>
                                    <div class="myClear"></div>
                                </li>
                                <li class="float-right" >
                                    <div style="float: right;display: inline-block; position: relative">
                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg.png" alt="img" class="img">
                                        <p class="ballon color2">Here ༼ つ ◕_◕ ༽つ</p><br>
                                    </div>
                                    <div class="myClear"></div>
                                </li>
                                <li class="float-left" >
                                    <div>
                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg3.png" alt="img" class="img">
                                        <p class="ballon color1">Thanks, it works perfectly</p><br>
                                    </div>
                                </li>
                                <li class="float-left" >
                                    <div>
                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg3.png" alt="img" class="img">
                                        <p class="ballon color1">Thanks, it works perfectly</p><br>
                                    </div>
                                </li>
                                <li class="float-right" >
                                    <div style="float: right;display: inline-block; position: relative">
                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg.png" alt="img" class="img">
                                        <p class="ballon color2">Here ༼ つ ◕_◕ ༽つ</p><br>
                                    </div>
                                    <div class="myClear"></div>
                                </li>
                                <li class="float-right" >
                                    <div style="float: right;display: inline-block; position: relative">
                                        <img src="${pageContext.request.contextPath}/customerServicePlug/img/profileimg.png" alt="img" class="img">
                                        <p class="ballon color2">Here ༼ つ ◕_◕ ༽つ</p><br>
                                    </div>
                                    <div class="myClear"></div>
                                </li>
                                <li class="myClear"></li>
                            </ul>
                            <!-- End Conv -->
                            <div class="write" style="padding:0px;">
                                <form class="margin-b-20" action="javascript:;">
                                    <textarea name="content" style="width:100%;height:200px;visibility:hidden;resize: none;" placeholder="输入消息"></textarea>
                                    <button class="btn btn-default">发送</button>
                                    <button type="reset" class="btn margin-l-5">清除</button>
                                </form>
                            </div>
                            <script type="text/javascript">
                                $("button.btn-default").click(function(){
                                    var content = $(document.getElementById("ke-edit-iframe").contentWindow.document.body).html();
                                    //alert(content);
                                    var sendContent = $($("li.float-right")[0]).clone();
                                    sendContent.find("div.selfRight-Message").html(content);
                                    sendContent.show();
                                    $("ul.conv").append(sendContent);
                                    $("ul.conv").scrollTop($($("ul.conv")[0]).height());
                                    $(document.getElementById("ke-edit-iframe").contentWindow.document.body).html("");
                                });
                            </script>
                        </div>
                        <!-- End Chat -->
                    </div>
                    <!-- End Mailbox Container -->
                </div>
                <!-- End Mailbox -->
            </div>
            <!-- END CONTAINER -->
            <!-- //////////////////////////////////////////////////////////////////////////// -->
            <!-- Start Footer -->
            <div class="row footer">
                <div class="col-md-6 text-left">
                   	 著作版权 © 2015 <a href="#/" target="_blank">BaiHong.Chen</a>
                </div>
                <div class="col-md-6 text-right">
                    <a href="#/" target="_blank"></a>
                </div>
            </div>
            <!-- End Footer -->
        </div>
    </div>
    <button class="md-trigger" data-modal="modal-16" style="display: none;"></button>
    <div class="md-overlay"></div><!-- the overlay element -->
    <script>
        var polyfilter_scriptpath = '/js/';
    </script>
</body>
</html>
    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/js/index.js"></script>
</body>
</html>