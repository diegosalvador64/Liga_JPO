package web;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import modelo.Clasificacion;
import modelo.OError;
import modelo.UsuariosJuegos;

/**
 * Application Lifecycle Listener implementation class EscuchadorSesion
 *
 */
@WebListener
public class EscuchadorSesion implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public EscuchadorSesion() {
        // TODO Auto-generated constructor stub
    	
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	//Inicializar la sesión
    	HttpSession h1 = se.getSession();
    	
    	//Crear varios objetos de error
    	OError e1 = new OError(0, " ", " ");
    	h1.setAttribute("error", e1);
    	
    	//Crear un objeto usuario. Lo creo simplemente en blanco
    	
    	h1.setAttribute("usuario", " ");
    	
    	//Crear un objeto UsuarioJuego para guardar el id_usuario y el id_jeugo para no propagarlo a lo largo de 
    	//las páginas del JPO
    	
    	UsuariosJuegos uj1 = new UsuariosJuegos(0,0,0,0);
    	h1.setAttribute("usuariojuego", uj1);
    	
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}
