<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 2);
	sesion.setAttribute("respuesta", 4);
%>

<div id="divformulario">
	<h2>Pregunta 2 Reinos cristianos medievales peninsulares</h2>

	<p>Los condados catalanes formaron parte durante el siglo IX del
		imperio carolingio (fundado por Carlomagno), al que aceptaron para
		librarse del control que ejercía sobre la zona el emirato de Córdoba.
		Pero como sucedía con Navarra y Aragón, lo que querían era actuar de
		forma independiente de ambos poderes. El principal condado catalán era
		Barcelona. ¿Quién fue el primer conde de Barcelona que se independizó
		de la tutela carolingia?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Reinos_cristianos_2_Wifredo.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=6" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta2" value="1" checked/><span class="mostrarradio">Thorin Escudo de Roble</span><br>
                    <input type="radio" name="pregunta2" value="2"/><span class="mostrarradio">Bera el Tiñoso</span><br>
                    <input type="radio" name="pregunta2" value="3"/><span class="mostrarradio">Suñer el Ampuriano</span><br>
                    <input type="radio" name="pregunta2" value="4"/><span class="mostrarradio">Wifredo el Velloso</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />