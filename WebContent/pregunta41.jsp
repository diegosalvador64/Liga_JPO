<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 1);
	sesion.setAttribute("respuesta", 3);
%>

<div id="divformulario">
	<h2>Pregunta 1 La Edad de Hierro en la Península Ibérica</h2>

	<p>¿Contra qué general cartaginés sostuvieron el combate del Tajo
		en el año 220 a.C. los olcades, junto a los carpetanos y a los
		fugitivos de Helmantiké, que no está muy claro si eran vacceos o
		vettones?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Edad_Hierro_1_Anibal.jpg" width="100%" class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=4" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta1" value="1" checked/><span class="mostrarradio">Amílcar Barca</span><br>
                    <input type="radio" name="pregunta1" value="2"/><span class="mostrarradio">Asdrúbal el Bello</span><br>
                    <input type="radio" name="pregunta1" value="3"/><span class="mostrarradio">Aníbal Barca</span><br>
                    <input type="radio" name="pregunta1" value="4"/><span class="mostrarradio">Magón</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />