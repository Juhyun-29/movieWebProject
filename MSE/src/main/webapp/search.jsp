<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1.0">
<title>영화 통합검색</title>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
   integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="js/search.js"></script>
<script src="js/sideBar.js"></script>
<link rel="stylesheet" href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css">
<link rel="stylesheet" href="css/search.css" >

</head>
<body>
	<div id="container">
		<jsp:include page="frame/sideBarSearch.jsp"/>
		<div id="searchContainer">
  			<div id="search">
  				<img alt="movie" src="img/searchImg.jpg" width="60%">
  				<form id="searchForm" name="searchForm" action="search">
  					<select id="searchType" name="searchType">
  						<option value="title">영화명</option>
  						<option value="director">감독명</option>
  						<option value="actor">배우명</option>
  					</select>
  					<input id="searchInput" type="text" name="query" placeholder="검색 유형을 선택하고 검색어를 입력하세요...">
  					<a id="searchSubmit" onclick="document.searchForm.submit();"><img alt="searchImg" src="img/search.png" height="36px"></a>
  				</form>
  				<span>감독명·배우명의 경우 동명이인이 함께 검색될 수 있습니다</span>
  			</div>
  			<div id="searchResult">
  			</div>
  		</div>
	</div>
	<div id="footer"></div>
</body>
</html>