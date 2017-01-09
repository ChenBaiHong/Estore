<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 10/8/2016
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Animated Background Headers</title>
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME ICON CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet"><!-- BOOTSTRAP ADVANCE DATATABLE  CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet"><!-- BOOTSTRAP ADVANCE DATATABLE CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/assets/data-tables/DT_bootstrap.css"><!-- BOOTSTRAP DATATABLE CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS -->

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/backgroundPlug/css/normalize.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/backgroundPlug/css/demo.css" />
    <!--必要样式-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/backgroundPlug/css/component.css" />
    <!-- END STYLESHEET -->
    <!-- 预加载动画 -->
    <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/lanrenzhijia.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/loaders.css"/> --%>
    <style type="text/css">
        div[class="container demo-1"]{
            width:100%;height:100%;padding:0px;overflow:auto;
        }
        .panel{z-index:10;position: relative;bottom: 84%;width: 85%;left: 7%; overflow:hidden;}
        #two{background:rgba(0,0,0,0.4); color:white}
        #one{background:rgba(0,0,0,0.4);color:white;}
        .form-control{background: rgba(123,159,171,0.2);color:whitesmoke;border-radius:2px;border:1px solid whitesmoke;}
    </style>
</head>
<body>
<div class="container demo-1" style="background:url('${pageContext.request.contextPath}/backgroundPlug/AddRole/images/chinaGirl1.jpg') ">
    <div class="content">
        <div id="large-header" class="large-header" style="background:transparent;">
            <canvas id="demo-canvas"></canvas>
            <h1 class="main-title">BaiHhong<span class="thin">Chen</span></h1>
        </div>
    </div>
    <section class="panel"style="background:rgba(0,0,0,0.2); color:white">
        <header class="panel-heading" style="background:transparent;">
            <span class="label label-primary">角色表详情</span>
	        <span class="tools pull-right">
	            <a href="javascript:;" class="fa fa-chevron-down"></a>
	            <a href="javascript:;" class="fa fa-times"></a>
	        </span>
            <div class="panel-body" style="background:transparent;">
                <div class="adv-table" style="background:transparent;" >
                    <table class="display table table-bordered" id="hidden-table-info"style="background:transparent;">
                        <thead style="border-radius:2px;border:1px solid whitesmoke;">
                        <tr style="background:rgba(0,0,0,0.4);color:#72D0EB">
                            <th style="display: none">角色Id</th>
                            <th>角色名</th>
                            <th>描述信息</th>
                            <th>是否删除</th>
                        </tr>
                        </thead>
                        <tbody style="border-radius:2px;border:1px solid whitesmoke;">
                        <c:forEach var="role" items="${requestScope.roleList}" varStatus="status">
                            <tr id="${status.count%2==0 ? 'two':'one' }">
                                <td style="display: none" >${role.id}</td>
                                <td style="font-weight:bold;">${role.name}</td>
                                <td>${role.description}</td>
                                <td style="width: 14%;text-align: center;line-height: 100%;">
                                    <a class="delete" href="javascript:;" roleId="${role.id}" style="vertical-align:top;">
                                    	<span class="label label-danger">Delete</span>
                                    </a>
                                    <span class="fa" style="display:none;">权限不足</span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </header>
    </section>
</div>
<!-- /container -->
<!-- BEGIN JS -->

<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/rAF.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/demo-1.js"></script>

<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery-3.1.1.min.js"></script><!-- ADVANCE DATATABLE JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS -->
<script class="include"  src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.nicescroll.js" ></script><!-- NICESCROLL JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/respond.min.js" ></script><!-- RESPOND JS -->
<!-- 对数据表操作的插件 -->
<script src="${pageContext.request.contextPath}/backgroundPlug/assets/advanced-datatable/media/js/jquery.dataTables.js"></script><!-- ADVANCE DATATABLE JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/assets/data-tables/DT_bootstrap.js"></script><!-- DATATABLE JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
<script type=>
    /* DATATABLE MODIFICATION SCRIPT */
    /* Formating function for row details */
    //为id为（hidden-table-info）的表，每行开头被点击的格式化函数创建details显示表
    function fnFormatDetails ( oTable, nTr ,privileges)
    {
        var aData = oTable.fnGetData( nTr );
        var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
        sOut += '<tr><td>角色名:</td><td><input style="display:none" type="text" class="roleName" autofocus="autofocus">'
        sOut +=	'<span class="roleName2" >'+aData[2]+'</span></td></tr>';
        sOut += '<tr><td>角色描述:</td><td>'+aData[3]+'</td></tr>';
        sOut += '<tr><td>角色权限信息:</td><td>'+privileges+'</td></tr>';
        sOut += '</table>';

        return sOut;
    }

    $(function() {
        /*
         * Insert a 'details' column to the table
         	在行里面插入一个 描述详细信息的表
         */

        var nCloneTh = document.createElement( 'th' );
        var nCloneTd = document.createElement( 'td' );
        nCloneTd.innerHTML = '<img class="icon" src="${pageContext.request.contextPath}/backgroundPlug/assets/advanced-datatable/examples/examples_support/details_open.png">';
        nCloneTd.className = "center";

        $('#hidden-table-info thead tr').each( function () {
            //在id为（hidden-table-info）的表中头字段，每行插入的开头列前面插入一个<th>
            this.insertBefore( nCloneTh, this.childNodes[0] );
        } );
        //记录出当前页面所有用户的名字好为更改名字做判断
        var roleNameArray = new Array();
        $('#hidden-table-info tbody tr').each( function () {
            //在id为（hidden-table-info）的表身体中，每行插入的开头列前面插入一个<td>
            //cloneNode,节点克隆,针对相同的标签创建
            //在 tr （行节点）节点下面，它的第一个孩子（列节点）前插入一个孩子节点（列节点）,
            roleNameArray.push($(this).children().eq(1).text());
            this.insertBefore(  nCloneTd.cloneNode( true ), this.childNodes[0] );

        } );

        /*
         * Initialse DataTables, with no sorting on the 'details' column
         初始化数据表，但是没有排序这个 " details " 的序
         */
        var oTable = $('#hidden-table-info').dataTable( {
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ 0 ] }
            ],
            "aaSorting": [[1, 'asc']]
        });

        /* Add event listener for opening and closing details
         添加监听时间打开和关闭详情描述
         * Note that the indicator for showing which row is open is can controlled by DataTables,
         注意这个标志展现的是当前那个行被打开而是能操作更改数据信息
         * rather it is done here
         相比之下更好就只在这儿
         */
        //针对神秘的img标签换页消失事件依赖处理方式，
        $('#hidden-table-info tbody .center .icon').click(function () {
            mysteryTagImgClickVanish($(this).parents('tr')[0]);
        } );
        //神秘的img标签换页消失事件，可能是jQuery版本太高的缘故
        //处理方式，换页重新绑定;
        $('.row-fluid .span6 .pagination ul li').click(function(){
            //因为会出现重复绑定的问题，所以在绑定之前要解除绑定，在绑定
            $('#hidden-table-info tbody .center .icon').unbind("click");
            $('#hidden-table-info tbody .center .icon').bind("click",function(){
                mysteryTagImgClickVanish($(this).parents('tr')[0]);
            });
            $('.delete').unbind('click');
            $('.delete').bind('click',function(){
                deleteRoleFunction(this);
            });
        });
        //神秘的img标签换页消失事件可能是jQuery版本太高的缘故，以下是处理的方法，
        function mysteryTagImgClickVanish(nTr){//接收一个行标签，好获取行中的数据
            if ( oTable.fnIsOpen(nTr))//这是一个开关按钮,被点击第一次，视为被打开（true）
            {
                /* This row is already open - close it */
                this.src = "${pageContext.request.contextPath}/backgroundPlug/assets/advanced-datatable/examples/examples_support/details_open.png";
                oTable.fnClose( nTr );//打开后关闭（false）
            }
            else
            {
                //从表中获取某一行的数据
                var aData = oTable.fnGetData( nTr );
                var arrrayPrivileges = new Array();
                if(aData[1].length!=0){
                    var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
                    var args={"method":"findRoleOfAjaxById","roleId":aData[1],"time":new Date()};
                    $.post(url , args , function(data){
                        var object = eval("("+data+")");
                        if(object.message=="error"){
                            top.location.href="${pageContext.request.contextPath}/500.jsp";
                        }else{
                            var privilegeSet = object.privilegeSet;
                            for(var i = 0 ; i<privilegeSet.length;i++){
                                arrrayPrivileges.push(privilegeSet[i].name);
                            }
                            var privileges = arrrayPrivileges.join(",")
                            /* Open this row */
                            this.src = "${pageContext.request.contextPath}/backgroundPlug/assets/advanced-datatable/examples/examples_support/details_close.png";

                            oTable.fnOpen( nTr, fnFormatDetails(oTable, nTr,privileges), 'details' );//打开变为（true）

                            $('.details').css({"background":"rgba(128,123,163,0.3)"});
                            $('.details tbody').css({"color":"white","font-weight":"bold"});
                            $('.roleName').css({"background":"rgba(123,159,171,0.2)","border-radius":"2px","border":"1px solid whitesmoke"});
                            //鼠标悬停事件
                            $('.roleName2').bind("mouseover",function(){
                                $(this).hide();
                                $(this).siblings("input").slideDown(500);
                            });
                            //失去焦点事件
                            $('.roleName').bind("focusout",function(){
                                var oldRoleName = $($(this).parents('tr')[1]).siblings().eq($($(this).parents('tr')[1]).index()-1).children().eq(2).text();
                                var roleName = $(this).val();
                                if(roleName==oldRoleName){
                                    $(this).hide(500);
                                    $(this).siblings("span").slideDown(500);
                                    return ;
                                }
                                var thisTag = $(this);
                                //alert($($(this).parents('tr')[1]).index());//寻找当前标签的第二个父级标签（"tr"）的下标
                                if(roleName.trim().length>1){
                                    args={"method":"updateRoleNameOfAjaxById","roleId":aData[1],"roleName":roleName,"time":new Date()};
                                    $.post(url , args,function(data){
                                        var object = eval("("+data+")");
                                        //alert(object.message);
                                        if(object.message=="error"){
                                            top.location.href="${pageContext.request.contextPath}/500.jsp";
                                        }else if(object.message=="yes"){
                                            //无用的代码！位置原因
                                            //因为：$(this)在post里面好像被转义了，转义成当前的post,因此this在这里指的就是post自己本身
                                            for(var i =0 ; i<roleNameArray.length;i++){
                                                if(oldRoleName==roleNameArray[i]){
                                                    roleNameArray[i]=roleName;
                                                }
                                            }
                                           thisTag.siblings('span[class="roleName2"]').val(roleName);
                                           $($(thisTag).parents('tr')[1]).siblings().eq($($(thisTag).parents('tr')[1]).index()-1).children().eq(2).text(roleName);
                                        }
                                    });
                                }
                                $(this).hide(500);
                                $(this).siblings("span").slideDown(500);
                            });
                        }
                    });
                }
            }
        }
        $('.delete').click(function(){
            //$($(this).parents("tr")[0]).slideUp(500);
            //alert($(this))
            deleteRoleFunction(this);
        });
        function deleteRoleFunction(currentTag){
            var url = "${pageContext.request.contextPath}/RoleServlet.servlet";
            var args={"method":"deleteRoleOfAjaxById","roleId":$(currentTag).attr("roleId"),"time":new Date()};
            var grandfatherNode=$(currentTag).parent().parent();
            $.post(url , args , function(data){
                var object = eval("("+data+")");
                var variable = object.message;
                if("yes"==variable){
                    $(grandfatherNode).hide(500);
                    //grandfatherNode.remove();
                }else if("no"==variable){
                    $(currentTag).hide();
                    $(currentTag).siblings("span").text("未知错误！检修中。。。");
                    $(currentTag).siblings("span").show(500);
                    setTimeout(function(){
                        $(currentTag).siblings("span").slideUp();
                        $(currentTag).show(500);
                    },3000);
                }else if("noIdentity"==variable){
                    $(currentTag).hide();
                    $(currentTag).siblings("span").text("请登录管理员身份");
                    $(currentTag).siblings("span").show(500);
                    setTimeout(function(){
                        $(currentTag).siblings("span").slideUp();
                        $(currentTag).show(500)
                    },3000);
                }else if("noAuthotity"==variable){
                    $(currentTag).hide();
                    $(currentTag).siblings("span").text("权限不足请联系超级管理员");
                    $(currentTag).siblings("span").show(500);
                    setTimeout(function(){
                        $(currentTag).siblings("span").slideUp();
                        $(currentTag).show(500)
                    },3000);
                }else if("dataBindingError"==variable){
                    $(currentTag).hide();
                    $(currentTag).siblings("span").text("角色已被管理员设定");
                    $(currentTag).siblings("span").show(500);
                    setTimeout(function(){
                        $(currentTag).siblings("span").slideUp();
                        $(currentTag).show(500)
                    },3000);
                }
            });
        }
    });
</script>
<!-- END JS -->
</body>
</html>
