<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<core:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<link rel = "shortcut icon" href="#">
<link rel = "icon" href = "#" type = "image/x-icon">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script type="text/javascript">
	function win_upload(){
		var op = "width = 500, height = 500, left = 50, top = 150";
		open("pictureForm.me","",op);
	}
$(function(){
	
	if($("#emailcheck").prop("checked")){
		$("#emailreceive").val("1");
	}else{
		$("#emailreceive").val("0");
	}
	
	$("#idcheck").click(function(){
		var param = {id:$("#id").val()};
		$.ajax({
			url : "idcheck.jsp",
			type : "POST",
			data : param,
			success : function(data){
				console.log(data);
				$("#idchecker").html(data);
				if($("h1").is(".find")){
					$("#id").val("");
					alert("중복되는 아이디가 있습니다!");
				}else{
					alert($("#id").val() + " 사용 가능합니다!");
					$("#idcheckconfirm").val("1");
					$("#id").attr("readonly",true);
				}
			},
			error : function(e){
				console.log(e);
				alert("서버 오류 : " + e.status);
			}
		})
	})
})

</script>
</head>
<body>
<div id = "centerPosition">
<form action="join.me" name = "f" method="post">
	<input type = "hidden" name="picture" value ="">
	<input type = "hidden" id = "idcheckconfirm" value = "0">
	<input type = "hidden" name = "emailreceive" id = "emailreceive" value = "0">
	<div id = "idchecker"></div>
	<table class = "table table-bordered">
		<tr>
			<td rowspan = "8" valign = "middle" align = "center">
				<img src = ${path}/resource/assets/images/profileicon.png width="100" height="120" id="picture">
				<br>
				<font size="1">
					<a href = "javascript:win_upload()" class = "normalbutton">사진등록</a>
				</font>
			</td>
			<th>아이디</th>
			<td align = "center">
				<input type = "text" name = "id" id = "id" class="form-control"><br>
				<input type = "button" id = "idcheck" value = "아이디 중복 체크" class = "normalbutton">
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type = "password" name = "password" class="form-control"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
				<input type = "text" name = "nickname" id = "nickname" class="form-control">
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td align = "center">
				<input type = "radio" name = "gender" value = "1" checked>남
				<input type = "radio" name = "gender" value = "2">여
			</td>
		</tr>
		<tr>
			<th>나이(만)</th>
			<td><input type = "text" name = "age" class="form-control"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td align = "center">
			<input type = "text" name = "email" class="form-control"><br>
			이메일 수신을 원하지 않습니다 &nbsp;&nbsp;&nbsp;<input type = "checkbox" id = "emailcheckbox">
			</td>
		</tr>
		<tr>
			<th>대표 선호 장르</th>
			<td>
				<select name = "genre" class="form-control">
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
				<textarea name = "introduction" class="form-control" rows="3"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "3" align = "center">
				<input type = "submit" class = "redbutton" value = "회원가입">
				<a href = "${path}/movie/Movie/index.jsp" class = "normalbutton">취소</a>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>