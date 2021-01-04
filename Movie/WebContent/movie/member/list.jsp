<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset = "euc-kr">
	<title>회원 목록</title>
	<link rel="stylesheet" href="${path}/resource/mycss.css">
	<script type="text/javascript"
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	</script>
	<script type="text/javascript">
		function allchkbox(chk){
			var allchk = chk.checked // 전체 석택 값, true, false
			//getElementsByName(name) : name 속성 값이 mailchk 인 태그들
			//input name = "mailchk"
			document.getElementsByName("mailchk").forEach(function(item,index){
				//item : name = "mailchk" 인 태그 한개
				if(allchk){ // 전체 선택 값이 true 인 경우
					item.setAttribute("checked",true);
				}else{// 전체 선택이 안된 경우(false 인 경우)
					item.removeAttribute("checked");
				}
			})
		}
		
		function allchkbox2(chk){
			$("input[name=mailchk]").prop("checked",chk.checked)
		}
	</script>
</head>
<body>
<form action = "mailform.me" method = "post" name = "f">
<table class="table">
	<caption>회원 목록</caption>
		<tr>
			<th>아이디</th>
			<th>사진</th>
			<th>이름</th>
			<th>성별</th>
			<th>회원관리</th>
			<th>이메일</th>
			<th><input type = "checkbox" name = "allchk" onchange = "allchkbox2(this)"></th>
		</tr>
		<core:forEach var = "member" items = "${list}">
		<tr>
			<td>
				<a href = "info.me?id=${member.member_id}"> ${member.member_id}</a>
			</td>
			<td>
				<img src = "picture/sm_${member.member_picture}" width="20" height="30">
			</td>
			<td>${member.member_nickname }</td>
			<td>${member.member_gender==1?"남":"여"}</td>
			<td><a href = "updateForm.me?id=${member.member_id}">[수정]</a>
			<core:if test = "${member.member_id != 'admin'}">
			<a href = "deleteForm.me?id=${member.member_id}">[강제탈퇴]</a>
			</core:if>
			</td>
			<td>${member.member_email}</td>
			<td>
			<core:if test="${member.member_email_receive_ok == 0}">
				<input type="checkbox" name="mailchk" value="${member.member_email}" onchange = "clickit(this)">
			</core:if>
			</td>
		</tr>
		</core:forEach>
		<tr>
			<td colspan = "6">
				<input type = "button" value = "돌아가기" onclick="location.href='${path}/movie/board/index.do'" class = "normalbutton">
			</td>
			<td colspan = "2">
				<input type = "submit" value = "메일전송" class = "redbutton">
			</td>
		</tr>
</table>
</form>
</body>
</html>