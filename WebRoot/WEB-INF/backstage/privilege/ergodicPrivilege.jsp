<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 10/1/2016
  Time: 5:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- BEGIN META -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Olive Enterprise">
    <!-- END META -->

    <!-- BEGIN SHORTCUT ICON -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/backgroundPlug/img/favicon.ico">
    <!-- END SHORTCUT ICON -->
    <title>Dynamic Table</title>
    <!-- BEGIN STYLESHEET -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME ICON STYLESHEET -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet"><!-- ADVANCED DATATABLE CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet"><!-- ADVANCED DATATABLE CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backgroundPlug/assets/data-tables/DT_bootstrap.css"><!-- DATATABLE CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style-responsive.css" rel="stylesheet"><!-- THEME BASIC RESPONSIVE  CSS -->
    <!-- END STYLESHEET -->
    <style type="text/css">
        .changeEdit{
            display: none;
        }
    </style>
</head>
<body>
<!-- BEGIN WRAPPER  -->
<section class="wrapper site-min-height">
    <div class="row">
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                    <span class="label label-primary">Privilege Table</span>
                           <span class="tools pull-right">
                           <a href="javascript:;" class="fa fa-chevron-down"></a>
                           <a href="javascript:;" class="fa fa-times"></a>
                           </span>
                </header>
                <div class="panel-body">
                    <div class="adv-table">
                        <table class="table table-striped table-hover table-bordered" id="example">
                            <thead>
                                <tr>
                                    <th style="display:none">privilege Id</th>
                                    <th style="width: 200px;">privilege Name</th>
                                    <th style="width: 300px;">privilege Description</th>
                                    <th style="width: 150px;">Edit</th>
                                    <th style="width: 150px;">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="privilege" items="${requestScope.privilegeList}">
                                    <tr>
                                        <td style="display:none">${privilege.id}</td>
                                        <td >${privilege.name}</td>
                                        <td >
                                            <span>${privilege.description}</span>
                                            <input type="text" name="description" value="${privilege.description}" class="changeEdit">
                                        </td>
                                        <td >
                                            <a class="edit" href="javascript:;"><span class="label label-success" style="position: absolute;">Edit</span></a>                                           
                                            <i class="fa fa-chevron-down" style="display: none"></i>
                                            <i class="fa fa-times" style="display: none">权限不足</i>                                         
                                        </td>
                                        <td >
                                            <a class="deletePrivilege" style="display:block;" href="javascript:;"><span class="label label-danger"  style="position: absolute;cursor:pointer; margin-left:4%">Delete</span></a>
                                            <span class="" style="display:none;">权限不足</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </div>
    </div>
</section>
<!-- END MAIN CONTENT -->
  <!-- BEGIN FOOTER -->
  <footer class="site-footer">
    <div class="text-center">
      2016 &copy; BaiHong  
      <a href="" target="_blank">
        China Made
      </a>
      <a href="#" class="go-top">
        <i class="fa fa-angle-up">
        </i>
      </a>
    </div>
  </footer>
  <!-- END  FOOTER -->
<!-- BEGIN JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery-3.1.1.min.js"></script><!-- BASIC JQUERY JS  -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
<script src="${pageContext.request.contextPath}/backgroundPlug/assets/advanced-datatable/media/js/jquery.dataTables.js"></script><!-- BASIC COMMON JS  -->
<script src="${pageContext.request.contextPath}/backgroundPlug/assets/data-tables/DT_bootstrap.js"></script><!-- DATATABLE BOOTSTRAP JS  -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/respond.min.js" ></script><!-- RESPOND JS  -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
<script >
    <!-- DATATABLE JS  -->
    $(document).ready(function() {
        $('a[class="edit"]').click(function(){
            var textId = $(this).parent().siblings().eq(0).text();
            $(this).parent().siblings().eq(2).children().siblings().toggleClass("changeEdit");
            var node = $(this).parent().siblings().eq(2).children();
            var thisSiblings = $(this).siblings().eq(2);
            $(this).parent().siblings().eq(2).children().change(function(){
                var details = $(this).val();
                //alert(textId+"===="+details);
                if(details.length==0){
                    return;
                }else{
                    var url="${pageContext.request.contextPath}/PrivilegeServlet.servlet";
                    var args={"method":"editDescription","privilegeId":textId,"description":details,"time":new Date()};
                    $.post(url,args , function(data){
                        var object = eval("("+data+")");
                        var variable = object.authorityMessage;
                        if("yes"==variable){
                            node.siblings().eq(0).text(details);
                        }else if("no"==variable){
                            thisSiblings.show(500);
                           setTimeout(function(){
                               thisSiblings.hide(500);
                           },3000);
                        }
                    });
                }
            });
        });
        $('a[class="deletePrivilege"]').click(function(){
           var textId = $(this).parent().siblings().eq(0).text();
            var url="${pageContext.request.contextPath}/PrivilegeServlet.servlet";
            var args={"method":"deletePrivilege","privilegeId":textId,"time":new Date()};
            var thisSibling = $(this).parent().children().eq(1);//在这个里siblings和sibling好像不灵
            var thisTag = $(this);
            var grandfatherNode=$(this).parent().parent();
            $.post(url,args , function(data){
                var object = eval("("+data+")");
                var variable = object.authorityMessage;
                if("yes"==variable){
                    grandfatherNode.remove();
                }else if("no"==variable){
                	thisTag.hide();
                	thisSibling.text("未知错误！检修中。。。");
                    thisSibling.show(500);
                    setTimeout(function(){
                        thisSibling.hide();
                        thisTag.show();
                    },3000);
                }else if("noIdentity"==variable){
                	thisTag.hide();
                	thisSibling.text("请登录管理员身份");
                    thisSibling.show(500);
                    setTimeout(function(){
                        thisSibling.hide();
                        thisTag.show();
                    },3000);
                }else if("noAuthotity"==variable){
                	thisTag.hide();
                	thisSibling.text("权限不足请联系超级管理员");
                    thisSibling.show(500);
                    setTimeout(function(){
                        thisSibling.hide();
                        thisTag.show();
                    },4000);
                }else if("dataBindingError"==variable){
                	thisTag.hide();
                	thisSibling.text("权限已被角色设定");
                    thisSibling.show(500);
                    setTimeout(function(){
                        thisSibling.hide();
                        thisTag.show();
                    },3000);
                }
            });
        });
        $('#example').dataTable( {
            "aaSorting": [[ 4, "desc" ]]
        } );
    } );
</script>
<!-- END JS -->
</body>
</html>
