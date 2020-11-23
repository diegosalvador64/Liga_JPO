<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 4);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
	<h2>Pregunta 4 Los visigodos en Espa�a</h2>

	<p>�Cu�l fue el principal acontecimiento del reinado de Wamba, que
		gobern� entre los a�os 672 y 680? Nota: Wamba tambi�n es un municipio
		vallisoletano, denominado as� precisamente porque Wamba fue elegido
		rey en esa localidad, por entonces llamada G�rticos</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Visigodos_4_Wamba.jpg" width="100%" class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=3" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta4" value="1" checked /><span
						class="mostrarradio">Promulgaci�n del Fuero Juzgo</span><br>
					<input type="radio" name="pregunta4" value="2" /><span
						class="mostrarradio">Rebeli�n del duque Paulo en la
						Septimania o Galia Narbonense</span><br> <input type="radio"
						name="pregunta4" value="3" /><span class="mostrarradio">Rebeli�n
						de Hermenegildo, con epicentro en Sevilla</span><br> <input
						type="radio" name="pregunta4" value="4" /><span
						class="mostrarradio">Conversi�n de los visigodos al
						cristianismo en su versi�n arriana</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />