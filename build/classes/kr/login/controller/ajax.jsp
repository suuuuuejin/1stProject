<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn").click(function() {
			var su1 = $("#num").val(); 
			$.ajax({
				url : "${cpath}/ajax.do", 
				type : "get",
				data : {
					"num" : num					
				}, 
				success : resultHtml(),
				error : function() {
					alert("error");
				}
			});

		});
	});
	function resultHtml(data) { 
		$("#result").html(data);
	}
</script>
</head>
<body>
<label>데이터입력: </label>
	<input type="text" id="num">
	<button id="btn">계산</button>
	<div id="result">결과: </div>
</body>
</html>