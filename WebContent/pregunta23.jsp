<jsp:include page="layout/cabecera_juegos.jsp" flush="false" />
<%@page import="web.evaluar"%>

<%HttpSession sesion=request.getSession();
	sesion.setAttribute("numPregunta", 3);
	sesion.setAttribute("respuesta", 3);
%>

<div id="divformulario">
    <h2>Pregunta 3 Roma</h2>
    
    <p> Viriato, que seg�n las fuentes cl�sicas fue primero pastor, despu�s cazador y m�s tarde bandolero lusitano, les puso las cosas 
    muy dif�ciles a los romanos a mediados del siglo II a.C. Por ello el Senado de Roma envi� al c�nsul Quinto Servilio Cepi�n a v�rselas
    con el caudillo lusitano. Como no pod�a con �l, compr� a tres amigos de Viriato para que le asesinaran, lo cual hicieron. Pero Roma
    despu�s no pag� lo convenido a los traidores y neg� el triunfo a Cepi�n por conducta indigna. De ah� el famoso dicho "Roma no paga a 
    traidores". �C�mo se llamaban los tres "amigos" de Viriato, puesto que con amigos as�, qui�n necesita enemigos?</p> <br>
    <div style="overflow: hidden; width: auto;">
        <div style="float: left;">
            <img src="img/Roma_3_Viriato.jpg" width="100%" class="imagen1">
        </div> 
        <div style="float: center;">
            <form action="evaluar?op=2" method="post">
                <div class="cajaradio">
                    <input type="radio" name="pregunta3" value="1" checked/><span class="mostrarradio">Ind�bil, Mandonio y Bilistages</span><br>
                    <input type="radio" name="pregunta3" value="2"/><span class="mostrarradio">Ret�genes Caraunios, �varos y Astolpas</span><br>
                    <input type="radio" name="pregunta3" value="3"/><span class="mostrarradio">Audax, Ditalkon y Minuros</span><br>
                    <input type="radio" name="pregunta3" value="4"/><span class="mostrarradio">El Bueno, el Feo y el Malo</span><br>
                </div>
                <input type="submit" value="Responder">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true" />