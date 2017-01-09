<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 10/27/2016
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 全屏弹出框css样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/style.css" media="screen" />
    <!-- 日期css样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/pikaday.css"  />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/site.css" />
    <!-- 全屏背景线纹特效的css样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/component.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/normalize.css">
    <!-- easyUI Form表单的css样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/easyform.css">
    <!-- 上载图片插件的 css样式-->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/dropzone/css/dropzone.css" rel="stylesheet">
    <style type="text/css">
    
    .productContent{position: absolute;z-index: 2;top: 0px;width: 100%;height: 100%;}
    
    .productContent .form-div{
    	top: 15%;position: relative;background-color: rgba(0, 0, 0, 0.37);width: 710px;
	    border-radius: 10px;border: 1px solid #aaa;margin:auto; padding: 30px 0 20px 0px;font-size: 12px;
	    box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.3);
    }
    

	input[type="text"]{
	    border-radius: 8px;
	    box-shadow: inset 0 2px 5px #eee;
	    padding: 10px;
	    border: 1px solid #D4D4D4;
	    color: #333333;
	    margin-top: 5px;
	}
	
	input[type="text"]:focus{
	    border: 1px solid #50afeb;
	    outline: none;
	}
	
	input[type="button"], input[type="submit"],input[type="reset"] {
	    padding: 7px 15px;
	    background-color: #3c6db0;
	    text-align: center;
	    border-radius: 5px;
	    overflow: hidden;
	    min-width: 80px;
	    border: none;
	    color: #FFF;
	    box-shadow: 1px 1px 1px rgba(75, 75, 75, 0.3);
	}
	
	input[type="button"], input[type="submit"],input[type="reset"]{font-size:16px ; margin-left:186px;}
	
	input[type="button"]:hover, input[type="submit"]:hover,input[type="reset"]:hover { background-color: #5a88c8;}

	input[type="button"]:active, input[type="submit"]:active,input[type="reset"]:active {background-color: #5a88c8;}

	textarea{border-radius: 5px;box-shadow: inset 0 2px 5px #eee;padding: 5px;border: 1px solid #D4D4D4;color: #333333;-top: 5px;resize: none;}
	
	textarea:focus{border: 1px solid #50afeb;outline: none;}
    
    .form-div input[type="text"]{width: 268px;margin: 10px;line-height: 20px;font-size: 16px;}
     
     #reg-form section{display: block;position: relative;float: left;}
     
    #reg-form section div label{font-weight: bold;color:white;font-size:15px;}
    
    .myUpload_trigger{padding: 7px 15px;background-color: #5CB48E;text-align: center;border-radius: 5px;overflow: hidden;min-width: 80px;border: none;color: #FFF;box-shadow: 1px 1px 1px rgba(75, 75, 75, 0.3);}
    
    .productContent #reg-form input[type="text"]{background: rgba(225,225,225,0.7);border-radius: 5px;}
    
    .productContent #reg-form textarea{background: rgba(225,225,225,0.7);border-radius: 5px;width: 68%;height: 13%;}
    
    select{height: 31px;width: 50%;text-align: center;border: none;border-radius: 4px;background: rgba(225,225,225,0.8);color: black;margin-bottom: 10px;}
    
    .buttons{height: 45px;position: absolute;width: 100%;bottom: 5px;}
    
    select option{border: none;background: rgba(225,225,225,0.5);text-align: center; position:relative;}
    
    .myUpload{border: 1px solid rgba(0,0,0,0.03);min-height: 260px;-webkit-border-radius: 3px;border-radius: 3px;background: rgba(0,0,0,0.05);padding: 23px;cursor:pointer; clear:both;
		box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.5);  
    }
    .parameterImg{border: 1px solid rgba(0,0,0,0.03);min-height: 260px;-webkit-border-radius: 3px;border-radius: 3px;background: rgba(0,0,0,0.05);padding: 23px;cursor:pointer; clear:both;
		box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.5);  
    }
	
	.multiCategory{margin-bottom:12px;background:rgba(225,225,225,0.7);border-radius:6px;float:left;width:72%;}
	.multiCategory div {height:23px;text-align:center;line-height:23px;}
	.multiCategory div span{color:red;font-weight:bold;cursor:pointer;}
	
	.tree {
	    min-height:20px;
	    padding:19px;
	    margin-bottom:20px;
	    background-color:#fbfbfb;
	    border:1px solid #999;
	    -webkit-border-radius:4px;
	    -moz-border-radius:4px;
	    border-radius:4px;
	    -webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
	    -moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
	    box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
	    margin-top:57px;
	}
	.tree li {
	    list-style-type:none;
	    margin:0;
	    padding:10px 5px 0 5px;
	    position:relative
	}
	.tree li::before, .tree li::after {
	    content:'';
	    left:-20px;
	    position:absolute;
	    right:auto
	}
	.tree li::before {
	    border-left:1px solid #999;
	    bottom:50px;
	    height:100%;
	    top:0;
	    width:1px
	}
	.tree li::after {
	    border-top:1px solid #999;
	    height:20px;
	    top:25px;
	    width:25px
	}
	.tree li span {
	    -moz-border-radius:5px;
	    -webkit-border-radius:5px;
	    border:1px solid #999;
	    border-radius:5px;
	    display:inline-block;
	    padding:3px 8px;
	    text-decoration:none
	}
	.tree li.parent_li>span {
	    cursor:pointer
	}
	.tree>ul>li::before, .tree>ul>li::after {
	    border:0
	}
	.tree li:last-child::before {
	    height:30px
	}
	.tree li.parent_li>span:hover, .tree li.parent_li>span:hover+ul li span {
	    background:rgba(225, 225, 225, 0.37);
	    border:1px solid #94a0b4;
	    color:#000
	}
	.tree{background-color: rgba(0, 0, 0, 0.57);border-radius: 3px;border: 1px solid #aaa; color:white;
	    box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.3);
	}
	.rightClickdialog{
		height:60px; width:100px; position:absolute;left:0px; top:0px;border:0.7px solid white;background:#595555;z-index:9999;display:none;text-align:center;
	}
    </style>
</head>
    <body>
        <html lang="en" class="no-js">
            <body>
                <div class="md-modal md-effect-16" id="modal-16" style="max-width:1200px;">
                    <div class="md-content" style="background: rgba(0,0,0,0.3)">
                        <h3 style="background: rgba(0,0,0,0.2);"></h3>
                        <div>
                            <div>
								<div class="panel-body">
									<p>产品预览图片</p>
									<form action="javascript:;" id="myUpload" class="myUpload" awakeTrigger="0" dependUpFileId="fileList">
									
									</form>
									<p>产品图文参数</p>
									<form action="javascript:;" id="parameterImg" class="parameterImg" awakeTrigger="0" dependUpFileId="paramFileList">
										
									</form>
									<div>
										<input id="fileList" name="fileList" multiple="multiple" type="file" style="display:none;"/>
									</div>
									<div>
										<input id="paramFileList" name="paramFileList" multiple="multiple" type="file" style="display:none;"/>
									</div>
								</div>
							</div>
                            <!-- <button class="md-close">Close me!</button> -->
                        </div>
                    </div>
                    <div class="tree well">
						<ul>
							<s:iterator var="category" value="#request.categoryList">
								<li> 
									<span categoryId="${category.cid}" class="category" profile="${category.profile}" isExist="false">${category.name }</span>
								</li>
							</s:iterator>
						</ul>
					</div>
                </div>
                <div class="rightClickdialog">
						<span style="color:white; font-weight:bold ;" categoryId=""></span>
						<button class="addProd_Cate" style="font-size:12px;border-radius:0px; position:relative; width:100%;bottom:-8px;">设置该类别</button>
				</div>
                <div class="container demo-2">
                    <div class="content" >
                        <div id="large-header" class="large-header" style="background:url(${pageContext.request.contextPath}/backgroundPlug/AddRole/images/10.jpg)">
                            <canvas id="demo-canvas"></canvas>
                            <h1 class="main-title"><span>BaiHong</span></h1>
                        </div>
                        <div class="productContent" >
						      <div class="form-div" style="">
						        <h2 style="color: white;text-align: center;font-size: 24px;margin:0px;">添加产品栏</h2>
						        <hr/>
						        <form id="reg-form" action="javascript:;" method="post">
						        	<section class="step1">
							          <div>
						          		<label>产品名字</label>
							          	<input name="name" type="text" id="name" autocomplete="off"
				                               data-easyform="real-time;ajax:ajax_demo(1);"
				                               data-message="产品名字不能为空"
				                               data-message-ajax="用户名已存在!"
				                               data-easytip="position:top;class:easy-blue;">
						          	  </div>
							          <div>
						          		<label>进口价格</label>
						          		<input name="inletPrice" type="text" id="inletPrice" autocomplete="off"
				                               data-easyform="real-time;ajax:ajax_demo(2);"
				                               data-message="请填写进口价格"
				                               data-message-ajax="进口价格必须是数字并不能小于0"
				                               data-easytip="class:easy-blue;">
						          		</div>
							          <div>
							          	<label>零售价格</label>
							          	<input name="salePrice" type="text" id="salePrice" autocomplete="off"
				                    		   data-easyform="real-time;ajax:ajax_demo(3);"
				                    		   data-message="请填写零售价格"
				                               data-message-ajax="零售价格必须是数字并不能小于0" 
				                               data-easytip="class:easy-blue;">
							          </div>
							          <div>
							          	<label>产品来源</label>
							          	<input name="produceLocal" type="text" id="produceLocal" autocomplete="off"
				                    		   data-easyform="real-time;ajax:ajax_demo(4);"
				                    		   data-message="请填写产品来源地"
				                               data-message-ajax="产品来源地是必填项"
				                               data-easytip="class:easy-blue;">
							          </div>
							          <div>
							          	<label>产品公司</label>
							          	<input name="productCompany" type="text" id="productCompany" autocomplete="off"
				                               data-easyform="real-time;ajax:ajax_demo(5);"
				                               data-message="请填写产品公司"
				                    		   data-message-ajax="产品公司是必填项"
				                               data-easytip="class:easy-blue;position:bottom;">
							          	
							          	</div>
							          <div>
							          	<label>产品数量</label>
							          	<input name="quantity" type="text" id="quantity" autocomplete="off"
				                               data-easyform="real-time;ajax:ajax_demo(6);"
				                               data-message="请填写产品数量"
				                    		   data-message-ajax="产品数量必须是正整数"
				                               data-easytip="class:easy-blue;position:bottom;">
							          </div>
							          <div>
								     	<button class="myUpload_trigger" data-modal="modal-16" 
								     	style="margin-top: 12px;margin-bottom: 11px;position: relative;right: 20%;">上传样图</button>
								     	<button class="md-trigger" data-modal="modal-16" style="display:none"></button>
									   </div>
							        </section>
							        <section class="step2" style="width: 46.5%;">
							        	<div>
								        	<label>产品品牌</label>
									          <select  name="brandId">
									            <option value="default">&ndash; 选择产品品牌 &ndash;</option>
									            <s:iterator var="brand" value="#request.brandList">
									            	<option value="${brand.id }">${brand.name}</option>
									            </s:iterator>
									          </select>
									     </div>
							          	<div>
									        <div class="flow-element" style="margin-right:0px;">
									            <label for="datepicker">进口日期</label>
									            <input type="text" id="datepicker" name="inletDate" autocomplete="off" style="width: 68%;margin-bottom: 12px;"
									               data-easyform="real-time;ajax:ajax_demo(8);"
					                               data-message="进口日期不能为空"
					                               data-easytip="class:easy-blue;position:bottom;"
									            >
									        </div>
									        <div class="flow-element" style="position: absolute;left: 250px;top: 71px;">
									            <div id="container"></div>
									        </div>
									     </div>
									     <div style="width:77% ; margin:auto;">
								        	<div id="cid" style="width:27%;;float:left;cursor:pointer;"><label>产品类别</label></div>
									        <div class="multiCategory" style="">
									         	<div><a style="color:black">---选择类别---</a></div>
									        </div>
									        <br style="clear:both;"/>
									     </div>
									     <div>
										     <label>备注</label>
										     <textarea id="description" name="description" 
											           data-easyform="real-time;ajax:ajax_demo(7);"
											           data-message="你还没有描述该产品"
						                    		   data-message-ajax="你还没有描述该产品"
						                               data-easytip="class:easy-blue;"></textarea>
									     </div>
									     <!-- <img id="textImg" src="#"/> -->
									     <div style="height: 11%;">
									     	<label class="promptMsg" style="font-size: 120px;height: inherit;position: relative;top: -25px;color: rgba(28,202,224,1);display:none;">√</label>
									     </div>
							        </section>
						            <div class="buttons" >
						                <input value="提交" type="submit" id="submit" >
						                <input value="重置" type="reset" >
						            </div>
						            <br class="clear" style="clear:both;">
						        </form>
						    </div>
                        </div>
                    </div>
                </div>

                <div class="md-overlay" style="background: rgba(10,46,32,0.5);"></div><!-- the overlay element -->

                <script>
                    var polyfilter_scriptpath = '/js/';
                </script>
            </body>
        </html>
        
        <script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/js/index.js"></script><!-- 全屏弹出框的js文件 -->
        <script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/js/pikaday.js"></script><!-- 日期的js插件 -->
        <script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/rAF.js"></script>
        <script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/demo-2.js"></script>
        <!-- jQuery 必不可少的插件 -->
	    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/jquery-2.1.0.min.js"></script>
	    <!-- 全屏背景弦纹所需的js样式 -->
	    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/html5.js"></script>
	    <!-- easyUI form 表单的js样式 -->
	    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/easyform.js"></script>
	    <!-- 上在图片，与修建图片的js样式 -->
		<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
		<script src="${pageContext.request.contextPath}/backgroundPlug/assets/dropzone/dropzone.js" ></script><!-- DROPZONE JS  -->
		<script src="${pageContext.request.contextPath}/backgroundPlug/assets/dropzone/form-dropzone.js" ></script><!-- DROPZONE JS  -->
		<!-- 文件ajax异步上载的js插件 -->
		<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/ajaxfileupload.js"></script>

	    <script type="text/javascript">
		  var picker = new Pikaday(
		    {
		        field: document.getElementById('datepicker'),
		        firstDay: 1,
		        minDate: new Date(2000, 0, 1),
		        maxDate: new Date(2020, 12, 31),
		        yearRange: [2000, 2020],
		        bound: true,
		        container: document.getElementById('container'),
		    });
	   /* *****************************************************************
	   	开始解决文件上传，和文件删除的内存问题 
	   ********************************************************************/
	  	$("button.myUpload_trigger").click(function(){
	  		$("div.md-content").show();
	    	$("div.tree").hide();
	    	$("button.md-trigger").trigger("click");
	  	})
	  	var invalidFilePro = new Array();//产品预览图移除不需要的文件
	  	var invalidFileParam = new Array();//无效产品参数图片

	  	//开始产品图上传
		$("#myUpload").bind("click",function(){
			var $this = $(this);
			$(this).parents(".panel-body").bind("change",function(){
				addPreviewImg($this,invalidFilePro,"fileList");
				$(this).unbind("change");
			});
			$("#fileList").trigger("click");
			$("div.form-div").css("opacity","0.1");
		});
		//结束产品图上传
		
	  	//开始产品图文参数图上传
		$("#parameterImg").bind("click",function(){
			var $this = $(this);
			$(this).parents(".panel-body").bind("change",function(){
				addPreviewImg($this,invalidFileParam,"paramFileList");
				$(this).unbind("change");
			});
			$("#paramFileList").trigger("click");
			$("div.form-div").css("opacity","0.1");
		});
		//结束产品图文参数图上传
		$(".md-overlay").click(function(){
			$("div.form-div").css("opacity","1");
			$(".rightClickdialog").hide();//隐藏右击弹窗
		});
		function addPreviewImg($thisUp,removeFiles,triggerFileId){
			$thisUp.html("");
			var listFiles = document.getElementById(triggerFileId).files;
			for(var i = 0 ; i<listFiles.length;i++){
				if(i<6 && listFiles[i]!=null){
					var uri = getObjectURL(listFiles[i]);		
					var divTag= $('<div class="up-details"></div>');
					var imgTag = $('<img src="#" class="imgPreview" width="100%" alt=""/>');
					var removeTag = $('<button class="rBt" style="position:absolute;bottom:0px;font-size:14px;border-radius:2px;'+
					' width:100%; height:30px;" index="'+i+'">Remove file</button>');
					imgTag.attr("src",uri);
					divTag.append(imgTag);
					divTag.append(removeTag);
					divTag.css({"float":"left","position":"relative","display":"inline-block","width":"20%","height":"15%","margin":"2% 0 0 4%",});
					$thisUp.append(divTag);
					//开始给按钮绑定移除文件事件
					removeTag.bind("click",function(){
						var index = $(this).attr("index");
						var thisUp = $(this).parent().parent();
						var fileId = thisUp.attr("dependUpFileId");
						//判断唤醒的长度减一
						var up_len = parseInt(thisUp.attr("awakeTrigger"));
						if(up_len>0){
							thisUp.attr("awakeTrigger",up_len-1);
						}
						if(fileId == "fileList"){
							invalidFilePro.push(document.getElementById(fileId).files[index].name);
							if((up_len-1)==0){//最后一个移除就唤醒上传文件触发器
								invalidFilePro = new Array();
								setTimeout(function(){
									thisUp.bind("click",function(){
										var $this = $(this);
										$(this).parents(".panel-body").bind("change",function(){
											addPreviewImg($this,invalidFilePro,fileId);
											$(this).unbind("change");
										});
										$("#"+fileId).trigger("click");
										$("div.form-div").css("opacity","0.1");
									});
								},300);
							}
						}else if(fileId == "paramFileList"){
							invalidFileParam.push(document.getElementById(fileId).files[index].name);
							if((up_len-1)==0){//最后一个移除就唤醒上传文件触发器
								invalidFileParam = new Array();
								setTimeout(function(){
									thisUp.bind("click",function(){
										var $this = $(this);
										$(this).parents(".panel-body").bind("change",function(){
											addPreviewImg($this,invalidFileParam,fileId);
											$(this).unbind("change");
										});
										$("#"+fileId).trigger("click");
										$("div.form-div").css("opacity","0.1");
									});
								},300);
							}
						}
						document.getElementById(fileId).files[index]=null;
						$(this).parent().remove();//移除文件
					})
					//结束给按钮绑定移除文件事件
				}else{
					removeFiles.push(document.getElementById(triggerFileId).files[i].name);
					document.getElementById(triggerFileId).files[i]=null;
					continue;
				}
			}
			var clear = $('<div style="clear:both;"></div>');
			var up_details=$thisUp.find(".up-details");
			
			$thisUp.attr("awakeTrigger",up_details.length);//唤醒触发前提判断还有没有文件
			$thisUp.append(clear);
			$thisUp.unbind("click");
		}
		$("input[type=reset]").click(function(){
			$("#myUpload").html("");
			$("input#categoryId").val("---选择类别---");
			$("input#categoryId").attr("categoryId","");
			invalidFilePro = new Array();
			invalidFileParam = new Array();
		});
        /* *****************************************************************
	   	结束解决文件上传，和文件删除的内存问题
	   ********************************************************************/
	   var judge=false;
	   var categorys=new Array();//储存所有的分类 id 
	   $(document).ready(function (){
	        var v = $('#reg-form').easyform();
	        v.is_submit = false;
	        
	         //开始点击提交表单事件
	        $("#submit").click(function(){
        		var stringBuilder = invalidFilePro.join(",");
        		var stringBuffer = invalidFileParam.join(",");
	        	var brandId = $("select[name=brandId]").val();
	        	var inletDate = $("#datepicker").val();
	        	var categoryIds = categorys.join(",");
	        	if(judge==true && brandId!="default" && categoryIds.trim().length!=0){
	        		judge=false;//避免重复提交表单
	        		var name = $("#name").val();
	        		var inletPrice = $("#inletPrice").val();
	        		var salePrice = $("#salePrice").val();
	        		var produceLocal = $("#produceLocal").val();
	        		var productCompany = $("#productCompany").val();
	        		var quantity = $("#quantity").val();
	        		var description = $("#description").val();
	        		$.ajaxFileUpload({
		        		url:"addProductAction?name="+name+"&inletPrice="+inletPrice
		        				 +"&salePrice="+salePrice+"&produceLocal="+produceLocal
		        				 +"&productCompany="+productCompany+"&quantity="+quantity
		        				 +"&description="+description+"&brandId="+brandId+"&categoryId="+categoryIds+"&inletDate="+inletDate+"&removeFiles="+stringBuilder+"&invalidParamFiles="+stringBuffer,
		       			secureuri:false,
		       			fileElementId:["paramFileList","fileList"],
		                dataType:"json",//返回数据格式json
		                success:function(result){
		                	var message = eval("("+result+")");
		                	if(message.message=="yes"){
		                		$(".promptMsg").text("√");
		                		$(".promptMsg").slideDown(350);
		                		setTimeout(function(){
		                			$(".promptMsg").slideUp(300);
		                			$("#myUpload").html("");
		                			$("input[type=reset]").trigger("click");
		                		},5000);
		                	}else{
		                		$(".promptMsg").text("×");
		                		$(".promptMsg").slideDown(350);
		                		setTimeout(function(){
		                			$(".promptMsg").slideUp(300);
		                			$("input[type=reset]").trigger("click");
		                		},5000);
		                	}
		                }
	        		})
	        	}
	        })
	        //接受提交表单事件
	    });
	    function getObjectURL(file) {
		    var url = null;
		    if (window.createObjectURL != undefined) { // basic
		        url = window.createObjectURL(file);
		    } else if (window.URL != undefined) { // mozilla(firefox)
		        url = window.URL.createObjectURL(file);
		    } else if (window.webkitURL != undefined) { // webkit or chrome
		        url = window.webkitURL.createObjectURL(file);
		    }
		    return url;
	 	}
	    function ajax_demo(p)
	    {
	    	if(p==1){
	    		var name = $("#name").val();
	    		//alert(name);
	    		var url="verifyDuplicateAction";
	    		var args = "name="+name+"&time="+new Date();
	    		$.post(url , args , function(data){
	    			//alert(data);
	    			var message = eval("("+data+")");
					if(message.message=="no"){
						$("#name").trigger("easyform-ajax", false);
						judge=false
					}else{
						$("#name").trigger("easyform-ajax", true);
						judge=true;
					}
	    		})
	    	}if(p==2){
	    		var inletPrice = $("#inletPrice").val();
	    		if(isNaN(inletPrice) || inletPrice<0){//如果不是数字，就是true
	    			$("#inletPrice").trigger("easyform-ajax", false);
	    			judge=false;
	    		}else{//是数字即使false
	    			$("#inletPrice").trigger("easyform-ajax", true);
	    			judge=true
	    		}
	    	}if(p==3){
	    		var salePrice = $("#salePrice").val();
	    		if(isNaN(salePrice) || salePrice<0){//如果不是数字，就是true
	    			$("#salePrice").trigger("easyform-ajax", false);
	    			judge=false
	    		}else{//是数字即使false
	    			$("#salePrice").trigger("easyform-ajax", true);
	    			judge=true;
	    		}
	    	}if(p==4){
	    		var produceLocal = $("#produceLocal").val();
	    		if(produceLocal.trim().length==0){
	    			judge=false;
	    		}else{
	    			judge=true;
	    		}
	    	}if(p==5){
	    		var productCompany = $("#productCompany").val();
	    		if(productCompany.trim().length==0){
	    			judge=false;
	    		}else{
	    			judge=true;
	    		}
	    	}if(p==6){
	    		var quantity = $("#quantity").val();
	    		if(isNaN(quantity)|| quantity<0){//如果不是数字，就是true
	    			$("#quantity").trigger("easyform-ajax", false);
	    			judge=false;
	    		}else{//是数字即使false
	    			$("#quantity").trigger("easyform-ajax", true);
	    			judge=true
	    		}
	    	}if(p==7){
	    		var description = $("#description").val();
	    		if(description.trim().length==0){
	    			judge=false;
	    		}else{
	    			judge=true;
	    		}
	    	}
	    }
	    
	    /* *****************************************************************
	   	开始选择产品类别
	   ********************************************************************/
		    $("#cid").click(function(){
		    	$("div.md-content").hide();
		    	$("div.tree").show();
		    	$("button.md-trigger").trigger("click");
			})
			
		   $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
		   $('.tree li.parent_li > span').on('click', function (e) {
		        treeConstructFunction($(this));
		   });
		   $('.tree li > span').click(function(){
		   		var $this=$(this);
		   		cycleTreeFunction($this);
		   });
		   //开始鼠标右击事件，消除浏览器默认鼠标右击事件
		   $('.tree li > span').contextmenu(function(){
			return false;
			}); 
		   $('.tree li > span').mousedown(function(e){
		   		var $this=$(this);
		   		if(e.which==3){
		   			$(".rightClickdialog").css('left',e.pageX).css('top',e.pageY);
		   			$(".rightClickdialog").show();
		   			$(".rightClickdialog").find("span").text($this.text());
		   			$(".rightClickdialog").find("span").attr("categoryId",$this.attr("categoryId"));
		   		}
		   });
		   //结束鼠标右击事件
		   $('.tree').click(function(){
		   		$(".rightClickdialog").hide(260);//隐藏右击后的弹出框
		   })
		   //为产品表人性化显示分类参数
		   $(".addProd_Cate").click(function(){
		   		var $this=$(this);
		   		var categoryId = $this.siblings("span").attr("categoryId");
		   		if(categoryId.trim().length!=0){
		   			for(var i=0 ; i<categorys.length;i++){
		   				if(categorys[i]==categoryId){
		   					return;
		   				}
		   			}
		   			var displayCategory=$('<div><a>'+$this.siblings("span").text()+'</a> <span categoryId="'+categoryId+'">X</span></div>');
		   			//删除某个不需要的分类Id
		   			displayCategory.find("span").bind("click",function(){
		   				var cId = $(this).attr("categoryId");
		   				for(var i= 0 ; i<categorys.length;i++){
			   				if(categorys[i]==cId){
			   					categorys[i]=categorys[categorys.length-1];//最后的分类Id,覆盖当前要删除的分类Id对应的下标;以此就删除数组中的不需要的分类Id
			   					categorys.pop();//删除最后的一个元素
			   					break;
			   				}
		   				}
		   				$(this).parent().remove();
		   			});
		   			$(".multiCategory").append(displayCategory);
		   			categorys.push(categoryId);//添加分类
		   		}
		   });
		   
		  function cycleTreeFunction($this){
	   		var categoryId = $this.attr("categoryId");
	   		$("input#categoryId").attr("categoryId",categoryId);
		   	//防止重复数据提交请求，判断是否父节点下孩子节点是否已经向数据库请求显示过
	   		if($this.attr("isExist")=="false"){
		   		var url="fetchSubcategoryAction";
		   		var args={"cid":categoryId,"time":new Date()};
		   		$.post(url , args , function(data){
		   			var subcategorys=eval("("+data+")");
		   			if(subcategorys.length!=0){
		   				var ulTag = $("<ul></ul>");
		   				for(var i = 0; i<subcategorys.length;i++){
		   					var liTag = $("<li></li>");
		   					var spanTag = $('<span categoryId='+subcategorys[i].cid+' profile="'+subcategorys[i].profile+'" class="category" isExist="false">'+subcategorys[i].name+'</span>')
		   					//绑定事件
		   					spanTag.bind("click",function(){
						   		var $this=$(this);
						   		cycleTreeFunction($this);
						   });
		   					liTag.append(spanTag);
		   					ulTag.append(liTag);
		   				}
		   				$this.after(ulTag);
		   				$this.attr("isExist","true");//数据库遍历出这个父节点的子类，下次在被点击就不用再向数据发送该节点要子节点的请求
		   				$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
					    $('.tree li.parent_li > span').on('click', function (e) {
					        treeConstructFunction($(this));//给创建的后期绑定事件
					    });
					    $('.tree li > span').contextmenu(function(){
							return false;
						}); 
						//重新绑定鼠标右击事件
					   $('.tree li > span').mousedown(function(e){
					   		var $this=$(this);
					   		if(e.which==3){
					   			$(".rightClickdialog").css('left',e.pageX).css('top',e.pageY);
					   			$(".rightClickdialog").show();
					   			$(".rightClickdialog").find("span").text($this.text());
					   			$(".rightClickdialog").find("span").attr("categoryId",$this.attr("categoryId"));
					   		}
					   });
		   			}
		   		});
	   		}
	   }
	   //循环给树结构添加时间，是否可见是否不可见，这里应该是有图片但没有
	   function treeConstructFunction($this){
	  	var children = $this.parent('li.parent_li').find(' > ul > li');
	       if (children.is(":visible")) {
	           children.hide('fast');
	           $this.attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
	       } else {
	           children.show('fast');
	           $this.attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
	       }
	       e.stopPropagation();
	   }
	   /* *****************************************************************
	   	结束选择产品类别
	   ********************************************************************/
		</script>
    </body>
</html>