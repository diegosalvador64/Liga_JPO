<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 2);
	sesion.setAttribute("respuesta", 4);
%>

<div id="divformulario">
    <h2>Pregunta 2 Los visigodos en España</h2>
    
    <p> ¿En qué batalla derrotaron los francos a los visigodos, y que significó el final del reino de Tolosa? 
    Nota: Tras la paliza sufrida, los visigodos trasladaron sus bártulos aquende los Pirineos,
    manteniendo bajo su poder en las Galias la franja mediterránea de la Septimania, más o menos la actual Provenza</p>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Visigodos_2_Vouille.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=3" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta2" value="1" checked/><span class="mostrarradio">Campos Catalaúnicos</span><br>
                    <input type="radio" name="pregunta2" value="2"/><span class="mostrarradio">Adrianópolis</span><br>
                    <input type="radio" name="pregunta2" value="3"/><span class="mostrarradio">Guadalete</span><br>
                    <input type="radio" name="pregunta2" value="4"/><span class="mostrarradio">Vouillé</span><br>  
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />