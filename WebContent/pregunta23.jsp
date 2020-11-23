<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 3);
	sesion.setAttribute("respuesta", 3);
%>

<div id="divformulario">
    <h2>Pregunta 3 Roma</h2>
    
    <p> Viriato, que según las fuentes clásicas fue primero pastor, después cazador y más tarde bandolero lusitano, les puso las cosas 
    muy difíciles a los romanos a mediados del siglo II a.C. Por ello el Senado de Roma envió al cónsul Quinto Servilio Cepión a vérselas
    con el caudillo lusitano. Como no podía con él, compró a tres amigos de Viriato para que le asesinaran, lo cual hicieron. Pero Roma
    después no pagó lo convenido a los traidores y negó el triunfo a Cepión por conducta indigna. De ahí el famoso dicho "Roma no paga a 
    traidores". ¿Cómo se llamaban los tres "amigos" de Viriato, puesto que con amigos así, quién necesita enemigos?</p> <br>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Roma_3_Viriato.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=2" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta3" value="1" checked/><span class="mostrarradio">Indíbil, Mandonio y Bilistages</span><br>
                    <input type="radio" name="pregunta3" value="2"/><span class="mostrarradio">Retógenes Caraunios, Ávaros y Astolpas</span><br>
                    <input type="radio" name="pregunta3" value="3"/><span class="mostrarradio">Audax, Ditalkon y Minuros</span><br>
                    <input type="radio" name="pregunta3" value="4"/><span class="mostrarradio">El Bueno, el Feo y el Malo</span><br>
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />