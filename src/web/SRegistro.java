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
import modelo.Pass;
import modelo.Usuarios;
import persistencia.AccesoLigaJPO;
import helpers.helper;

/**
 * Servlet implementation class SRegistro
 */
@WebServlet("/sregistro")
public class SRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SRegistro() {
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
		RequestDispatcher rd = null;
		// Recogemos los datos del formulario de login a trav�s de la tecnolog�a beans
		Usuarios su1 = (Usuarios) request.getAttribute("u1");
		
		// Creamos un objeto para acceder a la bbdd a trav�s de la capa de persistencia
		AccesoLigaJPO ac1 = new AccesoLigaJPO();

		// SE recoge la sesi�n y guardamos el campo error para luego recogerlo en la
		// p�gina index por si hubiese error. El problema es que con
		// request.Dispatcher se met�a en un bucle si hab�a error y no se llamaba a una
		// p�gina previa de error
		HttpSession se1 = request.getSession();
		OError oe1 = (OError) se1.getAttribute("error");
		List<Juegos> juegosBBDD = null;
		List<Clasificacion> clasificacion = null;
		
		Usuarios u1 = null;
		
		try {
			boolean resultado = ac1.altausuario(su1);
			
			if (resultado) {
				//Obtengo el usuario y lo guardo en sesi�n. No valido si existe, puesto que lo acabo de dar de alta
				u1 = ac1.verificar(su1.getEmail());
				se1.setAttribute("usuario", u1);
				
				//************ Prueba de cifrado de la contrase�a.  
				//Esto funciona. Lo que no funciona es el cifrado de la pass recuperada de la tabla pass
				/*Pass p1 = new Pass();
				helper h1 = new helper();
				byte[] cifrada=null;
				try {
					//1.- Cifrar la contrase�a
					cifrada = h1.cifra(u1.getPass());
					System.out.println("La contrase�a cifrada es " + cifrada);
					//2.- Guardar en la tabla pass
					p1.setId_usuario_pass(u1.getId_usuario());
					p1.setPass(cifrada);
					boolean resultado2 = ac1.altaPass(p1);
					System.out.println("El resultado de insertar en tabla pass es " + resultado2);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}*/
				//*************    Fin Prueba de cifrado de la contrase�a 
				//*************    Prueba de descifrado de la contrase�a
				//He he estado probando guardar la contrase�a cifrada en bbdd, lo he conseguido sin procedimientos
				//almacenados. Los dejo como muestra de funcionamiento. Pero cuando he obtenido el campo de la
				//contrase�a cifrada el m�todo de desciframiento da un error raro con el que me pierdo: 
				//"Input length must be multiple of 16 when decrypting with padded cipher"	
				/*
				Pass p2 = new Pass();
				String sincifrar=null;
				
				try {
					//1.- Accedemos a pass con la id_usuario_pass que hemos usado para insertar
					p2 = ac1.obtenerPass(u1.getId_usuario());
					System.out.println("La contrase�a cifrada recuperada es " + p2.getPass());
					//2.- Desciframos la pass recuperada de la tabla pass
					sincifrar = h1.descifra(p2.getPass());
					System.out.println("La contrase�a descifrada es " + sincifrar);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}*/
				//******************  Fin Prueba descifrado de la contrase�a
				//Obtener los juegos disponibles
				//Acceder de nuevo a persistencia
				juegosBBDD = ac1.obtenerJuegosDisponibles(u1.getId_usuario());
				//Guardar en el �mbito request la lista de juegosDisponibles para que lo recoja Misjuegos.jsp
				System.out.println("Lista de juegos disponibles para el usuario " + u1.getId_usuario() + ": " + juegosBBDD);
				request.setAttribute("juegosDisponibles", juegosBBDD);
				
				//Obtener la clasificaci�n
				clasificacion = ac1.clasificacionLiga();
				//Guardar en el �mbito request la clasificaci�n de la liga para que lo recoja Misjuegos.jsp
				request.setAttribute("clasificacion", clasificacion);
				
				rd = request.getRequestDispatcher("/Misjuegos.jsp");
				rd.forward(request, response);
				
				
			}else {
				oe1.setMensaje("Error en el alta de usuario");
				oe1.setOrigen("1");
				response.sendRedirect("registro.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			oe1.setMensaje("Error en el alta de usuario, posiblemente un duplicado");
			oe1.setOrigen("1");
			response.sendRedirect("registro.jsp");
		}
	}

}
