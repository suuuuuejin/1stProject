<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#div1{
	font-size:14px;
	font-weight:bold;
	width:100%;
	height:190px;
	background-color:yellow;
	vertical-align:middle;
	line-height:2.0;
}
</style>
<script>
 user_id=user_id.trim();
 if(user_id.length)
</script>
</head>
<body>
<div id="div1">
<br><br>
<c:if test=${cnt ==0}>
	<span>사용 가능한 아이디입니다.</span>
	<script>
		opener.document.frm.chk.value="1"; //opener 부모창
	</script>
</c:if>

<c:if test=${cnt !=0}>
	<span>이미 사용중인 아이디입니다.</span>
	<script>
		opener.document.frm.chk.value="0"; 
	</script>
</c:if>



<br><br>
<button type="button" onclick="self.close()">닫기</button>
</div>
</body>
</html>