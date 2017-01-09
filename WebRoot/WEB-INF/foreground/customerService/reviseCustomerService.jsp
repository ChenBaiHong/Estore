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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customerServicePlug/myAssets/aui-production.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customerServicePlug/myAssets/layouts/default.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customerServicePlug/myAssets/elements/default.min.css">
    <script src="${pageContext.request.contextPath}/customerServicePlug/kindeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customerServicePlug/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customerServicePlug/myAssets/js/aui-production.min.js"></script>
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
            $(".ke-container").css({"width":"100%","border-right-style":"none"});
        },200);
        $(window).resize(function(){
            $(".ke-container").css({"width":"100%"});
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
    <div class="chatBox" style="width: 700px; position: relative; margin: auto;">
       <div class="col-md-12" style="margin:auto;padding:0px;">
              <div class="content-box">
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
                                      <img width="36" src="myAssets/images/gravatar.jpg" alt="">
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
                                      <img width="36" src="myAssets/images/gravatar.jpg" alt="">
                                  </div>
                                  <div class="popover no-shadow" style="float: left;">
                                      <div class="arrow"></div>
                                      <div class="popover-content">
                                              <h3>
                                                  <a href="#" title="Horia Simon">Horia Simon</a>
                                                  <div class="float-right">
                                                      <a href="#" class="btn glyph-icon icon-inbox font-gray tooltip-button" data-placement="bottom" title="This chat line was received in the mail."></a>
                                                  </div>
                                              </h3>
                                              This comment line has a title (author name) and a right button panel.
                                              <div class="chat-time">
                                                  <i class="glyph-icon icon-time"></i>
                                                  两分钟前
                                              </div>
                                      </div>
                                  </div>
                                  <div style="clear: both;"></div>
                              </li>
                              <li class="float_right" style="width: 90%">
                                  <div class="chat-author">
                                      <img width="36" src="myAssets/images/gravatar.jpg" alt="">
                                  </div>
                                  <div class="popover  no-shadow" style="float: right;">
                                  <div class="arrow"></div>
                                      <div class="popover-content">
                                          This comment line has a bottom button panel, box shadow and title.
                                          <div class="chat-time">
                                              <i class="glyph-icon icon-time"></i>
                                              三分钟前
                                          </div>
                                      </div>
                                  </div>
                                  <div style="clear: both"></div>
                              </li>
                              <li class="float_right" style="width: 90%">
                                  <div class="chat-author">
                                      <img width="36" src="myAssets/images/gravatar.jpg" alt="">
                                  </div>
                                  <div class="popover  no-shadow" style="float: right;">
                                  <div class="arrow"></div>
                                      <div class="popover-content">
                                              Lorem ipsum dolor sit amet,
                                          <div class="chat-time">
                                                  <i class="glyph-icon icon-time"></i>
                                                  一分钟前
                                              </div>
                                      </div>
                                  </div>
                                  <div style="clear: both"></div>
                              </li>
                              <li class="float-left" style="width: 90%">
                                  <div class="chat-author">
                                      <img width="36" src="myAssets/images/gravatar.jpg" alt="">
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
</div>
<!-- <button class="md-trigger" data-modal="modal-16">Blur</button> -->
<div class="md-overlay"></div><!-- the overlay element -->
<script>
    var polyfilter_scriptpath = '/js/';
</script>
</body>
</html>
    <script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/js/index.js"></script>
</body>
</html>