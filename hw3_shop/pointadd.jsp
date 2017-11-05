<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>

<%
request.setCharacterEncoding("UTF-8");
int addpoint = Integer.parseInt(request.getParameter("addpoint"));

String id = (String)session.getAttribute("id");
String userpath = "/home/ubuntu/id/"+id+".txt";
File userfile = new File(userpath);
BufferedReader br = new BufferedReader(new FileReader(userfile));

String userpw = br.readLine();
String userpoint = br.readLine();
int total = addpoint + Integer.parseInt(userpoint);

PrintWriter writer = new PrintWriter(userpath);
writer.println(userpw);
writer.println(total);
writer.close();


%>
<script>
	location.href='list.jsp';
</script>
