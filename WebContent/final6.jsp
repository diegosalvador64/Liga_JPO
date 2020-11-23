<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="helpers.Funciones"%>
<%@page import="modelo.UsuariosJuegos"%>
<%@page import="modelo.OError"%>
<%
	//Recoger los par�metros que vienen de la sesi�n 

	HttpSession sesion = request.getSession();

	//Crear contadores de ok y ko
	int contadorOK = 0;
	int contadorKO = 0;
	int i = 0;
	String resultado;
	//Contar resultados correctos y err�neos 
	for (i = 1; i <= 5; i++) {
		resultado = (String) sesion.getAttribute("resultado" + i);
		if (resultado == "OK") {
			contadorOK++;
		} else {
			contadorKO++;
		}
	}

	/* Recupero de sesi�n la fecha-hora de inicio
	*/
	LocalDateTime horaInicio = (LocalDateTime) sesion.getAttribute("fechaInicio");

	//Obtengo la fecha-hora final. Y calculo el resultado. En milisegundos es como m�s fiable ha salido
	LocalDateTime horaFinal = LocalDateTime.now();

	double milliseconds = ChronoUnit.MILLIS.between(horaInicio, horaFinal);
	
	//El formateo del tiempo empleado en hacer el juego lo hago en un m�todo en helpers.Funciones.tiempoFormateado
	/*int seconds = (int) (milliseconds / 1000) % 60;
	int minutes = (int) ((milliseconds / (1000 * 60)) % 60);
	int hours = (int) ((milliseconds / (1000 * 60 * 60)) % 24);*/

	//Recuperamos el id_usuario y el id_jpo
	UsuariosJuegos uj1 = (UsuariosJuegos) sesion.getAttribute("usuariojuego");
	//Guardamos las preguntas acertadas y los milisegundos en sesi�n
	uj1.setNum_preguntas(contadorOK);
	uj1.setTiempo(milliseconds);
	sesion.setAttribute("usuariojuego", uj1);
%>
<div id="divformulario">
	<h2>Reinos cristianos medievales peninsulares</h2>

	<h3>
		�Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- Para la historiograf�a cristiana es el punto de partida
			de lo que sus cronistas llamaron "Reconquista". Para los autores
			musulmanes no pas� de ser una escaramuza de medio pelo. Y Pelayo el
			personaje central del hecho supuestamente acaecido en el a�o 722. �A
			qu� combate nos referimos? <strong>Covadonga.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
		</li>
		<li>2.- Los condados catalanes formaron parte durante el siglo IX
			del imperio carolingio (fundado por Carlomagno), al que aceptaron
			para librarse del control que ejerc�a sobre la zona el emirato de
			C�rdoba. Pero como suced�a con Navarra y Arag�n, lo que quer�an era
			actuar de forma independiente de ambos poderes. El principal condado
			catal�n era Barcelona. �Qui�n fue el primer conde de Barcelona que se
			independiz� de la tutela carolingia? <strong> Wifredo el
				Velloso.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- La antigua oposici�n de los pueblos del norte (c�ntabros,
			astures, vascones,...) a los romanos y al reino visigodo de Toledo se
			va a transformar despu�s de la invasi�n musulmana en una guerra de
			religi�n que va a durar m�s que las obras del Escorial. Porque este
			largo conflicto se va a conocer como "Reconquista" desde finales del
			siglo IX. Pero, �quienes elaboraron la teor�a de la Reconquista en la
			corte del rey asturiano Alfonso III por esos a�os? <strong>Los
				cl�rigos moz�rabes que hu�an del emirato cordob�s</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- Las Cr�nicas cristianas hablan de un individuo al que
			denominaban <i>el tercer rey de Spania</i> mediado el siglo IX. Los
			otros dos eran nada menos que el emir cordob�s y el monarca
			asturiano. Este <i>tercer rey</i> lleg� a gobernar Zaragoza, Tudela,
			Huesca y Toledo, y era hermano de madre del primer rey de Pamplona
			I�igo Arista. �C�mo se llamaba este poderoso dirigente mulad�? <strong>Nota:</strong>
			Los mulad�es fueron los hispanorromanovisigodos que adoptaron la
			religi�n, la lengua y las costumbres del Islam para disfrutar de los
			mismos derechos que los musulmanes �rabes y bereberes en al-�ndalus.
			<strong>Musa ibn Musa.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- A la muerte del rey leon�s Ordo�o II (914-924) sus hijos,
			como de costumbre, se dividen el reino. Le�n no recobr� la unidad
			hasta que Ramiro II (931-951) intent� unir a los cristianos contra el
			califa And al_Rahm�n III. Incluso tuvo la "desfachatez" de derrotar
			al propio califa en la batalla de Simancas en el a�o 939, con lo que
			consigui� consolidar las posiciones leonesas en el valle del Duero.
			Pero sus �xitos no impidieron la sublevaci�n del condado castellano,
			que constitu�a la frontera oriental del reino leon�s. �Qui�n fue el
			primer conde castellano independiente, una independencia que se hizo
			efectiva a la muerte de Ramiro II, el �ltimo gran rey leon�s? <strong>
				Fern�n Gonz�lez.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
		</li>
	</ul>
	<div style="float: center;">
		<!-- Meter como par�metros en el action el n� respuestas acertadas (contadorOK) 
		y el tiempo en milisegundos (milliseconds). �Guardo los milisegundos en este formato en la tabla? Mejor, creo
		Y el usuario y el n� jpo en sesi�n. O guardarlo en la clase UsuariosJuegos, que es lo que se guardar�a 
		en sesi�n, para usar la clase en el servlet-->
		<a href="sguardarjuegos">Guardar el juego</a>
	</div>
</div>
<br>
<%
	OError oe1 = (OError) session.getAttribute("error");

	oe1.setMensaje(oe1.getMensaje());
%>
<span class=alert_red> <%=oe1.getMensaje()%></span>

<jsp:include page="layout/footer.jsp" flush="true" />