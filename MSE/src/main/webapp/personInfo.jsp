<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

</head>
<body>
	
	<img alt="profile" src="${imgPath }${profile_path}" onerror="this.src='${unknownImg }'">
	<h4>${name }</h4>
	<b>인물 정보</b> <br>
	<b>유명 분야</b> <br>
	${department } <br>
	<b>참여 작품 수</b> <br>
	${numOfWorks } <br>
	<b>성별</b> <br>
	<c:choose>
		<c:when test="${gender=='1'}">
			<c:out value="여성"/>
		</c:when>
		<c:when test="${gender=='2'}">
			<c:out value="남성"/>
		</c:when>
	</c:choose><br> 
	<b>생일</b> <br>
	${birthday } <br>
	<b>출생지</b> <br>
	${birthPlace } <br>
	<b>필모그래피</b> <br>
	<c:choose>
		<c:when test="${department=='Directing'||department=='Screenplay'||department=='Writer'||department=='Producer'}">
			<c:forEach items="${crew }" var="movie">
			
			</c:forEach>
		</c:when>
		<c:when test="${gender=='2'}">
			<c:out value="남성"/>
		</c:when>
	</c:choose><br> 
	<!-- 부트스트랩 JS -->
	<script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>