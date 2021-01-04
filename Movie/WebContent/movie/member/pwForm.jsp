<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<form action="pw.me" method="post">
	<table class = "table"><caption>비밀번호 찾기</caption>
		<tr>
			<th>아이디</th>
			<td>
				<input type = "text" name = "id" class="form-control">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type = "text" name = "email" class="form-control">
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<input type = "submit" value = "비밀번호찾기"  class = "form-control">
			</td>
		</tr>
	</table>
</form>
</body>
</html>