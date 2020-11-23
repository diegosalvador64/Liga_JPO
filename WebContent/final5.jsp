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
	<h2>Guerra Civil (1936-1939)</h2>

	<h3>
		¡Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- ¿Qué oficio tuvo el miliciano Enrique Líster antes de
			mandar tropas en el ejército republicano?<strong>Picapedrero.</strong>
			<%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
		</li>
		<li>2.- ¿Quién calificó de "bestia ponzoñosa y rencorosa" al
			general Mola en un periódico sevillano? <strong> Miguel de
				Unamuno.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- ¿Dónde estaba la "pasarela de la muerte" más famosa del
			frente de Madrid? <strong>Ciudad Universitaria.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- ¿Qué era el CTV que participó en la conquista de Málaga
			por las tropas nacionales en febrero de 1937? <strong>Corpo
				di truppe volontarie (italianos enviados por Mussolini).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- La Ley de Responsabilidades Políticas (LRP), fue
			promulgada por el Gobierno de Franco el 9 de febrero de 1939 y
			publicada en el BOE el día 13 de ese mismo mes. Con la guerra
			prácticamente ganada, el nuevo régimen "busca liquidar las culpas
			contraídas por quienes contribuyeron a forjar la subversión". No
			habría pues reconciliación entre españoles tras la contienda
			fratricida. Se perseguían conductas que el régimen consideraba
			subversivas pero no desde el comienzo de la guerra, sino de antes, y
			con carácter retroactivo. ¿Desde qué fecha? <strong> 1 de
				octubre de 1934 (Revolución de octubre de 1934).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
		</li>
	</ul>
	<div style="float: center;">
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