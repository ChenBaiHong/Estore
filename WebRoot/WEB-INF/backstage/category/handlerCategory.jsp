
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>jquery</title>

<!--图标样式--><link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap.min.css" rel="stylesheet"/>
<!--主要样式-->
<style type="text/css">
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
    background:#eee;
    border:1px solid #94a0b4;
    color:#000
}
.addCategoryImg h4{
	display: inline-block;
    position: relative;
    margin: 9px;
    margin-left:0px;
    padding: 5px;font-family:宋体;
    box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.5);  
}
.addCategoryImg #prewImg{
	border:0.02px solid rgba(0,0,0,0.2);
	box-shadow: inset 0px 0px 10px rgba(255, 255, 255, 0.5), 0px 0px 15px rgba(75, 75, 75, 0.5);
	width:150px; height:150px; 
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/AdminBg/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
    $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
    $('.tree li.parent_li > span').on('click', function (e) {
        treeConstructFunction($(this));
    });
   $('.tree li > span').click(function(){
   		var $this=$(this);
   		cycleTreeFunction($this);
   });
   //清空不绑定父节点
   $("#clearly").click(function(){
   	$("#parentId").attr("categoryId","");
   	$("#parentId").val("");
   });
   //点击要新添加的节点保存数据库
   $("button.add_btn").click(function(){
   		var name = $('#name').val();
   		var layer = $('#layer').val();
   		var profile = $('#profile').val();
   		var parentId = $('#parentId').attr("categoryId");
	    if(name!=null && name.trim().length!=0 && name!=$('#parentId').val() && layer>0 && !isNaN(layer)){//名字绝对不能为空,并且和父类的名字不能相等
	    	var $ul=null;
   			if(parentId.trim().length!=0){
   				var $span = $('span[categoryId="'+parentId+'"]');
   				var $spanList =$span.siblings("ul").find("span.category");
	      		for(var i=0 ; i<$spanList.length;i++){
	      			if($($spanList[i]).text().trim()==name){
	      				return ;
	      			}
	      		}
    			$ul=$span.siblings("ul");
   			}else{
   				var $span = $('div.tree');
    			$ul=$span.children("ul");
   			}
   			if(parentId.trim().length==0){
   				layer=0;
   			}
	    	var url="saveCategoryFormAction";
	    	var args="name="+name+"&parentId="+parentId+"&profile="+profile+"&layer="+layer;
	    	$.post(url , args , function(data){
	    		var message = eval("("+data+")");
	    		if(message.message=="success"){
	    			var liTag = $("<li></li>");
   					var spanTag = $('<span categoryId='+message.categoryId+' class="category" profile="'+profile+'" layer="'+layer+'" isExist="false">'+name+'</span>')
   					spanTag.bind("click",function(){
				   		var $this=$(this);
				   		cycleTreeFunction($this);
				   });
   					liTag.append(spanTag);
   					$ul.append(liTag);
	    		}
	    	});
	    }
    });
     //点击要更新的节点保存数据库
      $("button.update_btn").click(function(){
      	var updateName = $('#update_name').val();
      	var updateProfile = $('#update_profile').val();
      	var updateLayer = $('#update_layer').val();
      	if(updateName.trim().length!=0 && updateLayer>0 && !isNaN(updateLayer)){
      		var categoryId = $('#update_name').attr("categoryId");
      		var $span = $('span[categoryId="'+categoryId+'"]');
      		var url="updateCategoryFormAction";
	    	var args="name="+updateName+"&cid="+categoryId+"&profile="+updateProfile+"&layer="+updateLayer;
	    	$.post(url , args , function(data){
	    		var message = eval("("+data+")");
	    		if(message.message=="success"){
	    			$span.text(updateName);
	    			$span.attr("layer",updateLayer);
	    			$span.attr("profile",updateProfile);
	    			$("#parentId").val(updateName);
	    		}
	    	});
      	}
      })
      //点击删除事件
       $("button.delete_btn").click(function(){
       		var updateName = $('#update_name').val();
      		if(updateName.trim().length!=0){
    			var categoryId = $('#update_name').attr("categoryId");
    			var $span = $('span[categoryId="'+categoryId+'"]');
    			var url="deleteCategoryFormAction";
	    		var args="cid="+categoryId;
	    		$.post(url , args , function(data){
	    			var message = eval("("+data+")");
		    		if(message.message=="success"){
		    			$span.parent().remove();
		    			$("#parentId").val("");
		    		}
	    		});
    		}
       });
   function cycleTreeFunction($this){
   		var categoryId = $this.attr("categoryId");
   		//显示有的分类图片参数
   		$("#fileImg").attr("categoryId",categoryId);
   		$("#prewImg").css({'background': 'url(showCategoryImgAction?cid='+categoryId+')','background-size':'cover'});
   		var layer = parseInt($this.attr("layer"));
   		//在某某父节点下添加孩子节点，孩子节点持有父节点的id信息
   		$('#parentId').val($this.text());
	   	$('#parentId').attr("categoryId",categoryId);
	   	//更新该类别
	   	$('#update_name').val($this.text());
	   	//在这里如果layer等于0就说明是根节点那么就不允许更该阶层阶层，
	   	if(layer==0){
	   		$('#update_layer').attr("disabled","disabled");
	   	}else{
	   		$('#update_layer').removeAttr("disabled");
	   	}
	   	$('#update_layer').val(layer);
	   	$('#update_name').attr("categoryId",categoryId);
	   	$('#update_profile').val($this.attr("profile"));
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
	   					var spanTag = $('<span categoryId='+subcategorys[i].cid+' profile="'+subcategorys[i].profile+'" layer="'+subcategorys[i].layer+'" class="category" isExist="false">'+subcategorys[i].name+'</span>')
	   					//绑定事件
	   					spanTag.bind("click",function(){
					   		var $this=$(this);
					   		cycleTreeFunction($this);
					   });
	   					liTag.append(spanTag);
	   					ulTag.append(liTag);
	   				}
	   				$this.after(ulTag);
	   				$this.attr("isExist","true");//数据库遍历出这个父节点的子类，下次在被点击就不用显示
	   				$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
				    $('.tree li.parent_li > span').on('click', function (e) {
				        treeConstructFunction($(this));//给创建的后期绑定事件
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
   
   //开始对分类进行更新删除的操作
   
});
</script>
</head>
<body>
<div class="container" style="margin-top:81px;">
	        <div class="row">
	            <section>
	            
	                <div class="col-sm-8 col-sm-offset-2">
	                	<div class="page-header">
	                        <h2>操作分类</h2>
	                    </div>
	                    <form id="additionForm" method="post" class="form-horizontal" action="javascript:;">
	                        <div class="form-group">
	                            <label class="col-sm-3 control-label">分类 别名</label>
	                            <div class="col-sm-4">
	                                <input type="text" class="form-control" name="name" id="name" placeholder="分类 别名" autocomplete="off"/>
	                            </div>
	                        </div>
							<div class="form-group">
	                            <label class="col-sm-3 control-label">类别阶层</label>
	                            <div class="col-sm-4">
	                                <input type="text" class="form-control" name="layer" id="layer" placeholder="必填正整数" autocomplete="off"/>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-3 control-label">附带 参数</label>
	                            <div class="col-sm-4">
	                                <input type="text" class="form-control" name="profile" id="profile" placeholder="附带 参数" autocomplete="off"/>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-3 control-label">选择 父类</label>
	                            <div class="col-sm-4">
	                                <input type="text" class="form-control" categoryId="" name="parentId" id="parentId" disabled="disabled"/>
	                                <a href="javascript:;" id="clearly">清空</a> 
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="col-sm-9 col-sm-offset-3">
	                                <button type="submit" class="btn btn-primary add_btn">保存</button>
	                            </div>
	                        </div>
	                    </form>
	                    <hr/>
	                    <form id="updateForm" method="post" class="form-horizontal" action="javascript:;">
	                        <div class="form-group">
	                            <label class="col-sm-3 control-label">分类 别名</label>
	                            <div class="col-sm-4">
	                                <input type="text" class="form-control" name="name" categoryId="" id="update_name" placeholder="分类 别名" autocomplete="off"/>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-3 control-label">类别阶层</label>
	                            <div class="col-sm-4">
	                                <input type="text" class="form-control" name="layer" id="update_layer" placeholder="必填正整数" autocomplete="off"/>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-3 control-label">附带 参数</label>
	                            <div class="col-sm-4">
	                                <input type="text" class="form-control" name="profile" id="update_profile" placeholder="附带 参数" autocomplete="off"/>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="col-sm-9 col-sm-offset-3">
	                                <button type="submit" class="btn btn-primary update_btn">更新</button>
	                                <button type="submit" class="btn btn-primary delete_btn" style="background:;">删除</button>
	                            </div>
	                        </div>
	                    </form>
	                    <div style="width: 250px;position: absolute;bottom: 40px;left: 482px;" class="addCategoryImg">
	                    	<h4>分类类图<span></span></h4>
	                    	<div style="" id="prewImg"></div>
	                    	<div>
	                    		<input type="file" name="fileImg" id="fileImg" categoryId="" style="display:none;"/>
	                    	</div>
	                    	<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/ajaxfileupload.js"></script>
	                    	<script type="text/javascript">
	                    	$(document).ready(function(){
				                $("#prewImg").click(function() {
				                   $("#fileImg").trigger("click");  
				                });
				                $("#fileImg").parent().change(function(){
				                	var aFiles = document.getElementById("fileImg").files;
				                	var objUrl = getObjectURL(aFiles[0]) ;
				                	var categoryId = $("#fileImg").attr("categoryId");
				                	if(categoryId!=null && categoryId.trim().length!=0){
				                		$.ajaxFileUpload({
						       			url:"updateCategoryImgAction?cid="+categoryId,
						       			secureuri:false,
						       			fileElementId:"fileImg",
						                dataType:"json",//返回数据格式json
						                success:function(result){
						                var message= eval("("+result+")")
						                if(message.message=="success"){
						                	if (objUrl!=null && objUrl.trim().length!=0) {
									            $("#prewImg").css({'background': 'url('+objUrl+')','background-size':'cover'}); 
									        }
						                 }	
						                }
					                 });
				                	}
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
				            });
	                    	</script>
	                    </div>
	                    <hr/>
	                </div>
	            </section>
	        </div>
	    </div>
<div class="tree well">
	<ul>
		<s:iterator var="category" value="#request.categoryList">
			<li> 
				<span categoryId="${category.cid}" class="category" profile="${category.profile}" layer="${category.layer}" isExist="false">${category.name }</span>
			</li>
		</s:iterator>
	</ul>
</div>

</body>

</html>