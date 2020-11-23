<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 3);
	sesion.setAttribute("respuesta", 3);
%>

<div id="divformulario">
    <h2>Pregunta 3 Los visigodos en España</h2>
    
    <p> Esta es de las facilitas. Hasta el reinado de este monarca, los visigodos 
        profesaban el cristianismo, sí, pero en su versión arriana. O sea, eran herejes. ¿Quién fue el rey
        que se convirtió al catolicismo, obligando al resto de su pueblo a hacer lo mismo?</p> <br>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Visigodos_3_Recaredo.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=3" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta3" value="1" checked/><span class="mostrarradio">Leovigildo</span><br>
                    <input type="radio" name="pregunta3" value="2"/><span class="mostrarradio">Recesvinto</span><br>
                    <input type="radio" name="pregunta3" value="3"/><span class="mostrarradio">Recaredo</span><br>
                    <input type="radio" name="pregunta3" value="4"/><span class="mostrarradio">Chindasvinto</span><br>
                 </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />