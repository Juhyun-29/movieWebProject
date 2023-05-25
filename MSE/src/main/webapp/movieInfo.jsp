<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<img alt="poster" src="${poster}" onerror="this.onerror=null; this.src='img/nullPoster.png';" style="width: 213px;">
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
				</div>
			</div>
			<div id="plot" class="header">
				<h3 class="detailHeader">소개</h3>
				<p>${plotText}</p>
			</div>
			<c:choose>
				<c:when test="${fn:length(stllList)>1}">
					<div id="stll">
						<c:forEach items="${stllList}" var="stll">
							<a><img alt="스틸" src="${stll}"></a>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<div id="noResult">
						<b><c:out value="${msg}" /></b>
					</div>
				</c:otherwise>
			</c:choose>
			<form name="commentForm">
				<c:if test="${commentList.size()>0 }">
					<c:forEach items="${replyList }" var="reply">
						<div id="replyContainer">
							<p>
								<b> ${reply.masking_nickname } | </b> &nbsp;&nbsp;${reply.content } &nbsp;&nbsp; ${reply.regdate }
								<c:if test="${id==reply.userid || role=='Admin'}">
									<a href="getReplyBoard?rseq=${reply.rseq }">수정</a>
									<a href="deleteReplyBoard?rseq=${reply.rseq }">삭제</a>
								</c:if>
								<br>
							</p>
						</div>
					</c:forEach>
				</c:if>
				<div id="commentBox">
					<input type="text" name="comment">
					<div class="starpoint_wrap">
						<div class="starpoint_box">
							<label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5개</span></label>
							<label for="starpoint_2" class="label_star" title="1"><span class="blind">1개</span></label>
							<label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5개</span></label>
							<label for="starpoint_4" class="label_star" title="2"><span class="blind">2개</span></label>
							<label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5개</span></label>
							<label for="starpoint_6" class="label_star" title="3"><span class="blind">3개</span></label>
							<label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5개</span></label>
							<label for="starpoint_8" class="label_star" title="4"><span class="blind">4개</span></label>
							<label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5개</span></label>
							<label for="starpoint_10" class="label_star" title="5"><span class="blind">5개</span></label>
							<input type="radio" name="starpoint" id="starpoint_1" class="star_radio" value="1">
							<input type="radio" name="starpoint" id="starpoint_2" class="star_radio" value="2">
							<input type="radio" name="starpoint" id="starpoint_3" class="star_radio" value="3">
							<input type="radio" name="starpoint" id="starpoint_4" class="star_radio" value="4">
							<input type="radio" name="starpoint" id="starpoint_5" class="star_radio" value="5">
							<input type="radio" name="starpoint" id="starpoint_6" class="star_radio" value="6">
							<input type="radio" name="starpoint" id="starpoint_7" class="star_radio" value="7">
							<input type="radio" name="starpoint" id="starpoint_8" class="star_radio" value="8">
							<input type="radio" name="starpoint" id="starpoint_9" class="star_radio" value="9">
							<input type="radio" name="starpoint" id="starpoint_10" class="star_radio" value="10">
							<span class="starpoint_bg"></span>
						</div>
					</div>
					<button onclick="replyBoard();return false;">댓글 남기기</button>
				</div>
			</form>
			<hr>
		</div>
	</div>
	<div id="footer"></div>
	<script type="text/javascript">
		function replyBoard() {
			var comment=document.commentForm.comment.value;
			var rating=document.commentForm.starpoint.value;
			console.log(comment);
			console.log(rating);
		}
	</script>
</body>
</html>