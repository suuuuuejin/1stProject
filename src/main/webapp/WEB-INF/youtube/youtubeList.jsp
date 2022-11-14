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
<link href="${cpath}/css/my/hj.css" rel="stylesheet" />

<!-- Libs JS -->

<!-- Tabler Core -->
<script src="${cpath}/js/tabler.min.js" defer></script>



<!-- my -->
<link rel="stylesheet" href="${cpath}/css/my/sub.css">
<link rel="stylesheet" href="${cpath}/css/my/hj.css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	viewport-fit=cover">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<link rel="shortcut icon" href="/img/favi/favicon.ico">
<link rel="apple-touch-icon" sizes="57x57"
	href="${cpath }/img/fav/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="${cpath }/img/fav/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="${cpath }/img/fav/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="${cpath }/img/fav/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="${cpath }/img/fav/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="${cpath }/img/fav/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="${cpath }/img/fav/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="${cpath }/img/fav/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="${cpath }/img/fav/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="${cpath }/img/fav/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="${cpath }/img/fav/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="${cpath }/img/fav/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${cpath }/img/fav/favicon-16x16.png">
<link rel="manifest" href="${cpath }/img/fav/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="${cpath }/img/fav//ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

</head>



<body>
	<div class="page">
		<div class="page-main">

			<jsp:include page="../../header/header.jsp" />
			<!----------------------header end--------------------->
			<div class="cover-wrap">
				<div class="container">
					<div class="cover">
						<img src="${cpath}/img/my/ylogo.png" style="width: 300px">
					</div>
				</div>
			</div>
			<!------------여기부터 입력----------->
			<div class="page-wrapper">
				<div class="page-body">
					<div class="container-md">
						<div class="row row-card mt-3">

							<c:forEach var="vo" items="${list}">
								<div class="col-lg-4 mb-3">
									<div class="card ">
										<div class="text-muted">
											<image src="${vo.logo }" style="width:45px;">
											<span class="text-center ms-3">${vo.name }</span>
										</div>
										<div style="height: 210px">
											<iframe width="100%" height="100%" src="${vo.video }"
												title="YouTube video player" frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>
										</div>
										<div class="card-footer">
											<h4>${vo.content }</h4>
										</div>
									</div>
								</div>
							</c:forEach>

							<div class="card-footer d-flex align-items-center py-2">
								<ul class="pagination m-0 m-auto">
									<c:if test="${youtube.pagingPerCount<youtube.start_page}">
										<li class="page-item abled"><a class="page-link"
											href="${cpath }/youtubelist.do?p=${youtube.start_page-1}"
											tabindex="-1" aria-abled="true"> <!-- Download SVG icon from http://tabler-icons.io/i/chevron-left -->
												<svg xmlns="http://www.w3.org/2000/svg" class="icon"
													width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
													stroke="currentColor" fill="none" stroke-linecap="round"
													stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z"
														fill="none" />
                        page += <polyline points="15 6 9 12 15 18" /></svg>prev
										</a></li>
									</c:if>
									<c:forEach var="i" begin="${youtube.start_page}"
										end="${youtube.end_page}">
										<c:choose>
											<c:when test="${youtube.currentPage eq i}">
												<li class="page-item active"><a class="page-link"
													href="${cpath }/youtubelist.do?p=${i}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item "><a class="page-link"
													href="${cpath }/youtubelist.do?p=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<!-- Download SVG icon from http://tabler-icons.io/i/chevron-left -->

									<c:if test="${youtube.numPageCount>youtube.end_page}">
										<li class="page-item abled"><a class="page-link"
											href="${cpath }/youtubelist.do?p=${youtube.end_page+1}"
											tabindex="1" aria-abled="true">next <svg
													xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
													height="24" viewBox="0 0 24 24" stroke-width="2"
													stroke="currentColor" fill="none" stroke-linecap="round"
													stroke-linejoin="round">
                      <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                      page += <polyline points="9 6 15 12 9 18" /></svg></a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="../../footer/footer.jsp" />
</body>
</html>