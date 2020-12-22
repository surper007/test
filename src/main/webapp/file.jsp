<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/common.js"></script>
</head>
<body>

	<form method="post" action="/upload" enctype="multipart/form-data">
		<div class="form-group">
			<label for="upload" class="col-sm-2 control-label">图片</label>
			<div class="col-sm-3">
				<img id="preview" height="160" width="120"
					src="${pageContext.request.contextPath }/image/photo.jpg"
					style="padding: 2px 2px 5px; border: 1px #ddd solid;" /> <input
					type="file" class="form-control" id="fileupload" name="upload"
					onchange="javascript:setImgView('fileupload','preview');" />
			</div>
		</div>
		<input type="submit" value="提交">
	</form>

</body>
</html>