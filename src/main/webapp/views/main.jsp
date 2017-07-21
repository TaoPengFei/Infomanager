<%--
  Created by IntelliJ IDEA.
  User: 陶鹏飞
  Date: 2017/7/21
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,java.io.*,cn.shiyun.entity.User"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    User user = (User)session.getAttribute("User");
    String userName = "";
    if(user != null){
        userName = user.getName();
    }else{
        response.sendRedirect(url+"login.jsp");
        //request.getRequestDispatcher(url+"login.jsp").forward(request,response);
    }
%>

<!DOCTYPE html>
<html >
<head>
    <%
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", -10);
    %>
    <title><spring:message code="home"/></title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="login">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <link rel="shortcut icon" href="img/favicon.html">

    <title>首页</title>
    -->

    <!-- Bootstrap core CSS -->
    <link href="/plugins/flatlabAdmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="/plugins/flatlabAdmin/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="/plugins/flatlabAdmin/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!--
    <link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
    -->

    <!-- Custom styles for this template -->
    <link href="/plugins/flatlabAdmin/css/style.css" rel="stylesheet">
    <link href="/plugins/flatlabAdmin/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="/plugins/flatlabAdmin/js/html5shiv.js"></script>
    <script src="/plugins/flatlabAdmin/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<section id="container" class="">
    <!--header start-->
    <header class="header white-bg">
        <div class="sidebar-toggle-box">
            <!--
            <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
            -->
            <div data-original-title="" data-placement="right" class="icon-reorder tooltips"></div>
        </div>
        <!--logo start-->
        <a href="#" class="logo"><span><spring:message code="menu1"/></span></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu"></div>
        <div class="top-nav ">
            <!--search & user info start-->
            <ul class="nav pull-right top-menu">
                <li>
                    <input type="text" class="form-control search" placeholder="Search">
                </li>
                <!-- user login dropdown start-->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <!--
                        <img alt="" src="img/avatar1_small.jpg">
                        <span class="username">用户名</span>
                        -->
                        <span class="glyphicon glyphicon-user"><spring:message code="user" /><%=userName%></span>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <div class="log-arrow-up"></div>
                        <!--
                        <li><a href="#"><i class=" icon-suitcase"></i>Profile</a></li>
                        <li><a href="#"><i class="icon-bell-alt"></i> Notification</a></li>
                        -->
                        <li>
                            <!--
                            <a href="#"><i class="icon-cog"></i> </a>
                            -->
                            <a href="<%=url%>login.jsp"><i class="icon-key"></i> <spring:message code="changePassword"/></a>
                        </li>
                        <li>
                            <a href="<%=url%>login.jsp"><i class="icon-key"></i> <spring:message code="quit"/></a>
                            <!--
                            <a style="margin-left:20px" href="<%=url%>login.jsp"><spring:message code="quit"/></a>
                            <a style="margin-left:20px;cursor: pointer;" onclick = "modify();"><spring:message code="changePassword"/></a>
                            -->
                        </li>
                    </ul>
                </li>
                <!-- user login dropdown end -->
            </ul>
            <!--search & user info end-->
        </div>
    </header>
    <!--header end-->
    <!--sidebar start-->
    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->

            <ul class="sidebar-menu">
                <!--
                <li class="active">
                    <a class="" href="index.html">
                        <i class="icon-dashboard"></i>
                        <span>人员维护</span>
                    </a>
                </li>
                -->
                <li class="sub-menu">
                    <a class="" href=<%=url+"user/user.do"%> target="mainFrame">
                        <i class="icon-user"></i>
                        <span><spring:message code="empManager" /></span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a class="" href="<%=url+"role/role.do"%>" target="mainFrame">
                        <i class="icon-tasks"></i>
                        <span><spring:message code="roleManager" /></span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a class="" href=<%=url+"roleMenu/roleMenu.do"%> target="mainFrame">
                        <i class="icon-cogs"></i>
                        <span><spring:message code="roleMenu" /></span>
                    </a>
                </li>

                <!--
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon-cogs"></i>
                        <span>二级菜单</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="#">#1</a></li>
                        <li><a class="" href="#">#2</a></li>
                        <li><a class="" href="#">#3</a></li>
                    </ul>
                </li>
                -->
                <!--
                <li>
                    <a class="" href="login.html">
                        <i class="icon-user"></i>
                        <span>Login Page</span>
                    </a>
                </li>
                -->
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <iframe frameborder="0" style="margin-top: 15px; height: 631px;" width="1215" id="mainFrame" name="mainFrame" src=<%=url+"user/user.do"%> ></iframe>
        </section>
    </section>
    <!--main content end-->

</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="/plugins/flatlabAdmin/js/jquery-1.8.3.min.js"></script>
<script src="/plugins/flatlabAdmin/js/bootstrap.min.js"></script>
<script src="/plugins/flatlabAdmin/js/jquery.scrollTo.min.js"></script>
<script src="/plugins/flatlabAdmin/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="/plugins/flatlabAdmin/js/owl.carousel.js" ></script>
<script src="/plugins/flatlabAdmin/js/jquery.customSelect.min.js" ></script>

<!--common script for all pages-->
<script src="/plugins/flatlabAdmin/js/common-scripts.js"></script>


<script>
    //owl carousel
    $(document).ready(function() {
        $("#owl-demo").owlCarousel({
            navigation : true,
            slideSpeed : 300,
            paginationSpeed : 400,
            singleItem : true

        });
    });
    //custom select box
    $(function(){
        $('select.styled').customSelect();
    });
</script>

</body>
</html>
