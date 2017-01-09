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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/css/style.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/component.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backgroundPlug/css/normalize.css">

    <link href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/style.css" title="style" rel="stylesheet" type="text/css" />
    <link id="clink" href="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/css/style-blue.css" title="style" rel="stylesheet" type="text/css" media="screen" />

    <style type="text/css">
        .productContent{
            position: fixed;z-index: 2;top: 0px;width: 100%;height: 100%;overflow:auto;
        }

        .md-trigger{padding: 7px 15px;background-color: #5CB48E;text-align: center;border-radius: 5px;overflow: hidden;min-width: 80px;border: none;
            color: #FFF;box-shadow: 1px 1px 1px rgba(75, 75, 75, 0.3);
        }
    </style>
</head>
<body id="containsJs">
<html lang="en" class="no-js">
<body >
<div class="md-modal md-effect-16" id="modal-16">
    <div class="md-content" style="background: rgba(0,0,0,0.3)">
        <h3 style="background: rgba(0,0,0,0.2);">预览产品</h3>
        <div>
            <div>
                <p>产品图演示</p>
                <div class="panel-body">
                    <div class="article-img">
                        <div class="flexslider mainslide" style="background-color:transparent;">
                            <ul class="slides" style="padding:0px; padding-bottom:15px;">
                                <s:iterator var="brand" value="#request.brandList" status="status">
                                    <s:if test="#status.count<=6">
                                        <li >
                                            <img class="previewImg"  src="showBrandImgAction?id=${brand.id}">
                                        </li>
                                    </s:if>
                                </s:iterator>
                            </ul>
                        </div>
                        <div class="introduce" style="position:absolute;bottom:69px;width:100%; background:rgba(0,0,0,0.6);z-index:2;">
                            <p><span class="brand" style="margin:10px ; font-weight:bolder;font-size:18px;"></span>
                                <span class="name" style="font-weight:bolder;font-size:18px;"></span>
                                <span class="salePrice" style="margin:10px ; font-weight:bolder;font-size:18px;color:red;"></span>
                                <span class="saleQuantity" style="font-weight:bolder;font-size:18px;"></span><br>
                                <span class="totalQuantity" style="margin:10px ; font-weight:bolder;font-size:18px;"></span>
                            </p>
                            <p id="targetShowProduct"><a class="exp-button" href="productProfileAction">Read More &#8594;</a></p>
                        </div>
                    </div>
                    <div>
                        <input id="fileList" name="fileList" multiple type="file" style="display:none;"/>
                    </div>
                </div>
            </div>
            <button class="md-close">Close me!</button>
        </div>
    </div>
</div>
<div id="large-header" class="large-header"
     style="position: fixed;background:transparent;">
    <canvas id="demo-canvas"></canvas>
    <h1 class="main-title"><span>BaiHong</span></h1>
</div>
<div class="container demo-1" style="width:100%;padding:0px;margin:0px;">
    <div class="content">
        <div class="productContent">
            <div id="bodypat" style="background-attachment:fixed;padding-bottom:66px;">
        	   <div id="colorchanger" style="top:150px; opacity:0.9;">
                    <s:iterator var="brand" value="#request.brandList" status="status">
                        <a class="brand" isChecked="false" brandId="${brand.id}"><span class='${status.count%2==0?"blue":
	    				  (status.count%3==0?"red":
	    				  (status.count%4==0?"green":
	    				  (status.count%5==0?"magenta":
	    				  (status.count%6==0?"purple":
	    				  (status.count%7==0?"teal":
	    				  (status.count%8==0?"lime":
	    				  (status.count%9==0?"pink":"mango")))))))}
    				     '>${brand.name}</span></a>
                    </s:iterator>
                    <a class="brand" isChecked="true" brandId="null"><span class="teal">恢复默认</span></a>
                    <h4 style="width:243px;"><span>产品品牌</span><span class="brandName" style="color:#0CF5F7;font-size:18px;"></span></h4>
                </div>
                <section id="container" style="max-width: 1300px;top: 55px;position: relative;">
                    <header class="clearfix" style="background:rgba(0,0,0,0.6);margin:0 0 0 15;">
                        <a id="headerlink" href="#" title="home"><img id="logo"
                               src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/images/logo.png" alt="logo" />
                            <span id="sitename">BaiHong</span></a>
                        <nav>
                            <ul id="nav" class="clearfix">
                                <li class="current"><a href="javascript:;" title="Home"><span>首页</span></a></li>

                                <li>
                                    <a href="#" title="Portfolio"><span>每页记录</span></a>
                                    <ul style="opacity:0.8;">
                                        <li ><a href="javascript:;" class="showRecord" isChecked="true"><span>12 </span>条记录</a></li>
                                        <li ><a href="javascript:;" class="showRecord" isChecked="false"><span>24 </span>条记录</a></li>
                                        <li ><a href="javascript:;" class="showRecord" isChecked="false"><span>36 </span>条记录</a></li>
                                        <li ><a href="javascript:;" class="showRecord" isChecked="false"><span>48 </span>条记录</a></li>
                                        <li ><a href="javascript:;" class="showRecord" isChecked="false"><span>60 </span>条记录</a></li>
                                    </ul>
                                </li>

                                <li><a href="#" title="Blog"><span>页面排序</span></a>
                                    <ul style="opacity:0.8;">
                                        <li><a href="javascript:;" class="sortCondition" isChecked="false" field="salePrice"><span >上架价格</span></a></li>
                                        <li><a href="javascript:;" class="sortCondition" isChecked="false" field="putawayDate"><span >上架日期</span></a></li>
                                        <li><a href="javascript:;" class="sortCondition" isChecked="false" field="inletPrice"><span >进口价格</span></a></li>
                                        <li><a href="javascript:;" class="sortCondition" isChecked="false" field="inletDate"><span >进口日期</span></a></li>
                                        <li><a href="javascript:;" class="sortCondition" isChecked="false" field="totalSaleNum"><span >销售数量</span></a></li>
                                        <li><a href="javascript:;" class="sortCondition" isChecked="false" field="quantity"><span >总数量</span></a></li>
                                        <li><a href="javascript:;" class="sortCondition" isChecked="true" field="null"><span >恢复默认</span></a></li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="#" title="Features"><span>过滤</span></a>
                                    <ul style="opacity:0.8;">
                                        <li><a href="javascript:;"><span>公司</span></a></li>
                                        <li><a href="javascript:;"><span>系列</span></a></li>
                                        <li><a href="javascript:;"><span>价格</span></a></li>
                                        <li><a href="javascript:;"><span class="recoveryDefault">默认</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </header>

                    <section class="mainpage" style="margin:0 0 0 15;padding-right:0px;padding-left:0px;">
                        <!-- BEGIN TOGGLE CONTENT -->
                        <div class="toggle-button"><span class="toggle-indicator">+</span></div>
                        <div class="toggle-content close">
                            <div class="pagination clearfix" style="position:relative;">
						    	<span class="pages" style="font-weight:bolder ; color:white;">
						    		<span class="currentPage">${request.pageBean.currentpage}</span> / <span class="totalPage">${request.pageBean.totalPage }</span>
						    	</span>
                                <div class="recordPage">
                                    <s:iterator var="numBar" value="#request.pageBean.pagination" status="status">
                                        <a href="javascript:;" class='${status.count==1?"current":"page"}'>${numBar}</a>
                                    </s:iterator>
                                </div>
                                <a href="#" class="nextpagelink">&raquo;</a>
                                <form action="javascript:;"/>
                                <input   type="text" name="gotoNum" id="gotoNum" placeholder="goto" class="placeholder" autocomplete="off"
                                         style="background:#404040;height:30px; width:70px;margin-left:100px; padding-left:5px; text-align:center; color:white;font-weight:bolder;"/>
                                <input  type="submit" id="goto"  value="go"
                                        style="background:#404040;width:50px;height:30px;font-weight:bolder; color:white;"/>
                                </form>
                            </div>
                            <div id="search" class="widget" style="display:inline-block;position:relative;">
                                <form action="javascript:;" style="display:inline-block;position:relative;" />
                                <input id="search-field" type="search" name="sitesearch" class="placeholder" placeholder="Search" autocomplete="off"
                                       style="bottom:9px;display:inline-block;position:relative;"/>
                                <input type="submit" id="search-submit"  value="" style="position:relative;" />
                                </form>
                            </div>
                        </div>
                    </section>

                    <section id="content-mos" class="centered clearfix" style="">
                        <s:iterator var="product" value="#request.pageBean.listProduct" status="status">
                            <!-- Tile 1 -->
                            <s:if test="#status.count%2!=0">
                                <div class="productTypeOne" productId="${product.id}">
                                    <a href="#article-1" class="lightbox" rel="section">
                                        <div class="tile large live" data-stops="0,25%,50%,75%,100%" data-speed="3000" data-delay="0" data-direction="horizontal" data-stack="true">
                                            <div class="live-front">
                                                <ul>
                                                    <s:iterator var="iconName" value="#product.imgUrlList" status="status">
                                                        <s:if test="#status.count%2==0">
                                                            <li style="width:310px; height:310px;"><img src="showProductImgAction?id=${product.id}&iconurl=${iconName}" style="height:310px;" alt=""></li>
                                                        </s:if>
                                                    </s:iterator>
                                                </ul>
                                            </div>
                                            <div class="live-back">
                                                <ul>
                                                    <s:iterator var="iconName" value="#product.imgUrlList" status="status">
                                                        <s:if test="#status.count%2!=0">
                                                            <li style="width:310px; height:310px;"><img src="showProductImgAction?id=${product.id}&iconurl=${iconName}" style="height:310px;" alt=""></li>
                                                        </s:if>
                                                    </s:iterator>
                                                </ul>
                                            </div>
                                            <span class="tile-date redtxt"></span>
                                            <span class="tile-cat red">${product.name}</span>
                                        </div>
                                    </a>
                                </div>
                            </s:if>
                            <!-- Tile 2 -->
                            <s:else>
                                <div class="productTypeTwo" productId="${product.id}">
                                    <a href="#article-2" class="lightbox" rel="section">
                                        <div class="tile medium live" data-stops="0,75%,100%" data-speed="750" data-delay="1500">
                                            <div class="live-front">
                                                <ul>
                                                    <s:iterator var="iconName" value="#product.imgUrlList" status="status">
                                                        <s:if test="#status.count%2==0">
                                                            <li style="width:310px; height:150px;"><img src="showProductImgAction?id=${product.id}&iconurl=${iconName}" style="width:310px;" alt=""></li>
                                                        </s:if>
                                                    </s:iterator>
                                                </ul>
                                            </div>
                                            <div class="live-back">
                                                <ul>
                                                    <s:iterator var="iconName" value="#product.imgUrlList" status="status">
                                                        <s:if test="#status.count%2!=0">
                                                            <li style="width:310px; height:150px;">
                                                                <img src="showProductImgAction?id=${product.id}&iconurl=${iconName}" style="width:310px;" alt="">
                                                            </li>
                                                        </s:if>
                                                    </s:iterator>
                                                </ul>
                                            </div>
                                            <span class="tile-date limetxt"></span>
                                            <span class="tile-cat lime">${product.name}</span>
                                        </div>
                                    </a>
                                </div>
                            </s:else>
                            <!-- Tile 1 -->
                        </s:iterator>
                        <!-- END TILE CONTENT -->
                    </section>
                    <!-- 按钮事件触发显示全屏的弹出框 -->
                    <button class="md-trigger" data-modal="modal-16" style="display:none;"></button>
                    <footer class="clearfix">
                        <small>&copy; BaiHong &copy; 2016.陈柏宏制作
                            <a target="_blank" href="https://github.com/ChenBaiHong"></a>
                            - <a href="https://github.com/ChenBaiHong" target="_blank" title="">柏宏梦想创作</a></small>
                    </footer>
                    <!-- END FOOTER -->

                </section><!-- end #container -->
            </div>
        </div>
    </div>
</div>

<div class="md-overlay" style="background: rgba(0,6,2,0.7);z-index:2;"></div><!-- the overlay element -->

<script>
    var polyfilter_scriptpath = '/js/';
</script>
</body>
</html>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/rAF.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/demo-1.js"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/backgroundPlug/js/adminLogon/jquery-2.1.0.min.js"></script>

<%-- <script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/scripts/jquery.min.js" type="text/javascript"></script> --%>
<script id="jquery-masonry" src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/scripts/jquery.masonry.min.js" type="text/javascript"></script>
<script id="MetroJs-lt" src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/scripts/MetroJs.lt.js" type="text/javascript"></script>
<script id="jquery-flexslider" src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/scripts/jquery.flexslider.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/scripts/hoverintent.js" type="text/javascript" charset="utf-8"></script>
<script id="MainScript" src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg2/scripts/javascript.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/backgroundPlug/ergodicBg/ajaxfileupload.js"></script>
<script type="text/javascript">
    //开始交换显示查询分页的结果信息包括搜索
    $(".toggle-button").click(function(){
        $(this).siblings("div.toggle-content").slideToggle("slow");
        $(this).children('.toggle-indicator').text($(this).children('.toggle-indicator').text() == '+' ? '-' : '+');
    });
    $("#gotoNum").click(function(){
        $(this).css("background","#19a2de")
    })
    $("#gotoNum").focusout(function(){
        $(this).css("background","#404040")
    })
    $("#goto").mouseover(function(){
        $(this).css("background","#19a2de")
    })
    $("#goto").mouseout(function(){
        $(this).css("background","#404040")
    })
    //结束交换显示查询分页的结果信息包括搜索
    //开始显示产品预览图片信息
    $("div.productTypeTwo").click(function(){
        $("button.md-trigger").trigger("click");
        var productId = $(this).attr("productId");
        $('#targetShowProduct').find('a.exp-button').attr("href","productProfileAction?id="+productId);
        var url="showProductImgByAjaxAction";
        var args="id="+productId+"&time"+new Date();
        showProductImg(url , args , productId)
    });
    $("div.productTypeOne").click(function(){
        $("button.md-trigger").trigger("click");
        var productId = $(this).attr("productId");
        $('#targetShowProduct').find('a.exp-button').attr("href","productProfileAction?id="+productId);
        var url="showProductImgByAjaxAction";
        var args="id="+productId+"&time"+new Date();
        showProductImg(url , args , productId)
    });
    function showProductImg(url , args , productId){
        //alert(url+","+args+","+productId);
        $.post(url , args , function(data){
            var product=eval("("+data+")");
            var imgUrlList=product.imgUrlList;
			//alert(data)
            var ul_slides=$('<ul class="slides" style="padding:0px; padding-bottom:15px;z-index:-1;"></ul>');
            for(var i = 0 ; i<imgUrlList.length;i++){
                var liTag = $('<li>'
                        +'<img class="previewImg"  src="showProductImgAction?id='+product.id+'&iconurl='+imgUrlList[i]+'"/>'
                        +'</li>');
                ul_slides.append(liTag);
            }
            $('div.flexslider').remove();//为什么这里要移除，因为div_flexslider.flexslider();只被加载一次
            var div_flexslider = $('<div class="flexslider mainslide" style="background-color:transparent;z-index:1;"></div>')
            div_flexslider.append(ul_slides);
            $("div.introduce").before(div_flexslider);
            //重新布局
            div_flexslider.flexslider({
                slideshowSpeed: 3000, // 自动播放速度毫秒
            });
            $(".flex-direction-nav li a").hide();
            //alert(product.brand.name);
            $("div.introduce").find("span.brand").text("品牌: "+product.brand.name);
            $("div.introduce").find("span.name").text("产品名称: "+product.name);
            $("div.introduce").find("span.salePrice").text("￥"+product.salePrice);
            $("div.introduce").find("span.saleQuantity").text("销售数量: "+product.totalSaleNum);
            $("div.introduce").find("span.totalQuantity").text("总数量 :"+product.quantity);
        });
    }
    //结束产品图预览信息
    //开始每页多少条记录查询， 包括过滤条件
    var sortCondition="";//排序条件
    var brandType="";//产品的品牌
    var pageSize=12;//页面大小,默认是12条记录
    var currentPage=parseInt($("span.pages").find("span.currentPage").text());//默认当前页
    var totalPage=parseInt($("span.pages").find("span.totalPage").text());
    //开始开始点击分页
    $('div.recordPage a').bind("click",function(){
        var $this=$(this);
        pagingNumClickFn($this)
    });
    //开始goto多少页
    $("#goto").click(function(){
        var gotoNum = $("#gotoNum").val();
        if(isNaN(gotoNum)){
            return ;
        }if(gotoNum<=0){
            gotoNum=1;
        }if(gotoNum>=totalPage){
            gotoNum=totalPage;
        }
        //currentPage=gotoNum;
        var args="pageSize="+pageSize+"&sortCondition="+sortCondition+"&brandType="+brandType+"&currentPage="+gotoNum+"&time="+new Date();
        postAjaxPagingFn(args);
    })
    //结束goto多少页
    //开始点击下一页
    $("a.nextpagelink").click(function(){
        if(currentPage!=totalPage){
            var args="pageSize="+pageSize+"&sortCondition="+sortCondition+"&brandType="+brandType+"&currentPage="+(currentPage+1)+"&time="+new Date();
            postAjaxPagingFn(args);
        }
    });
    //结束点击下一页
    //结束点击分页

    //开始产品检索查询
    $("#search-field").keyup(function(){
        var obscureSearch = $(this).val();
        if(obscureSearch!=null && obscureSearch.trim().length!=0){
            var args="pageSize="+pageSize+"&sortCondition="+sortCondition+"&obscureSearch="+obscureSearch+"&time="+new Date();
            postAjaxPagingFn(args);
        }else{
            var args="pageSize="+pageSize+"&currentPage="+currentPage+"&time="+new Date();
            postAjaxPagingFn(args);
        }
    })
    //结束产品检索查询
    //开始产品品牌过滤查询
    $("#colorchanger a.brand").click(function(){
        if($(this).attr("isChecked")=="false"){
            $("#colorchanger a.brand").attr("isChecked","false");
            $(this).attr("isChecked","true");
            brandType=$(this).attr("brandId");
            if(brandType=="null"){
                $("a.sortCondition").css("color","#ECECEC");
                $("#colorchanger h4").find("span.brandName").text("");
                brandType="";
                var args="pageSize="+pageSize+"&currentPage="+currentPage+"&time="+new Date();
                postAjaxPagingFn(args);
            }else{
                $("#colorchanger h4").find("span.brandName").text(" ("+$(this).find("span").text()+")");
                var args="pageSize="+pageSize+"&sortCondition="+sortCondition+"&brandType="+brandType+"&currentPage="+currentPage+"&time="+new Date();
                postAjaxPagingFn(args);
            }
        }
    });
    //结束产品品牌过滤查询
    //开始排序条件查询
    $("a.sortCondition").click(function(){
        if($(this).attr("isChecked")=="false"){
            sortCondition=$(this).attr("field");
            if(sortCondition=="null"){
                $("a.sortCondition").css("color","#ECECEC");
                sortCondition="";
                var args="pageSize="+pageSize+"&sortCondition="+sortCondition+"&brandType="+brandType+"&currentPage="+currentPage+"&time="+new Date();
                postAjaxPagingFn(args);
            }else{
                $("a.sortCondition").attr("isChecked","false");
                $("a.sortCondition").css("color","#ECECEC");
                $(this).attr("isChecked","true");
                $(this).css("color","#10F1C6");
                var args="pageSize="+pageSize+"&sortCondition="+sortCondition+"&brandType="+brandType+"&currentPage="+currentPage+"&time="+new Date();
                postAjaxPagingFn(args);
            }
        }
    });
    //结束排序条件查询
    //开始展现每页多少条记录的查询
    $("a.showRecord").click(function(){
        pageSize =$(this).find("span").text();
        if($(this).attr("isChecked")=="false"){
            $("a.showRecord").attr("isChecked","false");
            $("a.showRecord").css("color","#ECECEC");
            $(this).attr("isChecked","true");
            $(this).css("color","#10F1C6");
            var args="pageSize="+pageSize+"&sortCondition="+sortCondition+"&brandType="+brandType+"&currentPage="+currentPage+"&time="+new Date();
            postAjaxPagingFn(args);
        }
    })
    function postAjaxPagingFn(args){
        //alert(pageSize+","+sortCondition+","+brandType);
        var productTypeOnes = $("div.productTypeOne");
        var productTypeTwos = $("div.productTypeTwo");
        var  evenLen=productTypeOnes.length;
        var  oddLen=productTypeTwos.length;
        var url="showPageSizeAction";
        $.post(url , args , function(data){
            //alert(data);
            var pageBean = eval("("+data+")");
            var listProduct = pageBean.listProduct;
            var oddArray = new Array();
            var evenArray = new Array();
            if((evenLen+oddLen)<listProduct.length){
                for(var i = 0,k=0 ,q=0; i<listProduct.length;i++){
                    var product = listProduct[i];
                    if(i<(evenLen+oddLen)){
                        if((i+1)%2!=0){
                            var productTypeOne = productTypeOnes[k++];
                            showSqlQueryProduct(product , $(productTypeOne));
                            $(productTypeOne).show(360);
                        }else{
                            var productTypeTwo = productTypeTwos[q++];
                            showSqlQueryProduct(product , $(productTypeTwo));
                            $(productTypeTwo).show(360);
                        }
                    }else{
                        if((i+1)%2!=0){
                            var productTypeOne = $(productTypeOnes[0]).clone(true);//克隆最后一个奇数节点
                            showSqlQueryProduct(product , productTypeOne);
                            $("section#content-mos").append(productTypeOne);
                            k++;
                        }else{
                            var productTypeTwo = $(productTypeTwos[0]).clone(true);//克隆最后一个偶数节点
                            showSqlQueryProduct(product , productTypeTwo);
                            $("section#content-mos").append(productTypeTwo);
                            q++;
                        }
                    }
                }
                pagingSetParamOfTag(pageBean);
            }else{
                if(listProduct.length<=6){
                    pagingElseJudgeFn_auxiliary(productTypeOnes ,productTypeTwos,listProduct );
                    pagingSetParamOfTag(pageBean);
                }else{
                    pagingElseJudgeFn(productTypeOnes ,productTypeTwos,listProduct );
                    pagingSetParamOfTag(pageBean);
                }
            }
            //瀑布流重新布局
            $('section#content-mos').masonry('reload');
            //重新布局瀑布流特效
            $(".live").liveTile({pauseOnHover: true});
        });
    }
    function pagingNumClickFn($this){
        var page = parseInt($($this).text());
        $($this).siblings("a.current").removeClass("current").addClass("page");
        $($this).removeClass("page").addClass("current");
        //currentPage=page;
        var args="pageSize="+pageSize+"&sortCondition="+sortCondition+"&brandType="+brandType+"&currentPage="+page+"&time="+new Date();
        postAjaxPagingFn(args);
    }
    //根据带过来的对象重新布局页面的参数
    function pagingSetParamOfTag(pageBean){
        $("span.currentPage").text(pageBean.currentpage);
        $("span.totalPage").text(pageBean.totalPage);
        currentPage=pageBean.currentpage;
        totalPage=pageBean.totalPage;
        $("div.recordPage").empty();
        for(var i = 0 ; i<pageBean.pagination.length;i++){
            if(pageBean.pagination[i]==currentPage){
                //alert(pageBean.pagination+","+currentPage);
                var aTag = $('<a href="javascript:;" class="current">'+pageBean.pagination[i]+'</a>');
                $("div.recordPage").append(aTag);
                aTag.bind("click",function(){
                    var $this=$(this);
                    pagingNumClickFn($this)
                });
            }else{
                var aTag = $('<a href="javascript:;" class="page">'+pageBean.pagination[i]+'</a>');
                $("div.recordPage").append(aTag);
                aTag.bind("click",function(){
                    var $this=$(this);
                    pagingNumClickFn($this)
                });
            }
        }
    }
    //分页判断，后台带过来的产品小于当前展现产品的长度
    function pagingElseJudgeFn(productTypeOnes ,productTypeTwos,listProduct ){
        var evenArr = new Array();
        var oddArr = new Array();
        for(var i = 0,k=0 ,q=0; i<listProduct.length;i++){
            var product = listProduct[i];
            if((i+1)%2!=0){
                evenArr[k]=k;
                var productTypeOne = productTypeOnes[k++];
                showSqlQueryProduct(product , $(productTypeOne));
                $(productTypeOne).show(360);
            }else{
                oddArr[q]=q;
                var productTypeTwo = productTypeTwos[q++];
                showSqlQueryProduct(product , $(productTypeTwo));
                $(productTypeTwo).show(360);
            }
        }
        for(var i = 0; i<productTypeOnes.length;i++){
            if(evenArr[i]==i){
                continue;
            }else{
                $(productTypeOnes[i]).remove();
            }
        }
        for(var i = 0; i<productTypeTwos.length;i++){
            if(oddArr[i]==i){
                continue;
            }else{
                $(productTypeTwos[i]).remove();
            }
        }
    }
    //页面的产品显示都是基于前一个标签体克隆而来，所以后台带过来的产品长度等于0或小于等于6，就把该标签体隐藏，以备后面留下克隆的样本
    function pagingElseJudgeFn_auxiliary(productTypeOnes ,productTypeTwos,listProduct ){
        var evenArr = new Array();
        var oddArr = new Array();
        for(var i = 0,k=0 ,q=0; i<listProduct.length;i++){
            var product = listProduct[i];
            if((i+1)%2!=0){
                evenArr[k]=k;
                var productTypeOne = productTypeOnes[k++];
                showSqlQueryProduct(product , $(productTypeOne));
                $(productTypeOne).show(360);
            }else{
                oddArr[q]=q;
                var productTypeTwo = productTypeTwos[q++];
                showSqlQueryProduct(product , $(productTypeTwo));
                $(productTypeTwo).show(360);
            }
        }
        for(var i = 0; i<productTypeOnes.length;i++){
            if(evenArr[i]==i){
                continue;
            }else{
                $(productTypeOnes[i]).hide();
            }
        }
        for(var i = 0; i<productTypeTwos.length;i++){
            if(oddArr[i]==i){
                continue;
            }else{
                $(productTypeTwos[i]).hide();
            }
        }
    }
    function showSqlQueryProduct(product , productTag){
        productTag.attr("productId",product.id);
        productTag.find("div.live-front").find("img").attr("src","showProductImgAction?id="+product.id+"&iconurl="+product.imgUrlList[0]);
        productTag.find("div.live-back").find("img").attr("src","showProductImgAction?id="+product.id+"&iconurl="+product.imgUrlList[1]);
        productTag.find("span.tile-cat").text(product.name);
    }
</script>
</body>
</html>
