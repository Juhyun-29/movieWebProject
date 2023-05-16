package com.company.movie.biz.search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/person")
public class PersonInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String key = "c3ecba5b01a149b9314ef1c7e5b23bb8";
		String personId = request.getParameter("person_id");
		
		String result=null;
		String result2=null;
		
		try {
			URL url = new URL("https://api.themoviedb.org/3/person/"+personId+"?api_key="+key);
			BufferedReader bfr;
			bfr=new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
			result=bfr.readLine();
			
			JSONParser jsonParser=new JSONParser();
			JSONObject jsonObject=(JSONObject)jsonParser.parse(result);
			Long id=(Long)jsonObject.get("id");;
			String name=(String)jsonObject.get("name");
			Long gender=(Long)jsonObject.get("gender");
			String birthday=(String)jsonObject.get("birthday");
			String department=(String)jsonObject.get("known_for_department");
			String biography=(String)jsonObject.get("biography");
			String birthPlace=(String)jsonObject.get("place_of_birth");
			String profile_path=(String)jsonObject.get("profile_path");
			String imgPath="https://image.tmdb.org/t/p/w342";
			
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			request.setAttribute("gender", gender);
			request.setAttribute("birthday", birthday);
			request.setAttribute("department", department);
			request.setAttribute("biography", biography);
			request.setAttribute("birthPlace", birthPlace);
			request.setAttribute("profile_path", profile_path);
			request.setAttribute("imgPath", imgPath);

			URL url2 = new URL("https://api.themoviedb.org/3/person/"+personId+"/movie_credits?api_key="+key+"&language=ko&region=kr");
			BufferedReader bfr2;
			bfr2=new BufferedReader(new InputStreamReader(url2.openStream(),"UTF-8"));
			result2=bfr2.readLine();
			
			JSONObject jsonObject2=(JSONObject)jsonParser.parse(result2);
			JSONArray cast=(JSONArray)jsonObject2.get("cast");
			JSONArray crew=(JSONArray)jsonObject2.get("crew");
			int numOfWorks=cast.size()+crew.size();
			String imgPath2="https://image.tmdb.org/t/p/w154";
			String unknownImg="img/blank_profile.png";
			
			request.setAttribute("cast", cast);
			request.setAttribute("crew", crew);
			request.setAttribute("numOfWorks", numOfWorks);
			request.setAttribute("imgPath2", imgPath2);
			request.setAttribute("unknownImg", unknownImg);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("personInfo.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
