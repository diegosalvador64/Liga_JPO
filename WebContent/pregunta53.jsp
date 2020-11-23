<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 3);
	sesion.setAttribute("respuesta", 4);
%>

<div id="divformulario">
	<h2>Pregunta 3 Guerra Civil (1936-1939)</h2>

	<p>¿Dónde estaba la "pasarela de la muerte" más famosa del frente de Madrid?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Guerra_Civil_3_pasarela.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=5" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta3" value="1" checked/><span class="mostrarradio">Puente de Segovia</span><br>
                    <input type="radio" name="pregunta3" value="2"/><span class="mostrarradio">Puente de Toledo</span><br>
                    <input type="radio" name="pregunta3" value="3"/><span class="mostrarradio">Cerro Garavitas</span><br>
                    <input type="radio" name="pregunta3" value="4"/><span class="mostrarradio">Ciudad Universitaria</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />