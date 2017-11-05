<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<script>
	alert("구매 완료");
</script>
<%
request.setCharacterEncoding("UTF-8");
String cnum = request.getParameter("content_num");

String userpath = "/home/ubuntu/apache-tomcat-8.0.33/webapps/shop/shopContent/product"+cnum+".txt";
File userfile = new File(userpath);
BufferedReader br = new BufferedReader(new FileReader(userfile));

// count modify
String arr[] = new String[4];
for(int i =0; i<4;i++){
	arr[i] = br.readLine();
}

String price = arr[1].replaceAll("[^0-9]","");
int count = Integer.parseInt(arr[2]); 
arr[2] = Integer.toString(count-1);

PrintWriter writer = new PrintWriter(userpath);
for(int i =0; i<4;i++){
	writer.println(arr[i]);
}
writer.close();


//point modify
String id = (String)session.getAttribute("id");
userpath = "/home/ubuntu/id/"+id+".txt";
userfile = new File(userpath);
br = new BufferedReader(new FileReader(userfile));
String userpw = br.readLine();
String userpoint = br.readLine();
int total = Integer.parseInt(userpoint) - Integer.parseInt(price);

writer = new PrintWriter(userpath);
writer.println(userpw);
writer.println(total);
writer.close();

//record
userpath = "/home/ubuntu/id/"+id+"_이용내역.txt";
userfile = new File(userpath);
br = new BufferedReader(new FileReader(userfile));
String arr2[] = new String[100];
int c=0;
for(int i = 0;true;i++){
	arr2[i] = br.readLine();
	if(arr2[i] == null){break;}
	c++;
}
writer = new PrintWriter(userpath);
for(int i = 0; i<c;i++){
	writer.println(arr2[i]);
}
Date dt = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
writer.println(c+"|"+arr[0]+"|"+arr[1]+"|"+sdf.format(dt).toString()+"|"+"구매");
writer.close();

%>
<script>
	location.href='list.jsp';
</script>
