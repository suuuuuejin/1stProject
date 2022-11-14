<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body class="text-center">
<c:if test="${!empty mvo}">
${mvo.login_id }님 반갑습니다.
<button onclick="location.href='${cpath}/main.do'">메인으로</button>
<button onclick="location.href='${cpath}/logout.do'">로그아웃</button>
</c:if>

 <c:if test="${empty mvo}">
 <%

    out.println("<script>");

    out.println("alert('아이디나 비밀번호가 틀렸습니다');");

    out.println("</script>");

 %>
 <h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>
	 <form action="${cpath}/login.do" method="post">
			 <div class="form-floating">
            <label for="user_id">아이디</label>
            <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디 입력...">
         </div>
         <div class="form-floating">
            <label for="pw">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
         </div>
         
           
         </div>
         <button type="submit">로그인</button>
         <button type="button" onclick="location.href='${cpath}/joinForm.do'">회원가입</button>
      </form>
	</c:if>
</body>
</html>