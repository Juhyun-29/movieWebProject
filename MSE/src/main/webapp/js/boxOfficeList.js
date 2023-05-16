$(function(){
      var kobisKey="31ef183abb64add094f000aefb37f2dd";
      
      var today=new Date();
      var yesterday=new Date(today.setDate(today.getDate()-1));
      var date=yesterday.toISOString().substring(0,10).replace(/-/g,'');
      
      $.ajax({
         type: "GET",
         url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="+kobisKey+"&targetDt="+date,
         success: function(response){
            var dailyBoxOffice=response["boxOfficeResult"]["dailyBoxOfficeList"];
            for(var i=0;i<dailyBoxOffice.length;i++){
               var rank=dailyBoxOffice[i].rank;
               var movieNm=dailyBoxOffice[i].movieNm;
               var openDt=dailyBoxOffice[i].openDt;
               var audiCnt=dailyBoxOffice[i].audiCnt;
               var audiInten=dailyBoxOffice[i].audiInten;
               var audiAcc=dailyBoxOffice[i].audiAcc;
               var scrnCnt=dailyBoxOffice[i].scrnCnt;
               var showCnt=dailyBoxOffice[i].showCnt;
               
               console.log(movieNm);
               
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
						
				console.log(dailyBoxOfficeRank);
				$("#dailyBoxOfficeList").append(dailyBoxOfficeRank);     
            }
         }
      })
     
     document.cookie = "safeCookie1=foo; SameSite=Lax"; 
	 document.cookie = "safeCookie2=foo"; 
	 document.cookie = "crossCookie=bar; SameSite=None; Secure";
})     