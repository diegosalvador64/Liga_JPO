<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 1);
	sesion.setAttribute("respuesta", 1);
%>

<div id="divformulario">
    <h2>Pregunta 1 Al Andalus</h2>
    
    <p> Gibraltar es el nombre del lugar donde desembarcaron los musulmanes para invadir la Península
    Ibérica, aprovechando las sempiternas trifulcas internas del reino visigodo. Gibraltar debe su nombre
    al caudillo bereber que dirigía el primer contingente mahometano. ¿Cómo se llamaba este señor?</p><br>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Andalus_1_Gibraltar.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=1" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta1" value="1" checked/><span class="mostrarradio">Tariq ibn Ziyad</span><br>
                    <input type="radio" name="pregunta1" value="2" /><span class="mostrarradio">Abd al-Rahman III</span><br>
                    <input type="radio" name="pregunta1" value="3" /><span class="mostrarradio">Witiza ibn Qutiya</span><br>
                    <input type="radio" name="pregunta1" value="4" /><span class="mostrarradio">Musa ibn Nusayr</span><br>
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>


</div>
<jsp:include page="layout/footer.jsp" flush="true" />
