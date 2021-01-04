<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 출력</title>
<link rel = "stylesheet" href = "../../css/main.css">
<script type = "text/javascript">
	function listdo(page){
		f = document.sf;
		f.pageNum.value = page;
		f.submit();
	}
</script>
</head>
<body>
<table>

	<caption>게시글 목록</caption>
		<core:if test = "${boardcount == 0}">
		<tr>
			<td colspan = "5"> 등록된 게시글이 없습니다...
			</td>
		</tr>
		</core:if>
		
		
		<core:if test = "${boardcount > 0}">
		
		
		<tr>
			<td colspan = "5" style = "text-align:right"> 글개수:${boardcount}
			</td>
		</tr>
		
		
		<tr>
			<th width = "5%"> 번호</th>
			<th width = "55%"> 제목</th>
			<th width = "10%"> 작성자</th>
			<th width = "20%"> 작성일자</th>
			<th width = "10%"> 조회수</th>			
		</tr>
		
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			<td style = "text-align : left">
			<!-- 답글이므로 여백이랑 └ 을 줘서 답글처럼 보이게... 이때 grplevel 사용! -->
			<core:forEach var = "i" begin = "1" end = "${board.grplevel}">
				&nbsp;&nbsp;&nbsp;
			</core:forEach>
			<core:if test = "${board.grplevel > 0}">
				└
			</core:if>
			<!--  첨부파일이 있으면 표시하겠습니당... -->
			<core:if test = "${!empty board.file1}">
				<a href = "file/${board.file1}" style="text-decoration: none;">@</a>
			</core:if>
			<core:if test = "${empty board.file1}">
				&nbsp;
			</core:if>
				<a href = "info.do?num=${board.num }&&boardname=${param.boardname}">${board.subject }</a>
			</td>
			<td>${board.name}</td>
			<fmt:formatDate var = "rdate" value="${board.regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- 오늘일 경우 -->
				<td>
				<fmt:formatDate value = "${board.regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  오늘이 아닌 경우 -->
				<td>
				<fmt:formatDate value = "${board.regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<td>${board.readcnt}</td>
		</tr>
		</core:forEach>
		
		
		<tr>
			<td colspan = "5">
				<core:if test = "${pageNum <= 1}">
					[이전]
				</core:if>
				<core:if test = "${pageNum > 1}">
					<a href = "javascript:listdo(${pageNum - 1 })">[이전]</a>
				</core:if>
				<core:forEach var = "a" begin = "${startpage}" end = "${endpage}">
					<core:if test = "${a == pageNum}">
						[${a }]
					</core:if>
					<core:if test = "${a != pageNum}">
						<a href = "javascript:listdo(${a })">[${a }]</a>
					</core:if>
				</core:forEach>
				<core:if test = "${pageNum >= maxpage}">
					[다음]
				</core:if>
				<core:if test = "${pageNum < maxpage}">
					<a href = "javascript:listdo(${pageNum + 1 })">[다음]</a>
				</core:if>
			</td>
		</tr>
		
		
		</core:if>
		<tr>
			<td colspan = "5" style = "text-align:right">
				<a href = "writeForm.do?boardname=${param.boardname}">[글쓰기]</a>
			</td>
		</tr>
	</table>
	${find}<br>
	${column}
	<form action = "list.do" method = "post" name = "sf">
		<div style = "display : flex; justify-content : center;">
			<input type = "hidden" name = "pageNum" value = "1">
			<input type = "hidden" name = "Paramfind" value = "${find}">
			<input type = "hidden" name = "Paramcolumn" value = "${column}">
				<select name = "column">
					<option value = ""> 선택하세요</option>
					<option value = "subject"> 제목</option>
					<option value = "name"> 작성자</option>
					<option value = "content"> 내용</option>
					<option value = "subject, name"> 제목 + 작성자</option>
					<option value = "subject, content"> 제목 + 내용</option>
					<option value = "name, content"> 작성자 + 내용</option>
					<option value = "subject, name, content"> 제목 + 작성자 + 내용</option>
				</select>
				<script>
					document.sf.column.value = "${param.column}";
				</script>
				<input type = "text" name = "find" value = "${param.find}" style = "width:50%;">
				<input type = "submit" value = "검색">
		</div>
	</form>
	
</body>
</html>