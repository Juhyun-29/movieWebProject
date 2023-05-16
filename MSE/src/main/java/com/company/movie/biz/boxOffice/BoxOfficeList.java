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

@WebServlet("/boxOfficeList.do")
public class BoxOfficeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kobisKey="31ef183abb64add094f000aefb37f2dd";
		
		// 여러번 사용되는 변수 초기화
		String result=null;
		BufferedReader bfr=null;
		JSONParser jsonParser=null;
		JSONObject jsonObject=null;
		JSONObject boxOfficeResult=null;
		
		// 어제 날짜 계산
		Calendar calDaily=Calendar.getInstance();
		SimpleDateFormat sdfDaily=new SimpleDateFormat("yyyyMMdd");
		calDaily.add(Calendar.DATE, -1);
		String dateDaily=sdfDaily.format(calDaily.getTime());
		
		// 지난주 날짜 계산
		Calendar calWeekly=Calendar.getInstance();
		SimpleDateFormat sdfWeekly=new SimpleDateFormat("yyyyMMdd");
		calWeekly.add(Calendar.DATE, -7);
		String dateWeekly=sdfWeekly.format(calWeekly.getTime());
		
		try {
			// 일일 박스오피스 불러오기
			URL urlDaily = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/"
					+ "searchDailyBoxOfficeList.json?key="+kobisKey+"&targetDt="+dateDaily);
			
			bfr = new BufferedReader(new InputStreamReader(urlDaily.openStream(), "UTF-8"));
			result=bfr.readLine();
			
			jsonParser=new JSONParser();
			jsonObject=(JSONObject)jsonParser.parse(result);
			boxOfficeResult=(JSONObject)jsonObject.get("boxOfficeResult");
			JSONArray dailyBoxOfficeList=(JSONArray)boxOfficeResult.get("dailyBoxOfficeList");
			
			request.setAttribute("dailyBoxOfficeList", dailyBoxOfficeList);
			
			
			// 주말 박스오피스 불러오기
			URL urlWeekend = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/"
					+ "searchWeeklyBoxOfficeList.json?key="+kobisKey+"&targetDt="+dateWeekly);
			
			bfr = new BufferedReader(new InputStreamReader(urlWeekend.openStream(), "UTF-8"));
			result=bfr.readLine();
			
			jsonObject=(JSONObject)jsonParser.parse(result);
			boxOfficeResult=(JSONObject)jsonObject.get("boxOfficeResult");
			
			String showRange=(String)boxOfficeResult.get("showRange");
			String[] dates = showRange.split("~");

			SimpleDateFormat inputDates = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat outputDates = new SimpleDateFormat("yyyy년MM월dd일");

			String startDateStr = outputDates.format(inputDates.parse(dates[0]));
			String endDateStr = outputDates.format(inputDates.parse(dates[1]));
			String weekendRange=startDateStr+"~"+endDateStr;
			
			String yearWeekTime=(String)boxOfficeResult.get("yearWeekTime");
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyww");
			SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 ww주차 주말 박스오피스");

			String weekendTime = outputFormat.format(inputFormat.parse(yearWeekTime));
			
			JSONArray weekendBoxOfficeList=(JSONArray)boxOfficeResult.get("weeklyBoxOfficeList");
			
			request.setAttribute("weekendRange", weekendRange);
			request.setAttribute("weekendTime", weekendTime);
			request.setAttribute("weekendBoxOfficeList", weekendBoxOfficeList);
			
			
			// 주간 박스오피스 불러오기
			URL urlWeekly = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/"
					+ "searchWeeklyBoxOfficeList.json?key="+kobisKey+"&targetDt="+dateWeekly+"&weekGb=0");
			
			bfr = new BufferedReader(new InputStreamReader(urlWeekly.openStream(), "UTF-8"));
			result=bfr.readLine();
			
			jsonParser=new JSONParser();
			jsonObject=(JSONObject)jsonParser.parse(result);
			boxOfficeResult=(JSONObject)jsonObject.get("boxOfficeResult");
			
			String showRange2=(String)boxOfficeResult.get("showRange");
			String[] dates2 = showRange2.split("~");

			SimpleDateFormat inputDates2 = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat outputDates2 = new SimpleDateFormat("yyyy년MM월dd일");

			String startDateStr2 = outputDates2.format(inputDates2.parse(dates2[0]));
			String endDateStr2 = outputDates2.format(inputDates2.parse(dates2[1]));
			String weeklyRange=startDateStr2+"~"+endDateStr2;
			
			String yearWeekTime2=(String)boxOfficeResult.get("yearWeekTime");
			SimpleDateFormat inputFormat2 = new SimpleDateFormat("yyyyww");
			SimpleDateFormat outputFormat2 = new SimpleDateFormat("yyyy년 ww주차 주간 박스오피스");

			String weeklyTime = outputFormat2.format(inputFormat2.parse(yearWeekTime2));
			
			JSONArray weeklyBoxOfficeList=(JSONArray)boxOfficeResult.get("weeklyBoxOfficeList");
			
			request.setAttribute("weeklyRange", weeklyRange);
			request.setAttribute("weeklyTime", weeklyTime);
			request.setAttribute("weeklyBoxOfficeList", weeklyBoxOfficeList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("boxOfficeList.jsp");
			dispatcher.forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
