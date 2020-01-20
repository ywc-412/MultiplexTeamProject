<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>S_CINEMA</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- <link rel="manifest" href="site.webmanifest"> -->
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon2.png">
	<!-- Place favicon.ico in the root directory -->
	<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
	<!-- CSS here -->
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/css/themify-icons.css">
	<link rel="stylesheet" href="/resources/css/nice-select.css">
	<link rel="stylesheet" href="/resources/css/flaticon.css">
	<link rel="stylesheet" href="/resources/css/gijgo.css">
	<link rel="stylesheet" href="/resources/css/animate.css">
	<link rel="stylesheet" href="/resources/css/slicknav.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	<link rel="stylesheet" href="/resources/css/custom-choi.css">
	<link rel="stylesheet" href="/resources/css/custom-jj.css">
	<link rel="stylesheet" href="/resources/css/custom-hanna.css">
	<link rel="stylesheet" href="/resources/css/custom-hong.css">
	<link rel="stylesheet" href="/resources/css/custom-lee.css">
	<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<div class="header-area">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid p-0">
					<div class="row align-items-center no-gutters">
						<div class="col-xl-2 col-lg-2">
							<div class="logo-img">
								<a href="index.html">
									<img src="/resources/img/sCineLogo3.png" alt="">
								</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6">
							<div class="main-menu d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a class="active" href="index.html">영화</a></li>
										<li><a href="#">예매 <i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="/reserve/register">영화 예매</a></li>
												<li><a href="/schedule/get">상영시간표</a></li>
											</ul>
										</li>
										<li><a href="#">리뷰</a></li>
										<li><a href="#">기프티콘</a></li>
										<li><a href="#">건의사항</a></li>
										<li><a href="#">공지사항</a></li>
										<li><a href="#">습득물</a></li>
									</ul>
								</nav>
							</div>
						</div>

						<!--						<div class="col-xl-4 col-lg-4 d-none d-lg-block">-->
						<div class="col-xl-4 col-lg-4 d-lg-block">
							<div class="custom-margin">
								
							</div>
							<div class="custom-margin">
								<sec:authorize access="!isAuthenticated()">
									<button class="btn btn-primary pull-right" id="joinBtn">회원가입</button>
									<button class="btn btn-primary pull-right" id="loginBtn">로그인</button>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<button class="btn btn-primary pull-right" id="logoutBtn">로그아웃</button>
								
									<sec:authorize access="hasRole('ROLE_MEMBER')">
										<button class="btn btn-primary pull-right" id="myPageBtn">마이페이지</button>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<button class="btn btn-primary pull-right" id="adminPageBtn">관리자페이지</button>
									</sec:authorize>
								</sec:authorize>
							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
										
										
	<script>
		$(function(){
			$('#joinBtn').on("click", function(){
				location.href="/member/join";
			});
			
			$('#loginBtn').on("click", function(){
				location.href="/customLogin";
			});
			
			$('#logoutBtn').on("click", function(){
				location.href="/logout";
			});
		})
		
	</script>