<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<% pageContext.setAttribute("newLineChar", "\n"); %>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
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
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
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
<link rel="stylesheet" href="${cpath}/css/my/kakao.css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	viewport-fit=cover" >
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	function vgList() {
		//게시판 리스트를 가져오기
		$.ajax({
				url : "${cpath}/myComVg.do",
				type : "get",
				dataType : "json",
				success : resultVg,
				error : function() {
					alert("error");
				}
			})
	};
	function resultVg(data) { 
		var html = "";
		$.each(data, function(index, obj) {
				
				html += "<tr>";
				html += "<td class='text-center'></td>";
				html += "<td><a href='#' class='text-reset '>" + obj.buy_cmt_content+"</a></td>";
				html += "<td class='text-muted  text-center'><img src='${cpath}${grade}' alt='icon' height='20px' width='auto'>" + obj.login_id+"</td>";
				html += "<td class='text-muted  text-center'>" + obj.buy_cmt_date.split(' ')[0]+"</td>";
				html += "</tr>";
		})
		$("#list").html(html);
	};
	
	function toList() {
		
		//게시판 리스트를 가져오기
		$.ajax({
				url : "${cpath}/myComTo.do",
				type : "get",
				dataType : "json",
				success : resultTo,
				error : function() {
					alert("error");
				}
			})
	};
	
	function resultTo(data) { 
		var html = "";
		$.each(data, function(index, obj) {
			
				html += "<tr>";
			 	html += "<td class='text-center'></td>"; 
				html += "<td><a href='#' class='text-reset '>" + obj.zw_cmt_content+"</a></td>";
				html += "<td class='text-muted  text-center'><img src='${cpath}${grade}' alt='icon' height='20px' width='auto'>" + obj.login_id+"</td>";
				html += "<td class='text-muted  text-center'>" + obj.zw_cmt_date.split(' ')[0]+"</td>";
				html += "</tr>";
		})
		$("#listT").html(html);
	};
	
function imgList() {
		
		//게시판 리스트를 가져오기
		$.ajax({
				url : "${cpath}/myComImg.do",
				type : "get",
				dataType : "json",
				success : resultImg,
				error : function() {
					alert("error");
				}
			})
	};
	
	function resultImg(data) { 
		var html = "";
		$.each(data, function(index, obj) {
			
				html += "<tr>";
				html += "<td class='text-center'></td>";
				html += "<td><a href='#' class='text-reset '>" + obj.zw_cmt_content+"</a></td>";
				html += "<td class='text-muted  text-center'><img src='${cpath}${grade}' alt='icon' height='20px' width='auto'>" + obj.login_id+"</td>";
				html += "<td class='text-muted  text-center'>" + obj.zw_cmt_date.split(' ')[0]+"</td>";
				html += "</tr>";
		})
		$("#listI").html(html);
	};
	
	function gradeinfo(){
		var url="${cpath}/gradeinfo.do";
		window.open(url,"등급안내","width=400,height=600")
	}
</script>
</head>
<body>
	<!-- WEB-INF폴더에서 사용시 page="../header/header.jsp"로 변경 -->
	<jsp:include page="../../header/header.jsp" />
	<!------------여기부터 입력----------->
	<div class="container-xl">
		<div class="page-header mb-3">
			<div class="row align-items-center mw-100 mt-4">
				<div class="col">
					<div class="mb-1"></div>

				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-3 px-4 ">
				<!--프로필 시작-->

				<div class="card-body text-center mb-4">
						<c:if test="${mvo.u_grade eq '지구프랜즈'}">
					<span class="avatar avatar-xl mb-3 avatar-rounded" style="background-image: url(${cpath}/img/my/p1.jpg)"></span>
					</c:if>
					<c:if test="${mvo.u_grade eq '지구지킴단'}">
					<span class="avatar avatar-xl mb-3 avatar-rounded" style="background-image: url(${cpath}/img/my/p2.jpg)"></span>
					</c:if>
					<c:if test="${mvo.u_grade eq '지구특공대'}">
					<span class="avatar avatar-xl mb-3 avatar-rounded" style="background-image: url(${cpath}/img/my/p3.jpg)"></span>
					</c:if>
					<c:if test="${mvo.u_grade eq '지구어벤져스'}">
					<span class="avatar avatar-xl mb-3 avatar-rounded" style="background-image: url(${cpath}/img/my/p4.jpg)"></span>
					</c:if>
					<c:if test="${mvo.u_grade eq 'admin'}">
					<span class="avatar avatar-xl mb-3 avatar-rounded" style="background-image: url(${cpath}/img/my/kf.gif)"></span>
					</c:if>

					<h3 class="m-0 mb-1">
						<a href="#">${mvo.u_nick }</a>
					</h3>
					<div class="text-muted">${mvo.login_id }</div>
					<div class="mt-3">
						<a href="javascript:gradeinfo()" ><span class="btn btn-pill btn-cyan">${mvo.u_grade}</span></a>
					</div>
				</div>
				<!-- 프로필 끝-->
				<c:if test="${mvo.u_grade ne '지구어벤져스'}">
				<div class="progress mb-2">
					<div class="progress-bar" style="width: ${mvo.u_point}%" role="progressbar"
						aria-valuenow="38" aria-valuemin="0" aria-valuemax="100"
						aria-label="38% Complete">
						<span class="visually-hidden">38% Complete</span>
					</div>
				</div>
				<p class="text-center">
					<small>다음 등급까지 <span class="text-orange strong">${100-mvo.u_point}</span> 포인트</small>
				</p>
				</c:if>
				<div
					class="list-group list-group-transparent mb-3 ml-3  theme-light mb-5">
					<a
						class="list-group-item list-group-item-action d-flex align-items-center"
						href="${cpath}/memberView.do"> 내 프로필 수정 </a> <a
						class="list-group-item list-group-item-action d-flex align-items-center"
						href="${cpath}/mypageWrite.do"> 내가 쓴 글 <small class="text-muted ms-auto">${cmw} </small>
					</a> <a
						class="list-group-item list-group-item-action d-flex align-items-center"
						href="${cpath}/mypageComment.do"> 내가 쓴 댓글 <small class="text-muted ms-auto">${cmc} </small>
					</a>
				</div>
			</div>
			<div class="col-12 col-md-9">
				<div class="row">
					<div class="col-12">
						<!-- 게시판-->
						<div class="ms-1 mb-3 mt-3">
							<h1>내가 쓴 댓글</h1>
						</div>
						<div class="col-12 mt-1 mb-5">
							<!-- tab -->
							<div class="card">
								<ul class="nav nav-tabs nav-fill" data-bs-toggle="tabs"
									role="tablist">
									<li class="nav-item" role="presentation"><a
										href="#tabs-home-14" class="nav-link active"
										data-bs-toggle="tab" aria-selected="false" role="tab"
										tabindex="-1">자유게시판</a></li>
									<li class="nav-item" role="presentation" onclick="vgList()" >
										<a class="nav-link" data-bs-toggle="tab" aria-selected="false"
										role="tab" tabindex="-1" href="#tabs-profile-14">공동구매</a>
									</li>
									<li class="nav-item" role="presentation" onclick="toList()"><a
										href="#tabs-activity-14" class="nav-link" data-bs-toggle="tab"
										aria-selected="true" role="tab">함께해요</a></li>
									<li class="nav-item" role="presentation" onclick="imgList()"><a
										href="#tabs-img-14" class="nav-link" data-bs-toggle="tab"
										aria-selected="false" role="tab" tabindex="-1">실천해요</a></li>
								</ul>
								<div class="card" id="sche">
									<div class="p-0 tab-content card-body card-body-scrollable card-body-scrollable-shadow" >
										<div class="tab-pane active divide-y" id="tabs-home-14"
											role="tabpanel">
											<div class="">
												<div class="bg-light border-y">
													<div class="table-responsive">
														<table class="table table-vcenter table-hover">
															<thead>
																<tr>
																	<!-- 제로웨이스트 -->
																	<th></th>
																	<th>내용</th>
																	<th>ID</th>
																	<th>등록일</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="vo" items="${list}">
																	<tr>
																		<td class="text-center"></td>
																		<td><a href="#" class="text-reset ">${vo.zw_cmt_content}</a></td>
																		<td class="text-muted  text-center"><img src="${cpath }${grade}"
																			alt="icon" height='20px' width='auto'>${vo.login_id}</td>
																		<td class="text-muted  text-center">${fn:split(vo.zw_cmt_date," ")[0]}</td>
																		
																	</tr>
																</c:forEach>


															</tbody>
														</table>
													</div>
													
												</div>
											</div>
										</div>
										<div class="tab-pane divide-y" id="tabs-profile-14" role="tabpanel">
											<div>
												<div class="bg-light border-y">
													<div class="table-responsive">
														<table class="table table-vcenter table-hover">
															<thead>
																<tr>
																	<!-- 비건 -->
																	<th></th>
																	<th>내용</th>
																	<th>ID</th>
																	<th>등록일</th>
																</tr>
															</thead>
															<tbody id="list">

															</tbody>
														</table>
													</div>
									
												</div>
											</div>
										</div>
										<div class="tab-pane divide-y " id="tabs-activity-14" role="tabpanel">
											<div class="">
												<div class="bg-light border-y ">
													<div class="table-responsive">
														<table class="table table-vcenter table-hover">
															<thead>
																<tr>
																	<!-- 함께해요 -->
																	<th></th>
																	<th>내용</th>
																	<th>ID</th>
																	<th>등록일</th>
																</tr>
															</thead>
															<tbody id="listT">
																

															</tbody>
														</table>
													</div>
												
												</div>
											</div>
										</div>
										<div class="tab-pane divide-y" id="tabs-img-14" role="tabpanel">
											<div>
												<div class="bg-light border-y">
													<div class="table-responsive">
														<table class="table table-vcenter table-hover">
															<thead>
																<tr>
																	<th></th>
																	<th>내용</th>
																	<th>ID</th>
																	<th>등록일</th>
																</tr>
															</thead>
															<tbody id="listI">
																

															</tbody>
														</table>
													</div>
												
													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- tab끝 -->


						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	</div>
	<!-- footer -->
	<!-- WEB-INF폴더에서 사용시 page="../footer/footer.jsp"로 변경 -->
	</div>
	<jsp:include page="../../footer/footer.jsp" />
	</div>



	</script>
</body>
</html>