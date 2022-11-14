<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>empty
  </title>
  <!-- CSS files -->
  <link href="${cpath}/css/tabler.css" rel="stylesheet" />
  <link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

  <!-- Libs JS -->
	<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

  <!-- Tabler Core -->
  <script src="${cpath}/js/tabler.min.js" defer></script>


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
		url : "${cpath}/tofileDelete.do",
		type : "post",
		data : {"tb_seq":num,"file":file},
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
    	<form action="${cpath }/toboardUpdate.do" method="post" enctype="multipart/form-data">
    		
    		<table class="table table-bordered">
    			<input type ="hidden" name ="login_id" value="${mvo.login_id }"/>
    			<input type="hidden" name ="tb_seq" value="${vo.tb_seq }"/>
    			<tr>
    				<td>제목</td>
    				<td><input type="text" name="tb_title" class="form-control" value="[${vo.tb_headline} ]${vo.tb_title }"></td>
    			</tr>
    			<tr>
    				<td>내용</td>
    				<td><textarea rows="10" name="tb_content" class="form-control" id="tinymce-default">${vo.tb_content }</textarea></td>
    			</tr>
    			<tr>
    				<td>첨부파일</td>
    				<td><div id="change">${vo.tb_file }<c:if test="${vo.tb_file != ' ' }">
    			<button type="button" class ="btn btn-sm btn-warning" onclick ="fileDelete(${vo.tb_seq },'${vo.tb_file }')">X</button>
    			</c:if></div></div><input type="file" name ="filename" ></td>
    				
    			</tr>
    			<tr>
    				<td colspan="2" align="right">
    					<button type="submit" class="btn btn-sm btn-primary" >수정 </button>
    					<button type="button" class="btn btn-sm btn-warning" onclick="location.href='${cpath}/toboardView.do?num=${vo.tb_seq }&login_id=${mvo.login_id}'">취소 </button>
    					<button type="button" class="btn btn-sm btn-info" onclick="location.href='${cpath }/tolist.do'">리스트</button>
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