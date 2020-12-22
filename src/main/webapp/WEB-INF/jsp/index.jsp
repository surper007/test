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
		 
		 //批量删除
		 $("#batchDel").click(function(){
			 var queryStatement = "?";
			//获取所有选择的元素
			if($("input[name=ids]:checked").size() > 0){ 
				//有选中
				//发送一个请求给后台
				location.href="${pageContext.request.contextPath }/batchDelRecord.action?"+$("#userListForm").serialize();
				
			}else{  //没有选中
				alert("请选择要删除的用户");
			}
		 });
		 
		//添加事件
		$("#insertRecord").click(function(){
				location.href="${pageContext.request.contextPath }/insertRecord.action";
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
		<h1 style="color: green; margin-left: 30px;"><a href="${pageContext.request.contextPath }/userlist" >用户列表</a></h1>
	</div>

	<div class="queryForm" style="margin-bottom: 20px;">
		<!-- 查询条件列表 -->
			<form class="form-inline"
				action="${pageContext.request.contextPath }/jsp/index.action"
				id="queryForm">
				<input type="hidden" name="pageIndex" value="1" id="pi" />
				
			</form>
	</div>
	<div class="table-bordered">
		<form id="userListForm">
			<table class="table   table-hover">
				<tr>
					<th><input id="all" type="checkbox">全选</th>
					<th>标题名</th>
					<th>标题内容</th>
					<th>标题时间</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pages.datas }" var="infolist">
					<tr>
						<td><input name="ids" type="checkbox"
							value="${infolist.id}" /></td>
						<td>${infolist.title }</td>
						<td>${infolist.content }</td>
						<td><fmt:formatDate value="${infolist.occurrenceTime }"
								pattern="yyyy-MM-dd" /></td>
						 <td><a
							href="${pageContext.request.contextPath }/findRecord.action?id=${infolist.id}"
							class="sh" id="update">修改</a>
							
						</td>
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
						<li><a href="JavaScript:void(0);"  onclick="queryData(1)"><span>首页</span></a></li>
						<li><a href="JavaScript:void(0);"
							onclick="queryData(${pages.pageIndex-1})"><span>上一页</span></a></li>
					</c:otherwise>
				</c:choose>
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
							<li><a href="JavaScript:void(0);" onclick="queryData(${i})">${i }</a></li>
						</c:otherwise>
					</c:choose>

				</c:forEach>

				<c:choose>
					<c:when test="${pages.pageIndex == pages.totalPage }">
						<li class="disabled"><a href="#"><span>下一页</span></a></li>
						<li class="disabled"><a href="#"><span>最后一页</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="JavaScript:void(0);"
							onclick="queryData(${pages.pageIndex + 1})"><span>下一页</span></a></li>
						<li><a href="JavaScript:void(0);"
							onclick="queryData(${pages.totalPage})"><span>最后一页</span></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<div class="footer" style="text-align: right;">
	    <button type="button" class="btn btn-success" id="insertRecord">添加事件</button>
		<button type="button" class="btn btn-danger" id="batchDel">批量删除</button>
		
	</div>

</body>
</html>