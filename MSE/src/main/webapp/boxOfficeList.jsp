<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박스오피스 순위</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
	integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="js/boxOfficeList.js"></script>
<script src="js/sideBar.js"></script>
<link rel="stylesheet"
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css">
<link rel="stylesheet" href="css/boxOffice.css">

</head>
<body>
	<div id="container">
		<jsp:include page="frame/sideBarBoxOffice.jsp" />
		<div id="subContainer">
			<div id="dailyHeader" class="chartHeader"></div>
			<table id="dailyBoxOffice" border="1" class="table">
				<thead class="table-dark">
					<tr>
						<th>순위</th>
						<th>영화명</th>
						<th>개봉일</th>
						<th>관객수</th>
						<th>관객수증감(전일대비)</th>
						<th>누적관객수</th>
						<th>스크린수</th>
						<th>상영횟수</th>
					</tr>
				</thead>
				<tbody id="dailyBoxOfficeList"></tbody>
			</table>
			
			<div id="weekendHeader" class="chartHeader"></div>
			<table border="1" class="table">
				<thead class="table-dark">
					<tr>
						<th>순위</th>
						<th>영화명</th>
						<th>개봉일</th>
						<th>관객수</th>
						<th>관객수증감(전주대비)</th>
						<th>누적관객수</th>
						<th>스크린수</th>
						<th>상영횟수</th>
					</tr>
				</thead>
				<tbody id="weekendBoxOfficeList"></tbody>
			</table>
			
			<div id="weeklyHeader" class="chartHeader"></div>
			<table border="1" class="table">
				<thead class="table-dark">
					<tr>
						<th>순위</th>
						<th>영화명</th>
						<th>개봉일</th>
						<th>관객수</th>
						<th>관객수증감(전주대비)</th>
						<th>누적관객수</th>
						<th>스크린수</th>
						<th>상영횟수</th>
					</tr>
				</thead>
				<tbody id="weeklyBoxOfficeList"></tbody>
			</table>
		</div>
	</div>
</body>
</html>