<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1.0">
<title>영화 정보 - ${title}</title>
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
				<h1><a href="movie?movieId=${movieId}&movieSeq=${movieSeq}">${title}</a></h1> <br>
				${repRlsDate} | ${genre} | ${runtime}분
				<h4>개요</h4>
				<p>${plotText }</p>
				<c:forEach items="${staffList}" var="staff">
					<a><img alt="스틸" src="${staff}"></a>
				</c:forEach>
				<c:forEach items="${stllList}" var="stll">
					<a><img alt="스틸" src="${stll}"></a>
				</c:forEach>
			</div>
			<c:choose>
				<c:when test="${not empty stllList}">
					<div id="stll">
						<c:forEach items="${stllList}" var="stll">
							<a><img alt="스틸" src="${stll}"></a>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<div id="noResult">
						<c:out value="${msg}" />
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div id="footer"></div>
</body>
</html>