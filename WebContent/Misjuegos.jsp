<%@page import="modelo.Usuarios"%>
<%@page import="modelo.Juegos"%>
<%@page import="modelo.UsuariosJuegos"%>
<%@page import="modelo.Clasificacion"%>
<%@page import="modelo.OError"%>
<%@page import="helpers.Funciones"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="layout/header.jsp" flush="false" />

<!-- BARRA LATERAL -->
<aside id="lateral">

	
	<%
		ArrayList<Clasificacion> clasificacion = (ArrayList<Clasificacion>) request.getAttribute("clasificacion");

		if (clasificacion != null && clasificacion.size() > 0) {
	%>
	<h3>Clasificación Liga JPO</h3>
	<br>
	<table>
		<tr>
			<th class=titulo_th>Jugador</th>
			<th class=titulo_th>Nº total preguntas acertadas</th>
			<th class=titulo_th>Tiempo total de juego</th>
		</tr>
		<%
			for (Clasificacion e1 : clasificacion) {
		%>
		<tr>
			<td><%=e1.getPersona()%></td>
			<td><%=e1.getSumpreguntas()%></td>
			<td><%=Funciones.tiempoFormateado(e1.getSumtiempo())%></td>

		</tr>
		<%
			}
			}
		%>
	</table>

</aside>

<div id="central">


	<div id="div_index">
		<%
			Usuarios u = (Usuarios) session.getAttribute("usuario");
		%>
		<h1>
			¡¡¡Bienvenido!!! Estás en la página de juegos del usuario:</h1>
			
			 <h6><%=u.getNombre()%>
				<%=u.getApellidos()%></h6>
		

		<br>

		<%
			ArrayList<Juegos> juegos = (ArrayList<Juegos>) request.getAttribute("juegosDisponibles");
			UsuariosJuegos uj1 = (UsuariosJuegos) session.getAttribute("usuariojuego");
			uj1.setId_usuario(u.getId_usuario());

			if (juegos != null && juegos.size() > 0) {
		%>
		<h3>Juegos disponibles</h3>
		<table>
			<tr>
				<th></th>
				<th class=titulo_th>Juego Preguntas Online</th>
			</tr>
			<%
				for (Juegos e1 : juegos) {
			%>
			<tr>
				<td><img src="img/<%=e1.getImagen()%>" class=img_juegos></td>
				<td><a
					href="susuariosjuegos?nombrejpo=<%=e1.getNombre_jpo()%>&idjpo=<%=e1.getId_jpo()%>"><%=e1.getTematica()%></a></td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<br>

		<%
			ArrayList<UsuariosJuegos> juegoshechos = (ArrayList<UsuariosJuegos>) request.getAttribute("juegosRealizados");

			if (juegoshechos != null && juegoshechos.size() > 0) {
		%>
		<h3>Juegos realizados</h3>
		<table>
			<tr>
				<th></th>
				<th class=titulo_th>Juego Preguntas Online</th>
				<th class=titulo_th>Nº preguntas acertadas</th>
				<th class=titulo_th>Tiempo en realizarse</th>
			</tr>
			<%
				for (UsuariosJuegos e1 : juegoshechos) {
			%>
			<tr>
				<td><img src="img/<%=e1.getImagen()%>" class=img_juegos2></td>
				<td><%=e1.getTematica()%></td>
				<td><%=e1.getNum_preguntas()%></td>
				<td><%=Funciones.tiempoFormateado(e1.getTiempo())%></td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<br>

	</div>
</div>

<jsp:include page="layout/footer.jsp" flush="true" />