<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- CSS files -->
<link href="${cpath}/css/tabler.css" rel="stylesheet" />
<link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

<!-- Libs JS -->

<!-- Tabler Core -->
<script src="${cpath}/js/tabler.min.js" defer></script>
<!-- my -->
<link rel="stylesheet" href="${cpath}/css/my/indexmy.css">
<title>FOR THE URTH</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
	viewport-fit=cover" >
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

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

</head>
<body>
	  <div class="page">
    <div class="page-main bgbg">
      <div class="wrap">
        <header class="navbar navbar-expand-md">
          <div class="container">
            <h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
              <a href="#">
                <img src="${cpath }/img/my/logo.png"  alt="Logo"  width="90rem" height="auto" >
              </a>
            </h1>
			<!-- 로그인 했음 -->
			
			<div class="navbar-nav flex-row order-md-last">
			<c:if test="${!empty mvo}">
            <div class="nav-item dropdown" id="user-box">
              <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown"
                aria-label="Open user menu">
                <span class="avatar avatar-sm" style="background-image: url(${cpath}${grade })"></span>
                <div class="d-none d-xl-block ps-2">
                  <div>${mvo.u_nick }</div>
                  <div class="text-muted mt-1"><small>${mvo.u_grade }</small></div>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
	              <c:choose>
	              <c:when test="${mvo.u_grade == 'admin' }">
                 	 <a href="${cpath}/memberlist.do?" class="dropdown-item">Admin Page</a>
                 </c:when>
                 <c:otherwise>
                	 <a href="${cpath}/mypageWrite.do" class="dropdown-item">My account</a>
                 </c:otherwise>
                 </c:choose>
                  <div class="dropdown-divider"></div>
                  <a href="${cpath}/logout.do" class="dropdown-item">Logout</a>
              </div>
            </div>
            </c:if>
            
			<!-- 로그인 하기전 -->
			<c:if test="${empty mvo}">
			<div class="mt-2" id="loginbtn">
					<button  class="btn btn-light" onclick="location.href='${cpath}/loginForm.do'">Login / Join</button>
					<%-- <button  class="btn btn-light" onclick="location.href='${cpath}/joinForm.do'">회원가입</button> --%>
				</div>
 			</c:if>
              <!-- c:if -->
            </div>
            <div class="collapse navbar-collapse" id="navbar-menu">
              <div class="d-flex flex-column flex-md-row flex-fill align-items-stretch align-items-md-center">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link" href="${cpath }/map.do">
                      <span class="nav-link-title">
                        Maps
                      </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${cpath}/weeklyView.do">
                      <span class="nav-link-title">
                        주간인기검색어
                      </span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${cpath}/youtubelist.do">
                      <span class="nav-link-title">
                        Youtube Archive
                      </span>
                    </a>
                  </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" aria-expanded="false">
                    <span class="nav-link-title">
                      FOR THE YOUR
                    </span>
                  </a>
                  <div class="dropdown-menu dropdown-menu">
                    <div class="dropdown-menu-columns">
                      <div class="dropdown-menu-column">
                        <a class="dropdown-item" href="${cpath }/zwlist.do?page=1">
                          제로웨이스트
                        </a>
                        <a class="dropdown-item" href="${cpath }/imgList.do">
                          실천해요
                        </a>
                       <a class="dropdown-item" href="${cpath }/tolist.do?page=1">
                            함께해요
                          </a>
                        </a>
                        <a class="dropdown-item" href="${cpath }/gradeList.do">
                          아나바다
                        </a>
                      </div>
                      </div>
                    </div>
                  </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#navbar-layout" role="button" aria-expanded="false">
                    <span class="nav-link-title ">
                      FOR THE EARTH
                    </span>
                  </a>
                  <div class="dropdown-menu dropdown-menu-arrow">
                    <div class="dropdown-menu-columns">
                      <div class="dropdown-menu-column">
                        <a class="dropdown-item" href="${cpath}/callist.do">
                          칼럼 Archive
                        </a>
                        <a class="dropdown-item" href="${cpath}/buylist.do">
                          공동구매
                        </a>
                      </div>
                    </div>
                    </div>
                  </li>

                </ul>
              </div>
            </div>
          </div>
        </header>
      </div>
      <div class="bg-area-wrap">
	
        <div class="container main-d">
          <div class="row">
            <div class="col-4">
              <span class="text-light main-text">TOGETHER</span>

            </div>
            <div class="col ">
              <div class="main-img-1"></div>
            </div>
            <div class="col-2">
              <span class="main-text float-xxl-end">VEGAN</span>
            </div>
          </div>
          <div class="row">
            <div class="col">
              <div class="main-img-2"></div>
            </div>
            <div class="col-6">
              <span class="text-light main-text float-xxl-end">WE CAN SAVE</span>
            </div>
          </div>
        </div>
      </div>
      <div class="bg-img">
      </div>
      <!--검정배경끝-->
      <div class="container-wrap ">
        <div class="container ">
          <div class="container pt-4 pb-4">
            <div class="page-header pb-3">
              <div class="row align-items-center mb-3">
                <div class="co my-title">
                  <h2 class="page-title ">
                    <span>Weekely Best</span>&nbsp;Posts
                  </h2>
                  <!-- <div class="wd ud"></div> -->
                </div>
                <div class="col-auto ms-auto">
                  <div class="btn-list">
                  </div>
                </div>
              </div>
              <div class="row my-3">
              
              </div>
            </div>
            <div class="row mb-3">
             <div class="col-md-3">
                <div class="card">
                  <div class="card-status-start bg-blue"></div>
                  <div class="card-body">
                    <h3 class="card-title text-truncate"><a href="${cpath }/boardView.do?num=${zw.zw_seq}&login_id=${mvo.login_id}" class="text-truncate">${zw.zw_title }</a>
                    </h3>
                    <div class="text-muted mb-1 hei">${zw.zw_content }</div>
                    <p class="text-muted text-end"><small>${zw.zw_date }</small></p>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card">
                  <div class="card-status-start bg-blue"></div>
                  <div class="card-body">
                    <h3 class="card-title text-truncate"><a href="${cpath }/imgBoardView.do?num=${img.img_seq}" class="text-truncate">${img.img_title }</a>
                    </h3>
                    <div class="text-muted mb-1 hei">${img.img_content }</div>
                    <p class="text-muted text-end"><small>${img.img_regdate}</small></p>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card">
                  <div class="card-status-start bg-blue"></div>
                  <div class="card-body">
                    <h3 class="card-title text-truncate"><a href="${cpath }/toboardView.do?num=${to.tb_seq}&login_id=${mvo.login_id}" class="text-truncate">${to.tb_title }</a>
                    </h3>
                    <div class="text-muted mb-1 hei">${to.tb_content }</div>
                    <p class="text-muted text-end"><small>${to.tb_regdate }</small></p>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card">
                  <div class="card-status-start bg-blue"></div>
                  <div class="card-body">
                    <h3 class="card-title text-truncate"><a href="${cpath }/buyboardView.do?num=${buy.buy_seq}&login_id=${mvo.login_id}"  class="text-truncate">${buy.buy_title}</a>
                    </h3>
                    <div class="text-muted mb-1 hei">${buy.buy_content }</div>
                    <p class="text-muted text-end"><small>${buy.buy_regdate }</small></p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container mb-45">
        <div class="row my-4">
          <div class="col my-title">
            <h2 class="page-title">
              &nbsp;함께해요!🌿<span>진행중인 Challenge</span>
            </h2>
            <div class="ud"></div>
          </div>
          <div class="col-auto ms-auto mt-3">
            <div class="btn-list">
              <span class="d-none d-sm-inline">
                <a href="${cpath }/imgList.do" class="btn border-blue text-blue btn-outline-blue rdm-btn" id="">
                  더보기 +
                </a>
              </span>
            </div>
          </div>
        </div>
        <div class="row g-2">
        <c:forEach var ="vo" items="${mainimg }">
           <div class="col-3 col-sm-4">
            <div class="card">
            <c:choose>
            <c:when test="${vo.img_file1 ne ' ' }">
              <div class="card-img-top img-responsive img-responsive-21x9" style="background-image: url(${cpath }/upload/${vo.img_file1}?type=w1200)"></div>
            </c:when>
            <c:when test="${vo.img_file2 ne ' ' }">
              <div class="card-img-top img-responsive img-responsive-21x9" style="background-image: url(${cpath }/upload/${vo.img_file2}?type=w1200)"></div>
            </c:when>
            <c:when test="${vo.img_file3 ne ' ' }">
              <div class="card-img-top img-responsive img-responsive-21x9" style="background-image: url(${cpath }/upload/${vo.img_file3}?type=w1200)"></div>
            </c:when>
            <c:when test="${vo.img_file4 ne ' ' }">
              <div class="card-img-top img-responsive img-responsive-21x9" style="background-image: url(${cpath }/upload/${vo.img_file4}?type=w1200)"></div>
            </c:when>
            <c:when test="${vo.img_file5 ne ' ' }">
              <div class="card-img-top img-responsive img-responsive-21x9" style="background-image: url(${cpath }/upload/${vo.img_file5}?type=w1200)"></div>
            </c:when>
            </c:choose>
              
              <div class="card-body">
                <p class="text-green">[${vo.img_headline}]<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 21c.5 -4.5 2.5 -8 7 -10"></path><path d="M9 18c6.218 0 10.5 -3.288 11 -12v-2h-4.014c-9 0 -11.986 4 -12 9c0 1 0 3 2 5h3z"></path></svg></p>
              
                <a href="${cpath }/imgBoardView.do?num=${vo.img_seq}" class="text-reset">
                <h3 class="card-title">${vo.img_title }<span class="text-orange">&nbsp;[${vo.img_cmtcnt }]</span></h3></a>
                <div class="text-truncate" id="s">
                	<div class="text-muted text-truncate">${vo.img_content }</div>
                </div>
                <hr class="mb-3 mt-2">
                <div class="d-flex align-items-center">
    
                        <div>
                          <div class="fs10">${vo.login_id }</div>
                          <div class="text-muted fs10">${vo.img_regdate }</div>
                        </div>
                        <div class="ms-auto">
                          <span class="text-muted">
                            <!-- Download SVG icon from http://tabler-icons.io/i/eye -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="12" cy="12" r="2"></circle><path d="M22 12c-2.667 4.667 -6 7 -10 7s-7.333 -2.333 -10 -7c2.667 -4.667 6 -7 10 -7s7.333 2.333 10 7"></path></svg>
                            ${vo.img_cnt }
                          </span>
                          <span href="#" class="ms-3 text-muted">
                            <!-- Download SVG icon from http://tabler-icons.io/i/heart -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428m0 0a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572"></path></svg>
                            ${vo.img_likes }
                          </span>
                        </div>
                      </div>
              </div>
            </div>
          </div>
          
         </c:forEach>
         </div>
      </div>

    </div>
    <!--검정배경-->
    <div class="container-wrap bl PT-3">
      <div class="container">
        <div class="row">
          <div class="col-4">
            <span class="main-text">ZEROWASTE</span>

          </div>
          <div class="col ">
            <div class="main-img-3"></div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="main-img-4"></div>
          </div>
          <div class="col-5">
            <span class="text-light main-text float-xxl-end">THE PLANET.</span>
          </div>
          <div class="col">
            <div class="bg-text">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
              dolore magna
              aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
              consequat.

            </div>
          </div>
        </div>
      </div>
		<jsp:include page="../../footer/footer.jsp" />
    </div>
  </div>
	
	
	
</body>
</html>