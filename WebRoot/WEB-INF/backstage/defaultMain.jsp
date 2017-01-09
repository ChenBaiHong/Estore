<%--
  Created by IntelliJ IDEA.
  User: cbh12
  Date: 9/28/2016
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--开始Meta-->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content="ChenBaiHong"/>
    <!--结束Meta-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/backgroundPlug/img/"/>
    <title>后台管理员操作界面</title>
    <!--开始引入css stylesheet-->
    <!-- BOOTSTRAP CSS -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/bootstrap-reset.css" rel="stylesheet"/>
    <!-- 特色风格的字体 图标 CSS样式 -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/font-awesome/css/font-awesome.css"rel="stylesheet"/>
    <!-- 基本主题的 CSS 样式 -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style.css"rel="stylesheet"/>
    <!--响应式主题css响应样式-->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/style-responsive.css" rel="stylesheet"/>
    <!-- MORRIS 图表 CSS 样式 -->
    <link href="${pageContext.request.contextPath}/backgroundPlug/assets/morris.js-0.4.3/morris.css"rel="stylesheet"/>
    <!--仪表盘 万年历 日历样式-->
    <link href="${pageContext.request.contextPath}/backgroundPlug/css/clndr.css" rel="stylesheet">

    <!--结束引入css stylesheet-->
</head>
<body>

    <!--开始页面包装-->
    <section class="wrapper">
		<!-- BEGIN ROW  -->
          <div class="row state-overview">
            <div class="col-lg-3 col-sm-6">
              <section class="panel">
                <div class="symbol">
                  <i class="fa fa-tags blue">
                  </i>
                </div>
                <div class="value">
                  <h1 class="count">
                    0
                  </h1>
                  <p>
                    总销售额
                  </p>
                </div>
              </section>
            </div>
            <div class="col-lg-3 col-sm-6">
              <section class="panel">
                <div class="symbol">
                  <i class="fa fa-money red">
                  </i>
                </div>
                <div class="value">
                  <h1 class=" count2">
                    0
                  </h1>
                  <p>
                    总盈利
                  </p>
                </div>
              </section>
            </div>
            <div class="col-lg-3 col-sm-6">
              <section class="panel">
                <div class="symbol">
                  <i class="fa fa-user yellow">
                  </i>
                </div>
                <div class="value">
                  <h1 class=" count3">
                    0
                  </h1>
                  <p>
                    新客户
                  </p>
                </div>
              </section>
            </div>
            <div class="col-lg-3 col-sm-6">
              <section class="panel">
                <div class="symbol">
                  <i class="fa fa-shopping-cart purple">
                  </i>
                </div>
                <div class="value">
                  <h1 class=" count4">
                    0
                  </h1>
                  <p>
                    新订单
                  </p>
                </div>
              </section>
            </div>
          </div>
		   <!-- END ROW  -->
          <div id="morris">
		     <!-- BEGIN ROW  -->
            <div class="row">
              <div class="col-lg-4">
                <div class="panel terques-chart">
                  <div class="panel-body chart-texture">
                    <div class="chart">
                      <div class="heading">
                        <span>
                          Friday
                        </span>
                        <strong>
                          ￥ 657,00 | 55%
                        </strong>
                      </div>
                      <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[564,123,890,564,455,200,135,667,333,526,996]">
                      </div>
                    </div>
                  </div>
                  <div class="chart-tittle">
                    <span class="title">
                      最新收益
                    </span>
                    <span class="value">
                      <a href="#" class="active">
                        Market
                      </a>
                      |
                      <a href="#">
                        Local
                      </a>
                      |
                      <a href="#">
                        Online
                      </a>
                    </span>
                  </div>
                </div>
                <div class="panel green-chart">
                  <div class="panel-body">
                    <div class="chart">
                      <div class="heading">
                        <span>
                          June
                        </span>
                        <strong>
                          23 Days | 65%
                        </strong>
                      </div>
                      <div id="designchart">
                      </div>
                    </div>
                  </div>
                  <div class="chart-tittle">
                    <span class="title">
                      总收益
                    </span>
                    <span class="value">
                      ￥, 50,23,561
                    </span>
                  </div>
                </div>
              </div>
              <div class="col-lg-2">
                <div class="tiles facebook-tile text-center">
                  <i class="fa fa-github icon-lg-size">
                  </i>
                  <h4>
                    <a href="#fakelink">
                      10K likes
                    </a>
                  </h4>
                </div>
                <!-- /.tiles .facebook-tile -->
                <div class="tiles twitter-tile text-center">
                  <i class="fa fa-linkedin-square icon-lg-size">
                  </i>
                  <h4>
                    <a href="#fakelink">
                      2K followers
                    </a>
                  </h4>
                </div>
                <!-- /.tiles .twitter-tile -->
              </div>
              <div class="col-lg-6">
                <section class="panel">
                  <header class="panel-heading">
                    未来预盈利(RMB)
                  </header>
                  <div class="panel-body">
                    <div id="hero-area" class="graph">
                    </div>
                  </div>
                </section>
              </div>
            </div>
			 <!-- END ROW  -->
          </div>
		   <!-- BEGIN ROW  -->
          <div class="row">
            <div class="col-lg-8">
              <section class="panel">
                <div class="panel-body">
                  <a href="#" class="task-thumb">
                    <img src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/8.jpg" alt="">
                  </a>
                  <div class="task-thumb-details">
                    <h1>
                      <a href="#">
                        Work Progress
                      </a>
                    </h1>
                    <p>
                      BaiHong Chen
                    </p>
                  </div>
                </div>
                <table class="table table-hover personal-task">
                  <tbody>
                    <tr>
                      <td>
                        1
                      </td>
                      <td>
                        Target Revenue
                      </td>
                      <td>
                        <span class="badge bg-important">
                          75%
                        </span>
                      </td>
                      <td>
                        <div id="work-progress1">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        2
                      </td>
                      <td>
                        Project Larsen
                      </td>
                      <td>
                        <span class="badge bg-success">
                          43%
                        </span>
                      </td>
                      <td>
                        <div id="work-progress2">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        3
                      </td>
                      <td>
                        Project Nowbie
                      </td>
                      <td>
                        <span class="badge bg-info">
                          67%
                        </span>
                      </td>
                      <td>
                        <div id="work-progress3">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        4
                      </td>
                      <td>
                        Total Sales
                      </td>
                      <td>
                        <span class="badge bg-warning">
                          30%
                        </span>
                      </td>
                      <td>
                        <div id="work-progress4">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        5
                      </td>
                      <td>
                        Delivery Pending
                      </td>
                      <td>
                        <span class="badge bg-primary">
                          15%
                        </span>
                      </td>
                      <td>
                        <div id="work-progress5">
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </section>
            </div>
            <div class="col-lg-4">
              <section class="panel post-wrap pro-box">
                <aside>
                  <div class="post-info">
                    <div class="panel-body">
                      <footer class="social-footer">
                        <ul>
                          <li class="active">
                            <a href="#">
                              <i class="fa  fa-github-square">
                              </i>
                            </a>
                          </li>
                        </ul>
                      </footer>
                      <!-- END  FOOTER -->
                      <div class="text-center twite">
                        <h1>
                          We just Launch a New Theme Check it Out at
                          <a href="javascript:;">
                            http://www.ChenBaiHong.gitHub.com/
                          </a>
                        </h1>
                        <p >
                          4 Days ago
                        </p>
                      </div>
                    </div>
                  </div>
                </aside>
              </section>
            </div>
          </div>
		   <!-- END ROW  -->
		    <!-- BEGIN ROW  -->
          <div class="row">
            <div class="col-lg-6">
              <div class="panel">
                <div class="panel-body">
                  <div class="media usr-info">
                    <a href="#" class="pull-left">
                      <img class="thumb" src="${pageContext.request.contextPath}/backgroundPlug/AddRole/images/8.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h4 class="media-heading">
                        BaiHong Chen
                      </h4>
                      <span>
                        Chief-Sarathi
                      </span>
                      <p>
                        I handcraft beautiful websites and application for all kind of devices
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <section class="panel">
                <div class="weather-bg">
                  <div class="panel-body">
                    <div class="row">
                      <div class="col-xs-6">
                        <i class="fa fa-cloud">
                        </i>
                        成都
                      </div>
                      <div class="col-xs-6">
                        <div class="degree">
                          48°
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <footer class="weather-category">
                  <ul>
                    <li class="active">
                      <h5>
                        湿度
                      </h5>
                      45%
                    </li>
                    <li>
                      <h5>
                        风力
                      </h5>
                      5 mph
                    </li>
                  </ul>
                </footer>
                <!-- END  FOOTER -->
              </section>
            </div>
            <div class="col-lg-6">
              <div class="panel">
                <div class="panel-body">
                  <div class="calendar-block ">
                    <div class="cal1">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
		   <!-- END ROW  -->
		    <!-- BEGIN ROW  -->
          <div class="row">
            <div class="col-lg-6">
              <div class="panel">
                <div class="panel-body">
                  <footer class="project-category">
                    <ul>
                      <li class="active">
                        <h5>
                          才高八斗
                        </h5>
                        <div id="work-progress6">
                        </div>
                      </li>
                      <li>
                        <h5>
                          风流倜傥
                        </h5>
                        <div id="work-progress7">
                        </div>
                      </li>
                      <li>
                        <h5>
                          翩翩君子
                        </h5>
                        <div id="work-progress8">
                        </div>
                      </li>
                    </ul>
                    <h1>
                      柏宏 评价
                    </h1>
                  </footer>
                  <!-- END  FOOTER -->
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="panel">
                <div class="panel-body">
                  <div class="bio-chart">
                    <input class="knob" data-width="100" data-height="100" data-displayPrevious=true data-thickness=".2" value="78" data-fgColor="#f9a3a3" data-bgColor="#e8e8e8">
                    <h4 class="red">
                      Profit
                    </h4>
                  </div>
                  <div class="bio-chart">
                    <input class="knob" data-width="100" data-height="100" data-displayPrevious=true data-thickness=".2" value="63" data-fgColor="#fcce54" data-bgColor="#e8e8e8">
                    <h4 class="yellow">
                      Expansion 
                    </h4>
                  </div>
                </div>
              </div>
            </div>
          </div>
		   <!-- END ROW  -->
    </section>
    <!--结束页面包装-->
    <!-- END MAIN CONTENT -->
      <!-- BEGIN FOOTER -->
      <footer class="site-footer">
        <div class="text-center">
          2016 &copy; BaiHong  
          <a href="" target="_blank">
            China Made
          </a>
          <a href="#" class="go-top">
            <i class="fa fa-angle-up">
            </i>
          </a>
        </div>
      </footer>
      <!-- END  FOOTER -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.js" ></script><!-- BASIC JQUERY 1.8.3 LIB. JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDIN JS -->
<%-- <script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.scrollTo.min.js" ></script> --%><!-- SCROLLTO JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.nicescroll.js" ></script><!-- NICESCROLL JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/respond.min.js" ></script><!-- RESPOND JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/jquery.sparkline.js"></script><!-- SPARKLINE JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/sparkline-chart.js"></script><!-- SPARKLINE CHART JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/common-scripts.js"></script><!-- BASIC COMMON JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/count.js"></script><!-- COUNT JS -->
<!--Morris-->
<script src="${pageContext.request.contextPath}/backgroundPlug/assets/morris.js-0.4.3/morris.min.js" ></script><!-- MORRIS JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/assets/morris.js-0.4.3/raphael-min.js" ></script><!-- MORRIS  JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/assets/chart-master/Chart.js" ></script>
<script src="${pageContext.request.contextPath}/backgroundPlug/js/chart.js" ></script><!-- CHART JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/all-chartjs.js" ></script><!-- MORRIS  JS -->

<!--Calendar-->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/calendar/clndr.js"></script><!-- CALENDER JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/calendar/evnt.calendar.init.js"></script><!-- CALENDER EVENT JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/js/calendar/moment-2.2.1.js"></script><!-- CALENDER MOMENT JS -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script><!-- UNDERSCORE JS -->
<script src="${pageContext.request.contextPath}/backgroundPlug/assets/jquery-knob/js/jquery.knob.js" ></script><!-- JQUERY KNOB JS -->
<script type="text/javascript">
    $(".knob").knob();
</script>
<!-- 结束引入js插件 -->
</body>
</html>
