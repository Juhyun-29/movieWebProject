<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1.0">
<title>영화 검색결과</title>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
   integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="js/searchResult.js"></script>
<script src="js/sideBar.js"></script>
<link rel="stylesheet" href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css">
<link rel="stylesheet" href="css/searchResult.css" >

</head>
<body>
	<div id="container">
		<jsp:include page="frame/sideBarSearch.jsp"/>
		<div id="searchContainer">
  			<div id="search">
  				<form id="searchForm" name="searchForm" action="search">
  					<select id="searchType" name="searchType">
  						<option value="title">영화명</option>
  						<option value="director">감독명</option>
  						<option value="actor">배우명</option>
  					</select>
  					<input id="searchInput" type="text" name="query" placeholder="검색 유형을 선택하고 검색어를 입력하세요..." value="${keyword }">
  					<a id="searchSubmit" onclick="document.searchForm.submit();"><img alt="searchImg" src="img/search.png" height="36px"></a>
  				</form>
  			</div>
  			<div id="searchResult">
  				<hr>
  				<c:choose>
	  				<c:when test="${not empty finalMovieList }">
	  					<ul id="list">
							<c:forEach items="${finalMovieList }" var="movie">
								<li class="list-group">
									<div class="movieImg"><a href="movie?movieId=${movie.movieId}&movieSeq=${movie.movieSeq}"><img class="" alt="poster" src="${movie.posters}" onerror="this.onerror=null; this.src='img/nullPoster.png';" style="width: 213px;"></a></div>
									<div class="list-group-item">
										<a href="movie?movieId=${movie.movieId}&movieSeq=${movie.movieSeq}"><b>${movie.title}</b></a>
										<div class="simpleInfo">${movie.rating}&nbsp;&nbsp;${movie.repRlsDate}&nbsp;&nbsp;${movie.genre}&nbsp;&nbsp;${movie.runtime}분</div>
										<div id="overview" class="text-clamp">${movie.overview}</div>
									</div>
								</li>
							</c:forEach>		
						</ul>
					</c:when>
					<c:otherwise>
						<div id="noResult">
							<c:out value="${msg}"/>
						</div>
					</c:otherwise>
				</c:choose>
			<hr>
			<!-- 페이지 리스트 삽입 시작 -->
			<div id="paging">
				<jsp:include page="searchResultPage.jsp">
					<jsp:param value="${query}" name="query"/>
					<jsp:param value="${searchType}" name="searchType"/>
					<jsp:param value="${totalCount}" name="totalCount"/>
					<jsp:param value="${page}" name="pg"/>
				</jsp:include>
			</div>
			<!-- 페이지 리스트 삽입 끝 -->
  			</div>
  		</div>
	</div>
	<div id="footer"></div>
</body>
</html>