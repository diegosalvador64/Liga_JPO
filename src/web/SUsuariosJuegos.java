package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.OError;
import modelo.UsuariosJuegos;

/**
 * Servlet implementation class SUsuariosJuegos
 */
@WebServlet("/susuariosjuegos")
public class SUsuariosJuegos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SUsuariosJuegos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entro en el servlet susuariosjuegos");
		// Abrir sesión para guardar la variable id_jpo en la variable "usuariojuego"
		HttpSession s1 = request.getSession();

		RequestDispatcher rd = null;
		
		OError oe1 = (OError) s1.getAttribute("error");

		// Recoger los parámetros que nos pasa como parámetro el jsp Misjuegos.jsp

		String jnombrejpo = request.getParameter("nombrejpo");
		System.out.println("El índice del jpo es " + jnombrejpo);
		int jidjpo = Integer.parseInt(request.getParameter("idjpo"));
		System.out.println("El id_jpo es " + jidjpo);

		// Guardo el id_jpo. El usuario ya guardé en Misjuegos
		UsuariosJuegos uj1 = (UsuariosJuegos) s1.getAttribute("usuariojuego");
		uj1.setId_jpo(jidjpo);

		// Redirigimos a la página que queremos
		rd = request.getRequestDispatcher("/" + jnombrejpo + ".jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
