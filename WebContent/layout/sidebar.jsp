<!-- BARRA LATERAL -->
<aside id="lateral">
     
     <%
		if (request.getParameter("email") != null) {
			//entra en este if al cargarse la página por segunda vez
			//"u1" es el nombre de una instancia de Usuario: Usuario u1 = new Usuario()
	%>
	<jsp:useBean id="u1" class="modelo.Usuarios" scope="request" />
	<jsp:setProperty property="*" name="u1" />
	<jsp:forward page="slogin"></jsp:forward>
	<%
		}
	%>  
    <div id="login" class="block_aside">
        
            <h3>Entrar a la web</h3>
            <form action="index.jsp" method="post">
                <label for="email">Email</label>
                <input type="email" name="email"/>
                <label for="password">Contraseña</label>
                <input type="password" name="password"/>
                <input type="submit" value="Enviar">
            </form>
            
    </div>
	<br>
	<a href="">Registrarse</a>
	<br>

</aside>    
<div id="central">