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
	<h2>Roma</h2>

	<h3>
		¡Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- Mientras Aníbal se las hacía pasar canutas a los romanos
			en la península itálica, los romanos pensaron en hacer lo mismo en la
			península ibérica con los cartagineses. Así que en agosto del año 218
			a.C, Cneo Cornelio Escipión (sí, claro, uno de los famosos
			Escipiones) desembarcó en la costa hispana con dos legiones para dar
			la batalla a los hermanos de Aníbal, Asdrúbal y Hannón, que defendían
			la Hispania púnica mientras su hermano se lo pasaba bomba en Italia.
			¿En qué lugar concreto desembarcaron los romanos?<strong>Emporion
				(Ampurias).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
		</li>
		<li>2.- Publio Cornelio Escipión, más conocido como "El
			Africano", se ganó el sobrenombre al vencer a los cartagineses en una
			gran batalla que tuvo lugar en el norte de África y con la que
			finalizó la Segunda Guerra Púnica. ¿Cuál fue esta famosa batalla en
			la que Aníbal fue derrotado? <strong>Zama.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- Viriato, que según las fuentes clásicas fue primero
			pastor, después cazador y más tarde bandolero lusitano, les puso las
			cosas muy difíciles a los romanos a mediados del siglo II a.C. Por
			ello el Senado de Roma envió al cónsul Quinto Servilio Cepión a
			vérselas con el caudillo lusitano. Como no podía con él, compró a
			tres amigos de Viriato para que le asesinaran, lo cual hicieron. Pero
			Roma después no pagó lo convenido a los traidores y negó el triunfo a
			Cepión por conducta indigna. De ahí el famoso dicho "Roma no paga a
			traidores". ¿Cómo se llamaban los tres "amigos" de Viriato, puesto
			que con amigos así, quién necesita enemigos? <strong>Audax,
				Ditalkon y Minuros.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- Durante unos cuantos años, la ciudad celtíbera de
			Numancia fue un forúnculo en salva sea la parte de Roma. Hasta que
			enviaron contra ella a su mejor general. El cónsul Publio Cornelio
			Escipión Emiliano, que no es el mismo que derrotó a Aníbal, había
			cortado de raíz el problema cartaginés unos años antes, destruyendo
			Cartago en el año 146 a.C. Escipión Emiliano asedió concienzudamente
			Numancia y acabó con ella en el año 133 a.C. Los detalles de la
			matanza son de sobra conocidos. Pero, ¿en qué población soriana se
			encuentran los restos arqueológicos de la Numancia romana, la
			población que sustituyó a la ciudad arévaca? <strong>Garray.</strong>
			<%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- Señas de identidad características de las ciudades
			romanas en Hispania (y en todas partes) son la construcción de
			edificios públicos como teatros, acueductos, anfiteatros, circos,
			termas... ¿Qué célebre edificio romano muestra la imagen? <strong>El
				teatro de Emerita Augusta (Mérida).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
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