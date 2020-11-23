<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 4);
	sesion.setAttribute("respuesta", 1);
%>

<div id="divformulario">
	<h2>Pregunta 4 Guerra Civil (1936-1939)</h2>

	<p>¿Qué era el CTV que participó en la conquista de Málaga por las
		tropas nacionales en febrero de 1937?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Guerra_Civil_4_CTV.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=5" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta4" value="1" checked/><span class="mostrarradio">Corpo di truppe volontarie (italianos enviados por Mussolini)</span><br>
                    <input type="radio" name="pregunta4" value="2"/><span class="mostrarradio">Un tabor de la Legión compuesto exclusivamente por moros mercenarios</span><br>
                    <input type="radio" name="pregunta4" value="3"/><span class="mostrarradio">Cuerpo de Ejército marroquí mandado por Juan Yagüe</span><br>
                    <input type="radio" name="pregunta4" value="4"/><span class="mostrarradio">Corp de troupes volontaires (franceses de ideología fascista)</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />