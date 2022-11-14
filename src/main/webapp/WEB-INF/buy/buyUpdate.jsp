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
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>FOR THE URTH
  </title>
  <!-- CSS files -->
  <link href="${cpath}/css/tabler.css" rel="stylesheet" />
  <link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

  <!-- Libs JS -->
	<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

  <!-- Tabler Core -->
  <script src="${cpath}/js/tabler.min.js" defer></script>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2224da2e91e9de7689142f9c3f2f1635&libraries=services"></script>

  <!-- my -->
  <link rel="stylesheet" href="${cpath}/css/my/sub.css">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" viewport-fit=cover">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function () {
	    tinyMCE.init({
	      selector: '#tinymce-default',
	      height: 300,
	      menubar: false,
	      statusbar: false,
	      plugins: [
	        'advlist autolink lists link image charmap print preview anchor',
	        'searchreplace visualblocks code fullscreen',
	        'insertdatetime media table paste code help wordcount'
	      ],
	      toolbar: 'undo redo | formatselect | ' +
	        'bold italic backcolor | alignleft aligncenter ' +
	        'alignright alignjustify | bullist numlist outdent indent | ' +
	        'removeformat',
	      content_style: 'body { font-family: -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif; font-size: 14px; -webkit-font-smoothing: antialiased; }'
	    	});
	 	 })
	function fileDelete(num,file){
		$.ajax({
		url : "${cpath}/buyfileDelete.do",
		type : "post",
		data : {"buy_seq":num,"file":file},
		success : function(){
			$('#change').html("");
		},
		error : function(){alert("Error");}
		});
	}
</script>
</head>
<body>

	
<body>
  <div class="page">
    <div class="page-main">
      <jsp:include page="../../header/header.jsp" />
      <!----------------------header end--------------------->
      <div class="cover-wrap">
        <div class="container">
          <div class="cover">
            지도
          </div>
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
                  글 수정
                </h2>
              </div>
            </div>
          </div>
        </div>
        <div class="page-body">
          <div class="container-xl">
            <div class="row row-cards">
            <div class="panel-body">
    	<form action="${cpath }/buyboardUpdate.do" method="post" enctype="multipart/form-data">
    		
    		<table class="table table-bordered">
    			<input type ="hidden" name ="login_id" value="${mvo.login_id }"/>
    			<input type="hidden" name ="buy_seq" value="${vo.buy_seq }"/>
    			<tr>
    				<td>제목</td>
    				<td><input type="text" name="buy_title" class="form-control" value="${vo.buy_title }"></td>
    			</tr>
    			<tr>
    				<td>내용</td>
    				<td><textarea rows="10" name="buy_content" class="form-control" id="tinymce-default">${vo.buy_content }</textarea></td>
    			</tr>
    			<tr>
    				<td>첨부파일</td>
    				<td><div id="change">${vo.buy_file }<c:if test="${vo.buy_file != ' ' }">
    			<button type="button" class ="btn btn-sm btn-warning" onclick ="fileDelete(${vo.buy_seq },'${vo.buy_file }')">X</button>
    			</c:if></div></div><input type="file" name ="filename" ></td>
    				
    			</tr>
    			<tr>
    				<td colspan="2" align="right">
    					<button type="submit" class="btn btn-sm btn-primary" >수정 </button>
    					<button type="button" class="btn btn-sm btn-warning" onclick="location.href='${cpath}/buyboardView.do?num=${vo.buy_seq }&login_id=${mvo.login_id}'">취소 </button>
    					<button type="button" class="btn btn-sm btn-info" onclick="location.href='${cpath}/buylist.do'">리스트</button>
    				</td>
    			</tr>
    		</table>
    	</form>
     </div>
          </div>
        </div>
        <jsp:include page="../../footer/footer.jsp" />
  </div>
  </div>

</body>
</html>