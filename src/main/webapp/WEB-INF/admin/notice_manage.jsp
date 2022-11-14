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
<title>empty</title>
<!-- CSS files -->
<link href="${cpath}/css/tabler.css" rel="stylesheet" />
<link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

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
<!-- Libs JS -->

<!-- Tabler Core -->
<script src="${cpath}/js/tabler.min.js" defer></script>


<!-- my -->
<link rel="stylesheet" href="${cpath}/css/my/sub.css">
<title>FOR THE URTH</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	viewport-fit=cover">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function(){
		//전체 체크박스 클릭
		$("#checkAll").click(function(){
			if ($("#checkAll").prop("checked")){
				$(".test").prop("checked",true);
			} else{
				$(".test").prop("checked", false);
			}
		});
		
		$(".test").click(function(){
			if ($("input[name='check']:checked").length == 10){
				$("#checkAll").prop("checked", true);
			} else{
				$("#checkAll").prop("checked", false);
			}
		})
	})
	
	function user_delete(){
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name='check']:checked");
		
		console.log(checkbox)
		//체크된 체크박스 값을 가져온다
		checkbox.each(function(i){
			
			//checkbox.parent(): checkbox의 부모는 <td>이다.
			//checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			
			//체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text().replace(/\t/g, "").replace(/\n/g,", "));
			
			//td.eq(0)은 체크박스 이므로 td.eq(1)의 값부터 가져온다.
			var userid = td.eq(1).text();
			
			tdArr.push(userid);
			
			
		});
		console.log(tdArr);
		
		$.ajax({
			 url: "${cpath}/u_delete.do",
			  type : "post",
			  traditional : true ,
			  data : {tdArr:tdArr},
			  success : function(){
				  alert("삭제 되었습니다.");
			  },
			  error : function(){
				  alert("error");
			  }
		});
		
	}
	
	//검색 기능 구현
	function searching(num) {

        var option = $("#select-tags").val();
        var search = document.getElementById("search").value;;
        const queryParams = {
            num: (num) ? num : 1,
            option: option,
            search: search
        }
        location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
        console.log(location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString())
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
				<div class="list-group list-group-transparent mb-3 ml-3  theme-light mb-5">
					<a class="list-group-item list-group-item-action d-flex align-items-center"
						href="${cpath }/memberlist.do"> 사용자 관리 </a> 
					<a class="list-group-item list-group-item-action d-flex align-items-center"
						href="${cpath }/adminNotice.do"> 공지사항 관리 </a>
				</div>
			</div>
			<div class="col-12 col-md-9">
				<div class="row">
					<div class="col-12">
						<!-- 게시판-->
						<div class="ms-1 mb-3 mt-3">
							<h1>공지사항 관리</h1>
						</div>
						<div class="col-12 mt-1 mb-5">
							<!-- tab -->
							<div class="card">
								<ul class="nav nav-tabs nav-fill" data-bs-toggle="tabs"
									role="tablist">
									<li class="nav-item" role="presentation"><a
										href="#tabs-home-14" class="nav-link active"
										data-bs-toggle="tab" aria-selected="false" role="tab"
										tabindex="-1">제로웨이스트/비건</a></li>
									<li class="nav-item" role="presentation" onclick="toList()"><a
										href="#tabs-activity-14" class="nav-link" data-bs-toggle="tab"
										aria-selected="true" role="tab">함께해요</a></li>
									<li class="nav-item" role="presentation" onclick="imgList()"><a
										href="#tabs-img-14" class="nav-link" data-bs-toggle="tab"
										aria-selected="false" role="tab" tabindex="-1">등급제 게시판</a></li>
								</ul>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active snow" id="tabs-home-14"
											role="tabpanel">
											<div>
												<div class="bg-light border-y">
													<div class="table-responsive">
														<table class="table table-vcenter table-hover">
										                  <thead>
										                    <tr>
										                      <th>번호</th>
										                      <th class="w-50">제목</th>
										                      <th class="w-20">글쓴이</th>
										                      <th class="w-20">등록일</th>
										                      <th>조회</th>
										                      <th>추천</th>
										                    </tr>
										                  </thead>
										                  <tbody id="list">
										                  	<c:forEach  var="vo" items="${zwlist }"> 
										    					<tr>
													    			<td class ="text-center">${vo.zw_seq }</td>
													    			<td class="text-muted " ><a href="${cpath }/boardView.do?num=${vo.zw_seq}&p=${board.currentPage}&login_id=${mvo.login_id}" class="text-reset"><span class="text-green">[${vo.zw_headline}]<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 21c.5 -4.5 2.5 -8 7 -10"></path><path d="M9 18c6.218 0 10.5 -3.288 11 -12v-2h-4.014c-9 0 -11.986 4 -12 9c0 1 0 3 2 5h3z"></path></svg></span>
			    																${vo.zw_title }<span class="text-orange"></span></a></td>
													    			<td class="text-muted text-center"><img src="${cpath }${vo.u_grade}" alt="icon">${vo.login_id }</td>
													    			<td class="text-muted text-center">${vo.zw_date }</td>
													    			<td class="text-muted  text-center">${vo.zw_cnt }</td>
													    			<td class="text-muted text-center">${vo.zw_likes }</td>
													    		</tr>
										    				</c:forEach>
										                  </tbody>
										                </table>
													</div>
													
													<div class="card-footer d-flex align-items-center py-2">
															<ul class="pagination m-0 m-auto">
																<c:choose>
																	<c:when test="${paging.start_page eq 1 }">
																		<li class="page-item disabled">
																		<a class="page-link" tabindex="-1" aria-disabled="false">
																		<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
																		<polyline points="15 6 9 12 15 18" /></svg> prev</a></li>
																	</c:when>
																	<c:otherwise>
																		<li class="page-item"><a class="page-link" href="${cpath}/memberlist.do?num=${paging.start_page-1}"
																			tabindex="-1" aria-disabled="false"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"	stroke-width="2" stroke="currentColor" fill="none"
																					stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none" />
																		<polyline points="15 6 9 12 15 18" /></svg> prev</a></li>
																	</c:otherwise>
																</c:choose>
																<c:forEach var="i" begin="${paging.start_page }" end="${paging.end_page }">
																	<c:choose>
																		<c:when test="${paging.current_page eq i }">
																			<li class="page-item active"><a class="page-link">${i}</a></li>
																		</c:when>
																		<c:otherwise>
																			<li class="page-item"><a class="page-link" href="${cpath}/memberlist.do?num=${i}">${i}</a></li>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
																<c:choose>
																	<c:when test="${paging.end_page % 5 eq 0 }">
																		<li class="page-item"><a class="page-link" href="${cpath}/memberlist.do?num=${pagping.end_page+1}">next
																				<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																					width="24" height="24" viewBox="0 0 24 24"
																					stroke-width="2" stroke="currentColor" fill="none"
																					stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none" />
																		<polyline points="9 6 15 12 9 18" />
																		</svg>
																		</a></li>
																	</c:when>
																	<c:otherwise>
																		<li class="page-item disabled"><a class="page-link">next
																				<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																					width="24" height="24" viewBox="0 0 24 24"
																					stroke-width="2" stroke="currentColor" fill="none"
																					stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none" />
																		<polyline points="9 6 15 12 9 18" />
																		</svg>
																		</a></li>
																	</c:otherwise>
																</c:choose>
															</ul>
														</div>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="tabs-activity-14" role="tabpanel">
											<div>
												<div class="bg-light border-y">
													<div class="table-responsive">
														<table class="table table-vcenter table-hover">
										                  <thead>
										                    <tr>
										                      <th>번호</th>
										                      <th class="w-50">제목</th>
										                      <th class="w-20">글쓴이</th>
										                      <th class="w-20">등록일</th>
										                      <th>조회</th>
										                      <th>추천</th>
										                    </tr>
										                  </thead>
										                  <tbody id="list">
										                  	<c:forEach  var="vo" items="${tolist }"> 
										    					<tr>
													    			<td class ="text-center">${vo.tb_seq }</td>
													    			<td class="text-muted " ><a href="${cpath }/boardView.do?num=${vo.tb_seq}&p=${board.currentPage}&login_id=${mvo.login_id}" class="text-reset"><span class="text-green">[${vo.tb_headline}]<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 21c.5 -4.5 2.5 -8 7 -10"></path><path d="M9 18c6.218 0 10.5 -3.288 11 -12v-2h-4.014c-9 0 -11.986 4 -12 9c0 1 0 3 2 5h3z"></path></svg></span>
			    																${vo.tb_title }<span class="text-orange"></span></a></td>
													    			<td class="text-muted text-center"><img src="${cpath }${vo.u_grade}" alt="icon">${vo.login_id }</td>
													    			<td class="text-muted text-center">${vo.tb_regdate }</td>
													    			<td class="text-muted  text-center">${vo.tb_cnt }</td>
													    			<td class="text-muted text-center">${vo.tb_likes }</td>
													    		</tr>
										    				</c:forEach>
										                  </tbody>
										                </table>
													</div>
													
													<div class="card-footer d-flex align-items-center py-2">
															<ul class="pagination m-0 m-auto">
																<c:choose>
																	<c:when test="${paging.start_page eq 1 }">
																		<li class="page-item disabled">
																		<a class="page-link" tabindex="-1" aria-disabled="false">
																		<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
																		<polyline points="15 6 9 12 15 18" /></svg> prev</a></li>
																	</c:when>
																	<c:otherwise>
																		<li class="page-item"><a class="page-link" href="${cpath}/memberlist.do?num=${paging.start_page-1}"
																			tabindex="-1" aria-disabled="false"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"	stroke-width="2" stroke="currentColor" fill="none"
																					stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none" />
																		<polyline points="15 6 9 12 15 18" /></svg> prev</a></li>
																	</c:otherwise>
																</c:choose>
																<c:forEach var="i" begin="${paging.start_page }" end="${paging.end_page }">
																	<c:choose>
																		<c:when test="${paging.current_page eq i }">
																			<li class="page-item active"><a class="page-link">${i}</a></li>
																		</c:when>
																		<c:otherwise>
																			<li class="page-item"><a class="page-link" href="${cpath}/memberlist.do?num=${i}">${i}</a></li>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
																<c:choose>
																	<c:when test="${paging.end_page % 5 eq 0 }">
																		<li class="page-item"><a class="page-link" href="${cpath}/memberlist.do?num=${pagping.end_page+1}">next
																				<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																					width="24" height="24" viewBox="0 0 24 24"
																					stroke-width="2" stroke="currentColor" fill="none"
																					stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none" />
																		<polyline points="9 6 15 12 9 18" />
																		</svg>
																		</a></li>
																	</c:when>
																	<c:otherwise>
																		<li class="page-item disabled"><a class="page-link">next
																				<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																					width="24" height="24" viewBox="0 0 24 24"
																					stroke-width="2" stroke="currentColor" fill="none"
																					stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none" />
																		<polyline points="9 6 15 12 9 18" />
																		</svg>
																		</a></li>
																	</c:otherwise>
																</c:choose>
															</ul>
														</div>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="tabs-img-14" role="tabpanel">
											<div>
												<div class="bg-light border-y">
													<div class="table-responsive">
														<table class="table table-vcenter table-hover">
										                  <thead>
										                    <tr>
										                      <th>번호</th>
										                      <th class="w-50">제목</th>
										                      <th class="w-20">글쓴이</th>
										                      <th class="w-20">등록일</th>
										                      <th>조회</th>
										                      <th>추천</th>
										                    </tr>
										                  </thead>
										                  <tbody id="list">
										                  	<c:forEach  var="vo" items="${gradelist }"> 
										    					<tr>
													    			<td class ="text-center">${vo.grade_seq }</td>
													    			<td class="text-muted " ><a href="${cpath }/boardView.do?num=${vo.grade_seq}&p=${board.currentPage}&login_id=${mvo.login_id}" class="text-reset"><span class="text-green">[${vo.grade_headline}]<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 21c.5 -4.5 2.5 -8 7 -10"></path><path d="M9 18c6.218 0 10.5 -3.288 11 -12v-2h-4.014c-9 0 -11.986 4 -12 9c0 1 0 3 2 5h3z"></path></svg></span>
			    																${vo.grade_title }<span class="text-orange"></span></a></td>
													    			<td class="text-muted text-center"><img src="${cpath }${vo.u_grade}" alt="icon">${vo.login_id }</td>
													    			<td class="text-muted text-center">${vo.grade_regdate }</td>
													    			<td class="text-muted  text-center">${vo.grade_cnt }</td>
													    			<td class="text-muted text-center">${vo.grade_likes }</td>
													    		</tr>
										    				</c:forEach>
										                  </tbody>
										                </table>
													</div>
													
													<div class="card-footer d-flex align-items-center py-2">
															<ul class="pagination m-0 m-auto">
																<c:choose>
																	<c:when test="${paging.start_page eq 1 }">
																		<li class="page-item disabled">
																		<a class="page-link" tabindex="-1" aria-disabled="false">
																		<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
																		<polyline points="15 6 9 12 15 18" /></svg> prev</a></li>
																	</c:when>
																	<c:otherwise>
																		<li class="page-item"><a class="page-link" href="${cpath}/memberlist.do?num=${paging.start_page-1}"
																			tabindex="-1" aria-disabled="false"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"	stroke-width="2" stroke="currentColor" fill="none"
																					stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none" />
																		<polyline points="15 6 9 12 15 18" /></svg> prev</a></li>
																	</c:otherwise>
																</c:choose>
																<c:forEach var="i" begin="${paging.start_page }" end="${paging.end_page }">
																	<c:choose>
																		<c:when test="${paging.current_page eq i }">
																			<li class="page-item active"><a class="page-link">${i}</a></li>
																		</c:when>
																		<c:otherwise>
																			<li class="page-item"><a class="page-link" href="${cpath}/memberlist.do?num=${i}">${i}</a></li>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
																<c:choose>
																	<c:when test="${paging.end_page % 5 eq 0 }">
																		<li class="page-item"><a class="page-link" href="${cpath}/memberlist.do?num=${pagping.end_page+1}">next
																				<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																					width="24" height="24" viewBox="0 0 24 24"
																					stroke-width="2" stroke="currentColor" fill="none"
																					stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none" />
																		<polyline points="9 6 15 12 9 18" />
																		</svg>
																		</a></li>
																	</c:when>
																	<c:otherwise>
																		<li class="page-item disabled"><a class="page-link">next
																				<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																					width="24" height="24" viewBox="0 0 24 24"
																					stroke-width="2" stroke="currentColor" fill="none"
																					stroke-linecap="round" stroke-linejoin="round">
																		<path stroke="none" d="M0 0h24v24H0z" fill="none" />
																		<polyline points="9 6 15 12 9 18" />
																		</svg>
																		</a></li>
																	</c:otherwise>
																</c:choose>
															</ul>
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
	<!-- footer -->
	<!-- WEB-INF폴더에서 사용시 page="../footer/footer.jsp"로 변경 -->
	<jsp:include page="../../footer/footer.jsp" />



</body>
</html>