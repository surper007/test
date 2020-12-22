<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span id="erSpan"></span>
	<form id="loginForm">
		用户名：<input type="text" name="userName" id="userName" /> <br /> 密码<input
			type="text" name="pwd" id="pwd" /><br /> <input type="button"
			value="ajax表单提交" onclick="login()" /> <input type="button"
			value="ajax单独提交" onclick="login2()" />
	</form>

	<script type="text/javascript">
	function login(){
		  /**
		  * 提交方式一：整个表单的数据提交方式
		  */
		   //serialize():表单序列化
		  var params = $("#loginForm").serialize();
		  //post请求，params:请求参数，将数据传到后端，function(result){}:回调函数，接收后端返回的数据，参数名（result）可随便取
		  $.post("/ajax",params,
				  function(result){
		   //因为SpringMVC框架和Jquery框架的联合作用，使得传回来的result保留了原有数据类型
		   if(result){//登录成功
		    window.location.href="http://www.baidu.com" ;
		   }else{
		    //完全等于 document.getElementById("erSpan").innerHTML = result+":"+"登录失败！";
		    $("#erSpan").html(result+":"+"登录失败！");
		   }
		  })
		 }
		 function login2(){
		  /**
		  *提交方式二：一个个数据上传的方式
		  */
		  //以下两句相当于 document.getElementById("userName").value;
		  var userName = $("#userName").val();
		  var pwd = $("#pwd").val();
		  //写法一：key值必须要加"";
		  //var params = {"userName":userName,"pwd":pwd};
		  //写法二：
		  var params = "userName="+userName+"&pwd="+pwd;
		  //发送请求到后台
		  //如果要传参，直接在第二个参数中传就可以了
		  $.post("/ajax",params,function(result){
		   //因为SpringMVC框架和Jquery框架的联合作用，使得传回来的result保留了原有数据类型
		   if(result){
		    window.location.href="http://www.baidu.com" ;
		   }else{
		    //完全等于document.getElementById("erSpan").innerHTML = result+":"+"登录失败！";
		    $("#erSpan").html(result+":"+"登录失败！");
		   }
		  }) 
		 }
		</script>

</body>
</html>