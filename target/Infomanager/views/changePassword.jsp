
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="login">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="../js/bootstrap/css/bootstrap.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="../js/bootstrap/css/bootstrap-theme.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="../js/jquery-2.1.3.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="../js/bootstrap/js/bootstrap.js"></script>
<title>修改密码</title>
<style type="text/css">
.form-signin {
	max-width: 400px;
	padding: 15px;
	margin: 0 auto;
}
</style>
</head>
<body>

	<!-- 导航 -->
	<%
		String url = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + request.getContextPath()
				+ "/";
		String userName = request.getParameter("userName");
	%>

	<script>
   var gContextPath = "<%=url%>
		"; //网站根目录
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#planForm")[0].reset();

			$("#savepassword").click(function() {
				var userName = $("#userName").val();
				var oldPassword = $("#oldPassword").val();
				var newPassword = $("#newPassword").val();
				var confirmPassword = $("#confirmPassword").val();
				if (userName == null || userName == "") {
					alert('<spring:message code="plsLogin"/>');
				}
				if (oldPassword == null || oldPassword == "") {
					alert('<spring:message code="enterPassword"/>');
					return;
				}
				if (newPassword == "" || newPassword == null) {
					alert('<spring:message code="enterPassword"/>');
					return;
				}

				if (newPassword != confirmPassword) {
					alert('<spring:message code="passwordDiff"/>');
					return;
				}

				$.ajax({
					url : '../user/updatePassword.do',
					dataType : "json",
					type : "POST",
					data : {
						userName : userName,
						oldPassword : oldPassword,
						newPassword : newPassword
					},
					success : function(data, textStatus) {
						if (data) {
							if (data.constructor == String) {
								data = eval("(" + data + ")");
							}
							var ret = data.code;
							if (ret == "1") {
								$("#planForm")[0].reset();
								$('#passwordModal').modal('hide');
								alert(data.msg);
							} else {
								alert(data.msg);
							}
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(errorThrown);
					}
				});
			});
		});
	</script>

	<div class="container">
		<div class="form-signin">
			<div class="row">
				<div class="col-xs-3" style="width: 100%;">
					<div class="input-group" style="margin: 0px auto;">
						<h4 class="modal-title" id="passwordTitle">
							<spring:message code="changePassword" />
						</h4>
					</div>
				</div>
			</div>
			<form id="planForm">
				<div class="row" style="margin-top: 10px">
					<div class="col-xs-3" style="width: 100%;">
						<div class="input-group">
							<span class="input-group-addon"><spring:message
									code="loginName" /></span> <input type="text" class="form-control"
								id="userName" value="<%=userName%>" readonly="readonly">
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-xs-3" style="width: 100%;">
						<div class="input-group">
							<span class="input-group-addon"><spring:message
									code="password" /></span> <input type="password" class="form-control"
								id="oldPassword">
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-xs-3" style="width: 100%;">
						<div class="input-group">
							<span class="input-group-addon"><spring:message
									code="newPassword" /></span> <input type="password"
								class="form-control" id="newPassword">
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-xs-3" style="width: 100%;">
						<div class="input-group">
							<span class="input-group-addon"><spring:message
									code="confirmPwd" /></span> <input type="password"
								class="form-control" id="confirmPassword">
						</div>
					</div>
				</div>
			</form>
			<div class="row" style="margin-top: 10px">
				<div class="col-xs-3" style="width: 100%;">
					<div class="input-group" style="margin:0 auto;">
						<button style="width:100px;" type="button" class="btn btn-primary" id="savepassword">
							<spring:message code="save" />
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>