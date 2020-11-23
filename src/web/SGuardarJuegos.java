package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Clasificacion;
import modelo.Juegos;
import modelo.OError;
import modelo.UsuariosJuegos;
import persistencia.AccesoLigaJPO;

/**
 * Servlet implementation class SGuardarJuegos
 */
@WebServlet("/sguardarjuegos")
public class SGuardarJuegos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SGuardarJuegos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Recuperar sesion
		//Recoger los par�metros que vienen de la sesi�n 

		HttpSession sesion = request.getSession();
		
		OError oe1 = (OError) sesion.getAttribute("error");
		
		RequestDispatcher rd = null;
		//Recoger de la p�gina finalX los par�metros id_jpo, id_usuario, 
		//num_preguntas acertadas y el tiempo en milisegundos
		
		UsuariosJuegos uj1 = (UsuariosJuegos) sesion.getAttribute("usuariojuego");
		
		/*System.out.println("El usuario recogido de sesi�n es " + uj1.getId_usuario());
		System.out.println("El n� jpo recogido de sesi�n es " + uj1.getId_jpo());
		System.out.println("El n� preguntas recogido de sesi�n es " + uj1.getNum_preguntas());
		System.out.println("El tiempo recogido de sesi�n es " + uj1.getTiempo());*/
		
		//Llamar a persistencia para guardar un registro en la tabla UsuariosJuegos
		
		AccesoLigaJPO ac1 = new AccesoLigaJPO();
		
		List<Juegos> juegosBBDD = null;
		List<UsuariosJuegos> juegosHechos = null;
		List<Clasificacion> clasificacion = null;
		
		try {
			boolean resultado = ac1.altaUsuarioJpo(uj1);
			if (resultado) {
				juegosBBDD = ac1.obtenerJuegosDisponibles(uj1.getId_usuario());
				//Guardar en el �mbito request la lista de juegosDisponibles para que lo recoja Misjuegos.jsp
				//System.out.println("Lista de juegos disponibles para el usuario " + uj1.getId_usuario() + ": " + juegosBBDD);
				request.setAttribute("juegosDisponibles", juegosBBDD);
				
				//Obtener los juegos ya jugados
				//Acceder de nuevo a persistencia
				juegosHechos = ac1.obtenerJuegosRealizados(uj1.getId_usuario());
				//Guardar en el �mbito request la lista de juegosjugados para que lo recoja Misjuegos.jsp
				request.setAttribute("juegosRealizados", juegosHechos);
				
				//Obtener la clasificaci�n
				clasificacion = ac1.clasificacionLiga();
				//Guardar en el �mbito request la clasificaci�n de la liga para que lo recoja Misjuegos.jsp
				request.setAttribute("clasificacion", clasificacion);
				
				//Ir a la p�gina de juegos
				oe1.setOrigen("2");//Si tiene este valor en la p�gina de index no aparecer� "Cerrar sesi�n"
				rd = request.getRequestDispatcher("/Misjuegos.jsp");
				rd.forward(request, response);
				
			} else {
				oe1.setMensaje("Error en el alta del juego "); 
				oe1.setOrigen("1");
				response.sendRedirect("final" + uj1.getId_jpo() + ".jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			
			oe1.setMensaje("Error del sistema. Int�ntelo m�s tarde ");
			oe1.setOrigen("1");
			response.sendRedirect("final" + uj1.getId_jpo() + ".jsp");
		}	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
