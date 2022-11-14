<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
<h2>회원가입 성공</h2>
<button type="submit" onclick="loction.href='${cpath}/loginForm.do'">로그인하기</button>
<button type="submit" onclick="loction.href='${cpath}/main.do'">메인으로</button>
          
    
</body>
</html>