<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!-- movie write form -->
<core:if test = "${sessionScope.board_type == 0}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
</script>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<input type = "hidden" name = "movie_id">
	<input type = "hidden" name = "movie_subject">
	<input type = "hidden" name = "area_xpoint" value = "0">
	<input type = "hidden" name = "area_ypoint" value = "0">
	<table class="table table-bordered">
		<caption>게시판 글쓰기</caption>
		<tr>
			<th>
				작품대상
			</th>
			<td>
			<core:if test="${!empty param.movie_id}">
				<input type = "text" name = "movie_id" readonly value = "${param.movie_id}">
			</core:if>
			<core:if test = "${empty param.movie_id}">
				<input type = "text" name = "movie_subject">
			</core:if>
			</td>
		</tr>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		
		<tr>
			<th>
				점수 책정
			</th>
			<td colspan = "2">
			배우 점수 : 
			<select name="score_category_a">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			내용 점수 : 
			<select name="score_category_b">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			영상 점수 : 
			<select name="score_category_c">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			기타 점수 :
			<select name="score_category_d">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			</td>
		</tr>
		
		<tr>
			<th>
				첨부파일
			</th>
			<td>
				<input type = "file" name = "board_attached_file" class = "normalbutton">
			</td>
		</tr>
		
		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<input type = "submit" value = "게시물 등록" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>



<!--  theater write form -->
<core:if test = "${sessionScope.board_type == 1}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdjN2QZk3VM026nj2NXFC-u2rFZX38JGo&callback=initMap&libraries=&v=weekly"
      defer>
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
	function initMap() {
        const myLatlng = { lat: 37.47779053695607, lng: 126.87901758473859 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 14,
          center: myLatlng,
        });
        // Create the initial InfoWindow.
        let infoWindow = new google.maps.InfoWindow({
          content: "지정하실 장소를 선택하세요!",
          position: myLatlng,
        });
        infoWindow.open(map);
        // Configure the click listener.
        map.addListener("click", (mapsMouseEvent) => {
          // Close the current InfoWindow.
          infoWindow.close();
          // Create a new InfoWindow.
          infoWindow = new google.maps.InfoWindow({
            position: mapsMouseEvent.latLng
          });
          infoWindow.setContent(
        		  "여기로 하겠습니다!"
          );
          infoWindow.open(map);
          f.area_xpoint.value = mapsMouseEvent.latLng.toJSON().lat;
          f.area_ypoint.value = mapsMouseEvent.latLng.toJSON().lng;
        });
      }
</script>
<style type="text/css">
      #map {
        height: 100%;
      }
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<input type = "hidden" name = "something" value = "0">
	<table class="table table-bordered">
		<caption>영화세상 글쓰기</caption>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				지도 표시
			</td>
			<td>
				<div id="map" style="width: 800px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<th>
				지역 명칭
			</th>
			<td>
			<select name="area_name">
                <option  value="전체보기">전체보기</option>
                <option  value="서울/경기">서울/경기</option>
                <option  value="인천/부천">인천/부천</option>
                <option  value="춘천/강원">춘천/강원</option>
                <option  value="부산/울산/경남">부산/울산/경남</option>
                <option  value="대구/경북">대구/경북</option>
                <option  value="전주/전북">전주/전북</option>
                <option  value="광주/전남">광주/전남</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="대전/충남">대전/충남</option>
                <option  value="제주">제주</option>
            </select>
			</td>
		</tr>
		<tr>
			<th>
				극장 명칭
			</th>
			<td>
				<input type = "text" name = "area_name_specific">
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
			접객 점수 :
			<select name="score_category_a">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			환경 점수 : 
			<select name="score_category_b">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			먹거리 점수 :
			<select name="score_category_c">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			기타 점수 : 
			<select name="score_category_d">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<input type = "submit" value = "게시물 등록" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>



<!--  information write form -->
<core:if test = "${sessionScope.board_type == 2}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdjN2QZk3VM026nj2NXFC-u2rFZX38JGo&callback=initMap&libraries=&v=weekly"
      defer>
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
	function initMap() {
        const myLatlng = { lat: 37.47779053695607, lng: 126.87901758473859 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 14,
          center: myLatlng,
        });
        // Create the initial InfoWindow.
        let infoWindow = new google.maps.InfoWindow({
          content: "지정하실 장소를 선택하세요!",
          position: myLatlng,
        });
        infoWindow.open(map);
        // Configure the click listener.
        map.addListener("click", (mapsMouseEvent) => {
          // Close the current InfoWindow.
          infoWindow.close();
          // Create a new InfoWindow.
          infoWindow = new google.maps.InfoWindow({
            position: mapsMouseEvent.latLng
          });
          infoWindow.setContent(
        		  "여기로 하겠습니다!"
          );
          infoWindow.open(map);
          f.area_xpoint.value = mapsMouseEvent.latLng.toJSON().lat;
          f.area_ypoint.value = mapsMouseEvent.latLng.toJSON().lng;
        });
      }
</script>
<style type="text/css">
      #map {
        height: 100%;
      }
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<table class="table table-bordered">
		<caption>정보 글쓰기</caption>
		<tr>
			<td>
				정보 종류
			</td>
			<td>
				<select name="information_type">
                <option  value="0">일반정보</option>
                <option  value="1">이벤트</option>
                <option  value="2">시사회</option>
                <option  value="3">기타</option>
            </select>
			</td>
		</tr>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				지도 표시
			</td>
			<td>
				<div id="map" style="width: 800px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<td>
				지역 명칭 : 
			<select name="area_name">
                <option  value="전체보기">전체보기</option>
                <option  value="서울/경기">서울/경기</option>
                <option  value="인천/부천">인천/부천</option>
                <option  value="춘천/강원">춘천/강원</option>
                <option  value="부산/울산/경남">부산/울산/경남</option>
                <option  value="대구/경북">대구/경북</option>
                <option  value="전주/전북">전주/전북</option>
                <option  value="광주/전남">광주/전남</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="대전/충남">대전/충남</option>
                <option  value="제주">제주</option>
            </select>
			</td>
			<td>
				이벤트 지역 상세 : <input type = "text" name = "area_name_specific">
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>

		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<input type = "submit" value = "게시물 등록" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>



<!--  give write form -->
<core:if test = "${sessionScope.board_type == 3}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdjN2QZk3VM026nj2NXFC-u2rFZX38JGo&callback=initMap&libraries=&v=weekly"
      defer>
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
	function initMap() {
        const myLatlng = { lat: 37.47779053695607, lng: 126.87901758473859 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 14,
          center: myLatlng,
        });
        // Create the initial InfoWindow.
        let infoWindow = new google.maps.InfoWindow({
          content: "지정하실 장소를 선택하세요!",
          position: myLatlng,
        });
        infoWindow.open(map);
        // Configure the click listener.
        map.addListener("click", (mapsMouseEvent) => {
          // Close the current InfoWindow.
          infoWindow.close();
          // Create a new InfoWindow.
          infoWindow = new google.maps.InfoWindow({
            position: mapsMouseEvent.latLng
          });
          infoWindow.setContent(
        		  "여기로 하겠습니다!"
          );
          infoWindow.open(map);
          f.area_xpoint.value = mapsMouseEvent.latLng.toJSON().lat;
          f.area_ypoint.value = mapsMouseEvent.latLng.toJSON().lng;
        });
      }
</script>
<style type="text/css">
      #map {
        height: 100%;
      }
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<input type = "hidden" name = "give_state" value = "0">
	<table class="table table-bordered">
		<caption>게시판 글쓰기</caption>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				지역 명칭 : 
			<select name="area_name">
                <option  value="전체보기">전체보기</option>
                <option  value="서울/경기">서울/경기</option>
                <option  value="인천/부천">인천/부천</option>
                <option  value="춘천/강원">춘천/강원</option>
                <option  value="부산/울산/경남">부산/울산/경남</option>
                <option  value="대구/경북">대구/경북</option>
                <option  value="전주/전북">전주/전북</option>
                <option  value="광주/전남">광주/전남</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="대전/충남">대전/충남</option>
                <option  value="제주">제주</option>
            </select>
			</td>
			<td>
				나눔 종류 : <select name="give_type">
                <option  value="0">영화 티켓</option>
                <option  value="1">굿즈</option>
                <option  value="2">기념품</option>
                <option  value="3">기타</option>
            </select>
			</td>
		</tr>
		<tr>
			<td>
				지도 표시
			</td>
			<td>
				<div id="map" style="width: 800px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<td>
				나눔 시작 : <input type="date" id="date_start_date" name="date_start_date" value="2020-01-01">
			</td>
			<td>
				나눔 종료 : <input type="date" id="date_end_date" name="date_end_date" value="2020-01-01">
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<input type = "submit" value = "게시물 등록" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>



<!--  activity write form -->
<core:if test = "${sessionScope.board_type == 4}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdjN2QZk3VM026nj2NXFC-u2rFZX38JGo&callback=initMap&libraries=&v=weekly"
      defer>
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
	function initMap() {
        const myLatlng = { lat: 37.47779053695607, lng: 126.87901758473859 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 14,
          center: myLatlng,
        });
        // Create the initial InfoWindow.
        let infoWindow = new google.maps.InfoWindow({
          content: "지정하실 장소를 선택하세요!",
          position: myLatlng,
        });
        infoWindow.open(map);
        // Configure the click listener.
        map.addListener("click", (mapsMouseEvent) => {
          // Close the current InfoWindow.
          infoWindow.close();
          // Create a new InfoWindow.
          infoWindow = new google.maps.InfoWindow({
            position: mapsMouseEvent.latLng
          });
          infoWindow.setContent(
        		  "여기로 하겠습니다!"
          );
          infoWindow.open(map);
          f.area_xpoint.value = mapsMouseEvent.latLng.toJSON().lat;
          f.area_ypoint.value = mapsMouseEvent.latLng.toJSON().lng;
        });
      }
</script>
<style type="text/css">
      #map {
        height: 100%;
      }
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<input type = "hidden" name = "activity_able" value = "0">
	<table class="table table-bordered">
		<caption>게시판 글쓰기</caption>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				지도 표시
			</td>
			<td>
				<div id="map" style="width: 800px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<td>
				지역 명칭 : 
			<select name="area_name">
                <option  value="전체보기">전체보기</option>
                <option  value="서울/경기">서울/경기</option>
                <option  value="인천/부천">인천/부천</option>
                <option  value="춘천/강원">춘천/강원</option>
                <option  value="부산/울산/경남">부산/울산/경남</option>
                <option  value="대구/경북">대구/경북</option>
                <option  value="전주/전북">전주/전북</option>
                <option  value="광주/전남">광주/전남</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="대전/충남">대전/충남</option>
                <option  value="제주">제주</option>
            </select>
			</td>
			<td>
				활동 종류 : <input type = "text" name = "activity_type">
				활동 상태 : 
				<select name="activity_able">
				<option  value="0">준비</option>
                <option  value="1">활동</option>
                <option  value="2">종료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				활동 시작 : <input type="date" id="date_start_date" name="date_start_date" value="2020-01-01">
			</td>
			<td>
				활동 종료 : <input type="date" id="date_end_date" name="date_end_date" value="2020-01-01">
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<input type = "submit" value = "게시물 등록" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>