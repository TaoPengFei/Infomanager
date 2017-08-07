<%@ page language="java" import="java.util.*,cn.shiyun.entity.User"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", -10);
%>
<title><spring:message code="roleManager"/></title>
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

<script type="text/javascript"
	src="../js/jqgrid/themes/cupertino/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/jqgrid/js/jquery.jqGrid.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="../js/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="../js/role.js"></script>
<script type="text/javascript" src="../js/lan_en.js"></script>
<script type="text/javascript" src="../js/lan_zh_CN.js"></script>
<style type="text/css">
.ui-jqgrid tr.jqgrow td {
	/* jqGrid cell content wrap  */
	white-space: normal !important;
	height: auto;
}

th.ui-th-column div {
	/* jqGrid columns name wrap  */
	white-space: normal !important;
	height: auto !important;
	padding: 0px;
}
.input-group {
  margin: 5px;
}
</style>
</head>

<body>
	<!-- 导航 -->
	<!--
	<div id="menu"><%@ include file="menu.inc"%></div>
	-->

	<!-- 导航结束 -->
	<div style="text-align: center; margin: 0 auto;">
		<h3><spring:message code="roleManager"/></h3>
	</div>
	<HR style="FILTER: alpha(opacity = 100, finishopacity = 0, style = 3)"
		width="80%" color=#987cb9 SIZE=3>
	<div class="container">
		<form role="form" id="empinfo-form" AUTOCOMPLETE="off">
			<div class="row">
				<div class="col-md-3 column">
					<div class="input-group">
						<span class="input-group-addon"><spring:message code="roleName"/></span> <input type="text"
							class="form-control" id="roleName">
					</div>
				</div>
				<div class="pull-right" style="margin-top: 10xp;">
					<button type="button" class="btn btn-primary" id='queryRole'><spring:message code="query"/></button>
					<button type="button" class="btn btn-primary" id='addRole'><spring:message code="add"/></button>
					<button type="button" class="btn btn-primary" id='delRole'><spring:message code="delete"/></button>
					<button type="button" class="btn btn-info" id='reset'><spring:message code="reset"/></button>
				</div>
			</div>
		</form>

		<div class="row" style="margin-top: 10px; margin-bottom: 20px">
			<table id="roleList"></table>
			<!-- jqGrid 分页 div gridPager -->
			<div id="rolePager"></div>
			<!-- <p>注：双击行可修改</p> -->
		</div>
	</div>

	<!-- Modal -->
	<form id=myModalForm>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true" data-show="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel"><spring:message code="addRole"/></h4>
					</div>
					<div class="modal-body">
						<div class="container">
							<div class="row">
								<div class="col-md-6 column">
									<div class="input-group">
										<span class="input-group-addon"><spring:message code="roleName"/></span> <input type="text"
											class="form-control" id="newRole">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 column">
									<div class="input-group">
										<span class="input-group-addon"><spring:message code="description"/></span>
										<textarea class="form-control" rows="3" id="newDesc"
											placeholder=""></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btn_save"><spring:message code="save"/></button>
						<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="close"/></button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
