package com.company.movie.biz.search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
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

@WebServlet("/movie")
public class MovieInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String key = "KFI7VEXN1YPWR5EJLOD3";
		String movieId = request.getParameter("movieId");
		String movieSeq = request.getParameter("movieSeq");
		
		try {
			URL url = new URL("https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey="+key+"&movieId="+movieId+"&movieSeq="+movieSeq);
			BufferedReader bfr;
			bfr=new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
			
			JSONParser jsonParser=new JSONParser();
			JSONObject jsonObject=(JSONObject)jsonParser.parse(bfr);
			
			JSONArray data=(JSONArray)jsonObject.get("Data");
			JSONObject result=(JSONObject)data.get(0);
			JSONArray searchResult=(JSONArray)result.get("Result");
			
			JSONObject movieInfo=(JSONObject)searchResult.get(0);
			
			String title=(String)movieInfo.get("title");
			title=title.replace("!HS", "");
			title=title.replace("!HE", "");
			title=title.replaceAll("  ", "");
			
			String posters=(String)movieInfo.get("posters");
			String[] posterList=posters.split("\\|");
			String poster=posterList[0];
			
			String rating=(String)movieInfo.get("rating");
			String genre=(String)movieInfo.get("genre");
			String runtime=(String)movieInfo.get("runtime");
			
			String repRlsDate=(String)movieInfo.get("repRlsDate");
			if(repRlsDate.length()>7) {
				SimpleDateFormat dtFormat=new SimpleDateFormat("yyyyMMdd");
				SimpleDateFormat newDtFormat=new SimpleDateFormat("yyyy-MM-dd");
				Date newDt=dtFormat.parse(repRlsDate);
				repRlsDate=newDtFormat.format(newDt);
			}
			
			JSONObject plots=(JSONObject)movieInfo.get("plots");
			JSONArray plot=(JSONArray)plots.get("plot");
			JSONObject plotData=(JSONObject)plot.get(0);
			String plotText=(String)plotData.get("plotText");
			
			String stlls=(String)movieInfo.get("stlls");
			String[] stllList=stlls.split("\\|");
			
			JSONObject staffs=(JSONObject)movieInfo.get("staffs");
			JSONArray staff=(JSONArray)staffs.get("staff");
			
			JSONArray staffList=new JSONArray();
			JSONArray actorList=new JSONArray();
			for (int i = 0; i < staff.size(); i++) {
				if(i<12) {
					JSONObject staffResult=(JSONObject)staff.get(i);
					if(staffResult.get("staffRoleGroup").equals("감독")||staffResult.get("staffRoleGroup").equals("원작")||staffResult.get("staffRoleGroup").equals("각본")){
						staffList.add(staffResult);
					}else if(staffResult.get("staffRoleGroup").equals("출연")) {
						actorList.add(staffResult);
					}else {
						continue;
					}
				}else {
					continue;
				}
			}
			
			JSONArray productionList=new JSONArray();
			JSONArray distributorList=new JSONArray();
			for (int i = 0; i < staff.size(); i++) {
				JSONObject staffResult=(JSONObject)staff.get(i);
				if(staffResult.get("staffRoleGroup").equals("제작사")) {
					productionList.add(staffResult);
				}else if(staffResult.get("staffRoleGroup").equals("배급사")){
					distributorList.add(staffResult);
				}else {
					continue;
				}
			}
			
			String nation=(String)movieInfo.get("nation");
			String keywords=(String)movieInfo.get("keywords");
			String msg="스틸컷이 없습니다.";
			
			request.setAttribute("movieId", movieId);
			request.setAttribute("movieSeq", movieSeq);
			request.setAttribute("title", title);
			request.setAttribute("poster", poster);
			request.setAttribute("rating", rating);
			request.setAttribute("genre", genre);
			request.setAttribute("runtime", runtime);
			request.setAttribute("repRlsDate", repRlsDate);
			request.setAttribute("plotText", plotText);
			request.setAttribute("stllList", stllList);
			request.setAttribute("staffList", staffList);
			request.setAttribute("actorList", actorList);
			request.setAttribute("productionList", productionList);
			request.setAttribute("distributorList", distributorList);
			request.setAttribute("nation", nation);
			request.setAttribute("keywords", keywords);
			request.setAttribute("msg", msg);

			RequestDispatcher dispatcher=request.getRequestDispatcher("movieInfo.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
