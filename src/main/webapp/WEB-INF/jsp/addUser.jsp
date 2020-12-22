<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新物资</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery-datepicker/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/jquery-datepicker/jquery-ui.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/common.js"></script>	
<script type="text/javascript">
	$(function() {
		$("#brithday").datepicker({
			changeYear : true,
			maxDate : new Date(),
		});
	});
		
		
</script>

</head>
<body>
	<div style="width: 800px; margin: 0px auto;">
		<div class="page-header">
			<h1>更新事件</h1>
		</div>


		<form class="regist form-horizontal" action="/regist.action" method="post"
		 enctype="multipart/form-data">

			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="name"
						name="name" />
				</div>
			</div>
			<div class="form-group">
				<label for="pwd" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-3">
					<input type="password" class="form-control" id="pwd"
						name="pwd" />
				</div>
			</div>
			<div class="form-group">
				<label for="upload" class="col-sm-2 control-label">图片</label>
				<div class="col-sm-3">
				<img id="preview" height="160" width="120"
							src="${pageContext.request.contextPath }/image/photo.jpg"
							style="padding: 2px 2px 5px; border: 1px #ddd solid;" />
					<input type="file" class="form-control" id="fileupload"
						name="upload" onchange="javascript:setImgView('fileupload','preview');" />
				</div>
			</div>
			<div class="form-group">
				<label for="admin" class="col-sm-2 control-label">是否是管理员</label>
				<div class="col-sm-3">
				   <select class="form-control" name="admin" id="admin">
				      <option value="-1" selected="selected">权限选择</option>
				      <option value="1">管理员</option>
				      <option value="0">普通用户</option>
				   </select>
				</div>
			</div>
			<div class="form-group">
					<label for="inputBirthday" class="col-sm-2 control-label">出生日期</label>
					<div class="col-sm-3">
						<input class="form-control" type="text" value=""
							readonly="readonly" name="brithday" id="brithday" />
					</div>
				</div>
			<div class="form-group">
				<label for="state" class="col-sm-2 control-label">用户状态</label>
				<div class="col-sm-3">
				<select class="form-control" name="state" id="state">
				      <option value="-1" selected="selected">用户状态</option>
				      <option value="1">存在</option>
				      <option value="0">不存在</option>
				  </select>
				</div>
			</div>


			<div class="form-group" style="clear: both;">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default btn-sm">提交</button>
					<a href="${pageContext.request.contextPath }/jsp/index.action"
						class="btn btn-default btn-sm" role="button">返回</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>