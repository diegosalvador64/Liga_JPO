<!-- activar el inicio de sesión -->
<%@page session="true"%>
<%@page import="modelo.OError"%>
<%@page import="modelo.Usuarios"%>
<%@page import="modelo.Juegos"%>
<%@page import="modelo.UsuariosJuegos"%>
<jsp:include page="layout/header.jsp" flush="false" />

<!-- BARRA LATERAL -->
<aside id="lateral">

	<%
	
		if (request.getParameter("email") != null) {
			//entra en este if al cargarse la página por segunda vez
			//"u1" es el nombre de una instancia de Usuario: Usuario u1 = new Usuario()
	%>
	<jsp:useBean id="u1" class="modelo.Usuarios" scope="request" />
	<jsp:setProperty property="*" name="u1" />
	<jsp:forward page="slogin"></jsp:forward>
	<%
		}
	%>
	<div id="login" class="block_aside">

		<h3>Entrar a la web</h3>
		<form action="index.jsp" method="post">
			<label for="email">Email</label> <input type="email" name="email" />
			<label for="password">Contraseña</label> <input type="password"
				name="pass" /> <input type="submit" value="Enviar">
		</form>

	</div>
	<br>
	<ul>
		<li><a href="registro.jsp">Registrarse</a></li>
	</ul>
	
	
	<!-- Limpiar en mensaje en caso de volver al inicio desde una página que ha dado un mensaje de error
	o informativo -->
	<% 				
		OError oe1 = (OError) session.getAttribute("error");
		if (oe1.getOrigen().equals("1")){
			oe1.setMensaje(oe1.getMensaje());
		}else{
			oe1.setMensaje(" ");
		}
	%>
	<span class=alert_red> <%=oe1.getMensaje()%></span>

</aside>
<jsp:include page="layout/presentacion_juegos.jsp" />

<jsp:include page="layout/footer.jsp" flush="true" />