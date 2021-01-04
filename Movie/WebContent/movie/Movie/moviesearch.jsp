<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.comm.CodeAPIServiceImplService"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.comm.CodeResultVO"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieAPIServiceImplService"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
    <%
	String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");	
	String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");
	String movieNm = request.getParameter("movieNm")==null?"":request.getParameter("movieNm");	
	String directorNm = request.getParameter("directorNm")==null?"":request.getParameter("directorNm");	
	String openStartDt = request.getParameter("openStartDt")==null?"":request.getParameter("openStartDt");
	String openEndDt = request.getParameter("openEndDt")==null?"":request.getParameter("openEndDt");	
	String prdtStartYear = request.getParameter("prdtStartYear")==null?"":request.getParameter("prdtStartYear");
	String prdtEndYear = request.getParameter("prdtEndYear")==null?"":request.getParameter("prdtEndYear");	
	String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");	
	String[] movieTypeCdArr = request.getParameterValues("movieTypeCdArr")==null? null:request.getParameterValues("movieTypeCdArr");
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 검색 페이지</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../../js/KobisOpenAPIRestService.js"></script>
<script type="text/javascript">
$(function(){
	var kobisService = new KobisOpenAPIRestService("14234f311919496d0877ff15e5d5c03c");
	var resJson = null;
	try{
		resJson = kobisService.getMovieList(true,{curPage:"<%=curPage%>",itemPerPage:10,movieNm:"<%=movieNm%>"});
	}catch(e){
		resJson = $.parseJSON(e.message);
	}
	if(resJson.failInfo){
		alert(resJson.failInfo.message);
	}else{
		var movieList = resJson.movieListResult.movieList;
		var totCnt = resJson.movieListResult.totCnt;
		
		for(var i=0;i<movieList.length;i++){
			var movie = movieList[i];
			
			var appendStr = "<tr><td><a href = '/Movie/movie/board/list.do?board_type=0&&movie_id="+movie.movieCd+"'>"+movie.movieNm+"</a></td><td>"+movie.movieNmEn+"</td><td>"+movie.prdtYear+"</td><td>"+movie.openDt+"</td><td>"+movie.repNationNm+"</td>";
			
			appendStr += "<td>";			
			if(movie.directors != null && movie.directors != ""){
				for(var dir in movie.directors){
					appendStr += movie.directors[dir].peopleNm;
				}				
			}
			appendStr += "</td>";
			
			appendStr += "<td>";		
			if(movie.companys != null && movie.companys != ""){
				for(var com in movie.companys){
					appendStr += movie.companys[com].companyNm;
				}				
			}
			appendStr += "</td></tr>";						
			$("#titleInfo p:eq(0)").html("검색 결과 : " + totCnt);			
			$("#boxtab tbody").append(appendStr);
		}
	}
});
</script>
</head>
<body>
<table>
	<caption><h1>확인하고 싶은 영화를 찾아보세요!</h1></caption>
	<tr>
		<td>
			<table class = "table">
				<div id="titleInfo">
					<p></p>
					<p></p>	
				</div>
				<table id="boxtab" class = "table table-hover">
					<tr>
						<th>영화명</th>
						<th>영화명(영)</th>
						<th>제작연도</th>
						<th>개봉연도</th>
						<th>제작국가</th>
						<th>감독</th>
						<th>참여영화사</th>
					</tr>
				</table>
				<form action="">
					<input type = "hidden" name = "curpage" value = "0">
					<!--  현재페이지 :<input type="text" name="curPage" value="<%=curPage %>">-->
					&nbsp; 영화명 &nbsp; <input type="text" name="movieNm" value="<%=movieNm %>">&nbsp;
					<input type="submit" name="" value="조회" class = "redbutton">&nbsp;
					<a href = "${path}/movie/board/list.do?board_type=0" class = "normalbutton">전체 리뷰 보기</a>
				</form>
			</table>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<%
	Date today = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	String defaultdate = sf.format(today);
	int targetdate = Integer.parseInt(defaultdate) - 1;
	String apiurl = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=14234f311919496d0877ff15e5d5c03c&targetDt="+targetdate;
	String line = "";
	String str = "";
	
	URL url = new URL(apiurl);
	HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	conn.setRequestProperty("Accept","application/xml");
	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	while((str = br.readLine()) != null){
		line += str;
	}
	Document doc = null;
	String html = "<table class = 'table'><caption><h1> 일간박스오피스 순위 </h1></caption><tr><th>영화 순위</th><th>영화 제목</th></tr>";
	try{
		doc = Jsoup.parse(line);
		Elements e1 = doc.select("dailyBoxOffice");
		for(Element ele : e1){
			html += "<tr><td>" + ele.select("rank").get(0).text() + "</td>";
			html += "<td><a href = '/Movie/movie/board/list.do?board_type=0&&movie_id="+ele.select("movieCd").get(0).text()+"'>" + ele.select("movieNm").get(0).text() + "</a></td></tr>";
		}
		html += "</table>";
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%= html %>
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
<%
	int targetdate2 = Integer.parseInt(defaultdate)-7;
	String apiurl2 = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=14234f311919496d0877ff15e5d5c03c&targetDt="+targetdate2;
	String line2 = "";
	String str2 = "";
	
	URL url2 = new URL(apiurl2);
	HttpURLConnection conn2 = (HttpURLConnection)url2.openConnection();
	conn2.setRequestProperty("Accept","application/xml");
	BufferedReader br2 = new BufferedReader(new InputStreamReader(conn2.getInputStream(),"UTF-8"));
	while((str2 = br2.readLine()) != null){
		line2 += str2;
	}
	Document doc2 = null;
	String html2 = "<table class = 'table'><caption><h1> 주간박스오피스 순위 </h1></caption><tr><th>영화 순위</th><th>영화 제목</th></tr>";
	try{
		doc2 = Jsoup.parse(line2);
		Elements e2 = doc2.select("weeklyBoxOffice");
		for(Element ele : e2){
			html2 += "<tr><td>" + ele.select("rank").get(0).text() + "</td>";
			html2 += "<td><a href = '/Movie/movie/board/list.do?board_type=0&&movie_id="+ele.select("movieCd").get(0).text()+"'>" + ele.select("movieNm").get(0).text() + "</a></td></tr>";
		}
		html2 += "</table>";
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%= html2 %>
		</td>
		<td></td>
	</tr>
</table>
</body>
</html>