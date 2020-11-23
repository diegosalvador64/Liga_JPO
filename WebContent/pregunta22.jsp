<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 2);
	sesion.setAttribute("respuesta", 1);
%>

<div id="divformulario">
    <h2>Pregunta 2 Roma</h2>
    
    <p> Publio Cornelio Escipión, más conocido como "El Africano", se ganó el sobrenombre al vencer a los cartagineses en una 
    gran batalla que tuvo lugar en el norte de África y con la que finalizó la Segunda Guerra Púnica. ¿Cuál fue esta famosa batalla 
    en la que Aníbal fue derrotado?</p>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Roma_2_Escipion_Africano.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=2" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta2" value="1" checked/><span class="mostrarradio">Zama</span><br>
                    <input type="radio" name="pregunta2" value="2"/><span class="mostrarradio">Baecula</span><br>
                    <input type="radio" name="pregunta2" value="3"/><span class="mostrarradio">Cartago</span><br>
                    <input type="radio" name="pregunta2" value="4"/><span class="mostrarradio">Leptis Magna</span><br>
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />