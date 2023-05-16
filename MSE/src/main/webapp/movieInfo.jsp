<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1.0">
<title>영화정보</title>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
   integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="js/searchResult.js"></script>
<script src="js/sideBar.js"></script>
<link rel="stylesheet" href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css">
<link rel="stylesheet" href="css/movie.css" >

</head>
<body>
	<div id="container">
		<jsp:include page="frame/sideBarSearch.jsp"/>
		<div id="subContainer1">
  			<div id="main">
  				<img alt="poster" src="${poster}">
				<h3><a href="movie?movieSeq=${movieSeq}">${title}</a></h3> <br>
				${repRlsDate} | ${genre} | ${runtime}분
				<h4>개요</h4>
				<p>${plotText }</p>
  			</div>
  			<div id="nowPlaying"></div>
  			<div id="popular"></div>
  			<div id="upcoming"></div>
  		</div>
	</div>
	<div id="footer"></div>
	
	
<!-- 	<h4>감독</h4> -->
<%-- 	<c:forEach items="${staff }" var="staff"> --%>
<%-- 		<c:if test="${staff.job=='Director'}"> --%>
<%-- 			<img alt="profile" src="${imgPath2 }${staff.profile_path}" onerror="this.src='${unknownImg }'"> --%>
<%-- 			<a href="person?person_id=${staff.id }"><c:out value="${staff.name }"/></a> --%>
<%-- 		</c:if> --%>
<%-- 	</c:forEach> --%>
<!-- 	<h4>각본</h4> -->
<%-- 	<c:forEach items="${staff }" var="staff"> --%>
<%-- 		<c:if test="${staff.job=='Screenplay'}"> --%>
<%-- 			<img alt="profile" src="${imgPath2 }${staff.profile_path}" onerror="this.src='${unknownImg }'"> --%>
<%-- 			<a href="person?person_id=${staff.id }"><c:out value="${staff.name }"/></a> --%>
<%-- 		</c:if> --%>
<%-- 		<c:if test="${staff.job=='Writer'}"> --%>
<%-- 			<img alt="profile" src="${imgPath2 }${staff.profile_path}" onerror="this.src='${unknownImg }'"> --%>
<%-- 			<a href="person?person_id=${staff.id }"><c:out value="${staff.name }"/></a> --%>
<%-- 		</c:if> --%>
<%-- 	</c:forEach> --%>
<!-- 	<h4>주요 출연진</h4> -->
<%-- 	<c:forEach items="${cast }" var="cast" end="6"> --%>
<%-- 		<img alt="profile" src="${imgPath2 }${cast.profile_path}" onerror="this.src='${unknownImg }'"> --%>
<%-- 		<a href="person?person_id=${cast.id }"><b>${cast.name }</b></a> <br> --%>
<%-- 		${cast.character } 역 --%>
<%-- 	</c:forEach> --%>
	
</body>
</html>