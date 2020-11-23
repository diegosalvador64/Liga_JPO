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
	<h2>La Edad de Hierro en la Pen�nsula Ib�rica</h2>

	<h3>
		�Has acertado <span class="numerogrande"><%=contadorOK%></span>
		respuestas en <span class="numerogrande"><%=Funciones.tiempoFormateado(milliseconds)%></span>!
	</h3>
	<br>
	<h3>Preguntas, respuestas correctas y resultados obtenidos</h3>
	<ul>
		<li>1.- �Contra qu� general cartagin�s sostuvieron el combate del
			Tajo en el a�o 220 a.C. los olcades, junto a los carpetanos y a los
			fugitivos de Helmantik�, que no est� muy claro si eran vacceos o
			vettones?<strong>An�bal Barca.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado1"))%>
		</li>
		<li>2.- Estamos en el yacimiento abulense de Ulaca. En este
			asentamiento podemos admirar varias estructuras gran�ticas muy
			emblem�ticas. �A qu� edificio corresponde el detalle que se muestra
			en la imagen? <strong>Santuario o altar de sacrificios.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado2"))%>
		</li>
		<li>3.- Los carpetanos eran representantes de la cultura celta en
			el centro peninsular. Pero como podemos ver en la imagen, su celtismo
			estaba matizado por ciertos elementos orientalizantes transmitidos a
			trav�s de los pueblos iberos levantinos con los que comerciaban. �Qu�
			nombre recibe el objeto encontrado en una localidad madrile�a y que
			se utilizaba para libaciones rituales? <strong>Medusa de
				Titulcia.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado3"))%>
		</li>
		<li>4.- En esta imagen se ve un conjunto de elementos que
			formaban parte de algunos poblados de los pueblos prerromanos
			peninsulares de la Edad del Hierro. �Como cree que se llaman estas
			estructuras, que por m�s se�as, eran defensivas? <strong>Campo
				de piedras hincadas.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado4"))%>
		</li>
		<li>5.- La imagen se refiere al Conjunto arqueol�gico y
			monumental de Ol�rdola (Barcelona). Este lugar ha sido un enclave
			estrat�gico habitado sucesivamente por el hombre desde la Edad del
			Bronce hasta �poca medieval. De las cuatro de abajo, �nos puede decir
			una caracter�stica real asociada al asentamiento?<strong>
				Est� adaptado a la topograf�a del terreno.</strong> <%=Funciones.resultado((String) sesion.getAttribute("resultado5"))%>
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