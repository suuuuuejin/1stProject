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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">



$(document).ready(function(){
		reloadList();
	});	
	
	
	
  	function goList(){
  		location.href="${cpath}/buylist.do?p=${p}";
  	}
  	function goDel(num){
  		var del = confirm("글을 삭제하시겠습니까");
  		if(del == true){
  	  		location.href="${cpath}/buyboardDelete.do?num="+ num;

  		}else{
  			return false;
  		}
  	}
  	
  	function goUpdate(num){
  		location.href="${cpath}/buyboardUpdateForm.do?num="+ num;
  	}	
  	
  	function commUpdateForm(num){
  		console.log("updateform"+num);
  		$("#cmt"+num).html("<textarea id ='cmmUpdate' type='text' class='form-control' >"+$('#cmt'+num).text()+"</textarea>");  		
  		$("#cmtbtn"+num).html("<button type='button' class='btn btn-outline-success w-100' onclick='commUpdate("+num+")'>등록</button>");
  		$("#cmtdeletebtn"+num).html("<button type='button' class='btn btn-outline-danger w-100' onclick='updateCancel()'>취소</button>");			
  	}
  	
  	function commUpdate(num){
  		var content= $('#cmmUpdate').val();
  		console.log(num,content)
  		$.ajax({
  			url : "${cpath}/buyCommentUpdate.do",
  			type :"get",
  			data :{"buy_cmt_seq":num,"buy_cmt_content":content},
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
  	  			url : "${cpath}/buyCommentDelete.do",
  	  			type :"get",
  	  			data :{"buy_cmt_seq":num},
  	  			success : function(){
  	  				reloadList();
  	  				alert('삭제되었습니다.');
  	  			},
  	  			
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
  	  			url :"${cpath}/buyCommentWrite.do",
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
  		var num = ${vo.buy_seq};
  		$.ajax({
  			url : "${cpath}/buyCommentList.do",
  			type : "get",
  			data :{"buy_seq":num},
  			dataType:"json",
  			success : function(data){
  				var comm = "";
  				$.each(data,function(intdex,obj){
  					comm+="<div>";
  					comm+="<div class='row my-2' id='cm'>";
  					comm+="<div class='col-3'>";
  					comm+="<div class='form-selectgroup-label-content d-flex align-items-center '>";
  					comm+="<span class='avatar avatar-m avatar-rounded  me-3'";
  					comm+="style='background-image: url(${cpath}"+obj.u_grade+")'></span>";
  					comm+="<div>"
  					comm+="<div class='font-weight-medium'>"+obj.login_id+"</div>";
  					comm+='<div class="text-muted"><small>'+obj.buy_cmt_date+'</small></div>';
  					comm+='</div>';
  					comm+='</div>';
  					comm+='</div>';
					comm+='<div class="col-7 px-0" id="cmt'+obj.buy_cmt_seq+'">'+obj.buy_cmt_content+'</div>'
					
					
					if(obj.login_id=="${mvo.login_id}"){
						comm+='<div class="col m-auto">';
						comm+='<div class="row mt-2">';
						comm+='<div class="col">';
						comm+='<span id="cmtbtn'+obj.buy_cmt_seq+'"><button type="button" class="btn btn-outline-success w-100" onclick="commUpdateForm('+obj.buy_cmt_seq+')">수정</button></span>';
                        comm+='</div><div class="col ml-1"><span id="cmtdeletebtn'+obj.buy_cmt_seq+'"><button type="button" class="btn btn-outline-danger w-100" onclick="commDelete('+obj.buy_cmt_seq+')">삭제</button></span></div></div></div>';
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
  	  			url : "${cpath}/buylike.do",
  	  			type : "get",
  	  			data : {"buy_seq":${vo.buy_seq},"login_id":id},
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
  	
  	//공지
  	function goNotice(num){
  		location.href="${cpath}/buyboardNotice.do?num="+ num;
  	}
  	function delNotice(num){
  		location.href="${cpath}/buydelNotice.do?num="+num;
  	}
  	
  //	================ 댓글 폼 =================
	  
	  function breload(){
  		
  		$('#bbform').load(location.href + ' #bbform');
  		console.log("reload");
  	}
  	function bbformlist(){
  		var num = ${vo.buy_seq};
  		
	  	
  		if(${mvo.login_id==null}){
  			alert("로그인후 이용가능 합니다.");
  			document.getElementById('comm').click();
			} else {
  		$.ajax({
  			url : "${cpath}/buyCommFormList.do",
  			type : "get",
  			data : {"buy_seq":num ,"login_id":'${mvo.login_id}' },
  			dataType:"json",
  			success : function(data){
  				console.log('에이젝스실행');
  				var bc = "";
  				/* console.log(data); */
  				
  				
  				if(${mvo.login_id != null} && data == "" && '${mvo.login_id}' != "admin" ) { 
	 						bc+='<div id="tab-form" class="card tab-pane" role="tabpanel">';
  						bc+='<form id="commForm">';
  					bc+='<input type="hidden" name="buy_seq" value="${vo.buy_seq}">';
  					bc+='<input type="hidden" name="login_id" value="${mvo.login_id}">';
  						bc+='<div class="card-body">';
  						bc+='<div class="row">';
  						bc+='<div class="col">';
  						bc+='<label class="form-label">아이디</label>';
  						bc+='<div>${mvo.login_id}</div>';
  						bc+='</div>';
  						bc+='<div class="col">';
  						bc+='<label class="form-label">이름/입금자명</label>';
  						bc+='<input type="text" id="bfname" class="form-control form-control-rounded mb-2" name="user_name" placeholder="이름">';
              bc+='</div>';
              bc+='<div class="col">';
              bc+='<label class="form-label">금액</label>';
              bc+='<input type="number" id="bfamount" class="form-control form-control-rounded mb-2" name="user_amount" placeholder="숫자만 입력할 수 있습니다. ">';
              bc+='</div>';
              bc+='<div class="col">';
              bc+='<label class="form-label">전화번호</label>';
              bc+='<input type="text" id="bfphone" name="user_phone" class="form-control form-control-rounded" data-mask="000-0000-0000" data-mask-visible="true" placeholder="000-0000-0000" autocomplete="off">';
              bc+='</div></div>';
              bc+='<div class="row mt-2">';
              bc+='<div class="col-5">';
              bc+='<label class="form-label">주소</label>';
              bc+='<div class="input-icon">';
              //우편번호찾기
              bc+='<input type="text" value="" id="sample6_postcode" name="post" class="form-control form-control-rounded mb-1" placeholder="우편번호찾기" onclick="sample6_execDaumPostcode()">';
              bc+='<span class="input-icon-addon">';
              bc+='<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>';
              bc+='</span></div>';
              bc+='<input type="text" class="form-control form-control-rounded" id="sample6_address" name="u_addr" placeholder="주소">';
              bc+='<br>';
              bc+='<input type="text" class="form-control form-control-rounded mb-1" id="sample6_extraAddress" name="u_addr1" placeholder="동이름">';
              bc+='<input type="text" class="form-control form-control-rounded " id="sample6_detailAddress" name="u_addr2" placeholder="상세주소">';
              bc+='</div>';
              bc+='<div class="col-5">';
              bc+='<label class="form-label">상품명/갯수</label>';
              bc+='<div id="pro-1">';
              bc+='<div class="fl-l w-75">';
              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" id="prd1" name="prd1" placeholder="상품명/갯수">';
              bc+='</div>';
              bc+='<button type="button" class="fl-l btn btn-outline ms-3" id="plus" onclick="javascript:pluss()">+</button>';
              bc+='</div>';
              bc+='<div id="pro-2">';
              bc+='<div class="fl-l w-75">';
              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" name="prd2" placeholder="상품명/갯수">';
              bc+='</div>';
              bc+='<button type="button" class="fl-l btn btn-outline ms-3" id="min1" onclick="minn()">-</button>';
              bc+='</div>';
              bc+='<div id="pro-3">';
              bc+='<div class="fl-l w-75">';
              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" name="prd3" placeholder="상품명/갯수">';
              bc+='</div> </div>';
              bc+='<div id="pro-4">';
              bc+='<div class="fl-l w-75">';
              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" name="prd4" placeholder="상품명/갯수">';
              bc+='</div> </div></div>';
              bc+='<div class="col pt-5 px-4">';
              bc+='<button type="button" class="btn btn-primary w-100 mb-2" onclick="BInsertComment()">등록하기 </button>';
              bc+='</div></div></div>';
              bc+='</form></div>';
  				}
              //로그인한 사람이 댓글 달았을 경우
              $.each(data,function(index, item){
	  						if(item.login_id == '${mvo.login_id}'){
	  			 						bc+='<div id="tab-form" class="card tab-pane" role="tabpanel">';
	  		  						bc+='<form id="commForm">';
	  								bc+='<input type="hidden" name="buy_seq" value="${vo.buy_seq}">';
	  								bc+='<input type="hidden" name="login_id" value="${mvo.login_id}">';
	  		  						bc+='<div class="card-body">';
	  		  						bc+='<div class="row">';
	  		  						bc+='<div class="col">';
	  		  						bc+='<label class="form-label">아이디</label>';
	  		  						bc+='<div>${mvo.login_id}</div>';
	  		  						bc+='</div>';
	  		  						bc+='<div class="col">';
	  		  						bc+='<label class="form-label">이름/입금자명</label>';
	  		  						bc+='<input type="text" id="bfname" class="form-control form-control-rounded mb-2"  name="user_name" placeholder="'+item.user_name+'" disabled>';
	  		              bc+='</div>';
	  		              bc+='<div class="col">';
	  		              bc+='<label class="form-label">금액</label>';
	  		              bc+='<input type="number" id="bfamount" class="form-control form-control-rounded mb-2"name="user_amount" placeholder="'+item.user_amount+'" disabled>';
	  		              bc+='</div>';
	  		              bc+='<div class="col">';
	  		              bc+='<label class="form-label">전화번호</label>';
	  		              bc+='<input type="text" id="bfphone" name="user_phone" class="form-control form-control-rounded" data-mask="000-0000-0000" data-mask-visible="true" placeholder="'+item.user_phone+'" disabled autocomplete="off">';
	  		              bc+='</div></div>';
	  		              bc+='<div class="row mt-2">';
	  		              bc+='<div class="col-5">';
	  		              bc+='<label class="form-label">주소</label>';
	  		              bc+='<div class="input-icon">';
	  		              //우편번호찾기
	  		              bc+='<input type="text" value="" id="sample6_postcode" name="post" class="form-control form-control-rounded mb-1" placeholder="우편번호찾기" onclick="sample6_execDaumPostcode()" disabled />';
	  		              bc+='<span class="input-icon-addon">';
	  		              bc+='<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>';
	  		              bc+='</span></div>';
	  		              bc+='<input type="text" class="form-control form-control-rounded" id="sample6_address" name="u_addr" placeholder="주소" disabled>';
	  		              bc+='<br>';
	  		              bc+='<input type="text" class="form-control form-control-rounded mb-1" id="sample6_extraAddress" placeholder="동이름" disabled>';
	  		              bc+='<input type="text" class="form-control form-control-rounded " id="sample6_detailAddress" name="u_addr1" placeholder="'+item.user_addr+'" disabled>';
	  		              bc+='</div>';
	  		              bc+='<div class="col-5">';
	  		              bc+='<label class="form-label">상품명/갯수</label>';
	  		              bc+='<div id="pro-1">';
	  		              bc+='<div class="fl-l w-75">';
	  		              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" id="prd1" name="prd1" placeholder="'+item.goods_name+'" disabled>';
	  		              bc+='</div>';
	  		              bc+='<button type="button" class="fl-l btn btn-outline ms-3" id="plus" onclick="javascript:pluss()" disabled="true">+</button>';
	  		              bc+='</div>';
	  		              bc+='<div id="pro-2">';
	  		              bc+='<div class="fl-l w-75">';
	  		              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" name="prd2" placeholder="상품명/갯수" >';
	  		              bc+='</div>';
	  		              bc+='<button type="button" class="fl-l btn btn-outline ms-3" id="min1" onclick="minn()">-</button>';
	  		              bc+='</div>';
	  		              bc+='<div id="pro-3">';
	  		              bc+='<div class="fl-l w-75">';
	  		              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" name="prd3" placeholder="상품명/갯수">';
	  		              bc+='</div> </div>';
	  		              bc+='<div id="pro-4">';
	  		              bc+='<div class="fl-l w-75">';
	  		              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" name="prd4" placeholder="상품명/갯수">';
	  		              bc+='</div> </div></div>';
	  		              bc+='<div class="col pt-5 px-4" id="fbbtn">';
	  		              bc+='<button type="button" class="btn btn-outline-success w-100 mb-2" id="bedit" onclick="bfupdate()">수정하기</button>';
	  		              bc+='<br>';
	  		              bc+='<button type="button" class="btn btn-outline-danger w-100" onclick="BDeleteComment()">삭제하기</button>';
	  		              bc+='</div></div></div>';
	  		              bc+='</form></div>';
	  								}
	  							})
	  			
		  				if(${mvo.login_id== 'admin'}){ 	//admin
		  						 console.log(data);
		  					 $.each(data,function(inddex,obj){ 
		  						bc+='<input type="hidden" name="buy_seq" value="${vo.buy_seq}">';
  			 						bc+='<div id="tab-form" class="card tab-pane" role="tabpanel">';
  		  						bc+='<form id="commForm">';
  		  						bc+='<div class="card-body">';
  		  						bc+='<div class="row">';
  		  						bc+='<div class="col">';
  		  						bc+='<label class="form-label">아이디</label>';
  		  						bc+='<div>'+obj.login_id+'</div>';
  		  						bc+='</div>';
  		  						bc+='<div class="col">';
  		  						bc+='<label class="form-label">이름/입금자명</label>';
  		  						bc+='<input type="text" id="bfname" class="form-control form-control-rounded mb-2"  name="user_name" placeholder="'+obj.user_name+'" disabled>';
  		              bc+='</div>';
  		              bc+='<div class="col">';
  		              bc+='<label class="form-label">금액</label>';
  		              bc+='<input type="number" id="bfamount" class="form-control form-control-rounded mb-2"name="user_amount" placeholder="'+obj.user_amount+'" disabled>';
  		              bc+='</div>';
  		              bc+='<div class="col">';
  		              bc+='<label class="form-label">전화번호</label>';
  		              bc+='<input type="text" id="bfphone" name="user_phone" class="form-control form-control-rounded" data-mask="000-0000-0000" data-mask-visible="true" placeholder="'+obj.user_phone+'" disabled autocomplete="off">';
  		              bc+='</div></div>';
  		              bc+='<div class="row mt-2">';
  		              bc+='<div class="col-5">';
  		              bc+='<label class="form-label">주소</label>';
  		              bc+='<div class="input-icon">';
  		              //우편번호찾기
  		              bc+='<input type="text" value="" id="sample6_postcode" name="post" class="form-control form-control-rounded mb-1" placeholder="우편번호찾기" onclick="sample6_execDaumPostcode()" disabled >';
  		              bc+='<span class="input-icon-addon">';
  		              bc+='<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>';
  		              bc+='</span></div>';
  		              bc+='<input type="text" class="form-control form-control-rounded" id="sample6_address" name="u_addr" placeholder="주소" disabled>';
  		              bc+='<br>';
  		              bc+='<input type="text" class="form-control form-control-rounded mb-1" id="sample6_extraAddress" placeholder="동이름" disabled>';
  		              bc+='<input type="text" class="form-control form-control-rounded " id="sample6_detailAddress" name="u_addr1" placeholder="'+obj.user_addr+'" disabled>';
  		              bc+='</div>';
  		              bc+='<div class="col-5">';
  		              bc+='<label class="form-label">상품명/갯수</label>';
  		              bc+='<div id="pro-1">';
  		              bc+='<div class="fl-l w-75">';
  		              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" id="prd1" name="prd1" placeholder="'+obj.goods_name+'" disabled>';
  		              bc+='</div>';
  		              bc+='<button type="button" class="fl-l btn btn-outline ms-3" id="plus" onclick="javascript:pluss()" disabled>+</button>';
  		              bc+='</div>';
  		              bc+='<div id="pro-2">';
  		              bc+='<div class="fl-l w-75">';
  		              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" name="prd2" placeholder="상품명/갯수">';
  		              bc+='</div>';
  		              bc+='<button type="button" class="fl-l btn btn-outline ms-3" id="min1" onclick="minn()">-</button>';
  		              bc+='</div>';
  		              bc+='<div id="pro-3">';
  		              bc+='<div class="fl-l w-75">';
  		              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" name="prd3" placeholder="상품명/갯수">';
  		              bc+='</div> </div>';
  		              bc+='<div id="pro-4">';
  		              bc+='<div class="fl-l w-75">';
  		              bc+='<input type="text" class="form-control form-control-rounded mb-2 w-100" name="prd4" placeholder="상품명/갯수">';
  		              bc+='</div> </div></div>';
  		              bc+='<div class="col pt-5 px-4">';
  		              bc+='</div></div></div>';
  		              bc+='</form></div>';
		  						 }); 
		  							bc+='<div class="row">';
		  							bc+='<div class="col-10"></div>';
		  							bc+='<div class="col">';
		  							
		  							bc+='<button type="button" class="btn btn-success my-2 me-2 " onclick="downloadCSV()">Excel 저장</button>';
		  							bc+='</div</div>';
		  					}
		  			
  				$('#bbform').html(bc);
  				
  				
  			},//success end
	  			error :function(){alert("form error");}
  		});
			}
  	}
  
  	
  	function downloadCSV(){
  		var num = ${vo.buy_seq};
  	//chartDataList는 데이터 배열
  	var del = confirm("저장하시겠습니까?");
  		if(del == true){
  			var a= "";
  		$.ajax({
  			url : "${cpath}/buyCommFormList.do",
  			type : "get",
  			data : {"buy_seq":num ,"login_id":'${mvo.login_id}' },
  			dataType:"json",
  			success : function(data){
  				console.log('getCSV실행');
  				console.log(data);
  				if(${mvo.login_id== 'admin'}){ 	//admin
  					a += "아이디,이름/입금자명,금액,전화번호,주소,상품명/갯수"+"\r\n";
	 						 $.each(data,function(inddex,obj){ 
	 				  	    a += obj.login_id+","+obj.user_name+","+obj.user_amount+","+obj.user_phone+","+obj.user_addr+","+obj.goods_name+"\r\n";
 					 });
  			}
 				  var csvFile;
 				  var downloadLink;

 				  //한글 처리를 해주기 위해 BOM 추가하기
 				  const BOM = "\uFEFF";
 				  a = BOM + a;
		  		var downloadLink = document.createElement("a");
					var blob = new Blob([a], { type: "text/csv;charset=MS949" });
					var url = URL.createObjectURL(blob);
					downloadLink.href = url;
					downloadLink.download = "data_"+${vo.buy_seq}+".csv";
				
					document.body.appendChild(downloadLink);
					downloadLink.click();
					document.body.removeChild(downloadLink);
		  		},//success end
		  		error :function(){alert("excel error");}
  			
  		});
  		}else{
  			return false;}
  		}

  	
  	
  	
  	function bfupdate(){
  		$('#bincom').hide()
  		$('#bedit').hide();
  		$("#fbbtn").html('<button type="button" class="btn btn-outline-success w-100 mb-2" onclick="BUpdateComment()">수정완료</button><br><button type="button" class="btn btn-outline-danger w-100" onclick="BDeleteComment()">삭제하기</button>');
  		$("#bfname").prop("disabled", false)
  		$("#bfamount").prop("disabled", false)
  		$("#bfphone").prop("disabled", false)
  		$("#sample6_postcode").prop("disabled", false)
  		$("#sample6_address").prop("disabled", false)
  		$("#sample6_detailAddress").prop("disabled", false)
  		$("#sample6_extraAddress").prop("disabled", false)
  		$("#prd1").prop("disabled", false)
  		$("#plus").prop("disabled", false)
  	}
  	
  	function BUpdateComment(){
  		console.log($('#bbform').val())
  		if(${mvo.login_id==null}){
  			alert("로그인후 이용하세요");
  		}else if($('#bfname').val()==''){
  			alert("이름을 입력하세요");
  		}else if($('#bfphone').val()=='' || $('#bfphone').val().length<11){
  			alert("전화번호를 11자리 입력하세요");
  		}else if($('#bfamount').val()==''){
  			alert("금액을 입력하세요");
  		}else if($('#prd1').val()==''){
  			alert("상품명/갯수를 입력하세요");
  		}else if($('#sample6_postcode').val()==''){
  			alert("우편번호찾기를 진행해주세요");
  		}
  		else if($('#sample6_detailAddress').val()==''){
  			alert("상세주소를 입력하세요");
  		}else{
  			var bData = $('#commForm').serialize();
  	  		console.log(bData);
  	  		$.ajax({
  	  			url :"${cpath}/buyCommFormUpdate.do",
  	  			type :"post",
  	  			data : bData,
  	  			success : function(){
  	  				bbformlist();
  	  				alert('수정되었습니다.');
  	  			},
  	  			
  	  			error : function(){alert("goUpdate error");}
  	  		});
  		}
  	}
  	function BDeleteComment(){
  		var del = confirm("삭제하시겠습니까?");
  		if(del == true){
  			$.ajax({
  	  			url : "${cpath}/buyCommFormDelete.do",
  	  			type :"get",
  	  			data :{"buy_seq":${vo.buy_seq}},
  	  			success : function(){
  	  			bbformlist();
  	  				alert('삭제되었습니다.');
  	  			},
  	  			
  	  			error : function(){alert("form delete error");}
  	  		});
  		}else{
  			return false;
  		}
  		
  		
  	}
  	
  	function BInsertComment(){
  		console.log($('#bbform').val())
  		if(${mvo.login_id==null}){
  			alert("로그인후 이용하세요");
  		}else if($('#bfname').val()==''){
  			alert("이름을 입력하세요");
  		}else if($('#bfphone').val()=='' || $('#bfphone').val().length<11){
  			alert("전화번호를 11자리 입력하세요");
  		}else if($('#bfamount').val()==''){
  			alert("금액을 입력하세요");
  		}else if($('#prd1').val()==''){
  			alert("상품명/갯수를 입력하세요");
  		}else if($('#sample6_postcode').val()==''){
  			alert("우편번호찾기를 진행해주세요");
  		}
  		else if($('#sample6_detailAddress').val()==''){
  			alert("상세주소를 입력하세요");
  		}else{
  			var bData = $('#commForm').serialize();
  	  		console.log(bData);
  	  		$.ajax({
  	  			url :"${cpath}/buyCommFormWrite.do",
  	  			type :"post",
  	  			data : bData,
  	  			success : function(){
  	  				bbformlist();
  	  				alter('등록되었습니다.')
  	  			},
  	  			
  	  			error : function(){alert("goInsert error");}
  	  		});
  	  		/* $('#fwriter').val("");
  	  		$('#fcontent').val(""); */
  		}
  		
  	}
  	

		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
				}
				
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
				extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
				extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("sample6_extraAddress").value = extraAddr;
				
				} else {
				document.getElementById("sample6_extraAddress").value = '';
				}
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress").focus();
				}
				}).open();
				}           

  	
  	
  	
  	
  	</script>


</head>



<body>
	<script>

	let num = 2;
  	function pluss(){
	    	console.log("123");
	      $('#pro-' + num).css({ 'display': 'block' })
	      if (num <= 3) {
	        num += 1;
      	}
   		 }
  	function minn(){
        $('#pro-' + num).css({ 'display': 'none' })

        if (num <= 2) {
          num == 2;
        } else if (num <= 4) {
          num -= 1;
        }
      
  	}
  	
</script>

	<div class="page">
		<div class="page-main">
			<jsp:include page="../../header/header.jsp" />
			<!----------------------header end--------------------->
			<div class="cover-wrap">
				<div class="container">
					<div class="cover">같이사요! 공동구매게시판</div>
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
									<Td>${vo.buy_title }</Td>
									<td class="text-muted">조회수</td>
									<td>${vo.buy_cnt }</td>
								</tr>

								<tr>
									<td class="text-muted">작성자</td>
									<td>${vo.login_id }</td>
									<td class="text-muted">작성일</td>
									<td>${vo.buy_regdate}</td>
								</tr>
								<tr>
									<td class="text-muted">내용</td>
									<td colspan="3"><c:if test="${vo.img_file1 != ' ' }">
											<img src="${cpath}/upload/${vo.img_file1}">
											<Br>
										</c:if> ${fn:replace(vo.buy_content,newLineChar,"<br/>")}</td>

								</tr>
								<Tr>
									<td class="text-muted">첨부파일</td>
									<td colspan="3">${vo.img_file1}</td>

								</Tr>
								<tr>


									<td colspan="4" align="right"><c:choose>
											<c:when test="${mvo.u_type eq 'admin' }">
												<c:choose>
													<c:when test="${vo.notice eq 0 }">

														<button class="btn btn-sm btn-warning"
															onclick="goNotice(${vo.buy_seq})">공지</button>
													</c:when>
													<c:otherwise>
														<button class="btn btn-sm btn-warning"
															onclick="delNotice(${vo.buy_seq})">공지</button>
													</c:otherwise>
												</c:choose>
												<button class="btn btn-sm btn-warning"
													onclick="goUpdate(${vo.buy_seq})">수정</button>
												<button class="btn btn-sm btn-danger"
													onclick="goDel(${vo.buy_seq})">삭제</button>
											</c:when>

											<c:when test="${vo.login_id  eq mb.login_id}">
												<button class="btn btn-sm btn-warning"
													onclick="goUpdate(${vo.buy_seq})">수정</button>
												<button class="btn btn-sm btn-danger"
													onclick="goDel(${vo.buy_seq})">삭제</button>
											</c:when>
										</c:choose>
										<button class="btn btn-outline-primary w-5" onclick="goList()">목록</button>
									</td>
								</tr>

							</table>
							<div class="row mt-3 mb-2">
								<div class="col"></div>
								<div class="col " id="likebtn">
									<button type="button" onclick="return goLike()" id="likebtn2"
										class="btn btn-outline-info w-20">
										<c:choose>
										<c:when test="${empty mvo.login_id }">
												<i id="l" class="xi-heart-o"></i>
											</c:when>
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
										<span id="likes">&nbsp;${vo.buy_likes}</span>
									</button>
								</div>
								<div class="col"></div>


							</div>
							<div class="container">
								<!--start-->
								<div class="row">
									<div class="col">
										<div class="card">
											<div class="card-header">
												<!-- Cards navigation -->
												<ul class="  nav nav-pills card-header-pills "
													role="tablist">
													<li class=" nav-item " role="presentation"><a
														href="#tab-reply" class="nav-link active"
														data-bs-toggle="tab" aria-selected="true" role="tab" id="comm">댓글</a></li>
													<li class="  nav-item" role="presentation"><a
														href="#tab-form" class=" nav-link" data-bs-toggle="tab"
														aria-selected="false" tabindex="-1" role="tab"
														onclick="javascript:bbformlist()">신청하기</a></li>

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
																				<small>grade</small>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-7">
																	<input type="hidden" name="buy_seq"
																		value="${vo.buy_seq }"> <input type="hidden"
																		name="login_id" value="${mvo.login_id }">
																	<textarea class="form-control mt-3" id="content"
																		type="text" name="buy_cmt_content" rows="3"
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
												<!-- form -->
												<div id="bbform"></div>
											</div>
										</div>
									</div>
								</div>
								<!--end-->


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../footer/footer.jsp" />

</body>
</html>