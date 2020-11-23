<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 4);
	sesion.setAttribute("respuesta", 1);
%>

<div id="divformulario">
	<h2>Pregunta 4 La Edad de Hierro en la Península Ibérica</h2>

	<p>En esta imagen se ve un conjunto de elementos que formaban parte
		de algunos poblados de los pueblos prerromanos peninsulares de la Edad
		del Hierro. ¿Como cree que se llaman estas estructuras, que por más
		señas, eran defensivas?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Edad_Hierro_4_Piedras_Hincadas.jpg" width="100%" class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=4" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta4" value="1" checked /><span
						class="mostrarradio">Campo de piedras hincadas</span><br> 
					<input
						type="radio" name="pregunta4" value="2" /><span
						class="mostrarradio">Murallas</span><br> 
					<input type="radio"
						name="pregunta4" value="3" /><span class="mostrarradio">Piedras
						de moler cereales</span><br> 
					<input type="radio" name="pregunta4"
						value="4" /><span class="mostrarradio">Insculturas</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />