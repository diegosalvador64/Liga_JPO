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
	<h2>Los visigodos en Espa�a</h2>

	<h3>
		�Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- �Cu�l fue el �ltimo pueblo b�rbaro al que derrotaron los
			visigodos en la Pen�nsula ib�rica, anexionando adem�s su reino?<strong>Suevos.</strong>
			<%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
		</li>
		<li>2.- �En qu� batalla derrotaron los francos a los visigodos, y
			que signific� el final del reino de Tolosa? Nota: Tras la paliza
			sufrida, los visigodos trasladaron sus b�rtulos aquende los Pirineos,
			manteniendo bajo su poder en las Galias la franja mediterr�nea de la
			Septimania, m�s o menos la actual Provenza <strong>Vouill�.</strong>
			<%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- Esta es de las facilitas. Hasta el reinado de este
			monarca, los visigodos profesaban el cristianismo, s�, pero en su
			versi�n arriana. O sea, eran herejes. �Qui�n fue el rey que se
			convirti� al catolicismo, obligando al resto de su pueblo a hacer lo
			mismo? <strong>Recaredo.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- �Cu�l fue el principal acontecimiento del reinado de
			Wamba, que gobern� entre los a�os 672 y 680? Nota: Wamba tambi�n es
			un municipio vallisoletano, denominado as� precisamente porque Wamba
			fue elegido rey en esa localidad, por entonces llamada G�rticos <strong>Rebeli�n
				del duque Paulo en la Septimania o Galia Narbonense.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- �Cu�l fue el hecho m�s relevante del reinado de Suintila?<strong>La
				expulsi�n definitiva de los bizantinos del sureste, unificando la
				Pen�nsula bajo un solo poder.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
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