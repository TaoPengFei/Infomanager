<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,java.io.*,cn.shiyun.entity.User"%>
<!-- 导航 -->
<%
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

 <script>
   var gContextPath = "<%=url%>"; //网站根目录
   var RowNum=50;
 </script>
<script type="text/javascript">
    $(document).ready(function(){
        modify = function(){
        	var userName="<%=userName%>";
            if(userName == null || userName == ""){
            	alert('<spring:message code="plsLogin"/>');
            	document.location.href="<%=url%>login.jsp";
            	return;
            }
            $("#passwordModal").modal('show',function(){
                $("#planForm")[0].reset();     
            });
        }
        
        $('#passwordModal').on('hidden.bs.modal', function () {
		     $("#planForm")[0].reset();  
		});
        
        $("#savepassword").click(function(){
            var newPassword = $("#newPassword").val();
            var confirmPassword = $("#confirmPassword").val();
            var userName='<%=userName%>';
            if(userName == null || userName==""){
            	alert('<spring:message code="plsLogin"/>');
            	document.location.href="<%=url%>login.jsp";
            }
            if(newPassword==""||newPassword==null){
                alert('<spring:message code="enterPassword"/>');
                return;
            }
            
            if(newPassword!=confirmPassword){
                alert('<spring:message code="passwordDiff"/>');
                return;
            }
            
            
            $.ajax({
	             url:'../user/updateUser.do',
	             dataType:"json",
	             type:"POST",
	             data:{
	             	 name:userName,
	                 password:newPassword,
	                 enabled:true
	             },
	             success: function(data,textStatus) {
	                 if(data){
                          if(data.constructor == String){
                              data = eval("("+data+")");
                          }
                          var ret = data.code;
                          if(ret == "1"){
                              $("#planForm")[0].reset();                                   
                              $('#passwordModal').modal('hide');
                              alert(data.msg);
                              document.location.href="<%=url%>login.jsp";
                          }else{
                              alert(data.msg);
                          }
                      }   
	             },
	             error:function(XMLHttpRequest, textStatus, errorThrown){
	                  alert(errorThrown);
	             }
            });
        });
    });
  </script>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href=<%=url+"views/main.jsp"%>><spring:message code="home"/></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="menu1"/> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href=<%=url+"user/user.do"%>><spring:message code="empManager" /></a></li>
            <li><a href="<%=url+"role/role.do"%>"><spring:message code="roleManager" /></a></li>
            <!--<li><a href=<%=url+"menu/menu.do"%>><spring:message code="menuManager" /></a></li>-->
            <li><a href=<%=url+"roleMenu/roleMenu.do"%>><spring:message code="roleMenu" /></a></li>
          </ul>
        </li>
      </ul>
      
      <p class="navbar-text navbar-right" style="margin-right:100px">
	      <span class="glyphicon glyphicon-user"><spring:message code="user" /><%=userName%></span>
	      <a style="margin-left:20px;cursor: pointer;" onclick = "modify();"><spring:message code="changePassword"/></a>
	      <a style="margin-left:20px" href="<%=url%>login.jsp"><spring:message code="quit"/></a>
      </p>    
      
      <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog"
        aria-labelledby="passwordModalLabel" aria-hidden="true" data-show="false">
        <div class="modal-dialog" style="width:30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="passwordTitle"><spring:message code="changePassword"/></h4>                   
                </div>
                <div class="modal-body">
                    <div class="container" style="margin-left: 10px">
                    <form id="planForm">
                        <div class="row" style="margin-top: 10px">
                            <div class="col-xs-3" style="width:30%;">
                                <div class="input-group">
                                    <span class="input-group-addon"><spring:message code="newPassword"/></span>
                                    <input type="password" class="form-control" id="newPassword">
                                </div>
                            </div>
                        </div>
	                    <div class="row" style="margin-top: 10px">
	                        <div class="col-xs-3" style="width:30%;">
	                            <div class="input-group">
                                    <span class="input-group-addon"><spring:message code="confirmPwd"/></span>
                                    <input type="password" class="form-control" id="confirmPassword">
                                </div>
	                        </div>
	                    </div>
                    </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="savepassword"><spring:message code="save"/></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="close"/></button>
                </div>
                </div>
        </div>
    </div> 
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>