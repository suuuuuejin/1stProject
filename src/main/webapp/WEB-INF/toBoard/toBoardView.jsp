<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("newLineChar", "\n");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

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
<title>FOR THE URTH</title>

<!-- CSS files -->
<link href="${cpath}/css/tabler.css" rel="stylesheet" />
<link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

<!-- Libs JS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- Tabler Core -->
<script src="${cpath}/js/tabler.min.js" defer></script>


<!-- my -->
<link rel="stylesheet" href="${cpath}/css/my/sub.css">
<link rel="stylesheet" href="${cpath}/css/my/dy.css">
<title>Bootstrap Example</title>
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
  		location.href="${cpath}/tolist.do?p=${p}";
  	}
  	function goDel(num){
  		var del = confirm("글을 삭제하시겠습니까");
  		if(del == true){
  	  		location.href="${cpath}/toboardDelete.do?num="+ num;
			reloadlist();
  		}else{
  			return false;
  		}
  	}
  	function goUpdate(num){
  		location.href="${cpath}/toboardUpdateForm.do?num="+ num;
  		
  	}	
  	
  	function commUpdateForm(num){
  		console.log("toupdateform"+num);
  		$("#cmt"+num).html("<textarea id ='cmmUpdate' type='text' class='form-control' >"+$('#cmt'+num).text()+"</textarea>"
  				);
  		
  		$("#cmtbtn"+num).html("<button type='button' class='btn btn-outline-success w-100' onclick='commUpdate("+num+")'>등록</button>");
  		$("#cmtdeletebtn"+num).html("<button type='button' class='btn btn-outline-danger w-100' onclick='updateCancel()'>취소</button>");	
  		
  	}
  	function commUpdate(num){
  		var content= $('#cmmUpdate').val();
  		console.log(num,content)
  		$.ajax({
  			url : "${cpath}/tocommentUpdate.do",
  			type :"get",
  			data :{"tb_cmt_seq":num,"tb_cmt_content":content},
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
  	  			url : "${cpath}/tocommentDelete.do",
  	  			type :"get",
  	  			data :{"tb_cmt_seq":num},
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
  	  			url :"${cpath}/tocommentWrite.do",
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
  		var num = ${vo.tb_seq};
  		$.ajax({
  			url : "${cpath}/tocommentList.do",
  			type : "get",
  			data :{"tb_seq":num},
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
  					comm+='<div class="text-muted"><small>'+obj.tb_cmt_date+'</small></div>';
  					comm+='</div>';
  					comm+='</div>';
  					comm+='</div>';
					comm+='<div class="col px-0" id="cmt'+obj.tb_cmt_seq+'">'+obj.tb_cmt_content+'</div>'
					
					
					if(obj.login_id=="${mvo.login_id}"){
						comm+='<div class="col m-auto">';
						comm+='<div class="row mt-2">';
						comm+='<div class="col">';
						comm+='<span id="cmtbtn'+obj.tb_cmt_seq+'"><button type="button" class="btn btn-outline-success w-100" onclick="commUpdateForm('+obj.tb_cmt_seq+')">수정</button></span>';
                        comm+='</div><div class="col ml-1"><span id="cmtdeletebtn'+obj.tb_cmt_seq+'"><button type="button" class="btn btn-outline-danger w-100" onclick="commDelete('+obj.tb_cmt_seq+')">삭제</button></span></div></div></div>';
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
  	  			url : "${cpath}/tolike.do",
  	  			type : "get",
  	  			data : {"tb_seq":${vo.tb_seq},"login_id":id},
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
  	
  	//댓글폼===========================================================
  	
  	
  	
  	//=============================================================
  	function fcommUpdateForm(num){
  		$("#user_phone").prop("disabled", false)
  		$("#user_name").prop("disabled", false)
  		$("#formbtn").html("<div class='col'> <button type='button' class='btn w-40 btn-primary  mb-2' onclick='fcommUpdate("+num+")'>등록하기</button></div>");
	
	
	
  		
  	}
  	function fcommUpdate(num){
  		var user_phone= $('#user_phone').val();
  		var user_name= $('#user_name').val();
  		console.log(num,content)
  		$.ajax({
  			url : "${cpath}/ftocommentUpdate.do",
  			type :"get",
  			data :{"tb_seq":num,"user_name":user_name,"user_phone":user_phone},
  			success :  function(){
  				freloadList(${vo.tb_seq}); 
  				alert('수정되었습니다')
  			},
  			error : function(){alert("error");}
  		});
  		
  		
  	}
  	function fupdateCancel(){
  		freloadList(${vo.tb_seq});
  	}
  	
  	function fcommDelete(){
  		var del = confirm("삭제하시겠습니까?");
  		if(del == true){
  			$.ajax({
  	  			url : "${cpath}/ftocommentDelete.do",
  	  			type :"get",
  	  			data :{"tb_seq":${vo.tb_seq}},
  	  			success : 
  	  			function(){
  	  				alert('삭제되었습니다')
  	  				freloadList(${vo.tb_seq});},
  	  			
  	  			error : function(){alert("error");}
  	  		});
  		}else{
  			return false;
  		}
  		
  	}
  	
  	
  	 function focheck(login_id){
  		var attedancy_check = "a";
  		
  			$.ajax({
  	  			url : "${cpath}/ftocommentcheck.do",
  	  			type :"get",
  	  			data :{"login_id":login_id, "tb_seq":${vo.tb_seq},"attedancy_check":attedancy_check},
  	  			success : function(){
  	  					
  	  					$('#obutton').prop("disabled", true) ;
  	  					$('#xbutton').css("display", "none");
  	  					$('#attend').text('참석');
  	  					
  	  					},
  	  			
  	  			error : function(){alert("error");}
  	  		});
  		}
  	function fxcheck(login_id){
  		var attedancy_check = "b";
  		
			$.ajax({
	  			url : "${cpath}/ftocommentcheck.do",
	  			type :"get",
	  			data :{"login_id":login_id, "tb_seq":${vo.tb_seq},"attedancy_check":attedancy_check},
	  			success : function(){
  		$('#xbutton').prop("disabled", true) ;
			$('#obutton').css("display", "none");
			$('#attend').text('불참석');
},
  	  			
  	  			error : function(){alert("error");}
  	  		});
  		}
  	
  	
  	
  	
  	function freload(){
  		
  		$('#fcomment').load(location.href + ' #fcomment');
  		console.log("reload");
  	}
  	
  	
  	
  	
  	function fgoInsertComment(){
  		console.log($('#fcontent').val())
  		if(${mvo.login_id==null}){
  			alert("로그인후 이용하세요");
  		}else if($('#fcontent').val()==''){
  			alert("이름을 입력하세요");
  		}else if($('#fcontent1').val()=='' || $('#fcontent1').val().length<11){
  			alert("전화번호를 11자리 입력하세요");
  		}else{
  			var fData = $('#fwriteComment').serialize();
  	  		console.log(fData);
  	  		$.ajax({
  	  			url :"${cpath}/ftocommentWrite.do",
  	  			type :"post",
  	  			data : fData,
  	  			success : function(){
  	  				alert('등록되었습니다')
  	  				freloadList(${vo.tb_seq});} ,
  	  			
  	  			error : function(){alert("goInserterror");}
  	  		});
  	  		$('#fwriter').val("");
  	  		$('#fcontent').val("");
  		}
  		
  	}
  
  	function freloadList(num){
  		/* var num = ${vo.tb_seq}; */
  		if(${mvo.login_id==null}){
  			alert("로그인후 이용가능 합니다.");
  			document.getElementById('comm').click();
			} else {
  		$.ajax({
  			url : "${cpath}/ftocommentList.do",
  			type : "get",
  			data :{"tb_seq":num},
  			dataType:"json",
  			success : function(data){
  				var comm = "";
  				console.log(data)
  				
  					if(data == ""){
  						console.log('datanull');
   					 comm+="<div id='tab-form' class='card tab-pane' role='tabpanel'>";
					 comm+="<form id='fwriteComment'>";
					 comm+=" <div class='card-body'>";
					 comm+=" <div class='row'>";
					 comm+="<div class='col'>";
					 comm+=" <label class='form-label'>아이디</label>";
					 comm+=" <div>${mvo.login_id }</div>";
					comm+=" </div>";
					comm+="<div class='col'>";
					 comm+=" <input type='hidden' name='tb_seq' value='${vo.tb_seq }'>";
	    			comm+="<input type='hidden' name='login_id' value='${mvo.login_id }'>";
					comm+=" <label class='form-label'>이름/입금자명</label>";
					comm+=" <input type='text' class='form-control form-control-rounded mb-2' id='fcontent' name='user_name' placeholder='이름'>";
					comm+=" </div>";
					comm+=" <div class='col'>";
					 comm+=" <label class='form-label'>전화번호</label>";
					comm+=" <input type='text' id='fcontent1' name='user_phone' class='form-control' data-mask='000-0000-0000' data-mask-visible='true' placeholder='숫자만 입력해주세요' autocomplete='off'>";
					comm+="</div>";
					 comm+=" <div class='col ps-4'>";
					comm+=" <button type='button' class='btn btn-primary w-40  mb-2' onclick='fgoInsertComment()'>등록하기</button>";
					comm+=" </div>";
					comm+=" </div>";
					comm+="</form> ";
					comm+="</div>";
				 
				 } else if(${vo.login_id == mvo.login_id}){
  				
  					//로그인한 아이디가 글 쓴 사람이면	
  					$.each(data,function(index, item){
		  					console.log('login==mvo');
		  				$.each(data,function(inddex,obj){
		  				comm+="<div id='tab-form' class='card tab-pane' role='tabpanel'>";
  							comm+="<form id='fcheck'>";
  								comm+="<div class='card-body'>";
  									comm+="<div class='row'>";
  										comm+="<div class='col'>";
  											comm+="<label class='form-label'>아이디</label>";
					  						comm+="<div>";
					  						comm+= obj.login_id ;
					  						comm+="</div>";
					 					comm+="</div>";
										comm+=" <div class='col'>";
											comm+="<input type='hidden' name='tb_seq' value='${vo.tb_seq }'>";
											comm+=" <label class='form-label'>이름/입금자명</label>";
											comm+="<input type='text' class='form-control form-control-rounded mb-2' name='user_name' placeholder='"+obj.user_name+"'>";
                        				comm+="</div>";
                       					comm+="<div class='col'>";
                        					comm+=" <label class='form-label'>전화번호</label>";
                        					comm+="<input type='text' name='user_phone' class='form-control' data-mask='000-0000-0000' data-mask-visible='true' placeholder='"+obj.user_phone+"' autocomplete='off'>";
                        				comm+=" </div>";
                        				comm+=" <div id='attend' class='col ps-4'>";
                        				if(obj.attedancy_check=="a"){
					                        comm+=" <button type='button' id='obutton' onclick='focheck()' class='btn w-40 btn-success mb-2' name='fcheck' value='o' disabled>참석 O</button>";
					                        comm+=" <br>";
					                       
                        				}
                        				else if(obj.attedancy_check=="b"){
					                     
					                        comm+="  <button type='button' id='xbutton' onclick='fxcheck()' class='btn btn-danger w-40 mb-2' name='fcheck' value='x' disabled >참석 X</button>";
                        				}
                        				else{
                        					
                        					 comm+=" <button type='button' id='obutton' onclick='focheck(\""+obj.login_id+"\")' class='btn w-40 btn-success mb-2' name='fcheck' value='o'>참석 O</button>";
 					                        comm+=" <br>";
 					                       comm+="  <button type='button' id='xbutton' onclick='fxcheck(\""+obj.login_id+"\")' class='btn btn-danger w-40 mb-2' name='fcheck' value='x' >참석 X</button>";
                        				}
					                        comm+=" </div>";
                        				comm+=" </div>";
                        		comm+="</div>";
                       		comm+="</form>";
                        comm+="</div>";
		  				});
		  				});
					 }
		  			//글쓴이도 아니고 댓글도 안달았을때
					else if (data != ""){
						var valid = true;
						//댓글 유무 확인
						$.each(data,function(index, item){
							if(item.login_id == '${mvo.login_id}'){
								valid = false;
							}
						});
						
						//로그인한 사람이 댓글 달았을 경우
						if(valid==false){
							$.each(data,function(index, item){
								if(item.login_id == '${mvo.login_id}'){
									console.log('login==comm');
									comm+="<div id='tab-form' class='card tab-pane' role='tabpanel'>";
									comm+="<form >";
									comm+="<div class='card-body'>";
									comm+="<div class='row'>";
									comm+="<div class='col'>";
									comm+="<label class='form-label'>아이디</label>";
									comm+="<div>${mvo.login_id }</div>";
									comm+="</div>";
									comm+=" <div class='col'>";
									comm+="<input type='hidden' name='tb_seq' value='"+item.tb_seq +"'>";
									comm+="<input type='hidden' name='login_id' value='${mvo.login_id} '>";
									comm+=" <label class='form-label'>이름/입금자명</label>";
									comm+="<input type='text' id='user_name' class='form-control form-control-rounded mb-2' name='user_name' placeholder='"+item.user_name+"' disabled>";
			                        comm+="</div>";
			                       	comm+="<div class='col'>";
			                       	comm+=" <label class='form-label'>전화번호</label>";
			                       	comm+="<input type='text' id='user_phone' name='user_phone' class='form-control' data-mask='000-0000-0000' data-mask-visible='true' placeholder='"+item.user_phone+"' autocomplete='off' disabled>";
			                        comm+=" </div>";
			                       	comm+=" <div id='formbtn' class='col  ps-4'>";
			                     	if(item.attedancy_check==""){
				                      	comm+=" <button type='button' class='btn w-40 btn-outline-success  mb-2' onclick='javascript:fcommUpdateForm("+item.tb_seq+")'>수정하기</button>";
				                      	comm+=" <br>";
				                      	comm+="  <button type='button' class='btn btn-outline-danger w-40  mb-2' onclick='javascript:fcommDelete()'>삭제하기</button>";
			                     	}else if(item.attedancy_check=="a"){
					                	comm+=" <button type='button' id='obutton' onclick='focheck()' class='btn w-40 btn-success mb-2' name='fcheck' value='o' disabled>참석 O</button>";
			           				}
			                   		else if (item.attedancy_check=="b"){
			               				comm+= "<button type='button' id='xbutton' onclick='fxcheck()' class='btn btn-danger w-40 mb-2' name='fcheck' value='x' disabled >참석 X</button>";
			                   		}
			                        comm+=" </div>";
			               			comm+="</div>";
			        				comm+="</form>";
			                       	comm+="</div>";
			                       	return false;
								}
							})
						}
						 else{
							if('${mvo.login_id}' != '${vo.login_id}'){
								 console.log('notcomm');
								 comm+="<div id='tab-form' class='card tab-pane' role='tabpanel'>";
								 comm+="<form id='fwriteComment'>";
								 comm+=" <div class='card-body'>";
								 comm+=" <div class='row'>";
								 comm+="<div class='col'>";
								 comm+="<label class='form-label'>아이디</label>";
								 comm+="<div>${mvo.login_id }</div>";
								 comm+=" </div>";
								 comm+="<div class='col'>";
								 comm+=" <input type='hidden' name='tb_seq' value='${vo.tb_seq }'>";
				   			     comm+="<input type='hidden' name='login_id' value='${mvo.login_id }'>";
								 comm+=" <label class='form-label'>이름/입금자명</label>";
								 comm+=" <input type='text' class='form-control form-control-rounded mb-2' id='fcontent' name='user_name' placeholder='이름'>";
								 comm+=" </div>";
								 comm+=" <div class='col'>";
								 comm+=" <label class='form-label'>전화번호</label>";
								 comm+=" <input type='text' id='fcontent1' name='user_phone' class='form-control' data-mask='000-0000-0000' data-mask-visible='true' placeholder='숫자만 입력해주세요' autocomplete='off'>";
								 comm+="</div>";
								 comm+=" <div class='col ps-4'>";
								 comm+=" <button type='button' class='btn w-40 btn-primary  mb-2' onclick='fgoInsertComment()'>등록하기</button>";
								 comm+=" </div>";
								 comm+=" </div>";
								 comm+="</form> ";
								 comm+="</div>";
							}
						}
							
	  					
			  					
  					};
  					
  					
  					$('#fcomment').html(comm);
				 },
		  				
  				
  			error : function(){alert("freloadList error");}
  		});
		}
  		
  	}
  	
  	function goNotice(num){
  		location.href="${cpath}/toNotice.do?num="+ num;
  	}
  	function delNotice(num){
  		location.href="${cpath}/toDelNotice.do?num="+num;
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
					<div class="cover">함께해요</div>
				</div>
			</div>
			<!------------여기부터 입력----------->
			<div class="page-wrapper">
				<div class="container-xl">
					<!-- Page title -->
					<div class="page-header d-print-none">
						<div class="row g-2 align-items-center">
							<div class="col">
								<h2 class="page-title"></h2>
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
									<Td>[${vo.tb_headline}]${vo.tb_title }</Td>
									<td class="text-muted">조회수</td>
									<td>${vo.tb_cnt }</td>
								</tr>

								<tr>
									<td class="text-muted">작성자</td>
									<td>${vo.login_id }</td>
									<td class="text-muted">작성일</td>
									<td>${vo.tb_regdate}</td>
								</tr>
								<tr>
									<td class="text-muted">내용</td>
									<td colspan="3"><c:if test="${vo.tb_file != ' ' }">
											<img src="${cpath}/upload/${vo.tb_file}">
											<Br>
										</c:if> ${fn:replace(vo.tb_content,newLineChar,"<br/>")}</td>

								</tr>
								<Tr>
									<td class="text-muted">첨부파일</td>
									<td colspan="3">${vo.tb_file}</td>

								</Tr>
								<tr>


									<td colspan="4" align="right"><c:choose>
											<c:when test="${mvo.u_type eq 'admin' }">
												<c:choose>
													<c:when test="${vo.notice eq 0 }">

														<button class="btn btn-warning w-5"
															onclick="goNotice(${vo.tb_seq})">공지</button>
													</c:when>
													<c:otherwise>
														<button class="btn btn-warning w-5"
															onclick="delNotice(${vo.tb_seq})">공지 제거</button>
													</c:otherwise>
												</c:choose>
												<button class="btn btn-warning w-5"
													onclick="goUpdate(${vo.tb_seq})">수정</button>
												<button class="btn btn-danger w-5"
													onclick="goDel(${vo.tb_seq})">삭제</button>
											</c:when>

											<c:when test="${vo.login_id  eq mvo.login_id}">
												<button class="btn btn-warning w-5"
													onclick="goUpdate(${vo.tb_seq})">수정</button>
												<button class="btn  btn-danger w-5"
													onclick="goDel(${vo.tb_seq})">삭제</button>
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
											<c:when test="${likecheck eq 0 }">
												<i id="l" class="xi-heart-o"></i>
											</c:when>
											<c:when test="${likecheck eq 1 }">
												<i id="l" class="xi-heart"></i>
											</c:when>
											<c:otherwise>
												<i id="l" class="xi-heart-o"></i>
											</c:otherwise>
										</c:choose>
										<span id="likes">&nbsp;${likes}</span>
									</button>
								</div>
								<div class="col"></div>
							</div>

						</div>
					</div>
					<div class="container-xl">
						<div class="row">
							<div class="col">
								<div class="card">
									<div class="card-header">
										<!-- Cards navigation -->
										<ul class="  nav nav-pills card-header-pills " role="tablist">
											<li class=" nav-item " role="presentation"><a
												href="#tab-reply" class="nav-link active"
												data-bs-toggle="tab" aria-selected="true" role="tab"
												id="comm">Reply&nbsp;</a></li>
											<li class="  nav-item" role="presentation"><a
												href="#tab-form" class=" nav-link" data-bs-toggle="tab"
												aria-selected="false" tabindex="-1" role="tab"
												onclick="javascript:freloadList(${vo.tb_seq})">Form&nbsp;</a>
											</li>

										</ul>
									</div>
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
																		<small>${mvo.u_grade }</small>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-7">
															<input type="hidden" name="tb_seq" value="${vo.tb_seq }">

															<input type="hidden" name="login_id"
																value="${mvo.login_id }">
															<textarea class="form-control mt-3" id="content"
																type="text" name="tb_cmt_content" rows="3"
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
										<div id="fcomment"></div>

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
	</div>
	<jsp:include page="../../footer/footer.jsp" />
	</div>
	</div>

</body>
</html>