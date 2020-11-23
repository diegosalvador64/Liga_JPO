<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 5);
	sesion.setAttribute("respuesta", 4);
%>

<div id="divformulario">
	<h2>Pregunta 5 Reinos cristianos medievales peninsulares</h2>

	<p>A la muerte del rey leonés Ordoño II (914-924) sus hijos, como
		de costumbre, se dividen el reino. León no recobró la unidad hasta que
		Ramiro II (931-951) intentó unir a los cristianos contra el califa And
		al_Rahmán III. Incluso tuvo la "desfachatez" de derrotar al propio
		califa en la batalla de Simancas en el año 939, con lo que consiguió
		consolidar las posiciones leonesas en el valle del Duero. Pero sus
		éxitos no impidieron la sublevación del condado castellano, que
		constituía la frontera oriental del reino leonés. ¿Quién fue el primer
		conde castellano independiente, una independencia que se hizo efectiva
		a la muerte de Ramiro II, el último gran rey leonés?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Reinos_cristianos_5_Conde_Castilla.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=6" method="post">
				<div class="cajaradio">
						<input type="radio" name="pregunta5" value="1" checked/><span
                        class="mostrarradio">Ramiro el Monje</span><br> <input
                        type="radio" name="pregunta5" value="2" /><span
                        class="mostrarradio">Vermudo el Fuerte</span><br> <input
                        type="radio" name="pregunta5" value="3" /><span
                        class="mostrarradio">Rodrigo Díaz de Vivar</span><br>
                    <input type="radio" name="pregunta5" value="4" /><span
                        class="mostrarradio">Fernán González</span><br>
					</div>
					<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />