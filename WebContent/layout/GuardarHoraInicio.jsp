<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.time.LocalDateTime"%>
<%
	/*Crear el objeto sesi�n*/
	HttpSession sesion = request.getSession();

	/* Guardar la fecha-hora de inicio
	*/
	LocalDateTime localDateTime = LocalDateTime.now();

	sesion.setAttribute("fechaInicio", localDateTime);
%>