<%@page import="com.deloitte.utility.HibernateHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!-- SCRIPTLET -->
	
	<%
		out.println(HibernateHelper.getInstance());
	%>
</body>
</html>