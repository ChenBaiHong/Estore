var loadImageFile = (function () { 
	//判断窗口加载的是否是图片文件
	if (window.FileReader) { //如果是图片文件
		//进行文件图片格式过滤
		var oPreviewImg = null, //预先图片文件
		oFReader = new window.FileReader(), //创建窗口文件读取的类
		//这是一个正则表达式过滤文件
		rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i; 
	//文件读取加载
	oFReader.onload = function (oFREvent) { //文件读取事件
			if (!oPreviewImg) { //预先读取的文件不能为空
				var newPreview = document.getElementById("imagePreview"); //在id为（"imagePreview"）添加图片标签对象
				oPreviewImg = new Image(); 
				oPreviewImg.style.width = (newPreview.offsetWidth).toString() + "px"; 
				oPreviewImg.style.height = (newPreview.offsetHeight).toString() + "px"; 
				newPreview.appendChild(oPreviewImg); //结尾添加图片
			} 
		oPreviewImg.src = oFREvent.target.result; //img的src结果内容就是oFREvent监听事件得到的文件地址
	}; 

	return function () { //检验函数，判断input的file上传是否是能匹配正则中，指定文件类型
		var aFiles = document.getElementById("imageInput").files; 
			if (aFiles.length === 0) { 
				return; 
				} 
			if (!rFilter.test(aFiles[0].type)) { 
				alert("You must select a valid image file!"); return; 
				} 
			oFReader.readAsDataURL(aFiles[0]); 
		} 
	} 
	if (navigator.appName === "Microsoft Internet Explorer") { 
		return function () { 
		alert(document.getElementById("imageInput").value); 
		//imageInput上传文件的值，就是我新创建文件的src;
		document.getElementById("imagePreview").filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById("imageInput").value; 
		} 
	} 
})(); 