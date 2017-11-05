<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");
boolean found = false;

//경로설정
String filePath = "/home/ubuntu/user/"+id;
File f = new File(filePath);
File [] files = f.listFiles();
BufferedReader reader = null;

if(!f.exists()){
	out.println("<script>");
	out.println("alert('아이디가 일치하지 않습니다.')");
	out.println("location.href='login.html'");
	out.println("</script>");
}
else{
	for( int i=0; i < files.length; i++){
		if(files[i].getName().equals("pw.txt")){ 
			found = true;
			break;  
		}
	}
	if(found==true){
		reader = new BufferedReader( new FileReader(filePath+"/pw.txt"));
		String realPw = reader.readLine();

		if(realPw.equals(pw)){
			session.setAttribute("id", id);   
			out.println("<script>");
			out.println("alert('로그인 성공')");  
			out.println("location.href='list.html'");
			out.println("</script>");
		}
		else{
			out.println("<script>");
			out.println("alert('비밀 번호가 다릅니다')");
			out.println("location.href='login.html'");
			out.println("</script>");
		}

	}
}

/*
for( int i=0; i < files.length; i++){
	if(files[i].getName().equals(id_txt)){ 
		found = true;
		break;  
	}
}
//아이디 발견시
if(found==true){
	reader = new BufferedReader( new FileReader(filePath));
	String realPw = reader.readLine();

	if(realPw.equals(pw)){
		session.setAttribute("id", id);   
		out.println("<script>");
		out.println("alert('로그인 성공')");  
		out.println("location.href='list.jsp'");
		out.println("</script>");
	}
	else{
		out.println("<script>");
		out.println("alert('비밀 번호가 다릅니다')");
		out.println("location.href='login.html'");
		out.println("</script>");
	}
}
//아이디 미 발견시
else{
	out.println("<script>");
	out.println("alert('존재하지 않는 아이디 입니다.')");
	out.println("location.href='login.html'");
	out.println("</script>");
}
*/ 
%>
