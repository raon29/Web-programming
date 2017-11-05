<%@ page language="java" contentType="text/html; 
		charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.io.* , java.util.*, java.text.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset = "utf-8">
		<title>구매 취소</title>
	</head>
	<body>

<%
			request.setCharacterEncoding("UTF-8"); 
			String id=(String)session.getAttribute("id");			
			Enumeration names = request.getParameterNames();
			
			String name = (String)names.nextElement();
			int nameNum = Integer.parseInt(name);

			String FileName1 = "/home/ubuntu/id/"+id + ".txt";
			String FileName2 = "/home/ubuntu/id/"+id + "_이용내역.txt";
			File userPath1 = new File(FileName1);
			File userPath2 = new File(FileName2);
			
			BufferedReader lineReader = new BufferedReader(new FileReader(userPath2));
			int count = -1;
			while(lineReader.readLine() != null)
			{
				count++;
			}
			
			lineReader.close();
		
			BufferedReader userlist = new BufferedReader(new FileReader(userPath2));
			String userItem = userlist.readLine();
			userItem = userlist.readLine();	
			
			int temp = 0; int temp1 = 0; int temp2 = 0; int temp3 = 0; int temp4 = 0;
			String tempNum = null; String tempName = null; 
			String tempPrice = null; String tempDate = null; String tempState = null;
			
			String [] itemArray = new String [count];

			for(int i = 0; i < count;i++){
				itemArray[i] = userItem;
				
				temp1 = userItem.indexOf("|");
				tempNum = userItem.substring(0, temp1);
				temp = Integer.parseInt(tempNum);
				temp2 = userItem.indexOf("|", temp1+1);
				temp3 = userItem.indexOf("|", temp2+1);
				temp4 = userItem.indexOf("|", temp3+1);
				
				if(temp == nameNum)
				{
					tempName = userItem.substring(temp1+1, temp2);
					tempPrice = userItem.substring(temp2+1, temp3);
					tempDate = userItem.substring(temp3+1, temp4);
					tempState = userItem.substring(temp4+1, userItem.length()-1);
				}
			
				userItem = userlist.readLine();
			}
			
			userlist.close();
				
			BufferedReader reader1 = new BufferedReader(new FileReader(userPath1));
			
			String PW = reader1.readLine();
			String userPoint = reader1.readLine();
			
			reader1.close();
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			String today = formatter.format(new java.util.Date());
				
			int numToday = Integer.parseInt(today);
			int numDate = Integer.parseInt(tempDate);
			
			numToday = numToday - numDate;
			if (numToday > 3)
			{
				%>
					<script>
						alert("구매 취소는 구매일로부터 3일 이내로 가능합니다.");
						document.location.href = "./useList.jsp";
					</script>
				<%
			}
			
			else{
				int tempMoney1 = tempPrice.indexOf(",");
				String tempMoney2 = tempPrice.substring(0, tempMoney1);
				String tempMoney3 = tempPrice.substring(tempMoney1+1, tempPrice.length());            
				String tempMoney = tempMoney2 + tempMoney3;


				int userMoney = Integer.parseInt(userPoint);
				int itemMoney = Integer.parseInt(tempMoney);
				
				userMoney = userMoney + itemMoney;
				
				PrintWriter writer1 = new PrintWriter(userPath1);
				
				writer1.println(PW);
				writer1.println(userMoney);
				
				writer1.close();
				
				String FileName3 = null;
				
				if(tempName.equals("7 inch WiFi Laptop"))
				{ FileName3 = "product1.txt" ;}
				else if (tempName.equals("청축 텐키리스 Strike Battle"))
				{ FileName3 = "product2.txt" ;}
				else if (tempName.equals("띠아모전기포트 1.7L"))
				{ FileName3 = "product3.txt" ;}
				else if (tempName.equals("VR BOX 가상현실 체험 기기"))
				{ FileName3 = "product4.txt" ;}

				String itemPath = "/home/ubuntu/apache-tomcat-8.0.33/webapps/shop/shopContent/"+FileName3;
				File itemf= new File(itemPath);
				BufferedReader reader2 = new BufferedReader(new FileReader(itemf));
				String item = null;
				String itemfile[] = {null, null, null, null};
				int i = 0;
				
				while((item = reader2.readLine()) != null)
				{
					itemfile[i] = item; 
					i++;
				}
				
				reader2.close();
				
				int itemSum = Integer.parseInt(itemfile[2]) + 1;
				
				PrintWriter writer2 = new PrintWriter(itemPath);
				writer2.println(itemfile[0]);
				writer2.println(itemfile[1]);
				writer2.println(itemSum);
				writer2.println(itemfile[3]);
				writer2.close();
				
				PrintWriter writer3 = new PrintWriter(userPath2);
				
				for (i = 0; i < nameNum-1; i++)
				{
					writer3.println(itemArray[i]);
				}
				item = nameNum + "|" + tempName  + "|" +  tempPrice + "|" + tempDate + "|취소" ;
				writer3.println(item);
				for (i = nameNum; i<count;i++)
				{
					writer3.println(itemArray[i]);
				}
				writer3.close(); 
			}
		
		%>
			<script>
				document.location.href = "useList.jsp";
			</script>
	</body>
	
</html>
