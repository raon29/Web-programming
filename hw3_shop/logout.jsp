<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type = "text/javascript">
	alert('로그아웃!');
	location.href='login.html';	
</script>
	<%
		session.invalidate();
	%>

