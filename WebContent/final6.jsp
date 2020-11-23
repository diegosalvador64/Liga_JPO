<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="helpers.Funciones"%>
<%@page import="modelo.UsuariosJuegos"%>
<%@page import="modelo.OError"%>
<%
	//Recoger los parámetros que vienen de la sesión 

	HttpSession sesion = request.getSession();

	//Crear contadores de ok y ko
	int contadorOK = 0;
	int contadorKO = 0;
	int i = 0;
	String resultado;
	//Contar resultados correctos y erróneos 
	for (i = 1; i <= 5; i++) {
		resultado = (String) sesion.getAttribute("resultado" + i);
		if (resultado == "OK") {
			contadorOK++;
		} else {
			contadorKO++;
		}
	}

	/* Recupero de sesión la fecha-hora de inicio
	*/
	LocalDateTime horaInicio = (LocalDateTime) sesion.getAttribute("fechaInicio");

	//Obtengo la fecha-hora final. Y calculo el resultado. En milisegundos es como más fiable ha salido
	LocalDateTime horaFinal = LocalDateTime.now();

	double milliseconds = ChronoUnit.MILLIS.between(horaInicio, horaFinal);
	
	//El formateo del tiempo empleado en hacer el juego lo hago en un método en helpers.Funciones.tiempoFormateado
	/*int seconds = (int) (milliseconds / 1000) % 60;
	int minutes = (int) ((milliseconds / (1000 * 60)) % 60);
	int hours = (int) ((milliseconds / (1000 * 60 * 60)) % 24);*/

	//Recuperamos el id_usuario y el id_jpo
	UsuariosJuegos uj1 = (UsuariosJuegos) sesion.getAttribute("usuariojuego");
	//Guardamos las preguntas acertadas y los milisegundos en sesión
	uj1.setNum_preguntas(contadorOK);
	uj1.setTiempo(milliseconds);
	sesion.setAttribute("usuariojuego", uj1);
%>
<div id="divformulario">
	<h2>Reinos cristianos medievales peninsulares</h2>

	<h3>
		¡Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- Para la historiografía cristiana es el punto de partida
			de lo que sus cronistas llamaron "Reconquista". Para los autores
			musulmanes no pasó de ser una escaramuza de medio pelo. Y Pelayo el
			personaje central del hecho supuestamente acaecido en el año 722. ¿A
			qué combate nos referimos? <strong>Covadonga.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
		</li>
		<li>2.- Los condados catalanes formaron parte durante el siglo IX
			del imperio carolingio (fundado por Carlomagno), al que aceptaron
			para librarse del control que ejercía sobre la zona el emirato de
			Córdoba. Pero como sucedía con Navarra y Aragón, lo que querían era
			actuar de forma independiente de ambos poderes. El principal condado
			catalán era Barcelona. ¿Quién fue el primer conde de Barcelona que se
			independizó de la tutela carolingia? <strong> Wifredo el
				Velloso.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- La antigua oposición de los pueblos del norte (cántabros,
			astures, vascones,...) a los romanos y al reino visigodo de Toledo se
			va a transformar después de la invasión musulmana en una guerra de
			religión que va a durar más que las obras del Escorial. Porque este
			largo conflicto se va a conocer como "Reconquista" desde finales del
			siglo IX. Pero, ¿quienes elaboraron la teoría de la Reconquista en la
			corte del rey asturiano Alfonso III por esos años? <strong>Los
				clérigos mozárabes que huían del emirato cordobés</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- Las Crónicas cristianas hablan de un individuo al que
			denominaban <i>el tercer rey de Spania</i> mediado el siglo IX. Los
			otros dos eran nada menos que el emir cordobés y el monarca
			asturiano. Este <i>tercer rey</i> llegó a gobernar Zaragoza, Tudela,
			Huesca y Toledo, y era hermano de madre del primer rey de Pamplona
			Iñigo Arista. ¿Cómo se llamaba este poderoso dirigente muladí? <strong>Nota:</strong>
			Los muladíes fueron los hispanorromanovisigodos que adoptaron la
			religión, la lengua y las costumbres del Islam para disfrutar de los
			mismos derechos que los musulmanes árabes y bereberes en al-Ándalus.
			<strong>Musa ibn Musa.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- A la muerte del rey leonés Ordoño II (914-924) sus hijos,
			como de costumbre, se dividen el reino. León no recobró la unidad
			hasta que Ramiro II (931-951) intentó unir a los cristianos contra el
			califa And al_Rahmán III. Incluso tuvo la "desfachatez" de derrotar
			al propio califa en la batalla de Simancas en el año 939, con lo que
			consiguió consolidar las posiciones leonesas en el valle del Duero.
			Pero sus éxitos no impidieron la sublevación del condado castellano,
			que constituía la frontera oriental del reino leonés. ¿Quién fue el
			primer conde castellano independiente, una independencia que se hizo
			efectiva a la muerte de Ramiro II, el último gran rey leonés? <strong>
				Fernán González.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
		</li>
	</ul>
	<div style="float: center;">
		<!-- Meter como parámetros en el action el nº respuestas acertadas (contadorOK) 
		y el tiempo en milisegundos (milliseconds). ¿Guardo los milisegundos en este formato en la tabla? Mejor, creo
		Y el usuario y el nº jpo en sesión. O guardarlo en la clase UsuariosJuegos, que es lo que se guardaría 
		en sesión, para usar la clase en el servlet-->
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