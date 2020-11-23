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
		librarse del control que ejerc�a sobre la zona el emirato de C�rdoba.
		Pero como suced�a con Navarra y Arag�n, lo que quer�an era actuar de
		forma independiente de ambos poderes. El principal condado catal�n era
		Barcelona. �Qui�n fue el primer conde de Barcelona que se independiz�
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
                    <input type="radio" name="pregunta2" value="2"/><span class="mostrarradio">Bera el Ti�oso</span><br>
                    <input type="radio" name="pregunta2" value="3"/><span class="mostrarradio">Su�er el Ampuriano</span><br>
                    <input type="radio" name="pregunta2" value="4"/><span class="mostrarradio">Wifredo el Velloso</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />