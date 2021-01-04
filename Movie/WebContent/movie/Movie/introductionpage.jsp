<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Introduction</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
<div class = "introductionWrap">
<table style = "width:100%">
	<tr>
		<td colspan = "2">
		<div class = "introductionHead">
			영화가 좋은 사람들, 영화로와입니다
		</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class = "introductionContent">
				<h2>영화에 대하여</h2><br>
				영화는 우리의 상상력을 자극합니다<br>
				과학과 문학, 예술과 기술<br>
				만나지 않을 것 같은 두 영역을 이어주는<br>
				영상 문화의 결정체<br>
				영화로의 여행에 여러분을 초대합니다.
			</div>
		</td>
		<td>
			<div class = "introductionimg">
				<img src = "${path}/resource/slidimg/movie.jpg" class = "introductionimgsrc">
			</div>
		</td>
	</tr>
		
	<tr>
		<td>
			<div class = "introductionimg">
				<img src = "${path}/resource/slidimg/cinema.jpg" class = "introductionimgsrc">
			</div>
		</td>
		<td>
			<div class = "introductionContent">
				<h2>소통을 위한 커뮤니티</h2><br>
				대화와 소통을 통한 여러가지 활동<br>
				정보, 티켓, 시사회, 이벤트 정보 나눔까지<br>
				사람과의 정까지 서로주고받는 화합의 커뮤니티<br>
				영화로와로 여러분을 환영합니다.
			</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>