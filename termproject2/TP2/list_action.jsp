<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.FileNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8");%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>


<%

String id=(String)session.getAttribute("id");

String filepath = "/home/ubuntu/user/"+id;
File f = new File(filepath);
File []fileList = f.listFiles();
BufferedReader reader = null;

Arrays.sort(fileList, new Comparator<Object>(){
		public int compare(Object object1, Object object2){
		String s1 = "";
		String s2 = "";
		s1 = ((File) object1).lastModified()+"";
		s2 = ((File) object2).lastModified()+"";
		return s2.compareTo(s1);
		}
		});

JSONArray returndata = new JSONArray();
JSONObject json;

PrintWriter pw = response.getWriter();

try{
	for(File tempFile : fileList) {
		if(tempFile.getName().equals("pw.txt")){
		}
		else if(tempFile.isFile() &&  tempFile.getName().endsWith(".txt")){
			String tempFileName = tempFile.getName();
			json = new JSONObject();
			reader = new BufferedReader(new FileReader(filepath+"/"+tempFileName));
			String[] temptitle = tempFileName.split("\\.");
			json.put("title", temptitle[0]);
			reader.readLine();
			json.put("date",reader.readLine());
			returndata.add(json);
		}
	}
	pw.print(returndata);
	pw.flush();
	pw.close();

} catch( Exception e ){
	e.printStackTrace();
} finally{
	try{
		if( reader != null ) reader.close();
	}catch( Exception e1 ){
		e1.printStackTrace();
	}
}

%>

</body>
</html>

