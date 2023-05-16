<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1.0">
<title>메인</title>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
   integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="js/index.js"></script>
<script src="js/sideBar.js"></script>
<link rel="stylesheet" href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css">
<link rel="stylesheet" href="css/index.css" >

</head>
<body>
	<div id="container">
		<jsp:include page="frame/sideBarIndex.jsp"/>
		<div id="subContainer1">
  			<div id="main">
  				<div class="video-box"></div>
  				<div id="mainInfo">
  					<div id=header>
  						<div id="title"></div>
  						<div id="facts">
  							<span id="rating"></span>
  							<span id="release"></span>
  							<span id="genres"></span>
  							<span id="runtime"></span>
  						</div>
  						<div id="overview"></div>
  						<div id="btns">
  							<div id="firstNo" class="divBtn">
  								<a>어제의 박스오피스 <b>1위</b></a>
  							</div>
  							<div id="firstInfo" class="divBtn">
  							</div>
  						</div>
  					</div>
  				</div>
  				<div id="topBar"></div>
  				<div id="bottomBar"></div>
  			</div>
  			<div id="subContainer2">
  				<h2>어제의 박스오피스 TOP 10</h2>
  				<div id="boxOffice10"></div>
         	
  				<h2>개봉 & 개봉 예정 영화</h2>
  				<div id="upcoming"></div>
  			
  			</div>
  		</div>
	</div>
	<div id="footer"></div>
</body>
</html>