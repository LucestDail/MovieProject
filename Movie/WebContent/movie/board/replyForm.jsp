<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 
    1. 원글의 num을 파라매터로 받는다.
    2. db에서 num의 게시물을 조회하여 원글의 num, grp, grplevel, grpstep 정보를 저장
    3. 입력 화면 표시
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 답글 쓰기</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<form action="reply.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "num" value = "${b.num}">
<input type = "hidden" name = "grp" value = "${b.grp}">
<input type = "hidden" name = "grplevel" value = "${b.grplevel}">
<input type = "hidden" name = "grpstep" value = "${b.grpstep}">
<input type = "hidden" name = "boardname" value = "${param.boardname}">
	<table class = "w3-table-all">
		<caption>게시판 답글 등록</caption>
		<tr>
			<th>
				글쓴이
			</th>
			<td>
				<input type = "text" name = "name">
			</td>
		</tr>
		<tr>
			<th>
				비밀번호
			</th>
			<td>
				<input type = "password" name = "pass">
			</td>
		</tr>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "subject" value = "RE:${b.subject}">
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "content" id = "content1" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("content1", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<th>
				첨부파일
			</th>
			<td>
				<input type = "file" name = "file1">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "javascript:document.f.submit()">[게시물 등록]</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>