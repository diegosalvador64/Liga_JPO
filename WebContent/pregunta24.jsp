<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 4);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
    <h2>Pregunta 4 Roma</h2>
    
    <p>Durante unos cuantos a�os, la ciudad celt�bera de Numancia fue un for�nculo en salva sea la parte de Roma. Hasta que enviaron 
        contra ella a su mejor general. El c�nsul Publio Cornelio Escipi�n Emiliano, que no es el mismo que derrot� a An�bal, hab�a cortado de 
        ra�z el problema cartagin�s unos a�os antes, destruyendo Cartago en el a�o 146 a.C. Escipi�n Emiliano asedi� concienzudamente Numancia y acab� con ella
        en el a�o 133 a.C. Los detalles de la matanza son de sobra conocidos. Pero, �en qu� poblaci�n soriana se encuentran los restos arqueol�gicos 
        de la Numancia romana, la poblaci�n que sustituy� a la ciudad ar�vaca?
    </p><br>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Roma_4_Numancia.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=2" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta4" value="1" checked/><span class="mostrarradio">Almaz�n</span><br>
                    <input type="radio" name="pregunta4" value="2"/><span class="mostrarradio">Garray</span><br>
                    <input type="radio" name="pregunta4" value="3"/><span class="mostrarradio">Calata�azor</span><br>
                    <input type="radio" name="pregunta4" value="4"/><span class="mostrarradio">Alfaro</span><br>
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />