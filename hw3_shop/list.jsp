<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.io.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<link href="list.css" rel="stylesheet" type="text/css"></link>
<script type = "text/javascript" src="shop.js"></script>
<script type="text/javascript" src="jquery-2.2.3.js"></script>
</head>
<body>
<div id="info">
<h3 id = h>온라인 상점 시스템</h3>
<br>
<table id = list_info >


<%

File file = new File("/home/ubuntu/apache-tomcat-8.0.33/webapps/shop/shopContent/");
File files[] = file.listFiles();


String id = (String)session.getAttribute("id");
String userpath = "/home/ubuntu/id/"+id+".txt";
File userfile = new File(userpath);

BufferedReader br;
for (int i = 0; i < files.length; i++) {
	String contentpath = "/home/ubuntu/apache-tomcat-8.0.33/webapps/shop/shopContent/product"+Integer.toString(i+1)+".txt";

	File ff = new File(contentpath);
	br = new BufferedReader(new FileReader(ff));
	int count;
	%>

	<form id ="myform<%=i%>" action ="./buy.jsp" >
		<input type ="hidden" value = "<%=i+1%>" name ="content_num"></input>
		<tr>
		<td>
		<p>이름 : <%=br.readLine()%></p>
		<p>가격 : <span id = "price<%=i%>" ><%=br.readLine()%></span></p>
		<p>재고 : <%count = Integer.parseInt(br.readLine());%><span id = "countnum<%=i%>"><%=count%></span></p>
<%

		if(count == 0){
			out.println("<p>구매 불가</p>");
		}
		else{
			out.println("<p id = 'buynum"+ i+"'><input type='button' value='구매' onclick='buysome("+i+")'></input></p>");
		}
	
%>
		</td>
		<td>
		<img src = "<%=br.readLine()%>">
		</td>
		</tr>
	</form>
		<%
}

br = new BufferedReader(new FileReader(userfile));
br.readLine();
%>
</table>
</div>

<div id="user">
<div id="userinfo">
<p>정보</p>
<p>아이디: <span id = "showid"><%=id%></span></p>
<p>포인트: <span id = "point"><%=br.readLine()%></span></p>
<p><input type="button" onclick= "location.href='useList.jsp' "value="이용내역 확인"></input><input type="button" value="로그아웃" onclick = "location.href='logout.jsp'"></input></p>
</div>
<div id="pointadd">
<p>포인트 추가</p>
<form action = "./pointadd.jsp">
<input id ="addpoint" type="text" name="addpoint"></input><br>
<p>
<input type="submit" value="포인트 추가"/>
</form>
</div>
</div>
</body>
</html>

