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
	<h2>Al Andalus</h2>

	<h3>
		�Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- Gibraltar es el nombre del lugar donde desembarcaron los
			musulmanes para invadir la Pen�nsula Ib�rica, aprovechando las
			sempiternas trifulcas internas del reino visigodo. Gibraltar debe su
			nombre al caudillo bereber que dirig�a el primer contingente
			mahometano. �C�mo se llamaba este se�or? <strong>Tariq ibn
				Ziyad.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
				
		</li>
		<li>2.- Los primeros conquistadores musulmanes que entraron en la
			Pen�nsula fueron bereberes norteafricanos reci�n islamizados. O sea,
			que eran m�s papistas que el Papa. Hubo numerosas tribus que pasaron
			con Tariq. �Cu�l de los siguientes pueblos NO era bereber? <strong>Nota:</strong>El
			t�rmino <i>Bereber</i> procede de la adaptaci�n �rabe <i>barbr</i>
			del griego <i>b�rbaro</i>. <strong>Yemen�es.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- Los abbas�es hicieron una buena escabechina entre la
			familia de los Omeyas, que hasta entonces hab�an gobernado en Damasco
			como califas. Pero hubo un joven superviviente omeya que escap� hasta
			Al Andalus. Este afortunado desembarc� en oto�o del a�o 755 en
			Almu�ecar, y con el tiempo cre� el emirato de C�rdoba, independiente
			del Califato abbas� de Damasco. �De qui�n hablamos? <strong>Abd
				al-Rahm�n I.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- Durante el tumultuoso gobierno del cultureta emir de
			C�rdoba Abd al-Rahm�n II (822-852) tuvo lugar un hecho muy relevante.
			�Cu�l de �stos fue? <strong>El saqueo de Sevilla por los
				normandos.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- Uno de los mayores hitos de la historia del mundo
			musulm�n medieval se produjo en el a�o 929: la proclamaci�n del
			califato de C�rdoba por el emir Abd al-Rahm�n III, que pas� ahora a
			ser Califa, el Comendador de los Creyentes, la m�xima autoridad
			pol�tica y religiosa del occidente musulm�n. Se cree que este hecho
			tan relevante tuvo lugar para celebrar un importante acontecimiento.
			�Cu�l? <strong>La victoria sobre los rebeldes de Bobastro
				(M�laga).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
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