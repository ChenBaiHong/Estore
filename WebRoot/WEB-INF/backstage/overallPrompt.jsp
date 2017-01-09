<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 10/27/2016
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  	<script type="application/x-javascript">
        addEventListener("load", function()
        {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar()
        {
            window.scrollTo(0,1);
        }
    </script>
    <!-- css -->
    <link href="${pageContext.request.contextPath}/foregroundPlug/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/inlineConsultPlug/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/foregroundPlug/css/font-awesome.min.css" type="text/css" media="all" />
	<style type="text/css">
		*, *:after, *:before { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; }
		body, html { font-size: 100%; padding: 0; margin: 0; }
		.clearfix:before, .clearfix:after { content: " "; display: table; }
		.clearfix:after { clear: both; }
		
		body {font-family: 'Lato', Calibri, Arial, sans-serif;color: #fff;background: ;}
		
		a {color: #c0392b;text-decoration: none;}
		
		a:hover,a:active {color: #333;}
		button {border: none;padding: 0.6em 1.2em;background: #72d0eb;color: #fff;font-family: 'Lato', Calibri, Arial, sans-serif;
				font-size: 1em;letter-spacing: 1px;text-transform: uppercase;cursor: pointer;display: inline-block;margin: 3px 2px;border-radius: 2px;}
		
		button:hover {background:#55acee ;}
		
		.main-container {background: ;min-height: 100%;}
		
		.md-modal {position: fixed;top: 50%;left: 50%;width: 50%;max-width: 630px;min-width: 320px;height: auto;z-index: 2000;visibility: hidden;
					-webkit-backface-visibility: hidden;-moz-backface-visibility: hidden;backface-visibility: hidden;-webkit-transform: translateX(-50%) translateY(-50%);-moz-transform: translateX(-50%) translateY(-50%);
					-ms-transform: translateX(-50%) translateY(-50%);transform: translateX(-50%) translateY(-50%);}
							
		.md-show {visibility: visible;}
		
		.md-overlay {position: fixed;width: 100%;height: 100%;visibility: hidden;top: 0;left: 0;z-index: 1000;opacity: 0;background: rgba(0,0,0,0.3);
					-webkit-transition: all 0.3s;-moz-transition: all 0.3s;transition: all 0.3s;}
		
		.md-show ~ .md-overlay {opacity: 1;visibility: visible;}
		.md-content {color: #000000;background: #f8f8f8;position: relative;border-radius: 3px;margin: 0 auto;}
			/* Effect 1:  3D Rotate from bottom */
		.md-effect-1.md-modal {-webkit-perspective: 1300px;-moz-perspective: 1300px;perspective: 1300px;}
		
		.md-effect-1 .md-content {-webkit-transform-style: preserve-3d;-moz-transform-style: preserve-3d;transform-style: preserve-3d;-webkit-transform: translateY(100%) rotateX(90deg);
				-moz-transform: translateY(100%) rotateX(90deg);-ms-transform: translateY(100%) rotateX(90deg);transform: translateY(100%) rotateX(90deg);-webkit-transform-origin: 0 100%;
				-moz-transform-origin: 0 100%;transform-origin: 0 100%;opacity: 0;-webkit-transition: all 0.3s ease-out;-moz-transition: all 0.3s ease-out;transition: all 0.3s ease-out;}
						
		.md-show.md-effect-1 .md-content {-webkit-transform: translateY(0%) rotateX(0deg);-moz-transform: translateY(0%) rotateX(0deg);-ms-transform: translateY(0%) rotateX(0deg);
				transform: translateY(0%) rotateX(0deg);opacity: 1;} 
				
		.shoppingTable{
		    width: 66.666%;
		    margin: auto;
		    background: rgba(225,225,225,0.6);border-radius: 3px;
	    }
	   .shoppingTable .container_shopping .goodsInfoHead div{
	   		float:left;
	   		display:inline-block;
	   		width:12.5%;
	   		height:50px;
	   		text-align:center;
	   		line-height:50px;
	   		border:0.3px solid rgba(225,225,225,0.3);
	   		font-family:华文中宋;
	   		font-weight:200;
	   		font-size:20px;
	   }
	   .shoppingTable .container_shopping .goodsInfoBody{
	   		color: #0057b1;font-size: 18px;
	   }
	   .shoppingTable .container_shopping .goodsInfoBody .myFo{
	   		float:left;
	   }
	   .shoppingTable .container_shopping .goodsInfoBody .goodsImg , .goodsName{
	   		display:inline-block;
	   		border:0.3px solid rgba(0,0,0,0.05);
	   		height:150px;
	   		width:12.5%;
	   }
	   .shoppingTable .container_shopping .goodsInfoBody .goodsItem{
	   		display:inline-block;
	   		width:75%;
	   }
	   .shoppingTable .container_shopping .goodsInfoBody .goodsItem .myFo{
	   		display:inline-block;
	   		height:75px;
	   		text-align:center;
	   		line-height:75px;
	   		border:0.3px solid rgba(0,0,0,0.05);
	   		width:16.6666%;
	   }
	   .singlePrice ,.subtotal{
	   		color:#b31d04;
	   }
		.goodsItem .myFo .buyQuantity{
		    width: 60px;text-align: center;border: none; height:33px; margin:0 5;
		    box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.3);
		    vertical-align:text-top;
		}
	    .delete span{
	    	background:dodgerblue;
	    	padding:5px;
	    	color:white;
	    }
	    .delete span:hover{
	    	background:black;
	    	color:white;
	    	-webkit-transition: .5s all;
		    -moz-transition: .5s all;
		    -o-transition: .5s all;
		    -ms-transition: .5s all;
		    transition: .5s all;
	    }	
	</style>
</head>
<body>
	<html lang="en" class="no-js">
		<body>
			<div class="md-modal md-effect-1" id="modal-1">
				<div class="md-content">
					<div>
						
						<button class="md-close">Close me!</button>
					</div>
				</div>
			</div>
			<div class="main-container">
				
			</div>
			<!-- /main-container -->
			<div class="md-overlay"></div>
			<script>
				var polyfilter_scriptpath = '/js/';
			</script>
		</body>
	</html>
  <script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/js/index.js"></script>
  <script src="${pageContext.request.contextPath}/backgroundPlug/easyformPlug/js/jquery-2.1.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/inlineConsultPlug/js/myConsult.js"></script>
  <script src="${pageContext.request.contextPath}/foregroundPlug/js/bootstrap.js"></script>
</body>
</html>