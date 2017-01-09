<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 9/30/2016
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- BEGIN META -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Custom Theme">
    <!-- END META -->

    <!-- BEGIN SHORTCUT ICON -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/backgroundPlug/img/favicon.ico">
    <!-- END SHORTCUT ICON -->
    <title>500</title>

    <!-- BEGIN STYLESHEET -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME ICON STYLESHEET -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style-responsive.css" rel="stylesheet"><!-- THEME BASIC RESPONSIVE  CSS -->

    <!-- END STYLESHEET -->
</head>
<body class="body-500">
<div class="container">
    <!-- BEGIN MAIN CONTENT -->
    <section class="error-wrapper">
        <h1>OOOPS!</h1>
        <h2>500 Page Error</h2>
        <p class="page-500">Looks like Something went wrong.<a href="${pageContext.request.contextPath}/AdminServlet?method=logonSuccess" target="_top">Return Home</a></p>
    </section>
    <!-- END MAIN CONTENT -->
</div>
</body>
</html>