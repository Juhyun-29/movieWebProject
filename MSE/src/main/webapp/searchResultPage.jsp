<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		// 검색어
		String query=request.getParameter("query");
		
		// 검색유형
		String searchType=request.getParameter("searchType");
		
		// 전체 게시물의 개수(중요 변수)
		int totalCount=Integer.parseInt(request.getParameter("totalCount"));
		
		// 한 페이지에 출력될 게시물의 수(10개를 기준으로 잡음)
		int countList=10;
		
		// 한 페이지에 출력될 페이지 수(통상적으로 10개 페이지를 나오게 함)
		int countPage=10;
		
		// 현재 위치한 페이지(서버 프로그램을 통해 현재 보고자 하는 페이지 번호 받아옴)
		int pg=Integer.parseInt(request.getParameter("pg"));
		
		// 전체 페이지 수(전체 게시물/한 페이지에 출력될 게시물 수)
		int totalPage=totalCount/countList;
		
		// 10개가 꽉 안 차는 페이지가 존재할 경우를 위한 보정
		if(totalCount%countList>0){
			totalPage++;
		}
		
		// 현재 페이지를 기준으로 한 화면에서 시작 페이지 값을 보여줌
		int startPage=((pg-1)/countList)*countPage+1;	
		
		// 현재 페이지를 기준으로 한 화면에서 끝 페이지 값을 보여줌
		// 끝 값은 시작페이지에서 카운트페이지를 더한 후 1을 빼면 끝 페이지가 나옴
		int endPage=startPage+countPage-1;
			
		// 시작 페이지와 끝 페이지의 값을 정확히 확인하기 위해서는
		// 전체 게시물의 개수를 충분히 큰 수로 설정하고 테스트를 수행한다
		
		if(totalPage<pg){
			// 현재 페이지가 전체 페이지보다 크다면,
			// 이런 경우는 출력될 페이지 범위를 벗어난 현재의 페이지를 의미
			// 따라서 현재 페이지를 가장 끝 페이지 totalPage로 이동시킨다
			pg=totalPage;
		}
		
		// 마지막 페이지 잔여 페이지 보정 /  ex) 3페이지 뿐인데 10페이지까지 나오면 안 됨
		if(endPage>totalPage){
			endPage=totalPage;
		}
		
		// 처음 링크(두 번째 페이지 이동 시 활성화)
		if(startPage>1) { %>
			<a href="search?searchType=<%=searchType %>&query=<%=query %>&page=1">처음</a>
		<%}
		
		// 이전 링크
		if(pg>1) {%>
			<a href="search?searchType=<%=searchType %>&query=<%=query %>&page=<%=pg-1%>">이전</a>
		<% }
		
		// 반복문을 이용하여 페이지리스트 생성. 현재페이지번호를 강조하기 위해 b태그 사용.
		for (int iCount = startPage; iCount <= endPage; iCount++) {
			if (iCount == pg) {%>
				<a href="search?searchType=<%=searchType %>&query=<%=query %>&page=<%=iCount%>"><b><%=iCount %></b></a>
			<% } else {%>
				<a href="search?searchType=<%=searchType %>&query=<%=query %>&page=<%=iCount%>"><%=iCount %></a>
			<% }
		}
		
		// 다음 링크
		if(pg<totalPage) {%>
			<a href="search?searchType=<%=searchType %>&query=<%=query %>&page=<%=pg+1%>">다음</a>
		<% }
		
		// 끝 링크
		if(endPage<totalPage) {%>
			<a href="search?searchType=<%=searchType %>&query=<%=query %>&page=<%=totalPage %>">끝</a>
		<%}
%>