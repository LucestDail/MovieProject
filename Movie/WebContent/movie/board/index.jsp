<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Index</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<style>
* {
	margin: 0;
	padding: 0;
}

.animation_canvas {
	overflow: hidden;
	position: relative;
	width: 600px;
	height: 400px;
}

.slider_panel {
	width: 3000px;
	position: relative;
}

.slider_image {
	float: left;
	width: 600px;
	height: 400px;
}

.slider_text_panel {
	position: absolute;
	top: 100px;
	left: 50px;
}

.slider_text {
	position: absolute;
	width: 250px;
}

.control_panel {
	position: absolute;
	top: 380px;
	left: 270px;
	height: 15px;
	overflow: hidden;
}

.control_button {
	width: 12px;
	height: 46px;
	position: relative;
	float: left;
	cursor: pointer;
	background: url("slidimg/point_button.png");
}

.control_button:hover {
	top: -16px;
}

.control_button:select {
	top: -31px;
}
</style>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table style="width: 100%; text-align:center;">
		<tr>
			<td rowspan="2">
				<div class="animation_canvas">
					<div class="slider_panel">
						<img src="${path}/resource/slidimg/movie1.jpg"
							class="slider_image"> <img
							src="${path}/resource/slidimg/movie.jpg"
							class="slider_image">
						<img src="${path}/resource/slidimg/cinema.jpg"
							class="slider_image"> <img
							src="${path}/resource/slidimg/movie2.jpg"
							class="slider_image">
						<img src="${path}/resource/slidimg/ticket.jpg"
							class="slider_image"> <img
							src="${path}/resource/slidimg/movie.jpg"
							class="slider_image">
					</div>
					<div class="slider_text_panel">
						<div class="slider_text">
							<h1>영화로와</h1>
							<p>영화인들을 위한 커뮤니티사이트</p>
						</div>
						<div class="slider_text">
							<h1 style = "color:white">영화 세상</h1>
							<p style = "color:white">영화 리뷰와 감상 공간</p>
						</div>
						<div class="slider_text">
							<h1>극장 마실</h1>
							<p>극장에 관한 모든것</p>
						</div>
						<div class="slider_text">
							<h1>정보 바다</h1>
							<p>영화에 대한 모든 것</p>
						</div>
						<div class="slider_text">
							<h1 style = "color:white">나눔 누리</h1>
							<p style = "color:white">나눔과 소통</p>
						</div>
						<div class="slider_text">
							<h1>활동 마당</h1>
							<p>직접 참여해보세요</p>
						</div>
					</div>
					<div class="control_panel">
						<div class="control_button"></div>
						<div class="control_button"></div>
						<div class="control_button"></div>
						<div class="control_button"></div>
						<div class="control_button"></div>
						<div class="control_button"></div>
					</div>
				</div> <script type="text/javascript"
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
					
				</script> <script>
	$(function() {
		$(".control_button").each(function(index) {
			$(this).attr("idx", index);
		}).click(function() {
			let index = $(this).attr("idx");
			moveSlider(index);
		});
		$(".slider_text").css("left", -300).each(function(index) {
			$(this).attr("idx", index);
		});
		moveSlider(0);
		let index = 0;
		let inc = 1;
		setInterval(function() {
			if (index >= 4)
				inc = -1;
			if (index <= 0)
				inc = 1;
			index += inc;
			moveSlider(index);
		}, 4000);
		function moveSlider(index) {
			let moveLeft = -(index * 600);
			$(".slider_panel").animate({
				left : moveLeft
			}, 'slow');
			$(".control_button[idx=" + index + "]").addClass("select");
			$(".control_button[idx!=" + index + "]").removeClass("select");
			$(".slider_text[idx=" + index + "]").show().animate({
				left : 0
			}, 'slow');
			$(".slider_text[idx!=" + index + "]").hide('slow', function() {
				$(this).css("left", -300);
			});
		}
	});

	function inputcheck(f) {
		if (f.id.value == '') {
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if (f.id.value.length < 4) {
			alert("아이디는 4자리 이상 입력하세요");
			f.id.focus();
			return false;
		}
		if (f.pass.value == '') {
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_open(page) {
		var op = "width = 500, height=350, left=50, top=150";
		open(page + ".me", "", op);
	}
</script>
			</td>
			<td>
			<core:if test="${!empty sessionScope.login}">
					<table>
						<tr>
							<td align = "center">
								<img src="${path}/movie/member/picture/${sessionScope.picture}" style="width: 32px; height:48px;">
							</td>
							<td align = "center">
								환영합니다! <strong>${sessionScope.login}</strong>님
							</td>
						</tr>
						<tr>
							<td>
								<a href="${path}/movie/member/logout.me" class = "redbutton">로그아웃</a>
							</td>
							<td>
								<a href="${path}/movie/member/info.me?id=${sessionScope.login}" class = "normalbutton">내정보</a>
							</td>
						</tr>
					</table>
				</core:if> <core:if test="${empty sessionScope.login}">
				
					<form action="${path}/movie/member/login.me" method="post" name="f" onsubmit="return inputcheck(this)">
						<table>
							<tr>
								<td align = "center" colspan = "2"><input type="text" name="id" onfocus="this.value=''" value = "아이디를 입력하세요" class="form-control"></td>
							</tr>
							<tr>
								<td align = "center" colspan = "2"><input type="password" name="password" onfocus="this.value=''" value = "비밀번호를 입력하세요" class="form-control"></td>
							</tr>
							<tr>
								<td>
									<input type="button" class="redbutton" value="회원가입"  onclick="location.href ='${path}/movie/member/joinForm.me'" style = "width:100%;">
									
								</td>
								<td>
									<input type="submit" class="normalbutton" value="로  그  인" style = "width:100%;">
								</td>
							</tr>
							<tr>
								<td>
									<input type="button" class="normalbutton" value="아이디찾기" style = "width:100%;" onclick="win_open('/Movie/movie/member/idForm')">
								</td>
								<td>
									<input type="button" class="normalbutton" value="비밀번호찾기" style = "width:100%;" onclick="win_open('/Movie/movie/member/pwForm')">
								</td>
							</tr>
						</table>
					</form>
				</core:if>
				
				</td>
		</tr>
			<!-- 공지사항 메뉴 -->
			<tr>
				<td>
				<table class = "table table-hover">
					<caption>공지사항</caption>
						<tr>
							<th width = "70%">글 제목</th>
							<th width = "30%">작성일자</th>
						<core:forEach var="notice" items="${noticelist}">
						<tr>
							<!-- 글 제목 -->
							<td style = "text-align : left">
								<a href = "info.do?board_num=${notice.board_num}&&board_type=${notice.board_type}">${notice.board_subject}</a>
							</td>
							<!--  작성일자 -->
							<fmt:formatDate var = "rdate" value="${notice.board_regdate}" pattern = "yyyy-MM-dd"/>
							<core:if test = "${today == rdate}">
								<!-- 오늘일 경우 -->
								<td>
								<fmt:formatDate value = "${notice.board_regdate}" pattern = "HH:mm:ss"/>
								</td>
							</core:if>
							<core:if test = "${today != rdate}">
								<!--  오늘이 아닌 경우 -->
								<td>
								<fmt:formatDate value = "${notice.board_regdate}" pattern = "yy-MM-dd"/>
								</td>
							</core:if>
						</tr>
						</core:forEach>
						</tr>
				</table>
				</td>
			</tr>
		<tr>
			<td>
				<table class = "table table-hover">
					<caption>현재 인기 있는 글</caption>
						<tr>
							<th width = "70%">글 제목</th>
							<th width = "30%">조회수</th>
						<core:forEach var="readcnt" items="${readcntlist}">
						<tr>
							<!-- 글 제목 -->
							<td style = "text-align : left">
								<a href = "info.do?board_num=${readcnt.board_num}&&board_type=${readcnt.board_type}">${readcnt.board_subject}</a>
							</td>
							<td>
								${readcnt.board_readcnt}
							</td>
						</tr>
						</core:forEach>
						</tr>
				</table>
			</td>
			<td>
				
				<table class = "table table-hover">
					<caption>최신 게시글</caption>
						<tr>
							<th width = "70%">글 제목</th>
							<th width = "30%">작성 일시</th>
						<core:forEach var="board" items="${recentboard}">
						<tr>
							<!-- 글 제목 -->
							<td style = "text-align : left">
								<a href = "info.do?board_num=${board.board_num}&&board_type=${board.board_type}">${board.board_subject}</a>
							</td>
							<td>
								<fmt:formatDate value = "${board.board_regdate}" pattern = "yy-MM-dd"/>	
							</td>
						</tr>
						</core:forEach>
						</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table class = "table table-hover">
					<caption>추천 많이 받은 글</caption>
						<tr>
							<th width = "70%">글 제목</th>
							<th width = "30%">추천수</th>
						<core:forEach var="recommand" items="${recommandlist}">
						<tr>
							<!-- 글 제목 -->
							<td style = "text-align : left">
								<a href = "info.do?board_num=${recommand.board_num}&&board_type=${recommand.board_type}">${recommand.board_subject}</a>
							</td>
							<td>
								${recommand.recommand_count}
							</td>
						</tr>
						</core:forEach>
						</tr>
				</table>
			</td>
			<td>
				<table class = "table table-hover">
					<caption>최신 댓글</caption>
						<tr>
							<th width = "70%">댓글 내용</th>
							<th width = "30%">작성 시각</th>
						<core:forEach var="comment" items="${recentcomment}">
						<tr>
							<!-- 글 제목 -->
							<td style = "text-align : left">
								<a href = "info.do?board_num=${comment.board_num}">${comment.comment_content}</a>
							</td>
							<td>
								<fmt:formatDate value = "${comment.comment_regdate}" pattern = "yy-MM-dd"/>	
							</td>
						</tr>
						</core:forEach>
						</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>