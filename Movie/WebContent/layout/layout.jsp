<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "decorator" uri = "http://www.opensymphony.com/sitemesh/decorator" %>
<core:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<decorator:head />
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<table>
		<tr>
			<td colspan = "3" align = "right">
			자바/스프링 기반 빅데이터 플랫폼 개발자 양성과정 모델2 프로그램 연습
			<span style = "float:right;">
				<core:if test = "${empty sessionScope.login}">
					<a href = "${path}/movie/member/loginForm.me"> 로그인 </a><br>
					<a href = "${path}/movie/member/joinForm.me"> 회원가입 </a><br>
				</core:if>
				<core:if test = "${!empty sessionScope.login}">
					${sessionScope.login} 님이 로그인하셨습니다...
					<a href = "${path}/movie/member/logout.me">로그아웃</a><br>
				</core:if>
			</span>
			</td>
		</tr>
		<tr>
			<td width = "15%" style = "vertical-align: top">
				<a href = "${path}/movie/member/main.me">회원관리</a><br>
				<a href = "${path}/movie/board/list.do">게시판</a><br>
				<a href = "${path}/movie/chat/chatForm.do">채팅</a>
			</td>
			<td colspan = "2" style = "text-align: left; vertical-align:top;">
			<decorator:body /><%-- <body> 태그 내용 추가 --%>
			</td>
		</tr>
		<tr>
			<td colspan = "3">  구디 아카데미 Since 2016
			</td>
		</tr>
	</table>
</body>
</html>