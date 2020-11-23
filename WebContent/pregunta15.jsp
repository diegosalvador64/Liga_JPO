<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 5);
	sesion.setAttribute("respuesta", 4);
%>

<div id="divformulario">
	<h2>Pregunta 5 Al Andalus</h2>

	<p>Uno de los mayores hitos de la historia del mundo musulmán
		medieval se produjo en el año 929: la proclamación del califato de
		Córdoba por el emir Abd al-Rahmán III, que pasó ahora a ser Califa, el
		Comendador de los Creyentes, la máxima autoridad política y religiosa
		del occidente musulmán. Se cree que este hecho tan relevante tuvo
		lugar para celebrar un importante acontecimiento. ¿Cuál?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Andalus_5_abd_al_rahman_iii.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=1" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta5" value="1" checked/><span
						class="mostrarradio">La fundación de Murcia</span><br> <input
						type="radio" name="pregunta5" value="2" /><span
						class="mostrarradio">La batalla de Covadonga</span><br> <input
						type="radio" name="pregunta5" value="3" /><span
						class="mostrarradio">El saqueo de Santiago de Compostela</span><br>
					<input type="radio" name="pregunta5" value="4" /><span
						class="mostrarradio">La victoria sobre los rebeldes de
						Bobastro (Málaga)</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>

<jsp:include page="layout/footer.jsp" flush="true" />