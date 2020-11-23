<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 4);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
	<h2>Pregunta 4 Al Andalus</h2>

	<p>Durante el tumultuoso gobierno del cultureta emir de Córdoba Abd al-Rahmán
		II (822-852) tuvo lugar un hecho muy relevante. ¿Cuál de éstos fue?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Andalus_4_abderraman_ii.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=1" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta4" value="1" checked/><span
						class="mostrarradio">La revuelta del Arrabal cordobés</span><br>
					<input type="radio" name="pregunta4" value="2" /><span
						class="mostrarradio">El saqueo de Sevilla por los normandos</span><br>
					<input type="radio" name="pregunta4" value="3" /><span
						class="mostrarradio">La batalla de las Navas de Tolosa
						cerca de Bailén</span><br> <input type="radio" name="pregunta4"
						value="4" /><span class="mostrarradio">Fundación de Medina
						Azahara cerca de Córdoba</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>

<jsp:include page="layout/footer.jsp" flush="true" />