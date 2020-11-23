<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 3);
	sesion.setAttribute("respuesta", 1);
%>

<div id="divformulario">
	<h2>Pregunta 3 Reinos cristianos medievales peninsulares</h2>

	<p>La antigua oposición de los pueblos del norte (cántabros,
		astures, vascones,...) a los romanos y al reino visigodo de Toledo se
		va a transformar después de la invasión musulmana en una guerra de
		religión que va a durar más que las obras del Escorial. Porque este
		largo conflicto se va a conocer como "Reconquista" desde finales del
		siglo IX. Pero, ¿quienes elaboraron la teoría de la Reconquista en la
		corte del rey asturiano Alfonso III por esos años?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Reinos_cristianos_3_Reconquista.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=6" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta3" value="1" checked/><span class="mostrarradio">Los clérigos mozárabes que huían del emirato cordobés</span><br>
                    <input type="radio" name="pregunta3" value="2"/><span class="mostrarradio">Los cronistas carolingios</span><br>
                    <input type="radio" name="pregunta3" value="3"/><span class="mostrarradio">Los cronistas musulmanes de Córdoba</span><br>
                    <input type="radio" name="pregunta3" value="4"/><span class="mostrarradio">Los juglares que compusieron los cantares de gesta castellanos</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />