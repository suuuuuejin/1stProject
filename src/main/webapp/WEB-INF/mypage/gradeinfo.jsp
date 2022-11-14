<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="Chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>등급안내</title>
<!-- CSS files -->
<link href="${cpath}/css/tabler.css" rel="stylesheet" />
<link href="${cpath}/css/tabler-vendors.css" rel="stylesheet" />

<!-- Libs JS -->

<!-- Tabler Core -->
<script src="${cpath}/js/tabler.min.js" defer></script>
<!-- my -->
</head>
<body>
	<div class="row row-cards">
		<div class="col-md-6 col-lg-3">
			<div class="card">
				<div class="card-header ">
					<h3 class="card-title">등급안내</h3>
				</div>
				<div class="card-body">
					<div class="form-selectgroup-label d-flex p-3">
						<div class="form-selectgroup-label-content d-flex ">
							<span class="avatar avatar-lg me-3"
								style="background: url(${cpath}/img/my/p2.jpg) center; background-size: cover;"></span>
							<div class="m-auto ms-3">
								<div class="fs-3 text-muted mb-2">
									<small>LV.1</small>
								</div>
								<div class="fs-1 text-blue">지구프렌즈</div>
							</div>
						</div>
					</div>
					<div class="form-selectgroup-label d-flex p-3">
						<div class="form-selectgroup-label-content d-flex ">
							<span class="avatar avatar-lg me-3"
								style="background: url(${cpath}/img/my/p1.jpg) center; background-size: cover;"></span>
							<div class="m-auto ms-3">
								<div class="fs-3 text-muted mb-2">
									<small>LV.2</small>
								</div>
								<div class="fs-1 text-blue">지구지킴단</div>
							</div>
						</div>
					</div>
					<div class="form-selectgroup-label d-flex p-3">
						<div class="form-selectgroup-label-content d-flex ">
							<span class="avatar avatar-lg me-3"
								style="background: url(${cpath}/img/my/p3.jpg) center; background-size: cover;"></span>
							<div class="m-auto ms-3">
								<div class="fs-3 text-muted mb-2">
									<small>LV.3</small>
								</div>
								<div class="fs-1 text-blue">지구특공대</div>
							</div>
						</div>
					</div>
					<div class="form-selectgroup-label d-flex p-3">
						<div class="form-selectgroup-label-content d-flex ">
							<span class="avatar avatar-lg me-3"
								style="background: url(${cpath}/img/my/p4.jpg) center; background-size: cover;"></span>
							<div class="m-auto ms-3">
								<div class="fs-3 text-muted mb-2">
									<small>LV.4</small>
								</div>
								<div class="fs-1 text-blue">지구어벤져스</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>