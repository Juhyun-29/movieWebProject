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
<script src="js/sideBar.js"></script>
<link rel="stylesheet" href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css">
<link rel="stylesheet" href="css/movie.css" >

</head>
<body>
	<div id="container">
		<jsp:include page="frame/sideBarSearch.jsp"/>
		<div id="subContainer1">
			<div id="header">
				<div id="poster">
					<img alt="poster" src="${poster}">
				</div>
				<div id="main">
					<div id="title">
						<h1>
							<a href="movie?movieId=${movieId}&movieSeq=${movieSeq}">${title}</a>
						</h1>
					</div>
					<div id="detail">
						<div id="staffList" class="list">
							<h3 class="detailHeader">제작진</h3>
							<c:forEach items="${staffList}" var="staff">
								<a class="detail"><b>${staff.staffRoleGroup} | </b>${staff.staffNm}</a>
							</c:forEach>
						</div>
						<div id="info" class="list">
							<h3 class="detailHeader">기본정보</h3>
							<a class="detail"><b>개봉 | </b>${repRlsDate}</a>
							<a class="detail"><b>등급 | </b>${rating}</a>
							<a class="detail"><b>장르 | </b>${genre}</a>
							<a class="detail"><b>국가 | </b>${nation}</a>
							<a class="detail"><b>러닝타임 | </b>${runtime}분</a>
							<c:if test="${not empty productionList}">
								<c:forEach items="${productionList}" var="production">
									<a class="detail"><b>제작사 | </b>${production.staffNm}</a>
								</c:forEach>
							</c:if>
							<c:if test="${not empty distributorList}">
								<c:forEach items="${distributorList}" var="distributor">
									<a class="detail"><b>배급사 | </b>${distributor.staffNm}</a>
								</c:forEach>
							</c:if>
						</div>
						<div id="actorList" class="list">
							<h3 class="detailHeader">출연</h3>
							<c:forEach items="${actorList}" var="actor">
								<a class="detail"><b>${actor.staffRole} 역 | </b>${actor.staffNm}</a>
							</c:forEach>
						</div>
					</div>
					<c:if test="${not empty keywords}">
						<div id="keywords">
							<h3 class="detailHeader">키워드</h3>
							<p>${keywords}</p>
						</div>
					</c:if>
				</div>
			</div>
			<div id="plot" class="header">
				<h3 class="detailHeader">소개</h3>
				<p>${plotText}</p>
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