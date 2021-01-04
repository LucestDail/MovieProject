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
<form action="id.me" method="post">
	<table class = "table"><caption>아이디 찾기</caption>
		<tr>
			<th>이메일</th>
			<td>
				<input type = "text" name = "email" class="form-control">
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<input type = "submit" value = "아이디찾기" class="form-control">
			</td>
		</tr>
	</table>
</form>
</body>
</html>