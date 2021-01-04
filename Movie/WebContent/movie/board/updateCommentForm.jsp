<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>댓글 수정 화면</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
<form action="updateComment.do" method="post" name = "f">
<input type = "hidden" name = "comment_num" value = "${param.comment_num}">
	<table>
		<caption>댓글 수정</caption>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "comment_content">${param.comment_content}
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "javascript:document.f.submit()">[댓글 수정]</a>
				<a href = "javascript:history.go(-1)">[뒤로가기]</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>