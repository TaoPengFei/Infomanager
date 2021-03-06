<%--
  Created by IntelliJ IDEA.
  User: 陶鹏飞
  Date: 2017/7/28
  Time: 15:40
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
//        response.sendRedirect(url+"login.jsp");
        response.sendRedirect(url+"login.html");
        //request.getRequestDispatcher(url+"login.jsp").forward(request,response);
    }
%>
<html ng-app="cBoard" ng-controller="cBoardCtrl">
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
    <!--
    <meta name="viewport" content="width=device-width, initial-scale=1">
    -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

    <!-- ngGrid -->
    <link rel="stylesheet" href="plugins/ng-grid-2.0.12/ng-grid.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <!--
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!--<script src="http://cdn.bootcss.com/angular.js/1.5.8/angular.js"></script>-->
    <script src="org/cboard/Settings.js"></script>
    <script src="lib/angular.min.js"></script>
    <script src="lib/angular-mocks.js"></script>

    <script src="lib/angular-ui-router.min.js"></script>
    <script src="lib/angular-md5.min.js"></script>
    <script src="lib/angular-drag-and-drop-lists.js"></script>
    <script src="lib/angular-sanitize.min.js"></script>
    <script src="lib/ui-bootstrap-tpls-2.1.3.min.js"></script>
    <script src="lib/angular-translate.js"></script>
    <script src="lib/angular-translate-loader-partial.js"></script>



    <script src="lib/underscore-min.js"></script>
    <script src="lib/numbro.min.js"></script>
    <script src="lib/ui-select.min.js"></script>

    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="plugins/jQueryUI/jquery-ui.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.js"></script>

    <!--
    <script src="plugins/echart/echarts.min.js"></script>
    <script src="plugins/echart/theme-fin1.js"></script>-->
    <script src="lib/jquery.ba-resize.js"></script>
    <!--<script src="plugins/echart/world.json"></script>
    <script src="plugins/echart/world.js"></script>-->
    <!--<script src="plugins/echart/china.json"></script>
    <script src="plugins/echart/china.js"></script>-->
    <script src="plugins/ace/ace.js"></script>
    <script src="plugins/ui-ace/ui-ace.min.js"></script>


    <script src="plugins/datatables/jquery.dataTables.js"></script>
    <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">

    <script src="plugins/ng-grid-2.0.12/ng-grid.debug.js"></script>

    <!-- boostrap验证提示 -->
    <script src="plugins/bootstrapvalidator/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="plugins/bootstrapvalidator/bootstrapValidator.min.css">

    <!--<link rel="stylesheet" href="css/ui-select.min.css">-->
    <link rel="stylesheet" href="css/select.css">
    <style>
        .modal-fit .modal-dialog {
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            margin: auto;
            padding: 50px;
        }
        .modal-fit .modal-body {
            height: calc(100vh - 200px);
            overflow: auto;
        }
        @media (min-width: 768px) {
            .modal-fit .modal-dialog {
                width: auto;
            }
        }
        /* ================ TABLE ================ */
        table,table tr th, table tr td {
            border:1px solid #F8FAFB;
        }
        table {
            border: none;
        }
        table {
            width: 100%;
            margin: 0 auto;
            clear: both;
            border-collapse: collapse;
            border-spacing: 0;
        }
        table thead {
            background-color: #EBEFF2;
            border: 1px solid #efefef;
        }
        table tbody tr {
            background-color: white;
            border: 1px solid #e2dfdf;
        }
        table tbody tr td {
            border: none;
            background-color: white;
            padding: 0px;
            line-height: 22px;
        }
        td, th {
            border-left: 1px solid #d5d5d5;
            border-top: 1px solid #d5d5d5;
            text-align: center;
            white-space: nowrap;
            font-weight: normal;
            font-size: 10px;
            padding: 0px 0px 0px 0px;
        }
        .table.table-bordered > tr >td {
            height: 22px;
            max-height: 22px;
        }
        /* ================ 淘汰/启用样式控制 ================ */
        .trueClass{
            opacity:0.1;
        }
        .falseClass{
        }

        /* ================ tpfPagination ================ */
        .page-list .pagination {float:left;}
        .page-list .pagination span {cursor: pointer;}
        .page-list .pagination .separate span{cursor: default; border-top:none;border-bottom:none;}
        .page-list .pagination .separate span:hover {background: none;}
        .page-list .page-total {float:left; margin: 25px 20px;}
        .page-list .page-total input, .page-list .page-total select{height: 26px; border: 1px solid #ddd;}
        .page-list .page-total input {width: 40px; padding-left:3px;}
        .page-list .page-total select {width: 50px;}
    </style>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header" ng-include="'starter/main-header.html'"></header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar" ng-include="'starter/main-sidebar.html'"></aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <!--<section class="content-header">-->
        <!--<h1>-->
        <!--Page Header-->
        <!--<small>Optional description</small>-->
        <!--</h1>-->
        <!--<ol class="breadcrumb">-->
        <!--<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>-->
        <!--<li class="active">Here</li>-->
        <!--</ol>-->
        <!--</section>-->

        <!-- Main content -->
        <section ui-view class="content"></section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer" ng-include="'starter/main-footer.html'"></footer>

</div>
<!-- ./wrapper -->


<script src="org/cboard/util/CBoardEChartRender.js"></script>
<script src="org/cboard/util/CBoardCommonUtils.js"></script>
<script src="org/cboard/util/CBoardKpiRender.js"></script>
<script src="org/cboard/util/CBoardTableRender.js"></script>


<!-- AngularJS-->
<script src="org/cboard/ng-app.js"></script>
<script src="org/cboard/ng-config.js"></script>
<script src="org/cboard/controller/cboard/cBoardCtrl.js"></script>
<script src="org/cboard/controller/dashboard/dashboardViewCtrl.js"></script>


<script src="org/cboard/controller/config/userCtrl.js"></script>
<script src="org/cboard/controller/config/roleCtrl.js"></script>
<script src="org/cboard/controller/config/roleMenuCtrl.js"></script>
<script src="org/cboard/controller/config/dataTablesCtrl.js"></script>


<script src="org/cboard/service/dashboard/dashboardService.js"></script>
<script src="org/cboard/service/data/dataService.js"></script>
<script src="org/cboard/service/util/ModalUtils.js"></script>
<script src="org/cboard/service/updater/updateService.js"></script>
<script src="org/cboard/service/chart/chartFunnelService.js"></script>
<script src="org/cboard/service/chart/chartKpiService.js"></script>
<script src="org/cboard/service/chart/chartLineService.js"></script>
<script src="org/cboard/service/chart/chartPieService.js"></script>
<script src="org/cboard/service/chart/chartSankeyService.js"></script>
<script src="org/cboard/service/chart/chartRadarService.js"></script>
<script src="org/cboard/service/chart/chartService.js"></script>
<script src="org/cboard/service/chart/chartTableService.js"></script>


<script src="org/cboard/directive/dashboard/dashboardWidget.js"></script>
<script src="org/cboard/directive/config/tm.pagination.js"></script>
<script src="org/cboard/directive/config/ensureRoleUnique.js"></script>


<script type="text/ng-template" id="echartContent">
    <div class="col-md-{{widget.width}}">
        <div class="box">
            <div class="box-header">
                <i class="fa fa-cube"></i>
                <h3 class="box-title">{{widget.name}}</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" ng-click="reload(widget)"><i
                            class="fa fa-refresh"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" ng-click="config(widget)"><i
                            class="fa fa-wrench"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" ng-click="modalChart(widget)"><i
                            class="fa fa-square-o"></i>
                    </button>
                </div>
            </div>
            <div class="box-body" ng-style="{height:myheight+'px'}">
            </div>
        </div>
    </div>
</script>
<script type="text/ng-template" id="kpiContent">
    <div class="col-md-{{widget.width}} kpi-body">
    </div>
</script>
<script type="text/ng-template" id="tableContent">
    <div class="col-md-{{widget.width}}">
        <div class="box">
            <div class="box-header">
                <i class="fa fa-cube"></i>
                <h3 class="box-title">{{widget.name}}</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" ng-click="reload(widget)"><i
                            class="fa fa-refresh"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" ng-click="config(widget)"><i
                            class="fa fa-wrench"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" ng-click="modalTable(widget)"><i
                            class="fa fa-square-o"></i>
                    </button>
                </div>
            </div>
            <div class="box-body" ng-style="{height:myheight+'px'}">
            </div>
        </div>
    </div>
</script>

<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

//    console.log(window);
</script>

</body>
</html>