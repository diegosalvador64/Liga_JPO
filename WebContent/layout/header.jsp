<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="modelo.OError"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>Liga de Juegos de Preguntas Online</title>
<link rel="stylesheet" type="text/css" href="estilos/styles.css" />

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
		<ul>
			<%
				OError oe1 = (OError) session.getAttribute("error");
			%>
			<li><a href="index.jsp">Inicio</a></li>
			<!-- <li><a href="index1.jsp">JPO Al Andalus</a></li>
			<li><a href="index2.jsp">JPO Roma</a></li>
			<li><a href="index3.jsp">JPO Visigodos en España</a></li>
			<li><a href="index4.jsp">JPO Edad del Hierro</a></li>
			<li><a href="index5.jsp">JPO Guerra Civil</a></li>
			<li><a href="index6.jsp">JPO Reinos cristianos medievales peninsulares</a></li>-->
		</ul>
	</nav>

	<div id="content">