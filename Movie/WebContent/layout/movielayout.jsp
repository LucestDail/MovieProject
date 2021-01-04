<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<core:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<!--  meta configuration  -->
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!--  decorator configuration  -->
<title><decorator:title /></title>
<decorator:head />
<!--  link configuration  -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link href="${path}/resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${path}/resource/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="${path}/resource/assets/css/templatemo-style.css">
<link rel="stylesheet" href="${path}/resource/assets/css/owl.css">
<link rel="stylesheet" href="${path}/resource/main.css">

<!--  script configuration  -->
<script src="${path}/resource/vendor/jquery/jquery.min.js"></script>
<script
	src="${path}/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resource/assets/js/browser.min.js"></script>
<script src="${path}/resource/assets/js/breakpoints.min.js"></script>
<script src="${path}/resource/assets/js/transition.js"></script>
<script src="${path}/resource/assets/js/owl-carousel.js"></script>
<script src="${path}/resource/assets/js/custom.js"></script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<div class="logo">
						<a href="${path}/movie/Movie/MovieGet.jsp">영화로와</a>
					</div>
				</header>

				<decorator:body />
			</div>
		</div>

		<!-- Sidebar Configuration -->
		<div id="sidebar">
			<div class="inner">
				<!-- Login Configuration -->
				<section id="search" class="alt">
					<div class="w3-container w3-row">
						<div class="w3-col s8 w3-bar">
							<core:if test="${!empty sessionScope.login}">
								<div class="w3-col s4">
									<img src="${path}/movie/member/picture/${sessionScope.picture}"
										class="w3-circle w3-margin-right" style="width: 46px">
								</div>
								<span>환영합니다! <strong>${sessionScope.login}</strong>님
								</span>
								<br>
								<a href="${path}/movie/member/logout.me">로그아웃</a>
								<a href="${path}/movie/member/info.me?id=${sessionScope.login}">내정보</a>
							</core:if>
							<core:if test="${empty sessionScope.login}">
								<span><strong>안녕하세요! 사이트 방문을 환영합니다!</strong></span>
								<br>
								<a href="${path}/movie/member/loginForm.me"> 로그인 </a>
								<br>
								<a href="${path}/movie/member/joinForm.me"> 회원가입 </a>
							</core:if>
						</div>
					</div>
				</section>

				<!-- Menu Configuration -->
				<nav id="menu">
					<ul>
						<li><a href="${path}/movie/Movie/MovieGet.jsp">메인</a></li>
						<li><a href="${path}/movie/chat/chatform.do">영화 검색</a></li>
						<li><a
							href="${path}/movie/board/list.do?boardname=reviewmovie">리뷰
								게시판</a></li>
						<li><a
							href="${path}/movie/board/list.do?boardname=recommandmovie">추천
								게시판</a></li>
						<li><a
							href="${path}/movie/board/list.do?boardname=requestmovie">요청
								게시판</a></li>
						<li><a
							href="${path}/movie/board/list.do?boardname=discussmovie">토론
								게시판</a></li>
						<li><a
							href="${path}/movie/board/list.do?boardname=etcsomething">기타
								게시판</a></li>
					</ul>
				</nav>

				<!-- Sidebar Footer -->
				<footer id="footer">
					<p class="copyright">
						Copyright &copy; 구디 아카데미 Since 2016 <br>Designed by <a
							rel="nofollow" href="https://github.com/LucestDail">Dev Hyun</a>
					</p>
				</footer>

			</div>
		</div>

	</div>

</body>
</html>