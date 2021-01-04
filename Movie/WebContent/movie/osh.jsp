<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="kms.css">
</head>
<body>
<form  name="f" method="post" action="osh.do">
  <select name="column">
     <option value="">선택하세요</option>
     <option value="name">이름</option>
     <option value="id">아이디</option>
     <option value="position">직급</option>
     <option value="name,position">이름+교수직급</option>
  </select>
  <script type="text/javascript">
     document.f.column.value ='${param.column}';
  </script>
  <input type="text" name="find" style="width:50%;" value="${param.find}">
  <input type="submit" value="검색" >
</form>
<c:if test="${param.column != null}">
<table>
<tr><td colspan="6" style="text-align: right;">조회건수 : ${recordcnt}</td></tr>
<tr><th>교수번호</th><th>이름</th><th>아이디</th><th>급여</th><th>입사일</th><th>직급</th></tr>
<c:forEach var="p" items="${list}">
<tr><td>${p.no}</td><td>${p.name}</td>
<td>${p.id}</td><td>${p.salary}</td>
<td><fmt:formatDate value="${p.hiredate}" pattern="yyyy-MM-dd"/></td>
<td>${p.position}</td></tr>
</c:forEach></table>
</c:if>
</body>
</html>