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
	<table style="width: 100%; table-layout: fixed;" >
		<tr>
			<td colspan="2" rowspan="2">
				<div class="animation_canvas">
					<div class="slider_panel">
						<img src="${path}/resource/slidimg/Desert.jpg"
							class="slider_image"> <img
							src="${path}/resource/slidimg/movie.jpg" class="slider_image">
						<img src="${path}/resource/slidimg/cinema.jpg"
							class="slider_image"> <img
							src="${path}/resource/slidimg/Desert.jpg" class="slider_image">
						<img src="${path}/resource/slidimg/ticket.jpg"
							class="slider_image"> <img
							src="${path}/resource/slidimg/Desert.jpg" class="slider_image">
					</div>
					<div class="slider_text_panel">
						<div class="slider_text">
							<h1>movie picture1</h1>
							<p>사이트 소개입니다...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture2</h1>
							<p>영화세상입니다...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture3</h1>
							<p>극장마실입니다...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture4</h1>
							<p>정보바다입니다...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture5</h1>
							<p>나눔누리입니다...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture6</h1>
							<p>활동마당입니다...</p>
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
			
			
			<!-- 공지사항 메뉴 -->
			<td>
				<table>
					<caption>공지사항</caption>
						<tr>
							<th width = "80%">글 제목</th>
							<th width = "20%">작성일자</th>
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
								<fmt:formatDate value = "${notice.board_regdate}" pattern = "yyyy-MM-dd"/>
								</td>
							</core:if>
						</tr>
						</core:forEach>
						</tr>
						<tr>
						</tr>
				</table>
			
			
			</td>

			<td style = "width:25%; height:30%; border:1px solid black;">
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
								<td align = "center"><input type="text" name="id" onfocus="this.value=''" value = "아이디를 입력하세요"></td>
								<td rowspan = "2">
									<input type="submit" class="normalbutton" value="로  그  인" style = "width:100%;">
								</td>
							</tr>
							<tr>
								<td align = "center"><input type="password" name="password" onfocus="this.value=''" value = "비밀번호를 입력하세요"></td>
							</tr>
							<tr>
								<td>
									<input type="button" class="redbutton" value="회원가입" style = "width:100%;" onclick="location.href = '${path}/movie/member/joinForm.me'">
								</td>
								<td>
									<input type="button" class="normalbutton" value="아이디찾기" style = "width:100%;" onclick="win_open('idForm')">
								</td>
								<td>
									<input type="button" class="normalbutton" value="비밀번호찾기" style = "width:100%;" onclick="win_open('pwForm')">
								</td>
							</tr>
						</table>
					</form>
				</core:if>
				
				</td>
		</tr>
		<tr>
			<!--  graph configuration area -->
			<td colspan="2" rowspan="2">
			<!--  
				<div id = "piecontainer" style = "width : 80%; border : 1px solid #FFFFFF">
					<canvas id = "canvas1" style = "width:100%;"></canvas>
				</div>
				<script type = "text/javascript">
var randomColorFactor = function(){
	return Math.round(Math.random() * 255);
}
var randomColor = function(opa){
	return "rgba(" + randomColorFactor() + "," + randomColorFactor() + "," + randomColorFactor() + "," + (opa || '.3')+")";
};
$(function(){
	piegraph();
})
function piegraph(){
	$.ajax("${path}/movie/ajax/graph.do",{
		success : function(data){
			console.log(data);
			pieGraphPrint(data);
		},
		error : function(e){
			alert("서버 오류 : " + e.status);
		}
	})
}
function pieGraphPrint(data){
	var rows = JSON.parse(data);
	var names = [];
	var datas = [];
	var colors = [];
	$.each(rows,function(index,item){
			names[index] = item.name;
			datas[index] = item.cnt;
			colors[index] = randomColor(0.7);
	})
	var config = {
		type : "pie",
		data : {
			datasets : [{
				data : datas,
				backgroundColor : colors
			}],
			labels : names
		},
		options : {
			responsive : true,
			legend : {position : "top"},
		}
	}
	var ctx = document.getElementById("canvas1").getContext("2d");
	new Chart(ctx, config);
}
</script>-->
			</td>
		</tr>
		<tr>
			<td>
				<table>
					<caption>조회수 정렬 내림차순 10개 표시</caption>
						<tr>
							<th width = "80%">게시글 제목</th>
							<th width = "20%"> 조회수</th>
						</tr>
						<tr>
						</tr>
				</table>
			</td>

			
			<td>
				<table>
					<caption>추천수 정렬 내림차순 10개 표시</caption>
						<tr>
							<th width = "80%">게시글 제목</th>
							<th width = "20%"> 조회수</th>
						</tr>
						<tr>
						</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>