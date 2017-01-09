<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 10/25/2016
  Time: 8:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>遍历查看添加的品牌</title>
    <!-- BOOTSTRAP CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap-reset.css" rel="stylesheet"/>
    <!-- 特色风格的字体 图标 CSS样式 -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/font-awesome/css/font-awesome.css"rel="stylesheet"/>
    <!-- 基本主题的 CSS 样式 -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style.css"rel="stylesheet"/>
    <!--响应式主题css响应样式-->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style-responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/styles.css">
    <style type="text/css">
        .header_icon #pageSize{width: 13%;height: 6%;margin: 4px;background: transparent;color: white;border: 1px solid whitesmoke;border-radius: 2px;text-align: center;
            cursor: pointer;position: absolute;z-index: 8;}
        .header_icon ul{z-index: 9;color: white; width: 13%; position: absolute;margin: 4px;: 1px solid white;text-align: center;background: rgba(0,0,0,0.3);
            border: 1px solid white;cursor:pointer;}
        .pagingBar{width: 60%;height: 5%;position: absolute;margin-top: -9%;margin-left: 28%;}
        .pagingBar ul li{float:left;width: 14%;}
        #searchKey{border: 1px solid #DDDDDD;width: 150px;height: 30px;margin-bottom: 15px;}
        input[class="search"]{margin:0px;border: 1px solid whitesmoke;height: 5%;width: 100%;}
        .MyEventBody{float: left;position: absolute;left: 0px;margin: 24px;border: none;padding: 0px;overflow: hidden;width: 100%;height: 100%;
		margin-top: 28%;display: none;padding-top: 7%;
					} 
        .updateData, .deleteData{
            float:left;
            width: 106px; height: 39px;line-height: 39px; text-align: center;background: #5CB48E;margin-left:20%; cursor:pointer;
        }
        .MyEventBody textarea{
        	margin: 0px 25px;width: 90%;resize: none;border: 1px solid #e0e0e0;height: 60px;border-radius: 3px;
        }
        .MyEventBody span{display: block;padding: 0px 25px;font-weight: 800;position: absolute;top: 39px;font-size: 10px;color: #7d7d7d;
        }
        .aboutName{ height: 39px;width: 33%;margin-left: 24px;background: white;margin-top: -7%;
        }
        .MyEventBody .aboutName .updateName{border-radius: 3px;border: 1px solid #e0e0e0;margin-top: 7px;position: absolute;font-size: 16px;
		background: white;left: 24px;display:none;
        }
        .MyEventBody .aboutName .displayName{
        border-radius: 2px;border: 1px solid #e0e0e0;font-size: 13px;cursor: pointer;margin-top: -29px;
        }.promptBar{position: absolute;bottom: 49.3%;width: 90%;background: rgba(0,0,0,0.5);height: 60px;margin: 0px;
			display:none;
        }
        .promptBar span{color: white;font-size: 20px;position: relative;top: 19px;
        }
        
    </style>
</head>
<body style="background-attachment:fixed;">
<div class='title'>
    <div class='title_inner'>
        <h1>
            BaiHong.Chen@yahoo.com
        </h1>
        <h2>
            因热爱技术而执着，因梦想而奋斗
        </h2>
    </div>
</div>
<div class='container' style="margin: 0px;margin-top: 8%;">
    <div id="RestrictionContainer" style="width: 68%;height: inherit;margin-left: 15%;">
        <div class='container_ui'style="background:url(${pageContext.request.contextPath}/backgroundPlug/ergodicBg/img/pro-ac-1.png)">
            <div class='container_ui__heading'>
                <div class='header_icon'>
					<input id="currentPage" type="hidden" value="${requestScope.pageBean.currentPage }"/>
					<input id="totalRecord" type="hidden" value="${ requestScope.pageBean.totalRecord}"/>
					<input id="totalPage" type="hidden" value="${ requestScope.pageBean.totalPage}"/>
                </div>
            </div>
            <div class="pagingBar">
                <ul>
                    <li><a href="javascript:;" class="fa fa-arrow-left" id="previous"></a></li>
                   	<s:iterator value="#request.pageBean.pageBar" var="num">
                   	<li><a href="javascript:;" class="num">${num}</a></li>
                   	</s:iterator>
                    <li><a href="javascript:;" class="fa fa-arrow-right" id="next"></a></li>
                </ul>
            </div>
            <div style="background:url(${pageContext.request.contextPath}/backgroundPlug/ergodicBg/img/pro-ac-1.png)">
                <input type="text" class="search" id="search"  name="searchKey" autocomplete="off" style="
        	color: white;font-weight: bold;font-size:15px">
                <s:iterator  value="#request.pageBean.brandList" var="brand" status="status">
                <div style="background:rgba(0,0,0,0);" class="brandClass">
                    <input id='message-${status.count}'class="checkInput" type='checkbox'>
                    <label for='message-${status.count}' href='#move' style="margin: 0px;" myChecked="false" class="clickLabel">
                        <div class='container_ui__item'>
                            <div class='face'>
                                <img src='${pageContext.request.contextPath}/backgroundPlug/ergodicBg/img/${status.count}.jpg'>
                                <div class='color_bar
	                    	${status.count==1?"one":""}
	                    	${status.count==2?"two":""}
	                    	${status.count==3?"three":""}
	                    	${status.count==4?"four":""}
	                    	${status.count==5?"five":""}
	                    	${status.count==6?"four":""}
	                    	${status.count==7?"three":""}
	                    	${status.count==8?"two":""}
	                    	${status.count==9?"one":""}'>
	                        <!-- 品牌的名字 -->
                                    <p>${brand.name}</p>
                                    <span class="brandName">${brand.name}</span>
                                </div>
                            </div>
                            <!-- 品牌的id 和 品牌的名字-->
                            <h2>
                                    ${brand.name}
                            </h2>
                            <div class='dot active'></div>
                            <h3>subj: you are watch brand</h3>
                           <!--  品牌的描述 -->
                            <h4 class="description">${brand.description}</h4>
                        </div>
                        <div class='container_ui__expand' id='${status.count==1?"close":""}'  style="width: 520px;height: 100%;pointer-events:none;">
                            <div class='heading
	                		${status.count==1?"one":""}
	                    	${status.count==2?"two":""}
	                    	${status.count==3?"three":""}
	                    	${status.count==4?"four":""}
	                    	${status.count==5?"five":""}
	                    	${status.count==6?"four":""}
	                    	${status.count==7?"three":""}
	                    	${status.count==8?"two":""}
	                    	${status.count==9?"one":""}'>
                                <div class='heading_head'></div>
                                <label for='message-${status.count}'style="font-size: 29px;width: 30px;pointer-events:auto;" class="closeIt">
                                    x
                                </label>
                            </div>
                            <div class='body'>
                                <div class='user'>
                                    <div class='face'>
                                        <img src='${pageContext.request.contextPath}/backgroundPlug/ergodicBg/img/${status.count}.jpg'>
                                    </div>
                                    <div class='details'>
                                    	<!-- 品牌的id 和 品牌的名字-->
                                        <h2>
                                              ${brand.name}
                                        </h2>
                                        <!-- <input id="brandName" type="text" style="border-radius:3px; border:1px solid black;display:none"/> -->
                                        <h3>subj: you are watch brand</h3>
                                    </div>
                                </div>
                                <div class='content'>
                                    <p><b>公司信息</b></br>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                    Fusce et commodo ipsum, ut rhoncus velit. Nullam placerat, ipsum sed pretium varius,
                                     magna metus ullamcorper magna, at porta quam libero ut est. Mauris cursus in magna in fermentum.
                                      Integer mollis convallis quam, vel dignissim ligula rutrum in.
                                      <br/>Pellentesque ut purus porta, gravida tellus et, consectetur massa. 
                                      Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; 
                                      Pellentesque egestas convallis urna...</p>
                                </div>
                            </div>
                        </div>
                    </label>
                    <div class="MyEventBody">
                    	<div class="aboutName">
	                    	<span class='displayName' style="">RENAME</span>
	                    	<input class="updateName" type="text" placeholder="更新品牌名" brandId="${brand.id}"/>
                    	</div>
                    	<div style="margin-top: 21px;">
                    		<span class="eventsSpan">品牌描述</span>
                            <textarea  class="description" autofocus="autofocus" style="pointer-events: auto;width: 90%;"></textarea>
                    	</div>
                      	<div class="companyPreview" style="width: 90%;height: 33%;margin: 24px;border: none;padding: 0px; overflow:hidden;">
                              <img class="previewImg"  src="showBrandImgAction?id=${brand.id}" style="width:100%; padding:0px;">
                              <p class="promptBar"><span>更新成功</span></p>
                         </div>
                         <div>
                              <div  class="updateData"><a href="javascript:;" style="color: white;font-size: 16px;">更新</a></div>
                              <div  class="deleteData" style="background: #D2CCB2;"><a href="javascript:;" style="color: white;font-size: 16px;">删除</a></div>
                         </div>
                     </div>
                   </div>
                </s:iterator>
                <div style="display:none">
                   <input type="file" id="fileImg" name="fileImg" myChecked="false" style="display:none;">
               </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/backgroundPlug/easyformPlug/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/ajaxfileupload.js"></script>
<script type="text/javascript">
    $(function(){
    	//开始自定义动画
        $(".clickLabel").click(function(){
        	var checked=$(this).attr("myChecked");
        	//alert(checked);
        	if(checked=="false"){
        		$(this).siblings("div.MyEventBody").stop().fadeTo(100,0.5).animate({left:548},200).fadeTo(200,1);
        		$(this).attr("myChecked","true");
        	}else{
        		$(this).siblings("div.MyEventBody").stop().animate({left:0},300).hide();
        		$(this).attr("myChecked","false");
        	}
        });
        $(".closeIt").click(function(){
        	$(this).parents(".clickLabel").siblings("div.MyEventBody").stop().animate({left:0},300).hide();
        	$(this).parents(".clickLabel").attr("myChecked","true");
        })
        //结束自定义动画
        //开始分页查询
        var currentPage = parseInt($("#currentPage").val());
        var totalPage = parseInt($("#totalPage").val);
        $("#previous").click(function(){
        	//alert(currentPage>1);
        	if(currentPage>1){
	        	ajaxPagingFunction(currentPage-1);
	        }
        });
        $(".pagingBar ul li a.num").click(function(){
        	//alert(totalPage.val()+","+currentPage.val());
        	var targetPage = parseInt($(this).text());
        	ajaxPagingFunction(targetPage);
        });
         $("#next").click(function(){
         	//alert(currentPage<totalPage);
         	if(currentPage<totalPage){
	        	ajaxPagingFunction(currentPage+1);
	        }
        });
        function ajaxPagingFunction(targetPage){
        	var url="pagingFindBrandAction";
        	var args = "targetPage="+targetPage+"&time="+new Date();
        	//alert(url,args);
	       	$.post(url , args , function(data){
	       		//alert(data);
	       		var pageBean = eval(("("+data+")"));
	       		var brandList = pageBean.brandList;
	       		var labelList = $(".clickLabel");
	       		//alert(brandList.length==labelList.length)
	       		if(brandList.length==labelList.length){
	       			for(var i = 0 ; i<brandList.length; i++){
			        	if($(labelList[i]).attr("myChecked")=="true"){
			        		$(labelList[i]).trigger("click");
			        	}
	       				plugPagingParams($(labelList[i]), brandList[i]);
	       				$(labelList[i]).slideDown(100);
	       			}
	       		}else{
	       			var arrNum = new Array();
	       			
	       			for(var i = 0 ; i<brandList.length; i++){
	       				plugPagingParams($(labelList[i]), brandList[i]);
	       				$(labelList[i]).slideDown(100);
	       				arrNum[i]=i;
	       			}
	       			for(var i = 0 ; i<labelList.length; i++){
			        	if($(labelList[i]).attr("myChecked")=="true"){
			        		$(labelList[i]).trigger("click");
			        	}
	       				if(i == arrNum[i]){
	       					continue;
	       				}else{
	       					$(labelList[i]).hide(100);
	       				}
	       			}
	       		}
	       		var pageBar = pageBean.pageBar;
		        var aNumBar = $("a.num")
		        for(var i = 0 ; i<pageBar.length;i++){
		             $(aNumBar[i]).text(pageBar[i]);
		        }
		        currentPage=pageBean.currentPage;
		        totalPage=pageBean.totalPage;
		        //alert(currentPage+","+totalPage);
	       	});
        }
        function plugPagingParams(tag , parames){
        	tag.find("div.color_bar").children().text(parames.name);
        	tag.siblings("div.MyEventBody").find("input.updateName").attr("brandId",parames.id);
        	tag.siblings("div.MyEventBody").find("img.previewImg").attr("src","showBrandImgAction?id="+parames.id);
        	tag.find("h2").text(parames.name);
        	tag.find("h4").text(parames.description);
        }
        function plugPagingParams2(tag){
        	alert("名字--》 "+tag.find("div.color_bar").children().text()+",id号--》"+tag.find("h2").attr("brandId")+
        	", 名字--》"+tag.find("h2").text()+",名字--》"+tag.find("h4").text());
        }
        //结束分页查询
        //开始搜索品牌
        $("#search").keyup(function(){
        	var retrievalValue = $(this).val();
        	//alert(retrievalValue);
        	if(retrievalValue.trim().length!=0){
        		var url="likeBlurredSearchAction";
        		var args = "conditionParam="+retrievalValue+"&time="+new Date();
        		//alert(url,args);
		       	$.post(url , args , function(data){
		       		var brandList = eval(("("+data+")"));
		       		var labelList = $(".clickLabel");
		       		//alert(brandList.length==labelList.length)
		       		if(brandList.length==labelList.length){
		       			for(var i = 0 ; i<brandList.length; i++){
			       			if($(labelList[i]).attr("myChecked")=="true"){
				        		$(labelList[i]).trigger("click");
				        	}
		       				plugPagingParams($(labelList[i]), brandList[i]);
		       				$(labelList[i]).slideDown(100);
		       			}
		       		}else{
		       			var arrNum = new Array();
		       			for(var i = 0 ; i<brandList.length; i++){
		       				plugPagingParams($(labelList[i]), brandList[i]);
		       				$(labelList[i]).slideDown(100);
		       				arrNum[i]=i;
		       			}
		       			for(var i = 0 ; i<labelList.length; i++){
			       			if($(labelList[i]).attr("myChecked")=="true"){
				        		$(labelList[i]).trigger("click");
				        	}
		       				if(i == arrNum[i]){
		       					continue;
		       				}else{
		       					$(labelList[i]).hide(100);
		       				}
		       			}
		       		}
		       	});
        	}else{
        		ajaxPagingFunction(currentPage);
        	}
        });
		//结束品牌搜索
		//开始更新品牌的名称
        $("span.displayName").click(function(){
       		$(this).slideUp(250);
        	$(this).siblings("input.updateName").slideDown(250);
        });
        //结束更新的品牌的名称
        
        //开始上传图片点击事件
        $(".previewImg").click(function(){
            var previewImg = $(this);
            $("#fileImg").trigger("click");
            $("#fileImg").attr("myChecked","true")
            //开始上传品牌图片预览
            var rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i; 
           	var aFiles = document.getElementById("fileImg").files;
            if (aFiles.length === 0) {
                return;
            }
            if (!rFilter.test(aFiles[0].type)) {
                alert("You must select a valid image file!"); 
                return;
            }
            var objUrl = getObjectURL(aFiles[0]) ;
	 		if (objUrl!=null && objUrl.trim().length!=0) {
	            previewImg.attr('src', objUrl);
	        }
	        //结束上传品牌图片预览
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
	 	//结束图片点击事件
	 	
	 	//开始向数据库更新品牌的信息
       $(".updateData").click(function(){
       		var thisUpdate = $('.updateData');
       		var parentsTag = $(this).parents("div.MyEventBody");
       		var id = parentsTag.find("input.updateName").attr("brandId");
       		var newName = parentsTag.find("input.updateName").val();
       		var description = parentsTag.find("textarea.description").val();
       		if(description.trim().length==0){
       			description = parentsTag.siblings("label.clickLabel").find("h4.description").text();
       		}if(newName.trim().length==0){
       			newName= parentsTag.siblings("label.clickLabel").find("span.brandName").text();
       		}
			if($("#fileImg").attr("myChecked")=="true"){
				$("#fileImg").attr("myChecked","false");
			}
			$.ajaxFileUpload({
       			url:"updateBrandAction?id="+id+"&name="+newName+"&description="+description,
       			secureuri:false,
       			fileElementId:"fileImg",
                dataType:"json",//返回数据格式json
                success:function(result){
                	var message = eval("("+result+")");
                	if(message.message=="success"){
                		parentsTag.find("input.updateName").show(500);
                		parentsTag.siblings("label.clickLabel").find("div.color_bar").children().text(newName);
			        	parentsTag.siblings("label.clickLabel").find("h2").text(newName);
			        	parentsTag.siblings("label.clickLabel").find("h4").text(description);
			        	thisUpdate.parent().siblings("div.companyPreview").find("p.promptBar").slideDown(500);
			        	setTimeout(function(){
			        		thisUpdate.parent().siblings("div.companyPreview").find("p.promptBar").slideUp(500);
			        	},4000)
                	}else{
                		parentsTag.find("input.updateName").show(500);
                		thisUpdate.parent().siblings("div.companyPreview").find("p.promptBar").text("上传文件错误！")
                		thisUpdate.parent().siblings("div.companyPreview").find("p.promptBar").slideDown(500);
			        	setTimeout(function(){
			        		thisUpdate.parent().siblings("div.companyPreview").find("p.promptBar").slideUp(500);
			        	},4000)
                	}
                }
       		}); 
       })
    });
</script>
</body>
</html>