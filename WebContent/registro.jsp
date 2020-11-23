<%@page import="modelo.OError"%>
<jsp:include page="layout/header.jsp" flush="false" />

<!-- BARRA LATERAL -->
<aside id="lateral">

	<%
		if (request.getParameter("email") != null & request.getParameter("pass") != null) {
			//entra en este if al cargarse la página por segunda vez
			//"u1" es el nombre de una instancia de Usuario: Usuario u1 = new Usuario()
	%>
	<jsp:useBean id="u1" class="modelo.Usuarios" scope="request" />
	<jsp:setProperty property="*" name="u1" />
	<jsp:forward page="sregistro"></jsp:forward>
	<%
		}
	%>
	<div id="login" class="block_aside">
		<h3>Registro de usuarios</h3>
	
		<form action="registro.jsp" method="post">
			<!-- Estas validaciones en nombre y apellidos permite meter letras con tilde y un nombre unido 
			por guión pero no números. Desde un carácter hasta 30 -->
			<p>Nombre</p>
			<input type="text" name="nombre" pattern="[A-Za-zñÑáéíóúÁÉÍÓÚüÜ- ]{1,30}" required>
			<p>Apellidos</p>
			<input type="text" name="apellidos" pattern="[A-Za-zñÑáéíóúÁÉÍÓÚüÜ- ]{1,30}" required>
			<p>Email</p>
			<input type="email" name="email" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" required>
			<p>Password</p>
			<input type="password" name="pass" pattern="[A-Za-z0-9!?-]{6,12}" required>
			<br> <input type="submit" value="Enviar">
		</form>
	</div>
	<%
		OError oe1 = (OError) session.getAttribute("error");
	%>
	<span class=alert_red> <%=oe1.getMensaje()%></span>

</aside>
<jsp:include page="layout/presentacion_juegos.jsp" />

<jsp:include page="layout/footer.jsp" flush="true" />