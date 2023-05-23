$(function(){
      var kobisKey="31ef183abb64add094f000aefb37f2dd";
      
      var today=new Date();
      var yesterday=new Date(today.setDate(today.getDate()-1));
      var date=yesterday.toISOString().substring(0,10).replace(/-/g,'');
      
      var dailyDate=yesterday.toISOString().substring(0,10);
      var dailyHeader="<a><b>일일 박스오피스</b></a>&nbsp;&nbsp;<span>"+dailyDate+"</span>"
      $("#dailyHeader").append(dailyHeader);
      
      $.ajax({
         type: "GET",
         url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="+kobisKey+"&targetDt="+date,
         success: function(response){
            var dailyBoxOffice=response["boxOfficeResult"]["dailyBoxOfficeList"];
            for(var i=0;i<dailyBoxOffice.length;i++){
               var rank=dailyBoxOffice[i].rank;
               var movieNm=dailyBoxOffice[i].movieNm;
               var openDt=dailyBoxOffice[i].openDt;
               var audiCntData=parseInt(dailyBoxOffice[i].audiCnt);
               var audiIntenData=parseInt(dailyBoxOffice[i].audiInten);
               var audiAccData=parseInt(dailyBoxOffice[i].audiAcc);
               var scrnCntData=parseInt(dailyBoxOffice[i].scrnCnt);
               var showCntData=parseInt(dailyBoxOffice[i].showCnt);
               
               var audiCnt=audiCntData.toLocaleString();
               var audiInten=audiIntenData.toLocaleString();
               var audiAcc=audiAccData.toLocaleString();
               var scrnCnt=scrnCntData.toLocaleString();
               var showCnt=showCntData.toLocaleString();
               
               var dailyBoxOfficeRank="<tr>"
               			+"<td>"+rank+"위</td>"
						+"<td><a href='search?searchType=title&query="+movieNm+"'>"+movieNm+"</a></td>"
						+"<td>"+openDt+"</td>"
						+"<td>"+audiCnt+"명</td>"
						+"<td>"+audiInten+"명</td>"
						+"<td>"+audiAcc+"명</td>"
						+"<td>"+scrnCnt+"개</td>"
						+"<td>"+showCnt+"회</td>"
						+"</tr>";
				$("#dailyBoxOfficeList").append(dailyBoxOfficeRank);     
            }
         }
      })
      
      var weekday=new Date(today.setDate(today.getDate()-5));
      var weekdate=weekday.toISOString().substring(0,10).replace(/-/g,'');
      
      $.ajax({
         type: "GET",
         url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key="+kobisKey+"&targetDt="+weekdate,
         success: function(response){
            var weekendBoxOffice=response["boxOfficeResult"]["weeklyBoxOfficeList"];
            
            var weekendRange=response["boxOfficeResult"].showRange;
            var weekend=weekendRange.substr(0,4)+"-"+weekendRange.substr(4,2)+"-"+weekendRange.substr(6,2)+"~"+weekendRange.substr(9,4)+"-"+weekendRange.substr(13,2)+"-"+weekendRange.substr(15,2);
            var yearWeekTime=response["boxOfficeResult"].yearWeekTime;
            var yearWeek=yearWeekTime.substr(0,4)+"년&nbsp;"+yearWeekTime.substr(4,2)+"주차"
            
            var weekendHeader="<a><b>주말 박스오피스</b></a>&nbsp;&nbsp;<span>"+yearWeek+"("+weekend+")</span>"
      		$("#weekendHeader").append(weekendHeader);
            
            for(var i=0;i<weekendBoxOffice.length;i++){
               var rank=weekendBoxOffice[i].rank;
               var movieNm=weekendBoxOffice[i].movieNm;
               var openDt=weekendBoxOffice[i].openDt;
               var audiCntData=parseInt(weekendBoxOffice[i].audiCnt);
               var audiIntenData=parseInt(weekendBoxOffice[i].audiInten);
               var audiAccData=parseInt(weekendBoxOffice[i].audiAcc);
               var scrnCntData=parseInt(weekendBoxOffice[i].scrnCnt);
               var showCntData=parseInt(weekendBoxOffice[i].showCnt);
               
               var audiCnt=audiCntData.toLocaleString();
               var audiInten=audiIntenData.toLocaleString();
               var audiAcc=audiAccData.toLocaleString();
               var scrnCnt=scrnCntData.toLocaleString();
               var showCnt=showCntData.toLocaleString();
               
               var weekendBoxOfficeRank="<tr>"
               			+"<td>"+rank+"위</td>"
						+"<td><a href='search?searchType=title&query="+movieNm+"'>"+movieNm+"</a></td>"
						+"<td>"+openDt+"</td>"
						+"<td>"+audiCnt+"명</td>"
						+"<td>"+audiInten+"명</td>"
						+"<td>"+audiAcc+"명</td>"
						+"<td>"+scrnCnt+"개</td>"
						+"<td>"+showCnt+"회</td>"
						+"</tr>";
				$("#weekendBoxOfficeList").append(weekendBoxOfficeRank);     
            }
         }
      })
      
      $.ajax({
         type: "GET",
         url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key="+kobisKey+"&targetDt="+weekdate+"&weekGb=0",
         success: function(response){
            var weeklyBoxOffice=response["boxOfficeResult"]["weeklyBoxOfficeList"];
            
            var weeklyRange=response["boxOfficeResult"].showRange;
            var weekly=weeklyRange.substr(0,4)+"-"+weeklyRange.substr(4,2)+"-"+weeklyRange.substr(6,2)+"~"+weeklyRange.substr(9,4)+"-"+weeklyRange.substr(13,2)+"-"+weeklyRange.substr(15,2);
            var yearWeekTime=response["boxOfficeResult"].yearWeekTime;
            var yearWeek=yearWeekTime.substr(0,4)+"년&nbsp;"+yearWeekTime.substr(4,2)+"주차"
            
            var weeklyHeader="<a><b>주간 박스오피스</b></a>&nbsp;&nbsp;<span>"+yearWeek+"("+weekly+")</span>"
      		$("#weeklyHeader").append(weeklyHeader);
            
            for(var i=0;i<weeklyBoxOffice.length;i++){
               var rank=weeklyBoxOffice[i].rank;
               var movieNm=weeklyBoxOffice[i].movieNm;
               var openDt=weeklyBoxOffice[i].openDt;
               var audiCntData=parseInt(weeklyBoxOffice[i].audiCnt);
               var audiIntenData=parseInt(weeklyBoxOffice[i].audiInten);
               var audiAccData=parseInt(weeklyBoxOffice[i].audiAcc);
               var scrnCntData=parseInt(weeklyBoxOffice[i].scrnCnt);
               var showCntData=parseInt(weeklyBoxOffice[i].showCnt);
               
               var audiCnt=audiCntData.toLocaleString();
               var audiInten=audiIntenData.toLocaleString();
               var audiAcc=audiAccData.toLocaleString();
               var scrnCnt=scrnCntData.toLocaleString();
               var showCnt=showCntData.toLocaleString();
               
               var weeklyBoxOfficeRank="<tr>"
               			+"<td>"+rank+"위</td>"
						+"<td><a href='search?searchType=title&query="+movieNm+"'>"+movieNm+"</a></td>"
						+"<td>"+openDt+"</td>"
						+"<td>"+audiCnt+"명</td>"
						+"<td>"+audiInten+"명</td>"
						+"<td>"+audiAcc+"명</td>"
						+"<td>"+scrnCnt+"개</td>"
						+"<td>"+showCnt+"회</td>"
						+"</tr>";
				$("#weeklyBoxOfficeList").append(weeklyBoxOfficeRank);     
            }
         }
      })
     
     
     
     
     document.cookie = "safeCookie1=foo; SameSite=Lax"; 
	 document.cookie = "safeCookie2=foo"; 
	 document.cookie = "crossCookie=bar; SameSite=None; Secure";
})     