<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 3);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
	<h2>Pregunta 3 La Edad de Hierro en la Península Ibérica</h2>

	<p>Los carpetanos eran representantes de la cultura celta en el
		centro peninsular. Pero como podemos ver en la imagen, su celtismo
		estaba matizado por ciertos elementos orientalizantes transmitidos a
		través de los pueblos iberos levantinos con los que comerciaban. ¿Qué
		nombre recibe el objeto encontrado en una localidad madrileña y que se
		utilizaba para libaciones rituales?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Edad_Hierro_3_carpetanos.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=4" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta3" value="1" checked /><span
						class="mostrarradio">Plato de Sieteiglesias</span><br> <input
						type="radio" name="pregunta3" value="2" /><span
						class="mostrarradio">Medusa de Titulcia</span><br> <input
						type="radio" name="pregunta3" value="3" /><span
						class="mostrarradio">Patera de Orusco</span><br> <input
						type="radio" name="pregunta3" value="4" /><span
						class="mostrarradio">Piedra escrita de Cenicientos</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />