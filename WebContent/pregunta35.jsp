<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 5);
	sesion.setAttribute("respuesta", 4);
%>

<div id="divformulario">
    <h2>Pregunta 5 Los visigodos en Espa�a</h2>
    
    <p> �Cu�l fue el hecho m�s relevante del reinado de Suintila?</p><br>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Visigodos_5_Suintila.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=3" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta5" value="1" checked/><span class="mostrarradio">La expulsi�n de los jud�os del reino visigodo </span><br>
                    <input type="radio" name="pregunta5" value="2"/><span class="mostrarradio">Anexi�n del reino de los suevos</span><br>
                    <input type="radio" name="pregunta5" value="3"/><span class="mostrarradio">Rebeli�n del duque Argimundo y desintegraci�n temporal del reino visigodo</span><br>
                    <input type="radio" name="pregunta5" value="4"/><span class="mostrarradio">La expulsi�n definitiva de los bizantinos del sureste, unificando la Pen�nsula bajo un solo poder</span><br>  
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />