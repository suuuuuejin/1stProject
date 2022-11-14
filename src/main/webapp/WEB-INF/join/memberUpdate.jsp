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
<link href="${cpath}/css/tabler.css" rel="stylesheet" />
<link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

<!-- Libs JS -->

<!-- Tabler Core -->
<script src="${cpath}/js/tabler.min.js" defer></script>

<!-- my -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="${cpath}/css/my/sub.css">
<link rel="stylesheet" href="${cpath}/css/my/kakao.css">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	viewport-fit=cover" >
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>


</head>
<script type="text/javascript">

function fn_view(login_id){
	if(confirm("취소하시겠습니까?"))
	location.href="${cpath}/memberView.do?login_id="+login_id;
}

</script>
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
				<!--프로필 시작-->

				<div class="card-body text-center mb-4">
					<span class="avatar avatar-xl mb-3 avatar-rounded"
						style="background-image: url(https://img.freepik.com/premium-vector/illustration-of-earth-character-sprouts_279539-60.jpg?w=1060)"></span>
					<h3 class="m-0 mb-1">
						<a href="#">${mvo.u_nick }</a>
					</h3>
					<div class="text-muted">${mvo.login_id }</div>
					<div class="mt-3">
						<span class="badge bg-blue-lt">등급</span>
					</div>
				</div>
				<!-- 프로필 끝-->

				<div class="progress mb-2">
					<div class="progress-bar" style="width: ${mvo.u_point}%" role="progressbar"
						aria-valuenow="38" aria-valuemin="0" aria-valuemax="100"
						aria-label="38% Complete">
						<span class="visually-hidden">38% Complete</span>
					</div>
				</div>
				<p class="text-center">
					<small>포인트</small>
				</p>
				<div
					class="list-group list-group-transparent mb-3 ml-3  theme-light mb-5">
					<a
						class="list-group-item list-group-item-action d-flex align-items-center"
						href="${cpath}/memberView.do"> 내 프로필 수정 </a> <a
						class="list-group-item list-group-item-action d-flex align-items-center"
						href="${cpath}/mypageWrite.do"> 내가 쓴 글 <small class="text-muted ms-auto">45</small>
					</a> <a
						class="list-group-item list-group-item-action d-flex align-items-center"
						href="${cpath}/mypageComment.do"> 내가 쓴 댓글 <small class="text-muted ms-auto">88</small>
					</a>
				</div>
			</div>
			<div class="col-12 col-md-9">
				<div class="row">
					<div class="col-12">
						<!-- 게시판-->
						
							<div class="row">
				<!-- <div class="col"></div> -->
					<div class="col-md-10 mt-1">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">회원정보 수정</h3>
							</div>
							<div class="card-body">
								<form method="post" action="${cpath}/memberUpdate.do" name="frm"
									onsubmit="return checkValue()">
									
									<input type="hidden" name="chk" value=0>
									<div class="form-group mb-3 ">
									
										<label class="form-label required">아이디</label> 
										<div>									
											<input readonly type="email" class="form-control  text-muted" id="login_id" 
												name="login_id" maxlength="50" value="${vo.login_id}" required style="background-color: #e2e2e2;">																												
										</div>
									</div>
									<div class="form-group mb-3 ">
                      <label class="form-label required">이름</label>
                      <div>									
											<input readonly type="email" class="form-control  text-muted" id="login_id" 
												name="user_name" maxlength="50" value="${vo.user_name}" required style="background-color: #e2e2e2;">																												
										</div>                  
										</div>
										<div class="form-group mb-3 ">
                      <label class="form-label required">가입날짜</label> 
                      <div>									
											<input readonly type="email" class="form-control  text-muted" id="login_id"
												name="joindate" maxlength="50" value="${vo.joindate}" required style="background-color: #e2e2e2;">																												
										</div>                  
										</div>
																	                     					 
									<div class="form-group mb-3 ">
										<label class="form-label required">비밀번호</label> 
										<div>
										
											<input type="password" class="form-control" id="u_pw"
												name="u_pw" maxlength="50"  required>
												
										</div>
										</div>
										<div class="form-group mb-3 ">
											<label class="form-label required">비밀번호 확인</label> 
                      <div>
                      
                        <input type="password" class="form-control" id="u_pwcheck" name="u_pwcheck"
						maxlength="50" required >  
						          
                      </div>
                      </div>
                      
										<div class="form-group mb-3 ">
											<label class="form-label required">닉네임</label> 
											<div>
											<div class="input-group mb-2 mt-2">
				                              <input type="text" class="form-control" id="u_nick" maxlength="20" value="${vo.u_nick}" name="u_nick" autocomplete="off" onchange="fn_niccheck()">
				                              <span class="input-group-text" required onclick="fn_niccheck()">
				                                중복확인
				                              </span>
				                            </div>
														
											</div>
										</div>
									
									<div class="form-group mb-3 ">
										<label class="form-label required">생일</label> 
										<small></small>
											
										<div>
											<input type="date" id="u_birthdate" name="u_birthdate"
												class="form-control" required value="${vo.u_birthdate}">
										</div>
									</div>
									<div class="form-group mb-3 ">
										<label class="form-label required">주소</label>
									
																		
											<div class="input-group mb-2 mt-2">
				                              <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" name="post" autocomplete="off">
				                              <span class="input-group-text" onclick="sample6_execDaumPostcode()">
				                                우편번호 찾기
				                              </span>
				                            </div>

											  <input type="text" id="sample6_address"
												class="form-control" name="u_addr" placeholder="주소">
												<div class="input-group mb-2 mt-2">
											 <input type="text" id="sample6_detailAddress"
												class="form-control" name="u_addr1" placeholder="상세주소">
												<div class="input-group mb-2 mt-2">
											<input type="text" id="sample6_extraAddress"
												class="form-control" placeholder="동이름"> 
										</div>
										</div>
										<script>
					
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
					u_pw.addEventListener("change",checku_pw);
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
									</div>

									<div class="form-footer">
										<button type="submit" class="btn btn-sm btn-primary">수정</button>
										<button type="reset" class="btn btn-sm btn-warning" onclick="fn_view('${vo.login_id}');return false;">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
						
						
						
<!-- 게시판 -->
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
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type='text/javascript'>
Kakao.init('281c02fa614e4ca369f032f5a1b0b714');


$("#kakao-login-btn").on("click", function(){
    //1. 로그인 시도
    Kakao.Auth.login({
        success: function(authObj) {
         
          //2. 로그인 성공시, API 호출
          Kakao.API.request({
            url: '/v2/user/me',
            data: {
                property_keys: ["kakao_account.email","kakao_account.profile.nickname"]
            },
            success: function(res) {
              var id = res.id;
			  scope : 'profile_nickname, account_email';
			  alert('로그인성공');
            	
			
			  var param = {
				  user_name : res.kakao_account.profile.nickname,
				  login_id : res.kakao_account.email, 
				  u_nick : id
    			}
			  
			  
            	$.ajax({
            		url:'${cpath}/kakaoLogin.do',
            		type: 'post',
            		data: param,
            		success: function(da){
            			 location.href="${cpath}/kakaoLoginS.do";
            		}
            	})
            	            	
            	
            	
             /*  console.log(res);
			
              location.href="${cpath}/kakaoLogin.do?userName="+res.kakao_account.profile.nickname+"&email="+res.kakao_account.email+"&user_id="+id;   */
		              
        }
          })
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
}) //


</script>
</body>
</html>