<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 2);
	sesion.setAttribute("respuesta", 1);
%>

<div id="divformulario">
	<h2>Pregunta 2 Guerra Civil (1936-1939)</h2>

	<p>¿Quién calificó de "bestia ponzoñosa y rencorosa" al general
		Mola en un periódico sevillano?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Guerra_Civil_2_Mola.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=5" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta2" value="1" checked/><span class="mostrarradio">Miguel de Unamuno</span><br>
                    <input type="radio" name="pregunta2" value="2"/><span class="mostrarradio">General Miaja</span><br>
                    <input type="radio" name="pregunta2" value="3"/><span class="mostrarradio">General Franco</span><br>
                    <input type="radio" name="pregunta2" value="4"/><span class="mostrarradio">Ramón Serrano Súñer</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />