<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원수정</title>
<link rel = "stylesheet" href="../../css/main.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
</head>
<body>
<script type = "text/javascript">
function back(){
	history.go(-1);
}
function inputcheck(f){
	if(f.pass.value == ''){
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return false;	
	}
	return true;
}
function win_upload(){
	var op = "width = 500, height = 150, left = 50, top = 150";
	open("pictureForm.me","",op);
}
function win_passchg(){
	var op = "width = 500, height=250, left=50, top=150";
	open("passwordForm.me","",op);
}
$(function(){
	if($("#emailcheck").prop("checked")){
		$("#emailreceive").val("1");
	}else{
		$("#emailreceive").val("0");
	}
})
</script>
<div id = "centerPosition">
<form action="update.me" name = "f" method="post" onsubmit="return inputcheck(this)">
	<input type = "hidden" name="picture" value ="${member.member_picture}">
	<input type = "hidden" name="kbn">
	<input type = "hidden" name = "emailreceive" id = "emailreceive" value = "0">
	<table style = "height:800px"><caption>회원정보 수정</caption>
		<tr>
			<td rowspan = "10" valign = "middle">
				<img src = "picture/${member.member_picture}" width="100" height="120" id="picture"><br>
				<font size="1"><a href = "javascript:win_upload()" class = "normalbutton">사진등록</a></font>
			</td>
				<th>아이디</th>
				<td>
					<input type = "text" name = "id" readonly value = "${member.member_id}">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type = "password" name = "password">
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input type = "text" name = "nickname" value = "${member.member_nickname}">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type = "radio" name = "gender" value = "1" ${member.member_gender==1?"checked":""}>남
					<input type = "radio" name = "gender" value = "2" ${member.member_gender==2?"checked":""}>여
				</td>
			</tr>
			<tr>
				<th>
					나이(만)
				</th>
				<td>
					<input type = "text" name = "age" value = "${member.member_age}">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2"><input type = "text" name = "email" value = "${member.member_email}">
				<input type = "checkbox" id = "emailcheckbox"></td>
			</tr>
			<tr>
			<th>대표 선호 장르</th>
			<td>
				<select name = "genre">
					<option value = "horror">코미디</option>
					<option value = "crime">범죄</option>
					<option value = "thriller">스릴러</option>
					<option value = "adventure">어드벤처</option>
					<option value = "sports">스포츠</option>
					<option value = "family">가족영화</option>
					<option value = "fantasy">판타지</option>
					<option value = "action">액션</option>
					<option value = "detective">수사물</option>
					<option value = "horror">공포</option>
					<option value = "romance">로맨스</option>
					<option value = "biograpy">자서전</option>
					<option value = "history">역사</option>
					<option value = "mystery">미스테리</option>
					<option value = "musical">뮤지컬</option>
					<option value = "drama">드라마</option>
					<option value = "scifi">공상과학</option>
					<option value = "war">전쟁</option>
					<option value = "animation">애니메이션</option>
					<option value = "western">서부</option>
				</select>
			</td>
			</tr>
			<tr>
			<th>자기소개</th>
			<td>
				<textarea name = "introduction" style = "width:170px; height:100px;">${member.member_introduction}</textarea>
			</td>
			</tr>
			<tr>
				<td colspan = "3">
					<input type = "submit" value = "회원수정" class = "redbutton">
					<core:if test = "${sessionScope.login != 'admin' || param.id == 'admin' }">
						<input type = "button" value = "비밀번호수정" onclick="win_passchg()" class = "normalbutton">
					</core:if>
					<input type = "button" value = "돌아가기" class = "normalbutton" onclick="back()">
				</td>
			</tr>
	</table>
</form>
</div>
</body>
</html>