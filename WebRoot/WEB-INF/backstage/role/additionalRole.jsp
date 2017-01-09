<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 9/27/2016
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html >
<head>
    <title>Title</title>
    <meta name="description" content="">
    <meta name="viewpoint" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap-reset.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/AddRole/css/templatemo-style.css">
    <style type="text/css">
        input[type="checkbox"]{
            width: 30px;
        }
        input[class="search"]{
            border: none;
            display: inline;
            margin-bottom: 0px;
            padding: 0px;
            width:120px;
            height:28px;
        }
        .fa-search{
            display:inline;
        }
        #authorityNames{
            border: 1px solid #DDDDDD;
            margin-bottom:20px;
            height:100px;
        }
        #searchKey{
            border: 1px solid #DDDDDD;
            width: 150px;
            height: 30px;
            margin-bottom: 15px;
        }
        #show-privilege tr{
            height: 28px;line-height: 28px;
        }
        #show-privilege td{
            width:206px;
            cursor: pointer;
        }
        #default-show-privilege tr{
            height: 28px;line-height: 28px;
        }
        #default-show-privilege td{
            width:1%;
            cursor: pointer;
        }
        .updateData{
            width: 106px; height: 39px;line-height: 39px; text-align: center;background: #5CB48E;
            margin-top: 20px;
        }
        .responsePrompt{
        	display:none; width:100%; height:100% ; background:rgba(0,0,0,0.8);position: absolute;bottom: 0;
        	color:#ECECEC;  line-height:100%;text-align:center; 
        }
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

<div class="site-bg"
     style="background-image: url(${pageContext.request.contextPath}/AdminServlet.servlet?method=showAdminHead);"></div>
<div class="site-bg-overlay"
     style="background: rgba(0, 0, 0, 0.4)"></div>

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
				<!-- 开始更新角色 -->
                <div id="menu-2" class="content about-section">
                    <div class="row">
                        <div class="col-md-8 col-sm-8">
                        	<!-- 更新角色的开始页面 -->
                            <div class="box-content profile">
                                <h3 class="widget-title" style="font-size: 18px; font-weight: bold">关于角色</h3>
                                <div class="profile-thumb">
                                    <img src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/8.jpg" alt="">
                                </div>
                                <div class="profile-content" style=" background: rgba(0,0,0,0.1);border-radius: 3px;">
                                    <h5 class="profile-name">xxxxx</h5>
                                    <div id="controlUpdate">
                                        <p style="font-weight:bold;">Introduce:</p>
                                        <div style="background: rgba(255,255,255,0.5);border-radius: 3px;
                                        ">
                                        	&nbsp;&nbsp;<span>没有可描述的角色。。</span>
                                        	<textarea style=" border:none; display:none;
                                        	border-radius: 3px;background: rgba(0,0,0,0);resize: none;width: 100%;padding: 0px;margin: 0px;" name="message" id="description" cols="25%" rows="5%" placeholder="角色描述.." autofocus="autofocus"></textarea>
                                        </div>
                                        <p style="font-weight:bold;">Authority:</p>
                                        <div style="width:270px;">&nbsp;&nbsp;<span>消失的亚特兰蒂斯。。</span></div>
                                    </div>
                                    <div id="updateData" class="updateData"><a href="javascript:;" style="color: white;font-size: 16px;">更新角色</a></div>
                                </div>
                            </div>
                            <!-- 更新角色的结束页面 -->
                        </div>
                        <div class="col-md-4 col-sm-4">
                     		<!--    开始检索数据库的权限分页显示的界面 -->
                            <div class="box-content">
                                <h3 class="widget-title" style="font-size: 18px; font-weight: bold ; margin-bottom:15px;">角色栏</h3>
                                <div id="ergodicRole">
                                    <ul style=" background: rgba(0,0,0,0.1);height: 140px;border: 3px;text-align: center;">
                                        <li>没有可选角色。。。</li>
                                    </ul>
                                </div>
                                <div class="about-social">
                                    <ul>
                                        <li><a href="#" class="fa fa-arrow-left" id="previous"></a></li>
                                        <li><a href="#" class="fa" id="bar1">1</a></li>
                                        <li><a href="#" class="fa" id="bar2">2</a></li>
                                        <li><a href="#" class="fa fa-arrow-right" id="next"></a></li>
                                    </ul>
                                </div>
                            </div>
                            <!--    结束检索数据库的权限分页显示的界面 -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-5">
                            <div class="box-content">
                                <h3 class="widget-title" style="font-size: 18px; font-weight: bold">我的工作间</h3>
                                <div class="project-item">
                                    <img src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/Europe1.jpg" alt="">
                                    <div class="project-hover">
                                        <h4>Great Nature Capture</h4>
                                    </div>
                                    <div class="responsePrompt" id="fa-check"style="">
                                        <i class="fa fa-check" style="font-weight:bold; font-size:18px;position: relative;bottom: -70;">更新成功</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 col-sm-7">
                            <div class="box-content">
                                <div>
                                <span style="display: inline; font-weight: bold">xxxxx</span>权限级别%80
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;"></div>
                                    </div>
                                </div>
                                <div style="width:100%;; height:185px;overflow-x: hidden; border-radius:3px;">
                                    <div class="show-privilege" id="show-privilege" style="width:104%; height: 185px; overflow-y: scroll; background: rgba(0,0,0,0.1); overflow-x:hidden">
                                        <table>
                                            <tr>
                                                <td rowspan="1" colspan="1"><span style="font-size: 18px; font-weight: bold; color:black;">权限列表栏</span></td>
                                            </tr>
                                            <tr>
                                                <c:forEach var="privilege" items="${requestScope.privileges}" varStatus="status">
                                                <%--标签体上自定义id的值 --%>
                                                <td style="text-align: center;"><span style="font-size: 16px; font-weight: bold;color:whitesmoke;" privilegeId="${privilege.id}">${privilege.name}</span></td>
                                                <c:if test="${status.count%2==0}">
                                            </tr>
                                            <tr >
                                                </c:if>
                                                </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- 结束更新角色 -->
				<!-- 开始风景图片预览 -->
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
				<!-- 结束风景图片预览 -->
				<!-- 开始添加角色 -->
                <div id="menu-4" class="content contact-section" style="display:block">
                    <div class="row">
                        <div class="col-md-8 col-sm-8">
                            <div class="box-content">
                                <h3 class="widget-title" checked >角色权限操作</h3>
                                
                                <!-- 开始form表单页面 -->
                                <form class="contact-form" action="javascript:;">
                                    <fieldset>
                                        <input type="text" class="name" id="name" placeholder="角色名...">
                                    </fieldset>
                                    <fieldset>
                                        <div id="searchKey">
                                            &nbsp;<i class="fa fa-search"></i>&nbsp;<input type="text" class="search" name="searchKey" placeholder="search.."autocomplete="off">
                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <div id="authorityNames" style="height: 102px;">
                                            <div class="default-show-privilege" id="default-show-privilege" style="width:100%; height:100px;overflow-x: hidden;display:block;border-radius:3px;">
                                                <div style="width: 103.4%; height: 100px; overflow-y: scroll; background: white; overflow-x:hidden;background: rgba(255,255,255,0.3);">
                                                    <table>
                                                        <tr>
                                                            <c:forEach var="privilege" items="${requestScope.privileges}" varStatus="status">
                                                            <td><input type="checkbox" value="${privilege.id}" name="defaultAuthority"><label style="color:#555555;">${privilege.name}</label></td>
                                                            <c:if test="${status.count%3==0}">
                                                        </tr>
                                                        <tr>
                                                            </c:if>
                                                            </c:forEach>
                                                    </table>
                                                </div>
                                            </div>
                                            <!-- 隐藏默认的选项checkbox选项界面, ajax获取搜索数据匹配出的checkbox选择对象显示界面 -->
                                            <div class="search-show-privilege" id="search-show-privilege" style="display:none;background:rgba(255,255,255,0.3);"></div>
                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <textarea name="message" id="addDescription" cols="30" rows="4" placeholder="角色描述.."></textarea>
                                    </fieldset>
                                    <fieldset>
                                        <input type="submit" class="button" id="button" value="保存数据库">
                                    </fieldset>
                                </form>
                                <!-- 结束form表单页面 -->
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="box-content">
                                <h3 class="widget-title">角色权限描述</h3>
                                <p style="background: rgba(0,0,0,0.2);color: white;border-radius: 3px;padding: 3px;">
                                根据数库据存在的权限，高级管理员可以创建角色的身份为其更好的管理,古之有云权倾者，天下归！<br><br>
                                    角色处理消息：<br>
                                    <span id="prompt" style="display:none ;font-weight:bold; font-size:14px;color: #843534"></span>
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
				<!-- 结束添加角色 -->
            </div>
        </div>


        <div class="col-md-3 hidden-sm">
            <nav id="nav" class="main-navigation hidden-xs hidden-sm">
                <ul class="main-menu">
                    <li>
                        <a class="show-5 contactbutton" href="#"><i class="fa fa-user"></i>Add Role</a>
                    </li>
                    <li>
                        <a class="show-3 projectbutton" href="#"><i class="fa fa-camera"></i>Gallery</a>
                    </li>
                    <li>
                        <a class="show-2 aboutbutton" id="aboutbutton" href="#"><i class="fa fa-star-half-full"></i>setup Role</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<%--
	知识要点说明：
		id获取的是唯一标签：var uniqueTag= $('#default-show-privilege'); 这个获取的是一个唯一的js标签，
		
		jquery中只有对象标签才能调用jquery的方法 
			写法：$(uniqueTag)
			
		class获取的是标签数组: var multiTag=$('.default-show-privilege');
		
		json对象转化为字符串文本:
			JSON.stringify(roleList[i])是json对象转化为为本字符串
	        
	         文本转化为json对象: 		
	      	eval("json格式文本"),json格式字符串文本转化为json对象
	        				
	        新的知识点给JQuery中给对象标签自定义属性并设置值
	        $(liTag).attr('role',JSON.stringify(roleList[i]));
	        
	        获取JQuery中给对象标签自定义的属性值;
	        var role = $(liTag).attr("role");
	   
	       实时更新对事件的绑定，因为数据库查询的数据放在<li><li>标签是在关联它点击事件，进行更新被创建的
	       	这个新的知识点事件,临时标签绑定临时的事件，
     		$(liTag).bind("click",function(){
	    		alert('hello')
	    	});	
 --%>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AddRole/js/vendor/modernizr-2.6.2.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AddRole/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AddRole/js/main.js"></script>
<script type="text/javascript">
    $(function(){
    	//键盘向上事件相数据发送匹配数据，事件
        var oldVal="";
        var oldData="";
        $('input[class="search"]').keyup(function(){
            //$('.default-show-privilege input:checked'), 这是强大的jQuery选择器获取默认checkbox默认被选中的值
            var checkedArrays= $('#default-show-privilege input:checked');//获取默认被选中的checkbox值

            var defaultArrays= $('#default-show-privilege input[type="checkbox"]');//获取默认所有的checkbox值
            var searchArrays=$('#search-show-privilege input[type="checkbox"]');//获取搜索所有的checkbox值
            //判断搜索框中的checked是否被选中，如果被选中就给默认框中的checked值置为选中
            for(var i=0 ; i<searchArrays.length;i++){
                var name=$(searchArrays[i]).parent().children().eq(1).text();
                for(var j=0;j<defaultArrays.length;j++){
                    if($(defaultArrays[j]).parent().children().eq(1).text()==name){
                        if(searchArrays[i].checked==true){//判断是否checkbox是否被选中
                            //alert(searchArrays[i].checked);
                            $(defaultArrays[j]).parent().children().eq(1).css('color','red');
                            $(defaultArrays[j]).prop('checked', 'checked');
                        }else{
                            //alert(searchArrays[i].checked);
                            $(defaultArrays[j]).parent().children().eq(1).css('color','#555555');
                            $(defaultArrays[j]).prop('checked', false);//给标签自带属性设置形态
                        }
                    }
                }
            }
            //获取搜索框中的新值与之做判断
            var newVal = $(this).val();
            //alert(val);
            if(newVal.trim().length==0){//新值不能是空的
                $('#search-show-privilege').hide();
                $('#default-show-privilege').show();
            }else if(newVal == oldVal){//新值如果和旧值相等就不用往数据库发送数据搜索
                $('#default-show-privilege').hide();
                $('#search-show-privilege').show();
            }else{
                var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
                var args={"method":"searchAboutRolePrivilegeByAjax","searchEvent":newVal,"time":new Date()};
                $.post(url,args , function(data){
                    //alert(data);
                    var object=eval("("+data+")");
                    var oldObject=null;
                    if(oldData!=""){
                        oldObject=eval("("+oldData+")");
                    }
                    oldData="";
                    //alert(object.length)
                    if("error" ==object.error){
                        top.location.href="${pageContext.request.contextPath}/500.jsp"
                    }else{
                        $('#search-show-privilege').html("");
                        if(object.length !=0 && object!=null){
                            $('#default-show-privilege').hide();
                            $('#search-show-privilege').show();
                            var sign=false;
                            //数据库查询出来的权限在搜索栏目录中，判断是否在默认栏中有被选中的就在搜索栏选中
                            for(var i = 0 ;i<object.length; i++){
                                var name = object[i].name;
                                var id = object[i].id;
                                for(var j=0 ; j<checkedArrays.length;j++){
                                    if($(checkedArrays[j]).parent().children().eq(1).text()==name){
                                        sign=true;
                                        break;
                                    }else{
                                        sign=false;
                                        continue;
                                    }
                                }
                                //alert(oldData);
                                //sign=isContainer(oldObject,name);
                                if(!sign){
                                    var span = $('<span><input type="checkbox" name="retrievalAuthority" value="'+id+'"><label>'+name+'</label></span>');
                                    $('#search-show-privilege').append(span);
                                }else{
                                    var span = $('<span><input type="checkbox" checked name="retrievalAuthority" value="'+id+'"><label style="color:red">'+name+'</label></span>');
                                    $('#search-show-privilege').append(span);
                                }
                            }
                        }else{
                            var span = $('<span style="margin-left:209px;">没有可取值！</span>');
                            $('#search-show-privilege').append(span);
                        }
                    }
                    oldData=data;
                });
            }
            oldVal=newVal;
        });
		//此函数是检测数据库获取的当前值，过去的值作比较
        function isContainer(oldObject , name){
            if(oldObject.length==0 || oldObject==null){
                return false;
            }
            for(var i = 0 ; i<oldObject.length; i++){
                var oldName=oldObject[i].name;
                if(oldName==name){
                    //alert(name,oldName);
                    return true;
                }
            }
            return false;
        }
        //点击checkbox选中变色事件
        $('input[type="checkbox"]').click(function(){
            if(this.checked==true){
                $(this).parent().children().eq(1).css('color','red');
            }else{
                $(this).parent().children().eq(1).css('color','#555555');
            }
        })
        //对当前选中的权限向数据库提交事件
        $('#button').click(function(){
	        var array = new Array();
			//var array2 = new Array();
            var defaultShow = document.getElementById("default-show-privilege");//id是唯一，也是只能检索当前div的唯一识别
            if(defaultShow.style.display=="block"){
                var defaultCheckedArrays = $('#default-show-privilege input:checked');
                //alert(defaultCheckedArrays.length);
                for(var i = 0 ; i<defaultCheckedArrays.length;i++){
                    //alert(defaultCheckedArrays[i].value);
                    array.push(defaultCheckedArrays[i].value)
                    //array2.push(defaultCheckedArrays[i].parent().children().eq(1).text());
                }
            }else{
                var searchCheckedArrays = $('#search-show-privilege input[type="checkbox"]:checked');
                //alert(searchCheckedArrays.length);
                for(var i = 0 ; i<searchCheckedArrays.length;i++){
                    //alert(searchCheckedArrays[i].value);
                    array.push(searchCheckedArrays[i].value);
                    //array2.push(searchCheckedArrays[i].parent().children().eq(1).text())
                }
            }
            var roleName=$('#name').val();
            var addDescription=$('#addDescription').val();
            //alert(addDescription);
            if(array.length==0 || array==""){
                $("#prompt").text("未对角色选中任何权限！");
                $("#prompt").show(500);
                setTimeout(function(){
                    $("#prompt").hide(500);
                },4000);
                return false;
            }else if(roleName.length==0 || roleName==""){
                $("#prompt").text("未填写角色名字！");
                $("#prompt").show(500);
                setTimeout(function(){
                    $("#prompt").hide(500);
                },4000);
                return false;
            }
            //alert(array.join(","));
            var ids = array.join(",");
            var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
            var args={
                "method":"additionalRoleSaveSQL",
                "ids":ids,
                "roleName":roleName,
                "description":addDescription,
                "time":new Date()
            };
            generallyAjaxFunction(url,args,$('#prompt'));
            return false;
        });

        function generallyAjaxFunction(url,args,prompt){
            $.post(url , args , function(data){
                var object = eval("("+data+")");
                var various = object.message;
                var currentRoleId = object.currentRoleId;
                //alert(currentRoleId);
                if("yes"==various){
	                //点击事件$('#aboutbutton')当关于页面设置角色的按钮跳转时，需要从后台拿到当前被创角色的id;
	                $(".profile-name").attr("roleId",currentRoleId);
                    prompt.text("角色创建成功！");
                    prompt.show(500);
                    setTimeout(function(){
                        prompt.hide(500);
                    }, 3000);
                }else if("no"==various){
                    prompt.text("请不要重复创建相同名的角色");
                    prompt.show(500);
                    setTimeout(function(){
                        prompt.hide(500);
                    }, 3000);
                }else if("error"==various){
                    top.location.href="${pageContext.request.contextPath}/500.jsp";
                }
            });
        }
        
        //定义一个记录最终分页的记录参数
        var finalPage=2;//初始化最终页
        var currentPage=1;//初始化当前页
        $('#aboutbutton').click(function(){
        	var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
	        var args={"method":"ergodicRoleFromAjax","time":new Date()};
	        paginationRoleCommon(url,args);
	        //装载role对象的权限数组;
        	var array2 = new Array();
        	var array = new Array();
            var defaultShow = document.getElementById("default-show-privilege");//id是唯一，也是只能检索当前div的唯一识别
            if(defaultShow.style.display=="block"){
                var defaultCheckedArrays = $('#default-show-privilege input:checked');
                for(var i = 0 ; i<defaultCheckedArrays.length;i++){
                    array.push(defaultCheckedArrays[i].value)
                    array2.push($(defaultCheckedArrays[i]).parent().children().eq(1).text());
                }
            }else{
                var searchCheckedArrays = $('#search-show-privilege input[type="checkbox"]:checked');
                for(var i = 0 ; i<searchCheckedArrays.length;i++){
                    array.push(searchCheckedArrays[i].value);
                    array2.push($(searchCheckedArrays[i]).parent().children().eq(1).text())
                }
            }
        	var roleName=$('#name').val();
            var addDescription=$('#addDescription').val();
			if(array2.length==0 || roleName.length==0){
	           	//$("#controlUpdate").children().eq(3).html("");
	        }else{
	        	$(".profile-name").text(roleName);//generallyAjaxFunction()方法已经获取当前角色的id;
	        	$("#controlUpdate").children().eq(3).html("");
	        	if(addDescription.trim().length!=0){
	        		$("#controlUpdate").children().eq(1).children().text(addDescription);
	        	}
	           for(var i=0;i<array2.length;i++){
           		//这样直接jquery创建一个自己想创建的标签
           		var tag = $('<a href="javascript:;"style="display:inline-block;color: greenyellow; text-align: center;width:125px;"><i class="fa fa-times-circle-o"></i>'+array2[i]+'</a>');
           		$(tag).attr("privilegeId", array[i]);
           		$("#controlUpdate").children().eq(3).append(tag);
           		$(tag).children().bind("click",function(){
		           	$(this).parent().remove();
		         });		
	           }
	        }
    	});
    	
    	//开始分页传传输当前页的页码事件
    	$("#previous").click(function(){
    		if(currentPage!=1){
    			var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
	            var args={
	                "method":"ergodicRoleFromAjax",
	                "indexBar":currentPage-1,
	                "time":new Date()
	            };
	            paginationRoleCommon(url,args);
    		}
    	});
    	$("#bar1").click(function(){
    		$("#bar1").css({"background":"#5CB48E","color":"white"});
    		$("#bar2").css("background","#dddddd");
    		var indexBar = $("#bar1").text();
   			var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
            var args={
                "method":"ergodicRoleFromAjax",
                "indexBar":indexBar,
                "time":new Date()
            };
            paginationRoleCommon(url,args);
    	});
    	$("#bar2").click(function(){
    		$("#bar2").css({"background":"#5CB48E","color":"white"});
    		$("#bar1").css("background","#dddddd");
    		var indexBar = $("#bar2").text();
   			var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
            var args={
                "method":"ergodicRoleFromAjax",
                "indexBar":indexBar,
                "time":new Date()
            };
            paginationRoleCommon(url,args);
    	});
    	$("#next").click(function(){
    		if(currentPage!=finalPage){
    			var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
	            var args={
	                "method":"ergodicRoleFromAjax",
	                "indexBar":currentPage+1,
	                "time":new Date()
	            };
	            paginationRoleCommon(url,args);
    		}
    	});
    	
    	function paginationRoleCommon(url , args){
	    	$.post(url , args , function(data){
	           	var dataObject = eval("("+data+")");
	           	if(dataObject.length==1){
	           		if("error"==dataObject.error){
	           			$("#ergodicRole ul li").eq(0).text("外太空访问数据断了...")
	           		}
	       		}else{
	       			$("#ergodicRole ul").html("");
	       			var roleList = dataObject.roleList;
	       			for(var i = 0 ; i<roleList.length; i++){
	       				//这样直接jquery创建一个自己想创建的标签
	       				var liTag = $('<li style="font-size:16px;font-weight:bold;padding:5px;'
	       				+'color:beige;cursor:pointer"><i class="fa fa-smile-o"></i>'+roleList[i].name+'</li>');
	       				//JSON.stringify(roleList[i])是json对象转化为为本字符串
	       				//eval("json格式文本"),json格式字符串文本转化为json对象
	       				
	       				//一个新的知识点自定义属性并设置值
	       				$(liTag).attr('role',JSON.stringify(roleList[i]));
	       				//var role = $(liTag).attr("role");获取自定义的属性值;
	       				$("#ergodicRole ul").append(liTag);
	       				//实时更新对事件的绑定，因为数据库查询的数据放在<li><li>标签是在关联它点击事件，进行更新被创建的
	       				//这个新的知识点事件是可以被绑定起到对某个标签的时间是更新的，一一对应标签绑定事件
	       				//临时标签创建绑定临时事件
	       				$(liTag).bind("click",function(){
				    		var role = $(this).attr("role");
				    		var roleObject=eval("("+role+")");
				    		$(".profile-name").text(roleObject.name);
				    		$(".profile-name").attr("roleId", roleObject.id);
				        	$("#controlUpdate").children().eq(3).html("");
				        	if(roleObject.description.trim().length>5){
				        		$("#controlUpdate").children().eq(1).children().text(roleObject.description);
				        	}
				        	var privilegeSet = roleObject.privilegeSet;
				        	for(var i=0;i<privilegeSet.length;i++){      							
			           			//这样直接jquery创建一个自己想创建的标签
			           			var tag = $('<a href="javascript:;"style="display:inline-block; text-align: center;color: greenyellow;width:125px;"><i class="fa fa-times-circle-o"></i>'+privilegeSet[i].name+'</a>');
			           			$(tag).attr("privilegeId", privilegeSet[i].id);
			           			$("#controlUpdate").children().eq(3).append(tag);
			           			//临时标签创建绑定临时事件
			           			$(tag).children().bind("click",function(){
			           				//$(this).parant().sibling().remove();
			           				$(this).parent().remove();
			           			});
				           }
				    	});
	       			}
	       			var pagingBar=dataObject.pagingBar;
	       			$("#bar1").text(pagingBar[0]);
	       			$("#bar2").text(pagingBar[1]);
	       			finalPage=dataObject.totalPage;
	       			currentPage=dataObject.currentPage;
	       			if($("#bar2").text()==currentPage){
		            	$("#bar2").css({"background":"#5CB48E","color":"white"});
	    				$("#bar1").css("background","#dddddd");
		            }else{
		            	$("#bar1").css({"background":"#5CB48E","color":"white"});
	    				$("#bar2").css("background","#dddddd");
		            }
	       		}
	        });
    	}
    	//结束分页传传输当前页的页码事件
    	//开始为页面关于角色的更新权限的点击事件
    	$('#show-privilege td span').click(function(){
    		var lis = $("#ergodicRole ul li");
    		var inputRoleName = $("#name").val();
    		var roleName = $(".profile-name").text();
    		var roleId = $(".profile-name").attr("roleId");
    		for(var i = 0 ; i<lis.length ; i++){
    			if(roleName==$(lis[i]).text()||(roleName==inputRoleName && roleId.length!=0)){//判断是否是数据库匹配的角色
    				var aTags = $("#controlUpdate").children().eq(3).children();
	    				for(var j = 0 ; j<aTags.length ; j++){
	    					if($(this).text()==$(aTags[j]).text()){
	    						return;
	    					}
	    				}
	    				//这样直接jquery创建一个自己想创建的标签
			           	var tag = $('<a href="javascript:;"style="display:inline-block; color: greenyellow;text-align: center;width:125px;"><i class="fa fa-times-circle-o"></i>'+$(this).text()+'</a>');
			           	//为 <a>标签自定义一个属性privilegeId
			           	$(tag).attr("privilegeId", $(this).attr("privilegeId"));
			           	$("#controlUpdate").children().eq(3).append(tag);
			           	//临时标签创建绑定临时事件
			           	$(tag).children().bind("click",function(){
			           	//$(this).parant().siblings('').remove();
			           	$(this).parent().remove();
		           	});
    			}  		
    		}
    	})
    });
    //控制更新的 ，描述的显示
    $('#controlUpdate').children().eq(1).children().eq(0).mouseover(function(){
    	$(this).hide(500);
    	$(this).siblings('textarea').show(500);
    });
    $('#controlUpdate').children().eq(1).children().eq(1).focusout(function(){
    	$(this).hide(500);
    	if($(this).val().length!=0 || $(this).text().length!=0){
    		$(this).siblings('span').text($(this).val());
    	}else{
    		$(this).siblings('span').text("没有可描述的角色。。");
    	}
    	$(this).siblings('span').show(500);
    });
    //点击向数据库更新角色
    $('#updateData').click(function(){
   		var sign=false;
   	    var lis = $("#ergodicRole ul li");
   		var roleName = $(".profile-name").text();
   		var inputRoleName = $("#name").val();
   		for(var i = 0 ; i<lis.length ; i++){
   			if(roleName==$(lis[i]).text()||roleName==inputRoleName){
   				sign=true;
   			}
   		}
   		if(sign){
   			var updateDescription = $('#controlUpdate').children().eq(1).children().eq(0).text();
   			var arrayId = new Array();
   			var aTags = $("#controlUpdate").children().eq(3).children();
   			for(var i = 0 ; i<aTags.length; i++){
   				//alert($(aTags[i]).attr("privilegeId"));
   				arrayId.push($(aTags[i]).attr("privilegeId"));
   			}
   			var privilegeIds = arrayId.join(",");
   			var roleId = $(".profile-name").attr("roleId");
   			if(roleId.length!=0){
   				var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
	            var args={
	                "method":"updateRoleFromAjax",
	                "privilegeIds":privilegeIds,
	                "roleId":roleId,
	                "description":updateDescription,
	                "time":new Date()
	            };
	   			$.post(url , args , function(data){
	                var object = eval("("+data+")");
	                var various = object.message;
	                if("yes"==various){
	                    $('#fa-check').slideDown(500);
			   			setTimeout(function(){
			   				$('#fa-check').slideUp(500);
			   			},3000);
	                }else if("error"==various){
	                    top.location.href="${pageContext.request.contextPath}/500.jsp";
	                }
	            });
   			}
   		}
    })
</script>
</body>
</html>
