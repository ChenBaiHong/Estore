<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 9/27/2016
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js">
<head>
    <title>Title</title>
    <meta name="description" content="">
    <meta name="viewpoint" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/templatemo-style.css">
    <script src="${pageContext.request.contextPath}/backgroundPlug/AddRole/js/vendor/modernizr-2.6.2.min.js"></script>
    <style type="text/css">
        .box-content{
            background: rgba(255,255,255,0.3);
            border-radius: 3px;
        }.contact-form input{
             border-radius: 3px;
             background: rgba(255,255,255,0.3);
         }
        textarea{
            background: rgba(255,255,255,0.3);
            border-radius: 3px;
            resize:none;
        }
    </style>
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<!--开始页面包装-->
<section class="wrapper">
    <div class="site-bg"
         style="background-image: url(${pageContext.request.contextPath}/backgroundPlug/img/IMG_0100.JPG);"></div>
    <div class="site-bg-overlay"
         style="background: rgba(0, 0, 0, 0.5)"></div>

    <!-- TOP HEADER -->
    <div class="top-header">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <p class="phone-info">Call us: <a href="#">010 020 0340</a></p>
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
            <div class="col-md-9 col-sm-12 content-holder">
                <!-- CONTENT -->
                <div id="menu-container">
                    <div id="menu-3" class="content gallery-section">
                        <div class="box-content">
                            <h3 class="widget-title">观赏画廊</h3>
                            <div class="row">
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <div class="project-item">
                                        <img src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/1.jpg" alt="">
                                        <div class="project-hover">
                                            <h4>Great Nature Capture</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <div class="project-item">
                                        <img src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/2.jpg" alt="">
                                        <div class="project-hover">
                                            <h4>Another Image Caption</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <div class="project-item">
                                        <img src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/3.jpg" alt="">
                                        <div class="project-hover">
                                            <h4>Great Nature Capture</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <div class="project-item">
                                        <img src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/4.jpg" alt="">
                                        <div class="project-hover">
                                            <h4>Another Image Caption</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <div class="project-item">
                                        <img src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/5.jpg" alt="">
                                        <div class="project-hover">
                                            <h4>Great Nature Capture</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <div class="project-item">
                                        <img src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/6.jpg" alt="">
                                        <div class="project-hover">
                                            <h4>Another Image Caption</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="project-pages">
                                <ul>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">...</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div id="menu-4" class="content contact-section" style="display:block">
                        <div class="row">
                            <div class="col-md-8 col-sm-8">
                                <div class="box-content">
                                    <h3 class="widget-title">产品品牌</h3>
                                    <form class="contact-form" action="javascript:;" method="post">
                                        <fieldset>
                                            <input type="text" class="name" id="name" placeholder="品牌名..." autocomplete="off">
                                        </fieldset>
                                        <br>
                                        <fieldset>
                                            <textarea name="message" id="description"  cols="30" rows="4" placeholder="品牌公司信息.."></textarea>
                                        </fieldset>
                                        <fieldset>
                                            <input type="submit" class="button" id="button" value="保存数据库">
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="box-content">
                                    <h3 class="widget-title">产品简要</h3>
                                    <p style="background: rgba(0,0,0,0.2);color: white;border-radius: 3px;padding: 3px;">论述情报产品生产是一种经济行为。探讨情报产品的概念和作为情报产品生产的一个重要环节——分类的意义，以及对情报产品按其在生产过程中所耗费的劳动进行分类的模糊数学方法 <br><br>
                                        添加消息提示框:<br>
                                        <span id="prompt" style="display:none ;font-weight:bold; font-size:14px;color: #843534">并未选中权限</span>
                                    </p>
                                    <div class="about-social">
                                        <ul>
                                            <li><a href="#" class="fa fa-facebook"></a></li>
                                            <li><a href="#" class="fa fa-twitter"></a></li>
                                            <li><a href="#" class="fa fa-linkedin"></a></li>
                                            <li><a href="#" class="fa fa-dribbble"></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>


            <div class="col-md-3 hidden-sm">
                <nav id="nav" class="main-navigation hidden-xs hidden-sm">
                    <ul class="main-menu">
                        <li>
                            <a class="show-5 contactbutton" href="#"><i class="fa fa-star-half-full"></i>ProductBrand</a>
                        </li>
                        <li>
                            <a class="show-3 projectbutton" href="#"><i class="fa fa-star-half-full"></i>Exhibition</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>

<!-- BEGIN JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AddRole/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AddRole/js/main.js"></script>
<script type="text/javascript">
    $(function(){
        $("#button").click(function(){
            var name= $("#name").val();
            var description = $("#description").val();
            //alert(name+"，"+description);
            if(name.trim().length!=0){
                var url="saveBrandAction"
                var args = {"name":name,"description":description,"time":new Date()}
                $.post(url , args , function(data){
                    var object = eval("("+data+")");
                    var variable = object.message;
                    if("yes"==variable){
                        $("#prompt").text("成功添加品牌！").show(500);
                        setTimeout(function(){
                            $("#prompt").text("成功添加品牌！").hide(500);
                        },4000)
                    }else{
                        $("#prompt").text("该品牌名被重复！").show(500);
                        setTimeout(function(){
                            $("#prompt").text("该品牌名称被重复！").hide(500);
                        },4000)
                    }
                })
            }
        })
    })
</script>
</body>
</html>
