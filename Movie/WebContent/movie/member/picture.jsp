
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script>
		opener.document.getElementById("picture").src="picture/${fname}";
		opener.document.f.picture.value="${fname}";
		self.close();
	</script>
</body>
</html>