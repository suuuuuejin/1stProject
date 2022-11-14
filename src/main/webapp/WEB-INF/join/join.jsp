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


<body>
	<div class="page">
		<div class="page-main">
			<!-- WEB-INF폴더에서 사용시 page="../header/header.jsp"로 변경 -->
			<!-- 여기까지 header -->









			<!------------여기부터 입력----------->
			<div class="container">
				<div class="row mt-4">
				<div class="col"></div>
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">회원가입</h3>
							</div>
							<div class="card-body">
								<form method="post" action="${cpath}/join.do" name="frm"
									onsubmit="return checkValue()">
									<input type="hidden" name="chk" value=0>
									<div class="form-group mb-3 ">
										<label class="form-label required">이메일</label>
										<div>

											<input type="email" class="form-control"
												aria-describedby="emailHelp" placeholder="이메일 형식으로 입력해주세요"
												id="login_id" name="login_id" maxlength="50" required
												onchange="fn_idcheck()">

											<div class="col-6 col-sm-4 col-md-2 col-xl py-3">
												<a href="#" class="btn btn-info w-100" button type="button"
													onclick="fn_idcheck()"> 중복확인
													</button>
													</td>
												</a>
											</div>

										</div>
									</div>
									<div class="form-group mb-3 ">
										<label class="form-label required">비밀번호</label>
										<div>

											<input type="password" class="form-control" id="u_pw"
												name="u_pw" maxlength="50" placeholder="비밀번호를 8자리 이상 입력해주세요"
												required>

										</div>
									</div>
									<div class="form-group mb-3 ">
										<label class="form-label required">비밀번호 확인</label>
										<div>

											<input type="password" class="form-control" id="u_pwcheck"
												name="u_pwcheck" maxlength="50" required
												placeholder="비밀번호를 다시 한번 입력해주세요">

										</div>
									</div>
									<div class="form-group mb-3 ">
										<label class="form-label required">이름</label>
										<div>

											<input type="text" class="form-control" id="user_name"
												name="user_name" maxlength="50" placeholder="이름을 입력해주세요">


										</div>

									</div>
									<div class="form-group mb-3 ">
										<label class="form-label required">닉네임</label>
										<div>

											<input type="text" class="form-control" id="u_nick"
												name="u_nick" maxlength="20" placeholder="닉네임을 입력해주세요"
												required onchange="fn_niccheck()">

											<div class="col-6 col-sm-4 col-md-2 col-xl py-3">
												<a href="#" class="btn btn-info w-100" button type="button"
													onclick="fn_niccheck()">중복확인
													</button>
												</a>
												</td>

											</div>
										</div>
									</div>

									<div class="form-group mb-3 ">
										<label class="form-label required">생일</label>

										<div>
											<input type="date" id="u_birthdate" name="u_birthdate"
												class="form-control" required>
										</div>
									</div>
									<div class="form-group mb-3 ">
										<label class="form-label required">주소</label>


										<div class="input-group mb-2 mt-2">
											<input type="text" class="form-control" id="sample6_postcode"
												placeholder="우편번호" name="post" autocomplete="off"> <span
												class="input-group-text"
												onclick="sample6_execDaumPostcode()"> 우편번호 찾기 </span>
										</div>

										<input type="text" id="sample6_address" class="form-control"
											name="u_addr" placeholder="주소">
										<div class="input-group mb-2 mt-2">
											<input type="text" id="sample6_detailAddress"
												class="form-control" name="u_addr1" placeholder="상세주소">
											<div class="input-group mb-2 mt-2">
												<input type="text" id="sample6_extraAddress"
													class="form-control" placeholder="동이름">
											</div>
										</div>
										
									</div>

									<div class="form-footer">
										<button type="submit" class="btn btn-primary"
											onclick="fn_submit();return false;">가입</button>
									</div>
								</form>
							</div>
						</div>
						
					</div>
				<div class="col"></div>
				</div>
			</div>
			<!-- footer -->
			<!-- WEB-INF폴더에서 사용시 page="../footer/footer.jsp"로 변경 -->
			<jsp:include page="../../footer/footer.jsp" />
		</div>
	</div>
	<script>
					function fn_idcheck(){
						var login_id=document.frm.login_id.value;
						var arrUrl=[".com", ".net"];
						var check1 = false;
						var check2 = false;
						
						if(login_id==""){
							 alert("아이디를 입력해주세요.")
							 document.frm.login_id.focus()
							 return false;
					    }
						
						if(login_id.indexOf("@")>0){
							check1=true;
						}
						for(var i=0; i<arrUrl.length; i++){
							if(login_id.indexOf(arrUrl[i])>0){
								check2 = true;
							}
						}
						if(check1 && check2){
							var url="${cpath}/idCheck.do?login_id="+login_id;
							window.open(url,"중복아이디체크","width=300,height=200")	
						}else{
							alert("아이디는 이메일 형식으로 넣어주세요")
							document.frm.login_id.focus()
						}
						
					}
					
					function fn_niccheck(){
						var u_nick=document.frm.u_nick.value;
						if(u_nick==""){
							 alert("닉네임을 입력해주세요.")
							 document.frm.u_nick.focus()
							 return false;
					    }
						if(u_nick.length<1 || u_nick.length>15){
							alert("닉네임은 1~15자리로 입력해주세요")
							document.frm.u_nick.focus()
							return false;
						}
						var url="${cpath}/nicCheck.do?u_nick="+u_nick;
						window.open(url,"중복닉네임 체크","width=300,height=200")
					}
					
					 //비번 8자리이상입력
					 let u_pw=document.querySelector('#u_pw')
					let u_pwcheck=document.querySelector('#u_pwcheck')
					u_pw.addEventListener("change",checku_pw)
					u_pwcheck.addEventListener('change', compareu_pw)
					
					function checku_pw(){
						if(this.value.length<8){
							alert("비밀번호는 8자리 이상")
							this.focus()
						}
					}
					//비밀번호와 비밀번호확인값이 같은지 확인
					//값이 틀리면 "암호가 다릅니다 다시 입력하세요!!!"
					function compareu_pw(){
						console.log("1 : "+this.value);
						console.log("2 : "+u_pw.value);
						if(this.value!=u_pw.value){
							alert("암호가 다릅니다 다시 입력하세요!!!")
							this.value=""
							this.focus()
						}
					}
					
					//가입버튼 눌렀을때 확인
					function fn_submit(){
						var f = document.frm;
							
						if(f.login_id.value==""){
							alert("아이디를 입력해주세요");
							f.login_id.focus();
							return false;
						}
						if(f.chk.value=="0"){
						 	alert("아이디 중복체크를 해주세요.")
						 	return false;
						}
						
						if(f.u_pw.value==""){
							alert("암호를 입력해주세요.");
							f.u_pw.focus();
							return false;				
						}
						if(f.user_name.value==""){
							alert("이름을 입력해주세요.")
							f.user_name.focus();
							return false;				
						}
						f.submit();
					}

					</script>

										<script
											src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
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
</body>
</html>