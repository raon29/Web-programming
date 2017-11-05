<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.util.regex.*"%>
<%@ page import = "java.text.*"%>
<%
//값 받아와 저장
request.setCharacterEncoding("UTF-8");
String title = request.getParameter("title");
String content = request.getParameter("content");
String bg_type = request.getParameter("skin");
String id = (String)session.getAttribute("id");
Date d = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");	
String date = sdf.format(d);
%>
<%!
//content 내용 분석으로 bg type 판단 
public int filter(String content, List filters){
	int count=0;

	for(int i=0; i<filters.size(); i++){
		Pattern p = Pattern.compile((String)filters.get(i));
		Matcher m = p.matcher(content);
		for(int j=0; m.find(j); j = m.end()){ count++; }
	}
	return count;
}
%>
<%
List sad = Arrays.asList("우울","자살","힘들다","죽고싶다","쓰레기","ㅠㅠ","슬프다","힘들다","지친다","피곤");
List happy = Arrays.asList("ㅎㅎ","신난다","좋다","대박","재밌","꿀잼","행복");
List angry = Arrays.asList("ㅡㅡ","씨발","짜증","화난다","빡침","씨벌탱","ㅗ","젠장","ㅅㅂ");
List love = Arrays.asList("좋다","귀엽","♡","사랑","졸귀");


if(bg_type == "auto"){

	int sad_count = filter(content,sad);
	int happy_count = filter(content,happy);
	int angry_count = filter(content,angry);
	int love_count = filter(content,love);

	//비교
	String max= "";
	if(sad_count > happy_count){max = "sad";}
	else{ max = "happy";}
	if(angry_count > love_count){
		if(angry_count > sad_count && angry_count > happy_count){
			max = "angry";
		}
	}
	else{
		if(love_count > sad_count || love_count > happy_count){
			max = "love";
		}
	}

	if(sad_count == 0 && happy_count == 0 && angry_count == 0 && love_count==0){
		max = "nomal";
	}


	switch(max){
		case "sad":
			bg_type = "sad.css";	
			break;
		case "happy":	
			bg_type = "happy.css";
			break;
		case "angry":
			bg_type = "angry.css";
			break;
		case "love":
			bg_type = "love.css";
			break;
		default:
			bg_type = "nomal.css";
	}
}
else{
	bg_type = bg_type+".css";
}

//받아온 값을 토대로 값 txt생성 및 write
String newFile = "/home/ubuntu/user/"+id+"/";
PrintWriter writer;
writer = new PrintWriter(newFile+title+".txt");
writer.println(bg_type);
writer.println(date);
writer.println(content);
writer.close();
%>
<script>


alert("작성완료!!");
location.href = "list.html";
</script>	
