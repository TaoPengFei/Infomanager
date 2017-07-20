<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%
	String path = "InfoManager";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", -10);
%>
<title>菜单管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="login">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link type="text/css" rel="stylesheet"
	href="../js/bootstrap/css/bootstrap.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link type="text/css" rel="stylesheet"
	href="../js/bootstrap/css/bootstrap-theme.css">

<!-- Custom styles for this template -->

<link type="text/css" rel="stylesheet"
	href="../js/jqgrid/themes/cupertino/jquery-ui.min.css">
<link type="text/css" rel="stylesheet"
	href="../js/jqgrid/css/ui.jqgrid.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script type="text/javascript" src="../js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="../js/menu.js"></script>
<script type="text/javascript"
	src="../js/jqgrid/themes/cupertino/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="../js/jqgrid/js/i18n/grid.locale-cn.js"></script>
<script type="text/javascript"
	src="../js/jqgrid/js/jquery.jqGrid.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript"
	src="../js/bootstrap/js/bootstrap.js"></script>
	
<style type="text/css">
.input-group {
  	margin: 5px;
}
</style>
</head>
<body>
	<div id="menu"><%@ include file="menu.inc"%></div>
	<!-- 导航结束 -->
	<div style="text-align: center; margin: 0 auto;">
		<h3>菜单管理</h3>
	</div>
	<HR style="FILTER: alpha(opacity = 100, finishopacity = 0, style = 3)"
		width="80%" color=#987cb9 SIZE=3>

	<div class="container">

		<form role="form" id="menu_form">
			<div class="row">
				<div class="col-md-3 column">
					<div class="input-group">
						<span class="input-group-addon">类别</span> <select name="type"
							id="menu_type" class="form-control">
							<option value="all_type" selected="selected">全部</option>
							<option value="maintain_qry">主档维护</option>
							<option value="storecheck_qry">巡店业务</option>
							<option value="report_qry">报表查询</option>
							<option value="set_up_qry">相关设置</option>
						</select>
					</div>
				</div>
			</div>
		</form>
		<div class="row">
			<div class="pull-right"
				style="margin-top: 10px; margin-bottom: 10px;">
				<div class="button-align">
					<button type="button" class="btn btn-primary" id='menu_query'>查询</button>
					<button type="button" class="btn btn-primary" id='menu_add'>新增</button>
					<button type="button" class="btn btn-primary" id='menu_delete'>删除</button>
					<!--  <button type="button" class="btn btn-info" id='menu_update'>修改</button>-->
				</div>
			</div>
		</div>
		<div class="row">
			<table id="list4"></table>
			<!-- jqGrid 分页 div gridPager -->
			<div id="gridPager"></div>

		</div>
	</div>

	<!-- 弹窗 -->
	<div class="modal fade" id="menuModal" tabindex="-1" role="dialog"
		aria-labelledby="menuinfoModalLabel" aria-hidden="true"
		data-show="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="menuinfoModalLabel">新增菜单</h4>
				</div>
				<div class="modal-body" style="margin-left: 10%; margin-right: 20%;">
					<div class="container">
						<div class="row" style="margin-top: 10px">
							<div class="col-xs-5">
								<div class="input-group">
									<span class="input-group-addon">菜单类型</span> 
									<select name="type" class="form-control" id="choice_menutype">
										<option  selected="selected">请选择菜单类型</option>
										<option value="16" >主档维护</option>
										<option value="17">巡店业务</option>
										<option value="18">报表查询</option>
										<option value="25">相关设置</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 10px" id="unuserdiv">
							<div class="col-xs-5">
								<div class="input-group">
									<span class="input-group-addon">该菜单是否在用</span> 
									<select name="type" class="form-control" id="unuser">
										<option  value="0" selected="selected">在用</option>
										<option value="100" >不在用</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 10px">
							<div class="col-xs-5">
								<div class="input-group">
									<span class="input-group-addon">菜单名</span> <input type="text"
										class="form-control" id="menu_name">
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 10px">
							<div class="col-xs-5">
								<div class="input-group">
									<span class="input-group-addon">菜单地址</span> <input type="text"
										class="form-control" id="menu_address">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id='menu_save'>保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>