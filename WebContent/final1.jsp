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
	<h2>Al Andalus</h2>

	<h3>
		¡Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- Gibraltar es el nombre del lugar donde desembarcaron los
			musulmanes para invadir la Península Ibérica, aprovechando las
			sempiternas trifulcas internas del reino visigodo. Gibraltar debe su
			nombre al caudillo bereber que dirigía el primer contingente
			mahometano. ¿Cómo se llamaba este señor? <strong>Tariq ibn
				Ziyad.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
				
		</li>
		<li>2.- Los primeros conquistadores musulmanes que entraron en la
			Península fueron bereberes norteafricanos recién islamizados. O sea,
			que eran más papistas que el Papa. Hubo numerosas tribus que pasaron
			con Tariq. ¿Cuál de los siguientes pueblos NO era bereber? <strong>Nota:</strong>El
			término <i>Bereber</i> procede de la adaptación árabe <i>barbr</i>
			del griego <i>bárbaro</i>. <strong>Yemeníes.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- Los abbasíes hicieron una buena escabechina entre la
			familia de los Omeyas, que hasta entonces habían gobernado en Damasco
			como califas. Pero hubo un joven superviviente omeya que escapó hasta
			Al Andalus. Este afortunado desembarcó en otoño del año 755 en
			Almuñecar, y con el tiempo creó el emirato de Córdoba, independiente
			del Califato abbasí de Damasco. ¿De quién hablamos? <strong>Abd
				al-Rahmán I.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- Durante el tumultuoso gobierno del cultureta emir de
			Córdoba Abd al-Rahmán II (822-852) tuvo lugar un hecho muy relevante.
			¿Cuál de éstos fue? <strong>El saqueo de Sevilla por los
				normandos.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- Uno de los mayores hitos de la historia del mundo
			musulmán medieval se produjo en el año 929: la proclamación del
			califato de Córdoba por el emir Abd al-Rahmán III, que pasó ahora a
			ser Califa, el Comendador de los Creyentes, la máxima autoridad
			política y religiosa del occidente musulmán. Se cree que este hecho
			tan relevante tuvo lugar para celebrar un importante acontecimiento.
			¿Cuál? <strong>La victoria sobre los rebeldes de Bobastro
				(Málaga).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
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