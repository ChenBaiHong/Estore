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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customerServicePlug/myAssets/aui-production.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customerServicePlug/myAssets/layouts/default.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customerServicePlug/myAssets/elements/default.min.css">
    <style type="text/css">
    	.main-container {background: ;min-height: 100%;}

        .md-modal {position: fixed;top: 50%;left: 50%;width: 50%;max-width: 630px;min-width: 320px;height: auto;z-index: 2000;visibility: hidden;
            -webkit-backface-visibility: hidden;-moz-backface-visibility: hidden;backface-visibility: hidden;-webkit-transform: translateX(-50%) translateY(-50%);-moz-transform: translateX(-50%) translateY(-50%);
            -ms-transform: translateX(-50%) translateY(-50%);transform: translateX(-50%) translateY(-50%);}

        .md-overlay {position: fixed;width: 100%;height: 100%;visibility: hidden;top: 0;left: 0;z-index: 1000;opacity: 1;background: rgba(0,0,0,0.3);
            -webkit-transition: all 0.3s;-moz-transition: all 0.3s;transition: all 0.3s;}
            
        .md-content {color: #000000;background: #f8f8f8;position: relative;border-radius: 3px;margin: 0 auto;}
       
      	.md-content div .previewImg{width: 95%;height: 90%;margin: auto;top: 9px;position: relative;
      	background: url(${pageContext.request.contextPath}/customerServicePlug/myAssets/images/bg.jpg);background-size:cover; cursor:pointer;}
      	
        .md-content button{font-size: 18px;border: none;background: #72d0eb;color: white;}
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customerServicePlug/kindeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customerServicePlug/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customerServicePlug/myAssets/js/aui-production.min.js"></script>
    <script>
        var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[name="content"]', {
                resizeType : 0,
                allowPreviewEmoticons : false,
                allowImageUpload :true,
                items : [
                    'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                    'insertunorderedlist', '|', 'emoticons','image']
            });
        });
        setTimeout(function(){
            $(".ke-container").css({"width":"100%","border-right-style":"none"});
            $(".append-right form").find('span[data-name="image"]').children(".ke-icon-image").bind("click",function(){
	          $(".ke-dialog-content").css({"border":"none","border-radius":"5px","box-shadow":"inset 0px 0px 10px rgba(225,225,225,0.07), 0px 0px 15px rgba(0,0,0,0.5)"});
	        });
	        $(".append-right").find(".ke-icon-image").parent().removeAttr("data-name");
	        $(".append-right").find(".ke-icon-image").parent().click(function(){
	        	$(".md-overlay").css({"visibility":"visible"});
	        	$(".md-modal").css({"visibility":"visible"});
	        });
	        /**
	        *
	        *开始显示预览图片
	        */
	        $(".md-close").click(function(){
        		$(".md-overlay").css({"visibility":"hidden"});
	        	$(".md-modal").css({"visibility":"hidden"});
	        	$(".previewImg").css({"background-image":"url(${pageContext.request.contextPath}/customerServicePlug/myAssets/images/bg.jpg)","backgroun-size":"cover"});
	        });
	        $(".previewImg").click(function(){
	        	$("#imageInput").trigger("click");
	        	showPreviewImg();
	        });
	        $("#imageInput").parent().change(function(){
	        	showPreviewImg()
	        });
        },222);
        $(window).resize(function(){
            $(".ke-container").css({"width":"100%"});
        })
        //预览显示图片
        function showPreviewImg(){
        	//开始上传品牌图片预览
            var rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i; 
           	var aFiles = document.getElementById("imageInput").files;
            if (aFiles.length === 0) {
                return;
            }
            if (!rFilter.test(aFiles[0].type)) {
                alert("You must select a valid image file!"); 
                return;
            }
            var objUrl = getObjectURL(aFiles[0]) ;
	 		if (objUrl!=null && objUrl.trim().length!=0) {
	            $(".previewImg").css({"background-image":"url("+objUrl+")","backgroun-size":"cover"});
	        }
	        //结束上传品牌图片预览
        }
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
	 	
	 	window.onbeforeunload=function(){
			//窗框关闭时响应事件
		return window.event.returnValue = '关闭浏览器将退出系统.'; 
		}
    </script>
</head>
<body style="overflow:hidden;">
	<div class="chatBox" style="width: 700px; position: relative; margin: auto;">
       <div class="col-md-12" style="margin:auto;padding:0px;">
              <div class="content-box" style="border-radius:0px;">
                  <h3 class="content-box-header ui-state-default">
                      <div class="glyph-icon icon-separator transparent">
                      </div>
                      <span class="pad0L">咨询客服</span>
                  </h3>
                  <div class="content-box-wrapper">
                      <div class="scrollable-content scrollable-medium">

                          <ul class="chat-box">
                              <li class="float_right" style="width: 90%">
                                  <div class="chat-author">
                                      <img width="36" src="${pageContext.request.contextPath}/customerServicePlug/myAssets/images/right.png" alt="">
                                  </div>
                                  <div class="popover  no-shadow" style="float: right;">
                                      <div class="arrow"></div>
                                      <div class="popover-content">
                                              Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                              <div class="chat-time">
                                                  <i class="glyph-icon icon-time"></i>
                                                 	 两分钟前
                                              </div>
                                      </div>
                                  </div>
                                  <div style="clear: both"></div>
                              </li>
                              <li class="float-left" style="width: 90%">
                                  <div class="chat-author">
                                      <img width="36" src="${pageContext.request.contextPath}/customerServicePlug/myAssets/images/left.png" alt="">
                                  </div>
                                  <div class="popover  no-shadow" style="float: left">
                                      <div class="arrow"></div>
                                      <div class="popover-content">
                                              Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                          <div class="chat-time">
                                                  <i class="glyph-icon icon-time"></i>
                                                  	一分钟前
                                              </div>
                                      </div>
                                  </div>
                                  <div style="clear: both;"></div>
                              </li>
                              <li style="clear: both;"></li>
                          </ul>

                      </div>
                  </div>
                  <div class="button-pane pad10A">
                      <div class="form-row pad0B">
                          <div class="form-input col-lg-12" style="padding-right:6px;padding-left:4px;">
                              <div class="input-append-wrapper input-append-right">
                                  <div class="append-right" style="margin-right:0px;">
                                      <form>
                                          <textarea name="content" style="height:150px;visibility:hidden;"></textarea>
                                      </form>
                                      <a href="javascript:;" class="btn input-append primary-bg tooltip-button" title="Reply" style="width: 60px;margin-top: 10px;margin-right: 10px;border-radius: 3px;">
                                          <!--<i class="glyph-icon icon-mail-reply"></i>-->回复
                                      </a>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  
              </div>
          </div>
       <div style="clear: both;"></div>
      </div>
      
      <div class="md-modal md-effect-1" id="modal-1">
	    <div class="md-content">
	    	<div style="height:180px;">
	    		<div class="previewImg">
	    			
	    		</div>
	    		<input type="file" name="imgLocal" id="imageInput" style="display:none;">
	    	</div>
	    	<div style="display: inline-block;position: relative;width: 88%;margin: 0 6%;">
	            <button class="md-close"  style="float:left;">取消</button>
	            <button class="md-correct" style="float:right;">确认</button>
	        </div>
	    </div>
	</div>
	<div class="md-overlay"></div>
</body>
</html>