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
	<h2>Guerra Civil (1936-1939)</h2>

	<h3>
		�Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- �Qu� oficio tuvo el miliciano Enrique L�ster antes de
			mandar tropas en el ej�rcito republicano?<strong>Picapedrero.</strong>
			<%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
		</li>
		<li>2.- �Qui�n calific� de "bestia ponzo�osa y rencorosa" al
			general Mola en un peri�dico sevillano? <strong> Miguel de
				Unamuno.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- �D�nde estaba la "pasarela de la muerte" m�s famosa del
			frente de Madrid? <strong>Ciudad Universitaria.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- �Qu� era el CTV que particip� en la conquista de M�laga
			por las tropas nacionales en febrero de 1937? <strong>Corpo
				di truppe volontarie (italianos enviados por Mussolini).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- La Ley de Responsabilidades Pol�ticas (LRP), fue
			promulgada por el Gobierno de Franco el 9 de febrero de 1939 y
			publicada en el BOE el d�a 13 de ese mismo mes. Con la guerra
			pr�cticamente ganada, el nuevo r�gimen "busca liquidar las culpas
			contra�das por quienes contribuyeron a forjar la subversi�n". No
			habr�a pues reconciliaci�n entre espa�oles tras la contienda
			fratricida. Se persegu�an conductas que el r�gimen consideraba
			subversivas pero no desde el comienzo de la guerra, sino de antes, y
			con car�cter retroactivo. �Desde qu� fecha? <strong> 1 de
				octubre de 1934 (Revoluci�n de octubre de 1934).</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
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