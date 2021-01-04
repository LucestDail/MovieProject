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
<title>내가 쓴 글 조회</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
	<table>
	<core:if test = "${boardcount == 0}">
		<tr>
			<td colspan = "5"> 등록된 게시글이 없습니다...
			</td>
		</tr>
	</core:if>
	<core:if test = "${boardcount > 0}">
	<caption>게시판 제목 - 게시글</caption>
		<tr>
			<th width = "20%">게시글 제목</th>
			<th width = "10%">작성일자</th>
			<th width = "10%">조회수</th>
			<th width = "10%">추천</th>
			<th width = "10%">비추천</th>
		</tr>
		<core:forEach var="boardlist" items="${boardlist}">
		<tr>
			<td style = "text-align : left">
				<a href = "info.do?board_num=${boardlist.board_num}&&board_type=${boardlist.board_type}">${boardlist.board_subject}</a>
			</td>
			<td>
				<fmt:formatDate value = "${boardlist.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
			</td>
			<td>${boardlist.board_readcnt}</td>
						<!--  추천 -->
			<td>${boardlist.recommand_count}</td>
			<!--  추천 -->
			<td>${boardlist.not_recommand_count}</td>
		</tr>
		</core:forEach>
	</core:if>
	</table>
	<table>
	<core:if test = "${commentcount == 0}">
		<tr>
			<td colspan = "5"> 등록된 게시글이 없습니다...
			</td>
		</tr>
	</core:if>
	<core:if test = "${commentcount > 0}">
	<caption>게시판 제목 - 댓글</caption>
		<tr>
			<th width = "20%">게시글 제목</th>
			<th width = "10%">댓글 내용</th>
			<th width = "10%">작성일자</th>
			<th width = "10%">추천</th>
			<th width = "10%">비추천</th>
		</tr>
		<core:forEach var="commentlist" items="${commentlist}">
		<tr>
			<td>${board.information_type}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
			</td>
			<td>${board.member_id}</td>
			<fmt:formatDate var = "rdate" value="${board.board_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- 오늘일 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  오늘이 아닌 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<td>${board.board_readcnt}</td>
						<!--  추천 -->
			<td>${board.recommand_count}</td>
			<!--  추천 -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
	</core:if>
	</table>
</body>
</html>