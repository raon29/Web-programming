<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.io.*" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset = "utf-8">
<title>이용 내역서</title>
<link rel = "stylesheet" type = "text/css" href = "styleUse.css">
</head>
<body>
<h3>온라인 상점 시스템</h3>
<%
request.setCharacterEncoding("UTF-8"); 
String id=(String)session.getAttribute("id");

String FileName1 = "/home/ubuntu/id/"+id + ".txt";
String FileName2 = "/home/ubuntu/id/"+id+ "_이용내역.txt";
File userPath1 = new File(FileName1);
File userPath2 = new File(FileName2);

BufferedReader userState = new BufferedReader(new FileReader(userPath1));
String pw = userState.readLine();
String point = userState.readLine();
userState.close();

BufferedReader userlist = new BufferedReader(new FileReader(userPath2));

String userItem = userlist.readLine();
if ((userItem = userlist.readLine()) == null)
{
	%>
		<script>
		alert("이용내용이 없습니다.");
		location.href = "list.jsp";
		</script>
<%
}
%>

<div id = "mainDiv">
<form id = "tableList" action = "cancel.jsp" method = "GET">
<table id ="myTable">
<th>숫자</th>
<th>물품명</th>
<th>가격</th>
<th>날짜</th>
<th></th>

<%	
int temp1 = 0; int temp2 = 0; int temp3 = 0; int temp4 = 0;

while(userItem != null)
{
	for (int i = 0; i < userItem.length(); i++)
	{
		temp1 = userItem.indexOf("|");
		temp2 = userItem.indexOf("|", temp1+1);
		temp3 = userItem.indexOf("|", temp2+1);
		temp4 = userItem.indexOf("|", temp3+1);
	}

	String tempNum = userItem.substring(0, temp1);
	String tempName = userItem.substring(temp1+1, temp2);
	String tempPrice = userItem.substring(temp2+1, temp3);
	String tempDate = userItem.substring(temp3+1, temp4);
	String tempState = userItem.substring(temp4+1, userItem.length());	

	%>
		<tr>
		<td> <%=tempNum%></td>
		<td> <%=tempName%></td>
		<td> <%=tempPrice%></td>
		<td> <%=tempDate%></td>
		<td> 
		<%
		if(tempState.equals("취소"))
		{ %> 구매 취소함<% }
		else
		{%>
		<input type = "submit" name = "<%=tempNum%>" value = "구매 취소" onClick = "cancel()"> <%}%>
	</td>
		</tr>

		<%
		userItem = userlist.readLine();
}%>
</table>
</form>

<div id = "inDiv">
<p>정보</p>
아이디 : <%=id%><br>
포인트 : <%=point%><br>
<input type = "button" value = "이용내역 확인" onClick = "useList()">
<input type = "button" value = "로그아웃" onClick = "location.href='logout.jsp'" >
</div>
</div>
<body>
</html>
