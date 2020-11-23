<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%
	HttpSession sesion = request.getSession();
	sesion.setAttribute("numPregunta", 4);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
	<h2>Pregunta 4 Reinos cristianos medievales peninsulares</h2>

	<p>
		Las Cr�nicas cristianas hablan de un individuo al que denominaban <i>el
			tercer rey de Spania</i> mediado el siglo IX. Los otros dos eran nada
		menos que el emir cordob�s y el monarca asturiano. Este <i>tercer
			rey</i> lleg� a gobernar Zaragoza, Tudela, Huesca y Toledo, y era hermano
		de madre del primer rey de Pamplona I�igo Arista. �C�mo se llamaba
		este poderoso dirigente mulad�? <strong>Nota:</strong> Los mulad�es
		fueron los hispanorromanovisigodos que adoptaron la religi�n, la
		lengua y las costumbres del Islam para disfrutar de los mismos
		derechos que los musulmanes �rabes y bereberes en al-�ndalus.
	</p>
	<br>
	<div style="overflow: hidden; width: auto;">
		<div style="float: left;">
			<img src="img/Reinos_cristianos_4_Tercer_rey.JPG" width="100%"
				class="imagen1">
		</div>
		<div style="float: center;">
			<form action="evaluar?op=6" method="post">
				<div class="cajaradio">
					<input type="radio" name="pregunta4" value="1" checked/><span
                        class="mostrarradio">Muhammad ibn Abdela</span><br>
                    <input type="radio" name="pregunta4" value="2" /><span
                        class="mostrarradio">Musa ibn Musa</span><br>
                    <input type="radio" name="pregunta4" value="3" /><span
                        class="mostrarradio">Fort�n Garc�s ibn Qasi</span><br> 
                    <input type="radio" name="pregunta4" value="4" /><span 
                        class="mostrarradio">Garc�a el Malo</span><br>
				</div>
				<input type="submit" value="Responder">
			</form>
		</div>
	</div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />