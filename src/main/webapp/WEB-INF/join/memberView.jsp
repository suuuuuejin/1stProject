<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>FOR THE URTH</title>
<!-- CSS files -->
<link href="./css/tabler.css" rel="stylesheet" />
<link href="./css/tabler-vendors.css" rel="stylesheet" />

<!-- Libs JS -->

<!-- Tabler Core -->
<script src="./js/tabler.min.js" defer></script>

<!-- my -->
<link rel="stylesheet" href="./css/my/sub.css">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	viewport-fit=cover" >
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>


</head>
<script type="text/javascript">

function fn_submit(login_id){
	location.href="${cpath}/memberUpdateForm.do?login_id="+login_id;
}
function fn_subdel(login_id){
	if(confirm("정말 탈퇴하시겠습니까?"))
	location.href="${cpath}/memberDelete.do?login_id="+login_id;
}
function gradeinfo(){
	var url="${cpath}/gradeinfo.do";
	window.open(url,"등급안내","width=400,height=600")
}
</script>

<body>
	<div class="page">
		<div class="page-main">
			<!-- WEB-INF폴더에서 사용시 page="../header/header.jsp"로 변경 -->
			<jsp:include page="../../header/header.jsp" />
			<!-- 여기까지 header -->


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
						<a href="javascript:gradeinfo()"><span class="btn btn-pill btn-cyan">${mvo.u_grade}</span></a>
					</div>
				</div>
				<!-- 프로필 끝-->

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
				<div class="row">
				<div class="col"></div>
					<!-- <div class="col-md-10"> -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">회원정보</h3>
							</div>
							<div class="card-body">
								<form method="post" action="${cpath}/join.do" name="frm"
									onsubmit="return checkValue()">
									
									<input type="hidden" name="chk" value=0>
									<div class="form-group mb-3 ">
									
										<label class="form-label required">아이디</label> <small>${vo.login_id}</small>  
									</div>
									<div class="form-group mb-3 ">
                      <label class="form-label required">이름</label>
                      <small>${vo.user_name}</small>   
                                       
										</div>
										
																	                     					 
									<div class="form-group mb-3 ">
										<label class="form-label required">비밀번호</label> 
										<small>${vo.u_pw}</small>
										</div>
										
										<div class="form-group mb-3 ">
                      <label class="form-label required">가입날짜</label>
                      <small>${fn:split(vo.joindate," ")[0]}</small>   
                                       
										</div>
										
                      
										<div class="form-group mb-3 ">
											<label class="form-label required">닉네임</label> 
											<small>${vo.u_nick}</small>
											
										</div>
									
									<div class="form-group mb-3 ">
										<label class="form-label required">생일</label> 
										<small>${fn:split(vo.u_birthdate," ")[0]}</small>
									</div>
									<div class="form-group mb-3 ">
										<label class="form-label required">주소</label>
										<small>${vo.post}</small>
										<small>${vo.u_addr}</small>
				
										
									</div>

									<div class="form-footer">
										<button type="submit" class="btn btn-primary"
											onclick="fn_submit('${vo.login_id}');return false;">회원정보 수정</button>
										<button type="submit" class="btn btn-warning"
											onclick="fn_subdel('${vo.login_id}');return false;">회원정보 탈퇴</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 게시판 -->
					</div>
				</div>
			</div>
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