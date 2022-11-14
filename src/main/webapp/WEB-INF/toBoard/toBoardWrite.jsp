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
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="${cpath }/js/summernote/summernote-lite.js"></script>
<script src="${cpath }/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="${cpath }/css/summernote/summernote-lite.css">

<!-- include summernote css/js-->

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
	function checkForm(){
		change.innerHTML="<input type =>"
		var title = $('#title').val();
		var content = $('#tinymce-default').val();
		if(title == ""){
			alert("제목을 입력하세요")
			$('#title').focus();
			return false
		}
		
		if(content == ""){
			alert("내용을 입력하세요")
			$('#tinymce-default').focus();
			return false
		}
		
		return true
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
           함께해요
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
                  함께해요
                </h2>
              </div>
            </div>
          </div>
        </div>
        <div class="page-body">
          <div class="container-xl">
            <div class="row row-cards">
            <form action="${cpath }/toboardWrite.do" method="post" name="writeForm" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return checkForm()">
    		<table class="table table-bordered">
    			<tr>
    				<input type="hidden" name="writer" value="${mvo.login_id }">
    				
    				<td class="w-20">
    				<div>
                      <select type="text" class="form-select " name ="headline" placeholder="Select" id="selectheadline" value="">
                        <option value="플로깅">플로깅</option>
                        <option value="클린하이킹">클린하이킹</option>
                        <option value="소모임">소모임</option>
                      </select>
                      
                    </div>
    				</td> 
    				<td class="w-75"><input type="text" id="title" name="title" class="form-control"/></td>
    				
    			</tr>
    			<!-- 말머리 -->
    			<tr>
    			 
    				<td colspan="2"><textarea  rows="10" name="content" class="form-control" id="tinymce-default" placeholder="말머리 선택 후 제목앞에 활동 지역을 붙여주세요 ex) [플로깅][광주] 무등산 플로깅 인원 모집합니다."></textarea></td>
    			</tr>
    			<tr>
    				<Td colspan="2"><input type="file" name = "filename1"></Td>
    			</tr>
    			<tr>
    				<Td colspan="2">
    				<button type="submit" class="btn btn-success btn-sm">등록</button>
    				<button type="button" class ="btn btn-warning btn-sm" onclick="location.href='${cpath }/tolist.do'">취소</button>
    				</Td>
    			</tr>
    		</table>
    	</form>
          </div>
        </div>
        <jsp:include page="../../footer/footer.jsp" />
  </div>
  </div>

</body>
</html>