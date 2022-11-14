<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html lang="en">
<head>
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
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>FOR THE URTH</title>
<!-- CSS files -->
<link href="${cpath}/css/tabler.css" rel="stylesheet" />
<link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

<!-- Libs JS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- Tabler Core -->
<script src="${cpath}/js/tabler.min.js" defer></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2224da2e91e9de7689142f9c3f2f1635&libraries=services"></script>

<!-- my -->
<link rel="stylesheet" href="${cpath}/css/my/sub.css">
<link rel="stylesheet" href="${cpath}/css/my/dy.css">
<link rel="stylesheet" href="${cpath}/css/my/reply.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	viewport-fit=cover">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(document).ready(function(){
		reloadList();
		
		
	});	
	
	
	
  	function goList(){
  		location.href="${cpath}/imgList.do?p=${p}";
  	}
  	function goDel(num){
  		var del = confirm("글을 삭제하시겠습니까");
  		if(del == true){
  	  		location.href="${cpath}/imgBoardDelete.do?num="+ num;

  		}else{
  			return false;
  		}
  	}
  	function goUpdate(num){
  		location.href="${cpath}/imgBoardUpdateForm.do?num="+ num;
  		
  	}	
  	
  	function commUpdateForm(num){
  		console.log("updateform"+num);
  		$("#cmt"+num).html("<textarea id ='cmmUpdate' type='text' class='form-control' >"+$('#cmt'+num).text()+"</textarea>"
  				);
  		
  		$("#cmtbtn"+num).html("<button type='button' class='btn btn-outline-success w-100' onclick='commUpdate("+num+")'>등록</button>");
  		$("#cmtdeletebtn"+num).html("<button type='button' class='btn btn-outline-danger w-100' onclick='updateCancel()'>취소</button>");	
  		
  	}
  	function commUpdate(num){
  		var content= $('#cmmUpdate').val();
  		console.log(num,content)
  		$.ajax({
  			url : "${cpath}/imgCommentUpdate.do",
  			type :"get",
  			data :{"img_cmt_seq":num,"img_cmt_content":content},
  			success : reloadList,
  			
  			error : function(){alert("error");}
  		});
  		
  		
  	}
  	function updateCancel(){
  		reloadList();
  	}
  	function commDelete(num){
  		var del = confirm("댓글을 삭제하시겠습니까");
  		if(del == true){
  			$.ajax({
  	  			url : "${cpath}/imgCommentDelete.do",
  	  			type :"get",
  	  			data :{"img_cmt_seq":num},
  	  			success : reloadList,
  	  			
  	  			error : function(){alert("error");}
  	  		});
  		}else{
  			return false;
  		}
  		
  	}

  	function reload(){
  		
  		$('#comment').load(location.href + ' #comment');
  		console.log("reload");
  	}
  	
  	
  	
  	
  	function goInsertComment(){
  		console.log($('#content').val())
  		if(${mvo.login_id==null}){
  			alert("로그인후 이용하세요");
  		}else if($('#content').val()==''){
  			alert("댓글을 입력하세요");
  		}else{
  			var fData = $('#writeComment').serialize();
  	  		console.log(fData);
  	  		$.ajax({
  	  			url :"${cpath}/imgCommentWrite.do",
  	  			type :"post",
  	  			data : fData,
  	  			success : reloadList,
  	  			
  	  			error : function(){alert("goInserterror");}
  	  		});
  	  		$('#writer').val("");
  	  		$('#content').val("");
  		}
  		
  	}
  
  	function reloadList(){
  		var num = ${imgvo.img_seq};
  		$.ajax({
  			url : "${cpath}/imgCommentList.do",
  			type : "get",
  			data :{"img_seq":num},
  			dataType:"json",
  			success : function(data){
  				var comm = "";
  				$.each(data,function(intdex,obj){
  					comm+="<div>";
  					comm+="<div class='row my-2' id='cm'>";
  					comm+="<div class='col-3 m-auto'>";
  					comm+="<div class='form-selectgroup-label-content d-flex align-items-center '>";
  					comm+="<span class='avatar avatar-m avatar-rounded  me-3'";
  					comm+="style='background-image: url(${cpath}"+obj.u_grade+")'></span>";
  					comm+="<div>"
  					comm+="<div class='font-weight-medium'>"+obj.login_id+"</div>";
  					comm+='<div class="text-muted"><small>'+obj.img_cmt_date+'</small></div>';
  					comm+='</div>';
  					comm+='</div>';
  					comm+='</div>';
					
					
					
					if(obj.login_id=="${mvo.login_id}"){
						comm+='<div class="col-7 px-0" id="cmt'+obj.img_cmt_seq+'">'+obj.img_cmt_content.replace("\n","<br>")+'</div>';
						comm+='<div class="col m-auto">';
						comm+='<div class="row mt-2">';
						comm+='<div class="col">';
						comm+='<span id="cmtbtn'+obj.img_cmt_seq+'"><button type="button" class="btn btn-outline-success w-100" onclick="commUpdateForm('+obj.img_cmt_seq+')">수정</button></span>';
                        comm+='</div><div class="col ml-1"><span id="cmtdeletebtn'+obj.img_cmt_seq+'"><button type="button" class="btn btn-outline-danger w-100" onclick="commDelete('+obj.img_cmt_seq+')">삭제</button></span></div></div></div>';
					}else{
						comm+='<div class="col px-0" id="cmt'+obj.img_cmt_seq+'">'+obj.img_cmt_content.replace("\n","<br>")+'</div>';
					}
					comm+="</div>";
					comm+="</div>";
  				});
  				$('#comment').html(comm);
  				
  				
  			},
  		error : function(){alert("reloadList error");}
  		});
  	}
  	
  	function goLike(){
  		var id = "${mvo.login_id}"
  		if(${mvo.login_id==null}){
  			alert("로그인후 이용가능 합니다.");
  			return false;
  		}else{
  			$.ajax({
  	  			url : "${cpath}/imglike.do",
  	  			type : "get",
  	  			data : {"img_seq":${imgvo.img_seq}},
  	  			success : function(data){
  	  			 	$.each(data, function(index, item){
  	  					console.log(item.likes)
  	  					$('#likes').text(item.likes);
  	  					if(item.result==0){
  	  						$('#l').attr('class','xi-heart-o');
  	  					}else{
  	  						$('#l').attr('class','xi-heart');
  	  						$('#l').css('color','red');
  	  					}
  	  				})
  	  			},
  	  			error :function(){alert("error");}
  			});	
  				
  		}
  	
  	}
  	
  	
  	</script>


</head>



<body>

	<div class="page">
		<div class="page-main">
			<jsp:include page="../../header/header.jsp" />
			<!----------------------header end--------------------->
			<div class="cover-wrap">
				<div class="container">
					<div class="cover">게시판</div>
				</div>
			</div>
			<!------------여기부터 입력----------->
			<div class="page-wrapper">
				<div class="container-xl">
					<!-- Page title -->
					<div class="page-header d-print-none">
						<div class="row g-2 align-items-center">
							<div class="col">
								<h2 class="page-title">
									<a href="${cpath }/imgList.do">이미지 게시판</a><br>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="page-body">
					<div class="container-xl">
						<div class="row row-cards">
							<table class="table mb-0" id="view">
								<tr>
									<td class="text-muted">제목</td>
									<Td>${imgvo.img_title }</Td>
									<td class="text-muted">조회수</td>
									<td>${imgvo.img_cnt }</td>
								</tr>

								<tr>
									<td class="text-muted">작성자</td>
									<td>${imgvo.login_id }</td>
									<td class="text-muted">작성일</td>
									<td>${imgvo.img_regdate}</td>
								</tr>
								<tr>
									<td class="text-muted">내용</td>
									<td colspan="3"><c:if test="${imgvo.img_file1 != ' '}">
											<img src="${cpath}/upload/${imgvo.img_file1}">
											<Br>
										</c:if> <c:if test="${imgvo.img_file2 != ' '}">
											<img src="${cpath}/upload/${imgvo.img_file2}">
											<Br>
										</c:if> <c:if test="${imgvo.img_file3 != ' '}">
											<img src="${cpath}/upload/${imgvo.img_file3}">
											<Br>
										</c:if> <c:if test="${imgvo.img_file4 != ' '}">
											<img src="${cpath}/upload/${imgvo.img_file4}">
											<Br>
										</c:if> <c:if test="${imgvo.img_file5 != ' '}">
											<img src="${cpath}/upload/${imgvo.img_file5}">
											<Br>
										</c:if> ${fn:replace(imgvo.img_content,newLineChar,"<br/>")}</td>

								</tr>
								<Tr>
									<td class="text-muted">첨부파일</td>
									<td colspan="3">${imgvo.img_file1}&nbsp;${imgvo.img_file2}&nbsp;${imgvo.img_file3}&nbsp;${imgvo.img_file4}&nbsp;${imgvo.img_file5}</td>

								</Tr>
								<tr>


									<td colspan="4" align="right"><c:choose>
											<c:when test="${mvo.u_type eq 'admin' }">
												<c:choose>
													<c:when test="${vo.notice eq 0 }">
														<button class="btn btn-warning"
															onclick="goNotice(${vo.img_seq})">공지</button>
													</c:when>
													<c:otherwise>
														<button class="btn btn-warning"
															onclick="delNotice(${vo.img_seq})">공지 제거</button>
													</c:otherwise>
												</c:choose>
												<button class="btn btn-success"
													onclick="goUpdate(${imgvo.img_seq})">수정</button>
												<button class="btn btn-danger"
													onclick="goDel(${imgvo.img_seq})">삭제</button>
											</c:when>

											<c:when test="${imgvo.login_id  eq mvo.login_id}">
												<button class="btn btn-success"
													onclick="goUpdate(${imgvo.img_seq})">수정</button>
												<button class="btn btn-danger"
													onclick="goDel(${imgvo.img_seq})">삭제</button>
											</c:when>
										</c:choose>
										<button class="btn btn-outline-primary w-5" onclick="goList()">목록</button>
									</td>
								</tr>

							</table>
							<div class="row mt-3 mb-2">
								<div class="col"></div>
								<div class="col" id="likebtn">
									<button type="button" onclick="return goLike()" id="likebtn2"
										class="btn btn-outline-info w-20">
										<c:choose>
											<c:when test="${empty mvo.login_id }">
												<i id="l" class="xi-heart-o"></i>
											</c:when>
											<c:when test="${imglikecheck eq 0 }">
												<i id="l" class="xi-heart-o"></i>
											</c:when>
											<c:when test="${imglikecheck eq 1 }">
												<i id="l" class="xi-heart"></i>
											</c:when>
										</c:choose>
										<span id="likes">&nbsp;${imgvo.img_likes}</span>
									</button>
								</div>
								<div class="col"></div>


							</div>
							<div class="container">
								<div class="row">
									<div class="col">
										<div class="card">

											<div class="tab-content">
												<!-- reply -->
												<div id="tab-reply" class="card tab-pane active show"
													role="tabpanel">
													<div class="card-body">
														<form id="writeComment">
															<div class="row">
																<div class="col-3 m-auto">
																	<div
																		class="form-selectgroup-label-content d-flex align-items-center ">
																		<span class="avatar avatar-m avatar-rounded  me-3"
																			style="background-image: url(${cpath}${grade })"></span>
																		<div>
																			<div class="font-weight-medium">${mvo.login_id }</div>
																			<div class="text-muted">
																				<small>grade</small>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-7">
																	<input type="hidden" name="img_seq"
																		value="${imgvo.img_seq }"> <input
																		type="hidden" name="login_id" value="${mvo.login_id }">
																	<textarea class="form-control mt-3" id="content"
																		type="text" name="img_cmt_content" rows="3"
																		placeholder="댓글을 입력하세요!"></textarea>
																</div>
																<div class="col m-auto">
																	<div class="row">
																		<div class="col">
																			<button type="button" class="btn btn-primary w-100"
																				onclick="goInsertComment()">등록하기</button>
																		</div>
																	</div>
																</div>
															</div>
														</form>
														<!-- <hr class="my-3"> -->
														<div class="card mt-3" style="height: 28rem">
															<div
																class="card-body card-body-scrollable card-body-scrollable-shadow">
																<div class="divide-y" id="comment"></div>
															</div>
														</div>


													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<footer class="footer footer-transparent d-print-none">
						<div class="container-xl">
							<div class="row text-center align-items-center flex-row-reverse">
								<div class="col-lg-auto ms-lg-auto">
									<ul class="list-inline list-inline-dots mb-0">
										<li class="list-inline-item"><a href="./docs/index.html"
											class="link-secondary">Documentation</a></li>
										<li class="list-inline-item"><a href="./license.html"
											class="link-secondary">License</a></li>
										<li class="list-inline-item"><a
											href="https://github.com/tabler/tabler" target="_blank"
											class="link-secondary" rel="noopener">Source code</a></li>
										<li class="list-inline-item"><a
											href="https://github.com/sponsors/codecalm" target="_blank"
											class="link-secondary" rel="noopener"> <!-- Download SVG icon from http://tabler-icons.io/i/heart -->
												<svg xmlns="http://www.w3.org/2000/svg"
													class="icon text-pink icon-filled icon-inline" width="24"
													height="24" viewBox="0 0 24 24" stroke-width="2"
													stroke="currentColor" fill="none" stroke-linecap="round"
													stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none" />
													<path
														d="M19.5 12.572l-7.5 7.428l-7.5 -7.428m0 0a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572" /></svg>
												Sponsor
										</a></li>
									</ul>
								</div>
								<div class="col-12 col-lg-auto mt-3 mt-lg-0">
									<ul class="list-inline list-inline-dots mb-0">
										<li class="list-inline-item">Copyright &copy; 2022 <a
											href="." class="link-secondary">Tabler</a>. All rights
											reserved.
										</li>
										<li class="list-inline-item">Generated 2022-08-10 11:58
											UTC</li>
									</ul>
								</div>
							</div>
						</div>
					</footer>
				</div>


				<footer class="my-footer">

					<div>Copyright© 2022 코D카인. All Right Reserved.</div>
				</footer>
			</div>
		</div>
	</div>

</body>
</html>