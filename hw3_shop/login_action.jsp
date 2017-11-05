<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");
String id_txt =id+".txt"; 
boolean found = false;
String filePath = "/home/ubuntu/id/";
File f = new File(filePath);
File [] files = f.listFiles();
BufferedReader reader = null;
	
for( int i=0; i < files.length; i++){
	if(files[i].getName().equals(id_txt)){ 
		found = true;
		break;  
	}
}
if(found==true){
	reader = new BufferedReader( new FileReader(filePath+id_txt));
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
else{
	out.println("<script>");
	out.println("alert('존재하지 않는 아이디 입니다.')");
	out.println("location.href='login.html'");
	out.println("</script>");
} 
%>
