
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
   		var profile = $('#profile').val();
   		var parentId = $('#parentId').attr("categoryId");
	    if(name!=null && name.trim().length!=0){//名字绝对不能为空
	    	var url="saveCategoryFormAction";
	    	var args="name="+name+"&parentId="+parentId+"&profile="+profile;
	    	$.post(url , args , function(data){
	    		var message = eval("("+data+")");
	    		if(message.message=="success"){
	    			var $ul=null;
	    			if(parentId.trim().length!=0){
	    				var $span = $('span[categoryId="'+parentId+'"]');
		    			$ul=$span.siblings("ul");
	    			}else{
	    				var $span = $('div.tree');
		    			$ul=$span.children("ul");
	    			}
	    			var liTag = $("<li></li>");
   					var spanTag = $('<span categoryId='+message.categoryId+' class="category" isExist="false">'+name+'</span>')
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
   function cycleTreeFunction($this){
   		var categoryId = $this.attr("categoryId");
   		//在某某父节点下添加孩子节点，孩子节点持有父节点的id信息
   		$('#parentId').val($this.text());
	   	$('#parentId').attr("categoryId",categoryId);
	   	//更新该类别需要的该种类的Id
	   	$('#updateHref').attr("href","updateCategoryAction?cid="+categoryId);
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
	   					var spanTag = $('<span categoryId='+subcategorys[i].cid+' class="category" isExist="false">'+subcategorys[i].name+'</span>')
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
	                                <input type="text" class="form-control" name="name" id="update_name" placeholder="分类 别名" autocomplete="off"/>
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
	                    <hr/>
	                </div>
	            </section>
	        </div>
	    </div>
<div class="tree well">
	<ul>
		<s:iterator var="category" value="#request.categoryList">
			<li> 
				<span categoryId="${category.cid}" class="category" isExist="false">${category.name }</span>
			</li>
		</s:iterator>
	</ul>
</div>

</body>

</html>