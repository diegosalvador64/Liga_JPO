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
	<h2>Los visigodos en España</h2>

	<h3>
		¡Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- ¿Cuál fue el último pueblo bárbaro al que derrotaron los
			visigodos en la Península ibérica, anexionando además su reino?<strong>Suevos.</strong>
			<%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
		</li>
		<li>2.- ¿En qué batalla derrotaron los francos a los visigodos, y
			que significó el final del reino de Tolosa? Nota: Tras la paliza
			sufrida, los visigodos trasladaron sus bártulos aquende los Pirineos,
			manteniendo bajo su poder en las Galias la franja mediterránea de la
			Septimania, más o menos la actual Provenza <strong>Vouillé.</strong>
			<%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- Esta es de las facilitas. Hasta el reinado de este
			monarca, los visigodos profesaban el cristianismo, sí, pero en su
			versión arriana. O sea, eran herejes. ¿Quién fue el rey que se
			convirtió al catolicismo, obligando al resto de su pueblo a hacer lo
			mismo? <strong>Recaredo.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- ¿Cuál fue el principal acontecimiento del reinado de
			Wamba, que gobernó entre los años 672 y 680? Nota: Wamba también es
			un municipio vallisoletano, denominado así precisamente porque Wamba
			fue elegido rey en esa localidad, por entonces llamada Gérticos <strong>Rebelión
				del duque Paulo en la Septimania o Galia Narbonense.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- ¿Cuál fue el hecho más relevante del reinado de Suintila?<strong>La
				expulsión definitiva de los bizantinos del sureste, unificando la
				Península bajo un solo poder.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
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