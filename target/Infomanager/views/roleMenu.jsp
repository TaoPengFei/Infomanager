<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String path = "InfoManager";
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
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
<title><spring:message code="roleMenu" /></title>
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
<!-- <script type='text/javascript'	src='../js/jqgrid/js/i18n/grid.locale-cn.js'></script> -->
<script type="text/javascript" src="../js/jqgrid/js/jquery.jqGrid.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="../js/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../js/roleMenu.js"></script>
<script type="text/javascript" src="../js/lan_en.js"></script>
<script type="text/javascript" src="../js/lan_zh_CN.js"></script>
<style type="text/css">
.input-group {
	margin: 5px;
}
</style>
</head>
<body>
	<div id="roleMenu"><%@ include file="menu.inc"%></div>
	<!-- 导航结束 -->
	<div style="text-align: center; margin: 0 auto;">
		<h3>
			<spring:message code="roleMenu" />
		</h3>
	</div>

	<div class="container">
	
		<div class="row">
			<div class="col-md-3 column">
				<div class="input-group">
					<span class="input-group-addon"><spring:message
							code="userRole" /></span> <select class="form-control" id="roleName">
					</select>
				</div>
			</div>
		</div>
		<HR style="FILTER: alpha(opacity = 100, finishopacity = 0, style = 3)"
		width="80%" color=#987cb9 SIZE=3>
		<div class="row">
			<div class="col-md-5 column" style="text-align:center">
			<h2><span class="label label-info"><spring:message code="menuWithoutRole" /></span></h2>
			</div>
			<div class="col-md-2" style="text-align: center;">
			</div>
			<div class="col-md-5 column" style="text-align:center">
			<h2><span class="label label-info"><spring:message code="menuWithRole" /></span></h2>
			</div>
	</div>
		<div class="row">
			<div class="col-md-5">
				<select multiple class="form-control"  id="menuLeft"
					style="height: 600px;border-width:3px;"></select>
			</div>
			<div class="col-md-2" style="text-align: center;">
				<div class="row" style="margin-top: 100px">
					<button type="button" class="btn btn-success" id="btnAdd"><spring:message code="add"/>&gt;&gt;</button>
				</div>
				<div class="row" style="margin-top: 300px;">
					<button type="button" class="btn btn-success" id="btnRemove">&lt;&lt;<spring:message code="delete"/></button>
				</div>
			</div>
			<div class="col-md-5">
				<select multiple class="form-control" id="menuRight"
					style="height: 600px;border-width:3px;"></select>
			</div>
		</div>
	</div>
</body>
</html>