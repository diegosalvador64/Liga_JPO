<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 1);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
	<h2>Pregunta 1 Reinos cristianos medievales peninsulares</h2>

	<p>Para la historiografía cristiana es el punto de partida de lo
		que sus cronistas llamaron "Reconquista". Para los autores musulmanes
		no pasó de ser una escaramuza de medio pelo. Y Pelayo el personaje
		central del hecho supuestamente acaecido en el año 722. ¿A qué combate
		nos referimos?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Reinos_cristianos_1_Pelayo.jpg"
				width="100%" class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=6" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta1" value="1" checked/><span class="mostrarradio">Clavijo</span><br>
                    <input type="radio" name="pregunta1" value="2"/><span class="mostrarradio">Covadonga</span><br>
                    <input type="radio" name="pregunta1" value="3"/><span class="mostrarradio">Alarcos</span><br>
                    <input type="radio" name="pregunta1" value="4"/><span class="mostrarradio">Simancas</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />