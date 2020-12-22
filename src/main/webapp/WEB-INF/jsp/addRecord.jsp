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
		$("#occurrenceTime").datepicker({
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


		<form class="form-horizontal"
			action="${pageContext.request.contextPath }/addRecord.action"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">标&nbsp;&nbsp;题&nbsp;号</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="inputEmail3"
						name="id" />
				</div>
			</div>
			<input name="id" value="${info.id}" type="hidden" />

			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">标&nbsp;&nbsp;题&nbsp;名</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="inputEmail3"
						name="title" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">标题内容</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="inputEmail3"
						name="content" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">标题时间</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="occurrenceTime"
						name="occurrenceTime"
						   /><span>(yyyy-MM-dd)</span>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">标题状态</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="inputEmail3"
						name="state" />
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