<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<!-- 绝对路径的写法,动态获取项目的 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery.js"></script>
<script type="text/javascript" src="<c:url value="/bootstrap/js/bootstrap.js"></c:url>"></script>


</head>
<body>
	<div style="width: 500px; margin: 0px auto;">
		<div class="page-header">
			<h1>个人登录</h1><h2>
			<a href="${pageContext.request.contextPath }/addUser.action">注册用户</a></h2>
		</div>
		
		<div class="alert alert-danger" id="error">
			
		</div>
		<form id="loginForm"> 
			<div class="form-group">
				<label for="username">用户名</label> <input type="text"
					class="form-control" id="name" placeholder="请输入用户名"
					name="name">
			</div>
			<div class="form-group">
				<label for="pwd">密&nbsp;&nbsp;&nbsp;码</label> <input
					type="password" class="form-control" id="pwd"
					placeholder="请输入密码" name="pwd">
			</div>
			<button type="button" class="btn btn-success" id="loginBtn">登录</button>
	</form>
	</div>
	<!-- 使用Ajax实现登录, 无刷新 -->
	<script type="text/javascript">
		$(function(){
			$("#loginBtn").click(function(){
				var params = $("#loginForm").serialize();
				$.ajax({
					url:"${pageContext.request.contextPath }/login.action",
					data:params,
					method:"POST",
					dataType:"json",
					success:function(rs){
						$("#error").html("");
						if(rs.status=="success"){
							/* jsp/index.action */
							location.href="/jsp/index.action";
						}else{
							$("#error").html(rs.msg);
						}
					}
				});
			});
		});
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>