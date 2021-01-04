<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<decorator:head />
<link rel="stylesheet" href="${path}/resource/mycss.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type = "text/javascript" src = "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
</head>
<body>
	<div id="wrap">
		<!-- header, nav configuration -->
		<div id="header">
			<div id="headerMenu">
				<ul class="headerMenubar">
					<core:if test = "${empty sessionScope.login}">
					<li><a href="${path}/movie/board/index.do">MAIN</a></li>
					<li><a href = "${path}/movie/member/loginForm.me">LOGIN</a></li>
					<li><a href = "${path}/movie/member/joinForm.me">JOIN</a></li>
					</core:if>
					<core:if test = "${!empty sessionScope.login}">
					<li><a href="${path}/movie/board/index.do">MAIN</a></li>
					<li><a href = "${path}/movie/member/info.me?id=${sessionScope.login}">MYPAGE</a></li>
					<li><a href = "${path}/movie/member/logout.me">LOGOUT</a></li>
					</core:if>
				</ul>
			</div>
			<div id="headerLogo" class = "headerLogo">
				<div id="headerLogoTable">
					<div class = "headerLogoMark">
					<table>
						<tbody>
							<tr>
								<td align="center" height="70"><a href="${path}/movie/board/index.do"> <img
										src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PHBhdGggZD0ibTMyNC43NSAwaC0yMDMuNzV2OTBoMjQwYzY2LjcyIDAgMTIxIDU0LjI4IDEyMSAxMjEgMCA1NS4wMjQtMzguODU2IDEwMi45MzctOTEuMzMyIDExNi4yOTQuMjEzLTMuNzM5LjMzMi03LjUwMi4zMzItMTEuMjk0IDAtMTA4LjA3NS04Ny40NzctMTk2LTE5NS0xOTYtMTA3Ljc5OCAwLTE5NiA4OC4yMTMtMTk2IDE5NiAwIDEwNy43OTkgODguMjE0IDE5NiAxOTYgMTk2IDcwLjc3IDAgMTMyLjg1MS0zOC4wOTMgMTY3LjAyNi05NC45NDcgODYuMzE0LTE4LjA1MSAxNDguOTc0LTk0LjM0NyAxNDguOTc0LTE4Mi4zMDMgMC0xNS4wOTIgMC0zMi40MDggMC00Ny41IDAtMTAyLjk2NC04NC4zMDEtMTg3LjI1LTE4Ny4yNS0xODcuMjV6bS0yMy43NSA2MGgtNjB2LTMwaDYwem0tMTUwLTMwaDYwdjMwaC02MHptMjEwIDMwaC0zMHYtMjkuODYyYzQ1LjM3NyAxLjc4NCA4NS44OCAyMi44NzQgMTEzLjQ4MyA1NS4yOC0yNC42MTUtMTYuNTM3LTUzLjQyMy0yNS40MTgtODMuNDgzLTI1LjQxOHptLTE2NSA0MjJjLTkxLjUzMyAwLTE2Ni03NC40NjctMTY2LTE2NnM3NC40NjctMTY2IDE2Ni0xNjZjOTAuOTgxIDAgMTY1IDc0LjQ2NyAxNjUgMTY2cy03NC4wMTkgMTY2LTE2NSAxNjZ6bTE4My45ODgtMTAxLjA3MWMyLjUxNC03LjE3NyA0LjYyNi0xNC41NDIgNi4zMDMtMjIuMDcxIDIwLjQ0MS0zLjQ2NiAzOS44NTktMTEuMDgxIDU3LjEyNS0yMi4zMjYtMTYuOTcxIDE5LjUzOS0zOC42OTYgMzUuMDE1LTYzLjQyOCA0NC4zOTd6Ii8+PHBhdGggZD0ibTE5NiAyNzFjMjQuODEzIDAgNDUtMjAuMTg3IDQ1LTQ1cy0yMC4xODctNDUtNDUtNDUtNDUgMjAuMTg3LTQ1IDQ1IDIwLjE4NyA0NSA0NSA0NXptMC02MGM4LjI3MSAwIDE1IDYuNzI5IDE1IDE1cy02LjcyOSAxNS0xNSAxNS0xNS02LjcyOS0xNS0xNSA2LjcyOS0xNSAxNS0xNXoiLz48cGF0aCBkPSJtMTk2IDM2MWMtMjQuODEzIDAtNDUgMjAuMTg3LTQ1IDQ1czIwLjE4NyA0NSA0NSA0NSA0NS0yMC4xODcgNDUtNDUtMjAuMTg3LTQ1LTQ1LTQ1em0wIDYwYy04LjI3MSAwLTE1LTYuNzI5LTE1LTE1czYuNzI5LTE1IDE1LTE1IDE1IDYuNzI5IDE1IDE1LTYuNzI5IDE1LTE1IDE1eiIvPjxwYXRoIGQ9Im0xMDYgMjcxYy0yNC44MTMgMC00NSAyMC4xODctNDUgNDVzMjAuMTg3IDQ1IDQ1IDQ1IDQ1LTIwLjE4NyA0NS00NS0yMC4xODctNDUtNDUtNDV6bTAgNjBjLTguMjcxIDAtMTUtNi43MjktMTUtMTVzNi43MjktMTUgMTUtMTUgMTUgNi43MjkgMTUgMTUtNi43MjkgMTUtMTUgMTV6Ii8+PHBhdGggZD0ibTI4NiAyNzFjLTI0LjgxMyAwLTQ1IDIwLjE4Ny00NSA0NXMyMC4xODcgNDUgNDUgNDUgNDUtMjAuMTg3IDQ1LTQ1LTIwLjE4Ny00NS00NS00NXptMCA2MGMtOC4yNzEgMC0xNS02LjcyOS0xNS0xNXM2LjcyOS0xNSAxNS0xNSAxNSA2LjcyOSAxNSAxNS02LjcyOSAxNS0xNSAxNXoiLz48cGF0aCBkPSJtMTgxIDMwMWgzMHYzMGgtMzB6Ii8+PC9nPjwvc3ZnPg=="
										width="200" height="100" border="0" />
								</a></td>
							</tr>
						</tbody>
					</table>
					</div>
				</div>
			</div>
		<div id="headerNavi">
			<ul class="headerNaviMenubar">
				<li><a href="${path}/movie/Movie/introductionpage.jsp">사이트 소개</a></li>
				<li><a href="${path}/movie/Movie/moviesearch.jsp">영화 세상</a></li>
				<li><a href="${path}/movie/board/list.do?board_type=1">극장 마실</a></li>
				<li><a href="${path}/movie/board/list.do?board_type=2">정보 바다</a></li>
				<li><a href="${path}/movie/board/list.do?board_type=3">나눔 누리</a></li>
				<li><a href="${path}/movie/board/list.do?board_type=4">활동 마당</a></li>
			</ul>
		</div>
	</div>
	<!-- main content configuration, this will be decorator activating -->
	<div id="container" style = "height : 50%">
	<table style = "width: 100%">
		<tr>
			<td width = 25%;>
			</td>
			<td width = 50%;>
				<decorator:body />
			</td>
			<td width = 25%;>
			</td>
		</tr>
	</table>
	</div>
	<!-- footer information configuration -->
	<div id="footer">
		 <footer>
            <div class="container">
                <div class="footerMain">
                <h2>
                    OH SEUNG HYUN
                </h2>
                    <p>
                        CheongRa, Incheon, Republic of Korea
                        <br>
                        <a href="https://github.com/LucestDail">Goodee Company, Web-Server dept, Junior Backend Developer</a>
                    </p>
                </div>
                <div class="footerCopyright">
                DevHyun All rights reserved
                </div>
            </div>
        </footer>
	</div>
	</div>
</body>
</html>