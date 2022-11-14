<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>empty</title>
<!-- CSS files -->
<link href="${cpath}/css/tabler.css" rel="stylesheet" />
<link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

<!-- Libs JS -->

<!-- Tabler Core -->
<script src="${cpath}/js/tabler.min.js" defer></script>


<!-- my -->
<link rel="stylesheet" href="${cpath}/css/my/sub.css">
<title>Bootstrap Example</title>
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
			 url: "${cpath}/user_delete.do",
			  type : "post",
			  traditional : true ,
			  data : {tdArr:tdArr},
			  success : function(){
				  alert("삭제 되었습니다.");
				  location.href="${cpath}/memberlist.do"
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
							<h1>사용자 관리</h1>
						</div>
						<div class="col-12 mt-1 mb-5">
							<!-- tab -->
							<div class="card">
								
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
																	<th><input type="checkbox" class="form-check-input test" name="checkAll" id="checkAll"></th>
																	<th>아이디</th>
																	<th>이름</th>
																	<th>닉네임</th>
																	<th>등급</th>
																	<th>포인트</th>
																	<th>주소</th>
																	<th>가입일자</th>
																</tr>
															</thead>
															<c:forEach var="user" items="${list }">
															<tbody>
																<tr>
																	<td ><input type="checkbox" class="form-check-input test" name="check"></td>
																	<td class="text-center">${user.login_id }</td>
																	<td class="text-center">${user.user_name }</td>
																	<td class="text-center">${user.u_nick }</td>
																	<td class="text-center">${user.u_grade }</td>
																	<td class="text-center">${user.u_point }</td>
																	<td class="text-center">${user.u_addr }</td>
																	<td class="text-center">${user.joindate }</td>
																</tr>
															</tbody>
															</c:forEach>
														</table>
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
															<a href="javascript:user_delete()" class="btn btn-primary">회원탈퇴</a>
														</div>
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
	<jsp:include page="../../footer/footer.jsp" />
	</div>
	</div>



	</script>
</body>
</body>
</html>