<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 5);
	sesion.setAttribute("respuesta", 4);
%>

<div id="divformulario">
	<h2>Pregunta 5 Guerra Civil (1936-1939)</h2>

	<p>La Ley de Responsabilidades Pol�ticas (LRP), fue promulgada por
		el Gobierno de Franco el 9 de febrero de 1939 y publicada en el BOE el
		d�a 13 de ese mismo mes. Con la guerra pr�cticamente ganada, el nuevo
		r�gimen "busca liquidar las culpas contra�das por quienes
		contribuyeron a forjar la subversi�n". No habr�a pues reconciliaci�n
		entre espa�oles tras la contienda fratricida. Se persegu�an conductas
		que el r�gimen consideraba subversivas pero no desde el comienzo de la
		guerra, sino de antes, y con car�cter retroactivo. �Desde qu� fecha?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Guerra_Civil_5_Ley_responsabilidades_politicas.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=5" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta5" value="1" checked/><span class="mostrarradio">14 de abril de 1931 (proclamaci�n II Rep�blica) </span><br>
                    <input type="radio" name="pregunta5" value="2"/><span class="mostrarradio">16 de febrero de 1936 (Elecciones ganadas por el Frente Popular)</span><br>
                    <input type="radio" name="pregunta5" value="3"/><span class="mostrarradio">12 de diciembre de 1930 (Sublevaci�n republicana en Jaca contra la monarqu�a de Alfonso XIII)</span><br>
                    <input type="radio" name="pregunta5" value="4"/><span class="mostrarradio">1 de octubre de 1934 (Revoluci�n de octubre de 1934)</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />