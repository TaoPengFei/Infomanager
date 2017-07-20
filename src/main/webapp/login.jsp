<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<%
	response.setHeader("Cache-Control", "must-revalidate");
	response.setCharacterEncoding("utf-8");
	request.setAttribute(
			"notexpired",
			new java.text.SimpleDateFormat("yyyy-MM-dd").parse(
					"2011-07-06").getTime() > new java.util.Date()
					.getTime());
	System.out.println("login.jsp");
%>

<!DOCTYPE html>
<html>
<head>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", -10);
%>

<title><%=application.getInitParameter("system-name")%></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="login">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="js/bootstrap/css/bootstrap-theme.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery-2.1.3.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap/js/bootstrap.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript">
	$(document).ready(function(){
	
	$("#btn-login").click(function(){
		var username = $("#username").val();
		var pwd = $("#pwd").val();
		$("#btn-login").button('loading');
		
		$.ajax({
			type:"POST",
			url : 'user/login.do',
			dataType: "json",
			async:false,
			cache:false,
			data:{	name:username,
					password:pwd,
					enabled:true
				  },
			success:function(data,textStatus){
				if(data){
					if(data.constructor == String){
						data = eval("("+data+")");
					}
					var notecode = data.code;
					$("#btn-login").button('reset');
					if(notecode == "1"){
						document.location.href="views/main.jsp";
					}else {
						if($("#btnClose").length > 0){
							$("#btnClose").trigger("click");
						}
						$("#btn-login").button('reset');
						$("#login-form").prepend("<div class='alert alert-danger' role='alert'><button type='button' class='close' data-dismiss='alert' id='btnClose'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><strong>登陆失败！</strong> 用户名或密码错误，请重试！</div>");
					}
				}
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				if($("#btnClose").length > 0){
					$("#btnClose").trigger("click");
				}			
				$("#btn-login").button('reset');
				$("#login-form").prepend("<div class='alert alert-danger' role='alert'><button id='btnClose' type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><strong>登陆失败！</strong> 用户名或密码错误，请重试！</div>");
			}								
		});		
	});
		
});
</script>
<style type="text/css">
.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading{
	font-family:微软雅黑, Arial；
	font-weight:900;
}
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

</style>

</head>

<body style="background-image:url(img/bglogin.jpg);">
	<div class="container">
		<form class="form-signin" style="margin:0 auto;margin-top:20%;" role="form" id="login-form" onsubmit="return false;" autocomplete="off">
			<h2 class="text-center" style="color:#f2f2f2"><spring:message code="login"/></h2>
			<input type="text" class="form-control" placeholder='<spring:message code="loginName"/>'
				id="username" required autofocus autocomplete="off"> 
				<p></p>
				<input type="password"
				class="form-control" placeholder='<spring:message code="password"/>' id="pwd" required autocomplete="off">
			<button class="btn btn-lg btn-primary btn-block" 
				data-loading-text='<spring:message code="loginStatus"/>' id="btn-login"><spring:message code="login"/></button>
		</form>
	</div>
</body>
</html>
