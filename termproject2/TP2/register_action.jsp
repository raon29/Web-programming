<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>

<%
	
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("register_id");
	String pw = request.getParameter("register_pw");

	boolean found = false;	

	//경로 설정
	String filePath = "/home/ubuntu/user/"+id;
	File f = new File(filePath);
	//File [] files = f.listFiles();
	PrintWriter writer;
	PrintWriter writer2;
	

	if(!f.exists()){
		f.mkdir();
		String newFile = "/home/ubuntu/user/"+id+"/pw.txt";
                writer = new PrintWriter(newFile);
		writer.println(pw);
                writer.close();
		out.println("<script>");
       		out.println("alert('생성 완료')");
       		out.println("location.href='login.html'");
		out.println("</script>");
	}
	else{
		out.println("<script>");
		out.println("alert('아이디가 존재 합니다')");
		out.println("location.href='login.html'");
		out.println("</script>");
	}

	/*
	for( int i =0; i < files.length; i++)
	{
		if(files[i].getName().equals(id))
		{
			found = true;
			break;
		}
	}
	

	//아이디 중복검사
	if(found==true){
		out.println("<script>");
		out.println("alert('아이디가 존재 합니다')");
		out.println("location.href='login.html'");
		out.println("</script>");
	}
	//아이디 생성
	else{
		String newFile = "";
		writer = new PrintWriter(newFile);
		writer.close();	
		out.println("<script>");
        out.println("alert('생성 완료')");
        out.println("location.href='login.html'");
		out.println("</script>");
	}
	*/
	%>	
