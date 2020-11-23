<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 2);
	sesion.setAttribute("respuesta", 4);
%>

<div id="divformulario">
	<h2>Pregunta 2 La Edad de Hierro en la Península Ibérica</h2>

	<p>Estamos en el yacimiento abulense de Ulaca. En este asentamiento
		podemos admirar varias estructuras graníticas muy emblemáticas. ¿A qué
		edificio corresponde el detalle que se muestra en la imagen?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Edad_Hierro_2_Ulaca.jpg" width="100%" class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=4" method="post">

				<div class="cajaradio">
					<input type="radio" name="pregunta2" value="1" checked /><span
						class="mostrarradio">Escalones sacrificiales</span><br> 
					<input
						type="radio" name="pregunta2" value="2" /><span
						class="mostrarradio">Sauna ritual</span><br> 
					<input
						type="radio" name="pregunta2" value="3" /><span
						class="mostrarradio">Muralla escalonada de sacrificios</span><br>
					<input type="radio" name="pregunta2" value="4" /><span
						class="mostrarradio">Santuario o altar de sacrificios</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />