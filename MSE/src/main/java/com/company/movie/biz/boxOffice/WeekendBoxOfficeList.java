package com.company.movie.biz.boxOffice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/weekendBoxOfficeList.do")
public class WeekendBoxOfficeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kobisKey="31ef183abb64add094f000aefb37f2dd";
		String result=null;
		
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		cal.add(Calendar.DATE, -7);
		String date=sdf.format(cal.getTime());
		
		try {
			URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/"
					+ "searchWeeklyBoxOfficeList.json?key="+kobisKey+"&targetDt="+date);
			
			BufferedReader bfr;
			bfr = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result=bfr.readLine();
			
			JSONParser jsonParser=new JSONParser();
			JSONObject jsonObject=(JSONObject)jsonParser.parse(result);
			JSONObject boxOfficeResult=(JSONObject)jsonObject.get("boxOfficeResult");
			
			String showRange=(String)boxOfficeResult.get("showRange");
			String[] dates = showRange.split("~");

			SimpleDateFormat inputDates = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat outputDates = new SimpleDateFormat("yyyy년MM월dd일");

			String startDateStr = outputDates.format(inputDates.parse(dates[0]));
			String endDateStr = outputDates.format(inputDates.parse(dates[1]));
			String range=startDateStr+"~"+endDateStr;
			
			String yearWeekTime=(String)boxOfficeResult.get("yearWeekTime");
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyww");
			SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 ww주차");

			String weekTime = outputFormat.format(inputFormat.parse(yearWeekTime));
			
			JSONArray weeklyBoxOfficeList=(JSONArray)boxOfficeResult.get("weeklyBoxOfficeList");
			
			request.setAttribute("range", range);
			request.setAttribute("weekTime", weekTime);
			request.setAttribute("weeklyBoxOfficeList", weeklyBoxOfficeList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("weeklyBoxOffice.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
