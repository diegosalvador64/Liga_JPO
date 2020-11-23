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
	<h2>Roma</h2>

	<h3>
		�Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- Mientras An�bal se las hac�a pasar canutas a los romanos
			en la pen�nsula it�lica, los romanos pensaron en hacer lo mismo en la
			pen�nsula ib�rica con los cartagineses. As� que en agosto del a�o 218
			a.C, Cneo Cornelio Escipi�n (s�, claro, uno de los famosos
			Escipiones) desembarc� en la costa hispana con dos legiones para dar
			la batalla a los hermanos de An�bal, Asdr�bal y Hann�n, que defend�an
			la Hispania p�nica mientras su hermano se lo pasaba bomba en Italia.
			�En qu� lugar concreto desembarcaron los romanos?<strong>Emporion
				(Ampurias).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
		</li>
		<li>2.- Publio Cornelio Escipi�n, m�s conocido como "El
			Africano", se gan� el sobrenombre al vencer a los cartagineses en una
			gran batalla que tuvo lugar en el norte de �frica y con la que
			finaliz� la Segunda Guerra P�nica. �Cu�l fue esta famosa batalla en
			la que An�bal fue derrotado? <strong>Zama.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- Viriato, que seg�n las fuentes cl�sicas fue primero
			pastor, despu�s cazador y m�s tarde bandolero lusitano, les puso las
			cosas muy dif�ciles a los romanos a mediados del siglo II a.C. Por
			ello el Senado de Roma envi� al c�nsul Quinto Servilio Cepi�n a
			v�rselas con el caudillo lusitano. Como no pod�a con �l, compr� a
			tres amigos de Viriato para que le asesinaran, lo cual hicieron. Pero
			Roma despu�s no pag� lo convenido a los traidores y neg� el triunfo a
			Cepi�n por conducta indigna. De ah� el famoso dicho "Roma no paga a
			traidores". �C�mo se llamaban los tres "amigos" de Viriato, puesto
			que con amigos as�, qui�n necesita enemigos? <strong>Audax,
				Ditalkon y Minuros.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- Durante unos cuantos a�os, la ciudad celt�bera de
			Numancia fue un for�nculo en salva sea la parte de Roma. Hasta que
			enviaron contra ella a su mejor general. El c�nsul Publio Cornelio
			Escipi�n Emiliano, que no es el mismo que derrot� a An�bal, hab�a
			cortado de ra�z el problema cartagin�s unos a�os antes, destruyendo
			Cartago en el a�o 146 a.C. Escipi�n Emiliano asedi� concienzudamente
			Numancia y acab� con ella en el a�o 133 a.C. Los detalles de la
			matanza son de sobra conocidos. Pero, �en qu� poblaci�n soriana se
			encuentran los restos arqueol�gicos de la Numancia romana, la
			poblaci�n que sustituy� a la ciudad ar�vaca? <strong>Garray.</strong>
			<%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- Se�as de identidad caracter�sticas de las ciudades
			romanas en Hispania (y en todas partes) son la construcci�n de
			edificios p�blicos como teatros, acueductos, anfiteatros, circos,
			termas... �Qu� c�lebre edificio romano muestra la imagen? <strong>El
				teatro de Emerita Augusta (M�rida).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
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