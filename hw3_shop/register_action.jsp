<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>

<%
	
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("register_id");
	String pw = request.getParameter("register_pw");

	boolean found = false;	

	String filePath = "/home/ubuntu/id/";
	File f = new File(filePath);
	File [] files = f.listFiles();
	PrintWriter writer;
	PrintWriter writer2;
	
	for( int i =0; i < files.length; i++)
	{
		if(files[i].getName().equals(id+".txt"))
		{
			found = true;
			break;
		}
	}
	
		
	if(found==true){
		out.println("<script>");
		out.println("alert('아이디가 존재 합니다')");
		out.println("location.href='login.html'");
		out.println("</script>");
	}
	else{
		String newFile = "/home/ubuntu/id/"+id+".txt";
		writer = new PrintWriter(newFile);
		writer.println(pw);
		writer.println("50000");
		writer.close();	
		newFile = "/home/ubuntu/id/"+id+"_이용내역.txt";
		writer2 = new PrintWriter(newFile);
		writer2.println();
		writer2.close();	
		out.println("<script>");
        out.println("alert('생성 완료')");
        out.println("location.href='login.html'");
		out.println("</script>");
	}
	
	%>	
