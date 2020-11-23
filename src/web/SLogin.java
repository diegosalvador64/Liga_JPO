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

import modelo.Usuarios;
import modelo.UsuariosJuegos;
import persistencia.AccesoLigaJPO;

/**
 * Servlet implementation class SLogin
 */
@WebServlet("/slogin")
public class SLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SLogin() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entro en Slogin");
		RequestDispatcher rd = null;
		// Recogemos los datos del formulario de login a través de la tecnología beans
		Usuarios su1 = (Usuarios) request.getAttribute("u1");
		// Creamos un objeto para acceder a la bbdd a través de la capa de persistencia
		AccesoLigaJPO ac1 = new AccesoLigaJPO();

		// SE recoge la sesión y guardamos el campo error para luego recogerlo en la
		// página index por si hubiese error. El problema es que con
		// request.Dispatcher se metía en un bucle si había error y no se llamaba a una
		// página previa de error
		HttpSession se1 = request.getSession();
		OError oe1 = (OError) se1.getAttribute("error");
		UsuariosJuegos uj1 = (UsuariosJuegos) se1.getAttribute("usuariojuego");
		
		List<Juegos> juegosBBDD = null;
		List<UsuariosJuegos> juegosHechos = null;
		List<Clasificacion> clasificacion = null;
		
		Usuarios u1 = null;
		 
		try {
			
			u1 = ac1.verificar(su1.getEmail());
			/*System.out.println("El email del formulario es " + su1.getEmail());
			System.out.println("La contraseña del formulario es " + su1.getPass());
			System.out.println("La contraseña de BBDD es " + u1.getPass());
			System.out.println("El id_usuario recogido de BBDD es " + u1.getId_usuario());*/
			// Validar primero si existe el usuario
			if (u1.getPass().equals(" ")) {
				//System.out.println("Email incorrecto");
				oe1.setNumintentos(oe1.getNumintentos()+1);
				oe1.setMensaje("Email incorrecto. Ya ha fallado " + oe1.getNumintentos() 
				+ " veces. Debería registrarse, joven");
				response.sendRedirect("index.jsp"); //Usar solo el sendRedirect para volver al index si ha habido error
			}else {//Comprobar que la contraseña guardada en BBDD corresponde con la tecleada por el usuario en el formulario
				if (u1.getPass().equals(su1.getPass())) {//La contraseña de BBDD coincide con la del formulario
					//Guardamos el id_usuario en sesión para lo que nos pueda valer,
					se1.setAttribute("usuario", u1);
					
					//Comprobar el perfil administrador para redirigir a una u otra página
					if (u1.getPerfil().equals("admin")) {
						//ir a la página de admin
					
						rd = request.getRequestDispatcher("/Gestion.jsp");
						rd.forward(request, response);
						 
					} else {
						//Hacer todo este mogollón como método estático en helper, pero primero lo pruebo aquí
						//Obtener los juegos disponibles
						//Acceder de nuevo a persistencia
						
						juegosBBDD = ac1.obtenerJuegosDisponibles(u1.getId_usuario());
						//Guardar en el ámbito request la lista de juegosDisponibles para que lo recoja Misjuegos.jsp
						System.out.println("Lista de juegos disponibles para el usuario " + u1.getId_usuario() + ": " + juegosBBDD);
						request.setAttribute("juegosDisponibles", juegosBBDD);
						
						//Obtener los juegos ya jugados
						//Acceder de nuevo a persistencia
						juegosHechos = ac1.obtenerJuegosRealizados(u1.getId_usuario());
						//Guardar en el ámbito request la lista de juegosjugados para que lo recoja Misjuegos.jsp
						request.setAttribute("juegosRealizados", juegosHechos);
						
						//Obtener la clasificación
						clasificacion = ac1.clasificacionLiga();
						//Guardar en el ámbito request la clasificación de la liga para que lo recoja Misjuegos.jsp
						request.setAttribute("clasificacion", clasificacion);
						
						//Ir a la página de juegos
						oe1.setOrigen("2");//Si tiene este valor en la página de index no aparecerá "Cerrar sesión"
						rd = request.getRequestDispatcher("/Misjuegos.jsp");
						rd.forward(request, response);
					}
				} else {//La contraseña guardada en BBDD no corresponde con la tecleada en el formulario
					oe1.setNumintentos(oe1.getNumintentos()+1);
	                oe1.setMensaje("Contraseña errónea, este es su intento " 
					+ oe1.getNumintentos());
	               response.sendRedirect("index.jsp");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			oe1.setMensaje("Error del sistema. Inténtelo más tarde "); 
			response.sendRedirect("index.jsp");
		}
		
	}

}
