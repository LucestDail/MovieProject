<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<%-- 로그아웃 상태인 경우
		-> 로그인 하세요 메시지 출력
	다른사용자의 비밀번호 변경 불가 => 로그인된 id값만 변경가능. 본인만 변경
	opener(회원 수정 페이지)를 loginForm.jsp 페이지로 이동 -> 현재 페이지 닫기
	pass, chgpass 파라매터 값 저장
	
	pass 비밀번호 db에 저장된 비밀번호 틀리면 비밀번호 오류 메시지 출력.
	passwordForm.jsp 페이지로 이동
	
	pass 비밀번혹 db에 저장도니 비밀번호와 같으면
	MemberDao.updatePass(login, chgpass) 비밀번호 수정
	비밀번호 수정 성공.
	메시지 출력
	opener 페이지를 info.jsp 페이지로 이동. 현재페이지 닫기
	
	비밀번호 수정 실패
	opener 페이지를 updateForm.jsp 페이지 이동
	혀재 페이지 닫기
	현재 페이지 닫기
	 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../css/main.css">
</head>
<body>

<script>
	alert("${msg}");
	<core:if test = "${opener}">
		opener.location.href="${url}";
	</core:if>
	<core:if test = "${!opener}">
		location.href="${url}";
	</core:if>
	<core:if test="${closer}">
		self.close();
	</core:if>
	</script>
</body>
</html>