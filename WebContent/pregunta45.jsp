<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 5);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
	<h2>Pregunta 5 La Edad de Hierro en la Península Ibérica</h2>

	<p>La imagen se refiere al Conjunto arqueológico y monumental de
		Olèrdola (Barcelona). Este lugar ha sido un enclave estratégico
		habitado sucesivamente por el hombre desde la Edad del Bronce hasta
		época medieval. De las cuatro de abajo, ¿nos puede decir una
		característica real asociada al asentamiento?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Edad_Hierro_5_olerdola.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=4" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta5" value="1" checked /><span
						class="mostrarradio">El poblado convivió más de medio siglo
						con una factoría fenicia </span><br> 
					<input type="radio"
						name="pregunta5" value="2" /><span class="mostrarradio">Está
						adaptado a la topografía del terreno</span><br> 
					<input type="radio"
						name="pregunta5" value="3" /><span class="mostrarradio">Fue
						conquistado por los galaicos durante la Segunda Guerra Púnica</span><br>
					<input type="radio" name="pregunta5" value="4" /><span
						class="mostrarradio">Según la leyenda, aquí descansó el rey
						tartésico Gerión</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />