<%--
  Created by IntelliJ IDEA.
  User: 陶鹏飞
  Date: 2017/7/20
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
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
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="login">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SYBoard | Starter</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/ionicons.min.css">
    <link rel="stylesheet" href="dist/css/AdminLTE.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/square/blue.css">



    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <!--
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    -->
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

    <style>
        .vertical-center{
            position: absolute;
            top: 25%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>

</head>
<body class="hold-transition login-page">
<div class="login-box vertical-center">
    <div class="login-logo">
        <!--
        <span><b>SYB</b></span><span>oard</span>
        -->
        <span><b> </b></span><span> </span>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <!--
        <p class="login-box-msg">Sign in to start your session</p>
        <p class="login-box-msg"><spring:message code="login"/></p>
        -->
        <div class="login-box-msg">
            <img src="favicon.ico">
        </div>
        <p class="login-box-msg"></p>
        <p class="login-box-msg"></p>
        <form role="form" id="login-form" onsubmit="return false;" autocomplete="off">
            <div class="form-group has-feedback">
                <!--
                <input type="text" class="form-control" placeholder="UserName" name="username">
                -->
                <input type="text" class="form-control" placeholder='<spring:message code="loginName"/>' id="username" required autofocus autocomplete="off">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <!--
                <input type="password" class="form-control" placeholder="Password" name="password">
                -->
                <input type="password" class="form-control" placeholder='<spring:message code="password"/>' id="pwd" required autofocus autocomplete="off">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <!--
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="remember_me" value="true"> Remember Me
                        </label>
                    </div>
                </div>
                -->
                <!-- /.col -->
                <div class="col-xs-12">
                    <!--
                    <button type="submit" class="btn btn-primary btn-block btn-flat">
                        Sign In
                    </button>
                    -->
                    <button type="submit" class="btn btn-primary btn-block btn-flat" data-loading-text='<spring:message code="loginStatus"/>' id="btn-login"><spring:message code="login"/></button>
                </div>
                <!-- /.col -->
            </div>
        </form>
        <p class="login-box-msg"></p>

        <!--
            <div class="social-auth-links text-center">
              <p>- OR -</p>
              <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
                Facebook</a>
              <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
                Google+</a>
            </div>
        /.social-auth-links -->
        <!--
        <a href="#">I forgot my password</a><br>
        <a href="#" class="text-center">Register a new membership</a>
        -->
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->



<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
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
                data:{
                    name:username,
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
                            //document.location.href="views/main.jsp";
                            document.location.href="starter.jsp";
                        }else {
                            if($("#btnClose").length > 0){
                                $("#btnClose").trigger("click");
                            }
                            $("#btn-login").button('reset');
                            $("#login-form").prepend(
                                    "<div class='alert alert-danger' role='alert'><button type='button' class='close' data-dismiss='alert' id='btnClose'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><strong>登陆失败！</strong> 用户名或密码错误，请重试！</div>"
                            );
                        }
                    }
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){
                    if($("#btnClose").length > 0){
                        $("#btnClose").trigger("click");
                    }
                    $("#btn-login").button('reset');
                    $("#login-form").prepend(
                            "<div class='alert alert-danger' role='alert'><button id='btnClose' type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><strong>登陆失败！</strong> 用户名或密码错误，请重试！</div>"
                    );
                }
            });
        });

    });
</script>
<!-- iCheck
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
-->



</body>
</html>
