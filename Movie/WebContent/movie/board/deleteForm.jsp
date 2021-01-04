<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 삭제 화면</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
<form action="delete.do" method="post" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
	<table>
		<caption>게시글 삭제 화면</caption>
		<tr>
			<td colspan = "2">
				<a href = "javascript:document.f.submit()">[게시물 삭제]</a>
				<a href = "javascript:history.go(-1)">[뒤로가기]</a>
			</td>
		</tr>
	</table>
</form>

</body>
</html>