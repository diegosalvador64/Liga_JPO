<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 1);
	sesion.setAttribute("respuesta", 1);
%>

<div id="divformulario">
	<h2>Pregunta 1 Los visigodos en España</h2>

	<p>¿Cuál fue el último pueblo bárbaro al que derrotaron los
		visigodos en la Península ibérica, anexionando además su reino?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Visigodos_1_Leovigildo.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=3" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta1" value="1" checked /><span
						class="mostrarradio">Suevos</span><br> 
					<input type="radio"
						name="pregunta1" value="2" /><span class="mostrarradio">Vándalos</span><br>
					<input type="radio" name="pregunta1" value="3" /><span
						class="mostrarradio">Alanos</span><br> 
					<input type="radio"
						name="pregunta1" value="4" /><span class="mostrarradio">Ostrogodos</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />