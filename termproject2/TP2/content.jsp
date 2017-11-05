<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>

<%

		String title = request.getParameter("title");
		String id = (String)session.getAttribute("id");
		
		String filepath = "/home/ubuntu/user/"+id+"/"+title+".txt";
		File f = new File(filepath);
		BufferedReader reader = null;
		
		reader = new BufferedReader(new FileReader(filepath));
		String match_css = reader.readLine();
		String c_date = reader.readLine();

		String content="";
		String rline;
		
		while((rline=reader.readLine()) != null){
			content = content+rline+"<br>";
		}

%>



<html>
<script src = "test.js"></script>
<link rel = "stylesheet" type="text/css" href= "<%=match_css%>" >
<head>
</head>
<body>

<div id = content>
<%=content%>
</div>

<button onclick = "location.href='list.html'">목록으로</button>

</body>
</html>
