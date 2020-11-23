<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 5);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
	<h2>Pregunta 5 La Edad de Hierro en la Pen�nsula Ib�rica</h2>

	<p>La imagen se refiere al Conjunto arqueol�gico y monumental de
		Ol�rdola (Barcelona). Este lugar ha sido un enclave estrat�gico
		habitado sucesivamente por el hombre desde la Edad del Bronce hasta
		�poca medieval. De las cuatro de abajo, �nos puede decir una
		caracter�stica real asociada al asentamiento?</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Edad_Hierro_5_olerdola.jpg" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=4" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta5" value="1" checked /><span
						class="mostrarradio">El poblado convivi� m�s de medio siglo
						con una factor�a fenicia </span><br> 
					<input type="radio"
						name="pregunta5" value="2" /><span class="mostrarradio">Est�
						adaptado a la topograf�a del terreno</span><br> 
					<input type="radio"
						name="pregunta5" value="3" /><span class="mostrarradio">Fue
						conquistado por los galaicos durante la Segunda Guerra P�nica</span><br>
					<input type="radio" name="pregunta5" value="4" /><span
						class="mostrarradio">Seg�n la leyenda, aqu� descans� el rey
						tart�sico Geri�n</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />