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
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   



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
  <link rel="stylesheet" href="${cpath }/css/my/dy.css">

    <link rel="stylesheet" href="${cpath}/css/my/reply.css">
  

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
		
		var title = $('#title').val();
		var content = $('#tinymce-default').val();
		var file1 = $('#file1').val();
		var file2 = $('#file2').val();
		var file3 = $('#file3').val();
		var file4 = $('#file4').val();
		var file5 = $('#file5').val();
		
		if(title == ""){
			alert("제목을 입력하세요");
			
			return false
		}
		
		if(content == ""){
			alert("내용을 입력하세요");
			return false
		}
		
		if(file1 == "" && file2 == "" && file3 == "" && file4 == "" && file5 == ""){
			alert("이미지를 첨부하세요");
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
                  Maps
                </h2>
              </div>
            </div>
          </div>
        </div>
        <div class="page-body">
          <div class="container-xl">
            <div class="row row-cards">
            <form action="${cpath }/imgBoardWrite.do" method="post" name="writeForm" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return checkForm()">
    		<table class="table table-bordered">
    			<tr>
                <input type="hidden" name="writer" value="${mvo.login_id }">
                <td class="w-20">
                <div>
                      <select type="text" class="form-select " name ="headline" placeholder="Select" id="selectheadline" value="">
                        <option value="이벤트참여">이벤트참여</option>
                        <option value="일상">일상</option>
                        <option value="추천">추천</option>
                      </select>
                      
                    </div>
                </td> 
                <td class="w-75"><input type="text" id="title" name="title" class="form-control"/></td>
                
             </tr>
    			<tr>
    				
    				<td colspan="2"><textarea  rows="10" name="content" class="form-control" id="tinymce-default"></textarea></td>
    			</tr>
    			<tr>
    				<td colspan="2">
                          
                          <div id="pro-1">
                            <div class="fl-l w-75">
                              <input type="file" id="file1" class="form-control form-control-rounded mb-2 w-100"
                                name="file1">
                            </div>
                            <button type="button"  class="fl-l btn btn-outline ms-3" id="plus">+</button>
                          </div>
                          <div id="pro-2">
                            <div class="fl-l w-75">
                              <input type="file" id="file2" class="form-control form-control-rounded mb-2 w-100"
                                name="file2" >
                            </div>
                            <button type="button" class="fl-l btn btn-outline ms-3" id="min1">-</button>
                          </div>
                          <div id="pro-3">
                            <div class="fl-l w-75">
                              <input type="file" id="file3" class="form-control form-control-rounded mb-2 w-100"
                                name="file3">
                            </div>
                          </div>
                          <div id="pro-4">
                            <div class="fl-l w-75">
                              <input type="file" id="file4" class="form-control form-control-rounded mb-2 w-100"
                                name="file4" >
                            </div>
                          </div>
                          <div id="pro-5">
                            <div class="fl-l w-75">
                              <input type="file" id="file5" class="form-control form-control-rounded mb-2 w-100"
                                name="file5" >
                            </div>
                          </div>
                        </td>
    			</tr>
    			<tr>
    				<Td colspan="2" align="right">
    				<button type="submit" class="btn btn-outline-success w-5">등록</button>
    				<button type="button" class ="btn btn-outline-danger w-5" onclick="location.href='${cpath }/imgList.do'">취소</button>
    				</Td>
    			</tr>
    		</table>
    	</form>
          </div>
        </div>
        <footer class="footer footer-transparent d-print-none">
          <div class="container-xl">
            <div class="row text-center align-items-center flex-row-reverse">
              <div class="col-lg-auto ms-lg-auto">
                <ul class="list-inline list-inline-dots mb-0">
                  <li class="list-inline-item"><a href="./docs/index.html" class="link-secondary">Documentation</a></li>
                  <li class="list-inline-item"><a href="./license.html" class="link-secondary">License</a></li>
                  <li class="list-inline-item"><a href="https://github.com/tabler/tabler" target="_blank" class="link-secondary" rel="noopener">Source code</a></li>
                  <li class="list-inline-item">
                    <a href="https://github.com/sponsors/codecalm" target="_blank" class="link-secondary" rel="noopener">
                      <!-- Download SVG icon from http://tabler-icons.io/i/heart -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon text-pink icon-filled icon-inline" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428m0 0a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572" /></svg>
                      Sponsor
                    </a>
                  </li>
                </ul>
              </div>
              <div class="col-12 col-lg-auto mt-3 mt-lg-0">
                <ul class="list-inline list-inline-dots mb-0">
                  <li class="list-inline-item">
                    Copyright &copy; 2022
                    <a href="." class="link-secondary">Tabler</a>.
                    All rights reserved.
                  </li>
                  <li class="list-inline-item">
                    Generated 2022-08-10 11:58 UTC
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </footer>
      </div>


  <footer class="my-footer">

    <div>
      Copyright© 2022 코D카인. All Right Reserved.
    </div>
  </footer>
  </div>
  </div>
	<script>
	var num = 2;
    $('#plus').on('click', function () {
      $('#pro-' + num).css({ 'display': 'block' })
      if (num <= 4) {
        num += 1;
      }
    })
    $('#min1').on('click', function () {
      $('#pro-' + num).css({ 'display': 'none' })

      if (num <= 2) {
        num == 2;
      } else if (num <= 5) {
        num -= 1;
      }
    })
	</script>
</body>
</html>