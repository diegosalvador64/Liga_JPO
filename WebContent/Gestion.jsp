<%@page import="modelo.Usuarios"%>
<%@page import="modelo.Juegos"%>
<%@page import="modelo.OError"%>
<jsp:include page="layout/header.jsp" flush="false" />
<!-- BARRA LATERAL -->
<aside id="lateral">
	<%
		if (request.getParameter("nombre_jpo") != null) {
			//entra en este if al cargarse la página por segunda vez
			//"u1" es el nombre de una instancia de Usuario: Usuario u1 = new Usuario()
	%>
	<jsp:useBean id="j1" class="modelo.Juegos" scope="request" />
	<jsp:setProperty property="*" name="j1" />
	<jsp:forward page="sjuegos"></jsp:forward>
	<%
		}
	%>
	
	<div id="login" class="block_aside">
		<%
			Usuarios u1 = (Usuarios) session.getAttribute("usuario");
		%>
		<h3>Página de gestión para el administrador</h3>
		<br>
			<h3><%=u1.getNombre()%>
			<%=u1.getApellidos()%></h3>
			<br>
			<form action="Gestion.jsp" method="post">
			
			<p>Página de entrada en el JPO</p><br>
			<input type="text" name="nombre_jpo"required><br>
			<p>Temática del JPO</p><br>
			<input type="text" name="tematica"required><br>
			<p>Imagen</p><br>
			<input type="file" name="imagen" required><br>
			
			
			<br> <input type="submit" value="Enviar">
		</form>
		
	</div>
	
	<%
		OError oe2 = (OError) session.getAttribute("error");
	%>
	<span class=alert_red> <%=oe2.getMensaje()%></span>

</aside>

<jsp:include page="layout/presentacion_juegos.jsp" />
<jsp:include page="layout/footer.jsp" flush="true" />