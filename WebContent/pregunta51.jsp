<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 1);
	sesion.setAttribute("respuesta", 3);
%>

<div id="divformulario">
	<h2>Pregunta 1 Guerra Civil (1936-1939)</h2>

	<p>�Qu� oficio tuvo el miliciano Enrique L�ster antes de mandar tropas en el ej�rcito republicano?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Guerra_Civil_1_Lister.JPG" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=5" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta1" value="1" checked/><span class="mostrarradio">Alba�il</span><br>
                    <input type="radio" name="pregunta1" value="2"/><span class="mostrarradio">Le�ador</span><br>
                    <input type="radio" name="pregunta1" value="3"/><span class="mostrarradio">Picapedrero</span><br>
                    <input type="radio" name="pregunta1" value="4"/><span class="mostrarradio">Pe�n caminero</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />