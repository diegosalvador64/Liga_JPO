package web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Juegos;
import modelo.OError;
import modelo.Usuarios;
import persistencia.AccesoLigaJPO;

/**
 * Servlet implementation class SJuegos
 */
@WebServlet("/sjuegos")
public class SJuegos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SJuegos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession se1 = request.getSession();
		OError oe1 = (OError) se1.getAttribute("error");
		
		//Recogemos del formulario de gestión los campos de la tabla jpo (juegos preguntas online)
		Juegos sju1 = (Juegos) request.getAttribute("j1");
		
		//Llamamos a persistencia para dar de alta el nuevo juego
		
		AccesoLigaJPO ac1 = new AccesoLigaJPO();
		
		try {
			boolean resultado = ac1.altaJpo(sju1);
			if (resultado) {
				
				oe1.setMensaje("Se ha dado de alta un juego de preguntas online");
				
			} else {
				
				oe1.setMensaje("Juego de preguntas online duplicado");
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			oe1.setMensaje("Error en alta de un juego de preguntas online");
			
		} finally {
			oe1.setOrigen("1");
			response.sendRedirect("Gestion.jsp");
		}
	}

}
