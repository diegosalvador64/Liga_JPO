<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="modelo.OError"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Estás en una página de error</h1>
<%
		OError oe1 = (OError) session.getAttribute("error");
	%>
	<span style="color: red; font-size: 2em"> <%=oe1.getMensaje()%></span>
</body>
</html>