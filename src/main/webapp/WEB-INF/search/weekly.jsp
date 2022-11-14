<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>FOR THE URTH</title>
<!-- CSS files -->
<link href="${cpath}/css/tabler.css" rel="stylesheet" />
<link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

<!-- Libs JS -->

<!-- Tabler Core -->
<script src="${cpath}/js/tabler.min.js" defer></script>

<!-- my -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="${cpath}/css/my/sub.css">
<link rel="stylesheet" href="${cpath}/css/my/weekely.css">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	viewport-fit=cover" >
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>


<link rel="shortcut icon" href="/img/favi/favicon.ico">
<link rel="apple-touch-icon" sizes="57x57" href="${cpath }/img/fav/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="${cpath }/img/fav/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="${cpath }/img/fav/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="${cpath }/img/fav/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="${cpath }/img/fav/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="${cpath }/img/fav/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="${cpath }/img/fav/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="${cpath }/img/fav/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="${cpath }/img/fav/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="${cpath }/img/fav/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="${cpath }/img/fav/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="${cpath }/img/fav/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="${cpath }/img/fav/favicon-16x16.png">
<link rel="manifest" href="${cpath }/img/fav/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="${cpath }/img/fav//ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
</head>
<body>

	<div class="page">
		<div class="page-main">
			<!-- WEB-INF폴더에서 사용시 page="../header/header.jsp"로 변경 -->
			<jsp:include page="../../header/header.jsp" />
			<!-- 여기까지 header -->
			<div class="cover-wrap">
				<div class="container">
					<div class="cover">주간인기검색어</div>
				</div>
			</div>
			<!------------여기부터 입력----------->
			<div class="container-wrap bg-primary-lt">
				<div class="container-xxl">
					<div class="row bb-line">
						<div class="w-sec py-5 px-4 ">
							<!-- <div class="col-4"> -->
							<c:forEach var="vo" items="${zero_list}" end="0">
							<span>UPDATE : ${vo.day}</span>
							</c:forEach>
							<h1 class="mt-2">
								이번주 <strong>"제로웨이스트"</strong>의<br>인기검색어는?
							</h1>
							<!-- </div> -->
						</div>
						<div class="col mx-3 py-4">
							<c:forEach var="vo" items="${zero_list}" end="4" varStatus="st">
							<a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${vo.title }" target=_blank>
								<div class="weekely mt-2">
									<div class="w-num p-2">0${st.count}</div>
									<div class="w-title py-2">${vo.title }</div>
								</div>
							</a>
							</c:forEach>
						</div>
						<div class="col me-3 py-4">
							<c:forEach var="vo" items="${zero_list}" begin="5" end="9" varStatus="st">
							<a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${vo.title }" target=_blank>
								<div class="weekely mt-2">
									<div class="w-num p-2">
									<c:choose>
									<c:when test="${st.index+1 eq 10 }">
									${st.index+1}
									</c:when>
									<c:otherwise>
									0${st.index+1}
									</c:otherwise>
									</c:choose></div>
									<div class="w-title py-2">${vo.title }</div>
								</div>
								</a>
							</c:forEach>
						</div>
					</div>
				
					<div class="row bb-line">
						<div class="vg-bg w-sec py-5 px-4 ">
							<!-- <div class="col-4"> -->
							<c:forEach var="vo" items="${vegan_list}" end="0">
							<span>UPDATE : ${vo.day}</span>
							</c:forEach>
							<h1 class="mt-2">
								이번주 <strong>"비건"</strong>의<br>인기검색어는?
							</h1>
							<!-- </div> -->
						</div>
						<div class="col mx-3 py-4">
							<c:forEach var="vo" items="${vegan_list}" end="4" varStatus="st">
							<a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${vo.title }" target=_blank>
								<div class="weekely mt-2">
									<div class="w-num p-2">0${st.count}</div>
									<div class="w-title py-2">${vo.title }</div>
								</div>
								</a>
							</c:forEach>
						</div>
						<div class="col me-3 py-4">
							<c:forEach var="vo" items="${vegan_list}" begin="5" end="9" varStatus="st">
								<a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${vo.title }" target=_blank>
								<div class="weekely mt-2">
									<div class="w-num p-2">
									<c:choose>
									<c:when test="${st.index+1 eq 10 }">
									${st.index+1}
									</c:when>
									<c:otherwise>
									0${st.index+1}
									</c:otherwise>
									</c:choose></div>
									<div class="w-title py-2">${vo.title }</div>
								</div>
								</a>
							</c:forEach>
						</div>
					</div>
					
					<div class="row">
						<div class="pl-bg w-sec py-5 px-4 ">
							<!-- <div class="col-4"> -->
							<c:forEach var="vo" items="${plastic_list}" end="0">
							<span>UPDATE : ${vo.day}</span>
							</c:forEach>
							<h1 class="mt-2">
								이번주 <strong>"플라스틱제로"</strong>의<br>인기검색어는?
							</h1>
							<!-- </div> -->
						</div>
						<div class="col mx-3 py-4">
							<c:forEach var="vo" items="${plastic_list}" end="4" varStatus="st">
							<a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${vo.title }" target=_blank>
								<div class="weekely mt-2">
									<div class="w-num p-2">0${st.count}</div>
									<div class="w-title py-2">${vo.title }</div>
								</div>
								</a>
							</c:forEach>
						</div>
						<div class="col me-3 py-4">
							<c:forEach var="vo" items="${plastic_list}" begin="5" end="9" varStatus="st">
							<a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${vo.title }" target=_blank>
								<div class="weekely mt-2">
									<div class="w-num p-2">
									<c:choose>
									<c:when test="${st.index+1 eq 10 }">
									${st.index+1}
									</c:when>
									<c:otherwise>
									0${st.index+1}
									</c:otherwise>
									</c:choose></div>
									<div class="w-title py-2">${vo.title }</div>
								</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- footer -->
			<!-- WEB-INF폴더에서 사용시 page="../footer/footer.jsp"로 변경 -->
			<jsp:include page="../../footer/footer.jsp" />
		</div>
	</div>
</body>
</html>