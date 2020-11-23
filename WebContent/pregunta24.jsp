<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 4);
	sesion.setAttribute("respuesta", 2);
%>

<div id="divformulario">
    <h2>Pregunta 4 Roma</h2>
    
    <p>Durante unos cuantos años, la ciudad celtíbera de Numancia fue un forúnculo en salva sea la parte de Roma. Hasta que enviaron 
        contra ella a su mejor general. El cónsul Publio Cornelio Escipión Emiliano, que no es el mismo que derrotó a Aníbal, había cortado de 
        raíz el problema cartaginés unos años antes, destruyendo Cartago en el año 146 a.C. Escipión Emiliano asedió concienzudamente Numancia y acabó con ella
        en el año 133 a.C. Los detalles de la matanza son de sobra conocidos. Pero, ¿en qué población soriana se encuentran los restos arqueológicos 
        de la Numancia romana, la población que sustituyó a la ciudad arévaca?
    </p><br>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Roma_4_Numancia.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=2" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta4" value="1" checked/><span class="mostrarradio">Almazán</span><br>
                    <input type="radio" name="pregunta4" value="2"/><span class="mostrarradio">Garray</span><br>
                    <input type="radio" name="pregunta4" value="3"/><span class="mostrarradio">Calatañazor</span><br>
                    <input type="radio" name="pregunta4" value="4"/><span class="mostrarradio">Alfaro</span><br>
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />