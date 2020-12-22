<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录界面</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }js/jquery.js"></script>
</head>
<body>
	<script type="text/javascript">
  
           /* function a1() {
            $.ajax({
                url: "${pageContext.request.contextPath}/a1",
                date: {
                    'name': $("TextName").val()
                },
                success: function(date, status) {
                    alert(date);
                    alert(status);

                }

            })

        } */
           
           function a2() {
               $.ajax({
                   url: "${pageContext.request.contextPath}/a2",
                   date: {
                       'name': $("name2").val()
                   },
                   success: function(date, status) {
                       alert(date);
                       alert(status);

                   }

               })

           }
           
           
              
    </script>
	用户名:
	<!-- <input type="text" id="textName"   onblur="a1()"> -->
	<input type="text" id="name2" onblur="a2()">

</body>
</html>