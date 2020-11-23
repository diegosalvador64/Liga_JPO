<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="modelo.OError"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>Liga de Juegos de Preguntas Online</title>
<link rel="stylesheet" type="text/css" href="estilos/styles.css" />
<link rel="stylesheet" type="text/css" href="estilos/estilos_juegos.css" />

</head>
<body>
	<!-- CABECERA -->
	<header id="header">
		<div id="logo">
			<img src="img/RcH_Logo_Color Horizontal_Web.png" alt="logo" /> <a
				href="">Liga de Juegos de Preguntas Online</a>
		</div>
	</header>
	<!-- MENÚ -->

	<nav id="menu">
		<ul><%
				OError oe1 = (OError) session.getAttribute("error");
			%>
			<li><a href="index.jsp">Inicio</a></li>
			<!--<li><a href="">Clasificación</a></li>-->
			
		</ul>
	</nav>

	<div id="content">