<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 1);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
    <h2>Pregunta 1 Roma</h2>
    
    <p> Mientras An�bal se las hac�a pasar canutas a los romanos en la pen�nsula it�lica, los romanos pensaron en hacer lo mismo en la 
    pen�nsula ib�rica con los cartagineses. As� que en agosto del a�o 218 a.C, Cneo Cornelio Escipi�n (s�, claro, uno de los famosos Escipiones) desembarc�
    en la costa hispana con dos legiones para dar la batalla a los hermanos de An�bal, Asdr�bal y Hann�n, que defend�an la Hispania p�nica 
    mientras su hermano se lo pasaba bomba en Italia. �En qu� lugar concreto desembarcaron los romanos?</p><br>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Roma_1_torre_escipiones.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=2" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta1" value="1" checked/><span class="mostrarradio">Emerita Augusta (M�rida)</span><br>
                    <input type="radio" name="pregunta1" value="2"/><span class="mostrarradio">Emporion (Ampurias)</span><br>
                    <input type="radio" name="pregunta1" value="3"/><span class="mostrarradio">Gadir (C�diz)</span><br>
                    <input type="radio" name="pregunta1" value="4"/><span class="mostrarradio">Tarraco (Tarragona)</span><br>
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
    </div>


</div>
<jsp:include page="layout/footer.jsp" flush="true" />
