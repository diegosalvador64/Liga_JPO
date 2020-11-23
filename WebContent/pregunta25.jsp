<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 5);
	sesion.setAttribute("respuesta", 4);
%>

<div id="divformulario">
    <h2>Pregunta 5 Roma</h2>
    
    <p>Señas de identidad características de las ciudades romanas en Hispania (y en todas partes) son la construcción 
        de edificios públicos como teatros, acueductos, anfiteatros, circos, termas... ¿Qué célebre edificio romano muestra la imagen?</p><br>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Roma_5_Teatro_romano_Merida.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=2" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta5" value="1" checked/><span class="mostrarradio">El teatro de Cartago Nova (Cartagena)</span><br>
                    <input type="radio" name="pregunta5" value="2"/><span class="mostrarradio">El anfiteatro de Itálica</span><br>
                    <input type="radio" name="pregunta5" value="3"/><span class="mostrarradio">El teatro de Tarraco (Tarragona)</span><br>
                    <input type="radio" name="pregunta5" value="4"/><span class="mostrarradio">El teatro de Emerita Augusta (Mérida)</span><br>
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />