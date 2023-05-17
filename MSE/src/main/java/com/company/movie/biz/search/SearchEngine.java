package com.company.movie.biz.search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/search")
public class SearchEngine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page;
		if(request.getParameter("page")==null) {
			page=1;
		}else {
			page=Integer.parseInt(request.getParameter("page"));  
		}
		System.out.println("현재 페이지 : "+page);
		
		request.setCharacterEncoding("UTF-8");
		
		String key = "KFI7VEXN1YPWR5EJLOD3";
		String query = URLEncoder.encode(request.getParameter("query"),"UTF-8");
		String keyword = request.getParameter("query");
		String searchType=request.getParameter("searchType");
		
		try {
			URL url = new URL("https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey="+key+"&"+searchType+"="+query+"&sort=prodYear,1&listCount=500");
			BufferedReader bfr;
			bfr=new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
			
			JSONParser jsonParser=new JSONParser();
			JSONObject jsonObject=(JSONObject)jsonParser.parse(bfr);
			
			JSONArray data=(JSONArray)jsonObject.get("Data");
			JSONObject result=(JSONObject)data.get(0);
			JSONArray searchResult=(JSONArray)result.get("Result");
			
			// 검색 결과가 없을 때
			if(searchResult==null) {
				int totalCount=0;
				String msg="검색 결과가 없습니다. 검색유형과 검색어를 확인해 보시고 다시 검색해 보세요.";
				
				request.setAttribute("page", page);
				request.setAttribute("query", query);
				request.setAttribute("searchType", searchType);
				request.setAttribute("keyword", keyword);			
				request.setAttribute("totalCount", totalCount);
				request.setAttribute("msg", msg);
				
				RequestDispatcher dispatcher=request.getRequestDispatcher("searchResult.jsp");
				dispatcher.forward(request, response);
			
			// 검색 결과가 있을 때
			}else {

				// 성인 영화 필터링 된 검색 결과를 담을 JSONArray 생성
				JSONArray movieList=new JSONArray();
				
				// 최초 검색 결과에서 성인 영화, 장르·개봉날짜·런타임 미정, 극장상영 x 필터링
				for (int i = 0; i < searchResult.size(); i++) {
					JSONObject movieResult=(JSONObject)searchResult.get(i);
					if(movieResult.get("genre").equals("에로")||movieResult.get("genre").equals("")||!movieResult.get("use").equals("극장용")||movieResult.get("repRlsDate").equals("")||movieResult.get("runtime").equals("")) {
						continue;
					}else {
						// 필터링 된 검색 결과를 위에서 선언한 movieList에 담음
						movieList.add(movieResult);
					}
				}
				
				if(movieList.toString().equals("[]")) {
					int totalCount=0;
					String msg="검색 결과가 없습니다. 검색유형과 검색어를 확인해 보시고 다시 검색해 보세요.";
					
					request.setAttribute("page", page);
					request.setAttribute("query", query);
					request.setAttribute("searchType", searchType);
					request.setAttribute("keyword", keyword);			
					request.setAttribute("totalCount", totalCount);
					request.setAttribute("msg", msg);
					
					RequestDispatcher dispatcher=request.getRequestDispatcher("searchResult.jsp");
					dispatcher.forward(request, response);
				}else {
					// 필터링 된 검색 결과 수
					int totalCount=movieList.size()-1;
					
					// 검색 결과를 10개씩 담아낼 JSONArray 생성(페이징 처리를 위함)
					JSONArray finalMovieList=new JSONArray();
					
					// 검색 결과 페이징 처리를 위한 반복문
					for (int j = page*10-10; j < movieList.size(); j++) {
						if(j<page*10) {
							JSONObject movieInfo=(JSONObject)movieList.get(j);
							
							// KMDB에 설정된 영화 제목 필터링
							String title=(String)movieInfo.get("title");
							title=title.replace("!HS", "");
							title=title.replace("!HE", "");
							title=title.replaceAll("  ", "");
							movieInfo.put("title", title);
							
							// 영화 포스터 1개만 가져오기
							String posters=(String)movieInfo.get("posters");
							String[] posterList=posters.split("\\|");
							String poster=posterList[0];
							movieInfo.put("posters", poster);
							
							// 개봉 날짜 포맷팅
							String repRlsDate=(String)movieInfo.get("repRlsDate");
							if(repRlsDate.length()>7) {
								SimpleDateFormat dtFormat=new SimpleDateFormat("yyyyMMdd");
								SimpleDateFormat newDtFormat=new SimpleDateFormat("yyyy-MM-dd");
								Date newDt=dtFormat.parse(repRlsDate);
								repRlsDate=newDtFormat.format(newDt);
								movieInfo.put("repRlsDate", repRlsDate);
							}
							
							// 영화 줄거리 가져오기
							JSONObject plots=(JSONObject)movieInfo.get("plots");
							JSONArray plot=(JSONArray)plots.get("plot");
							JSONObject plotData=(JSONObject)plot.get(0);
							String plotText=(String)plotData.get("plotText");
							movieInfo.put("overview", plotText);
							
							finalMovieList.add(movieInfo);
						}else {
							continue;
						}
					}
					
					request.setAttribute("page", page);
					request.setAttribute("query", query);
					request.setAttribute("searchType", searchType);
					request.setAttribute("keyword", keyword);			
					request.setAttribute("totalCount", totalCount);			
					request.setAttribute("finalMovieList", finalMovieList);			

					RequestDispatcher dispatcher=request.getRequestDispatcher("searchResult.jsp");
					dispatcher.forward(request, response);	
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
