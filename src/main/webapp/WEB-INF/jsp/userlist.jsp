<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jquery-datepicker/jquery-ui.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery-datepicker/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		
		 //全选
         $("#all").click(function(){      	
        	$("input[name=ids]").prop("checked",$(this).prop("checked"));
         });
		 
	 
	});
	
	 function  queryData(num){
			$("#pi").val(num);
			//1.提交表单
			$("#queryForm").submit();
		} 
	

</script>
</head>
<body>
	<div class="page-header">
		<h1 style="color: green; margin-left: 30px;">欢迎${current}</h1>
	</div>

	<div class="queryForm" style="margin-bottom: 20px;">
		<!-- 查询条件列表 -->
			<form class="form-inline"
				action="${pageContext.request.contextPath }/userlist"
				id="queryForm">
				<input type="hidden" name="pageIndex" value="1" id="pi" />
				
			</form>
	</div>
	<div class="table-bordered">
		<form id="userListForm">
			<table class="table   table-hover">
				<tr>
					<th><input id="all" type="checkbox">全选</th>
					<th>用户名</th>
					<th>密码</th>
					<th>图片</th>
					<th>是否是管理员</th>
					<th>生日</th>
					
				</tr>
				<c:forEach items="${pages.datas }" var="userfolist">
					<tr>
						<td><input name="ids" type="checkbox"
							value="${userfolist.id}" /></td>
					    <td>${userfolist.name } </td>
						<td>${userfolist.pwd }</td>
						<td><img height="60" width="80" alt="图片" src="/images/${userfolist.photo }"></td>
						<td>${userfolist.admin }</td>
						<td><fmt:formatDate value="${userfolist.brithday }"
								pattern="yyyy-MM-dd" /></td>
							
						
					</tr>
				</c:forEach>

			</table>
		</form>
		<div style="margin: 0px auto; width: 50%;">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pages.pageIndex == 1 }">
							<li class="disabled"><a href="#"><span>首页</span></a></li>
							<li class="disabled"><a href="#"><span>上一页</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="JavaScript:void(0);" onclick="queryData(1)"><span>首页</span></a></li>
							<li><a
								href="JavaScript:void(0);"  onclick="queryData(${pages.pageIndex-1})"><span>上一页</span></a></li>
						</c:otherwise>
					</c:choose>

					<!-- 	<li class="active"><a href="#">1</a></li> -->
					<!-- 定义两个变量:  开始序号, 结束序号
				  scope: 默认page域
				 -->
					<!--c:when 总页数 <= 显示页码个数 -->
					<!-- start:开始序号 -->
					<!--end: 结束序号  -->
					<!--c:otherwise 总页数>=显示页码个数 -->
					<!-- c:if test="${start < 1}" 头溢出 -->
					<!-- c:if test="${end > pages.totalPage }": 尾溢出 -->
					<c:choose>
						<c:when test="${pages.totalPage <= 5 }">
							<c:set var="start" value="1" />
							<c:set var="end" value="${pages.totalPage}" />
						</c:when>
						<c:otherwise>
							<c:set var="start" value="${pages.pageIndex -2 }" />
							<c:set var="end" value="${pages.pageIndex + 2 }" />
							<c:if test="${start < 1}">
								<c:set var="start" value="1" />
								<c:set var="end" value="${start + 4 }" />
							</c:if>
							<c:if test="${end > pages.totalPage }">
								<c:set var="end" value="${pages.totalPage }" />
								<c:set var="start" value="${end - 4 }" />
							</c:if>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i == pages.pageIndex }">
								<li class="active"><a href="#">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="JavaScript:void(0);" onclick="queryData(${i})">${i }</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>

					<c:choose>
						<c:when test="${pages.pageIndex == pages.totalPage }">
							<li class="disabled"><a href="#"><span>下一页</span></a></li>
							<li class="disabled"><a href="#"><span>最后一页</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="JavaScript:void(0);" onclick="queryData(${pages.pageIndex + 1})"><span>下一页</span></a></li>
							<li><a
								href="JavaScript:void(0);" onclick="queryData(${pages.totalPage})"><span>最后一页</span></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		
		
	</div>

</body>
</html>