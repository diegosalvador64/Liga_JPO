package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class evaluar
 */
@WebServlet("/evaluar")
public class evaluar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public evaluar() {
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
		//Recoger el parámetro del formulario que me dice el código del JPO:
		// 1 = JPO Al Andalus
		// 2 = JPO Roma
		// 3 = JPO Visigodos en España
		// 4 = JPO Edad de Hierro en la Península Ibérica
		// 5 = JPO Guerra Civil (1936-1939)
		// 6 = JPO Reinos cristianos medievales de la Península Ibérica
		
		int jop = Integer.parseInt(request.getParameter("op"));
		//System.out.println("El código de entrada es " + jop);
		//Recoger los parámetros que vienen de la sesión (nºpregunta y respuesta)
		
		HttpSession sesion=request.getSession();
		
		int numPregunta = (int)sesion.getAttribute("numPregunta");
		int respuesta = (int)sesion.getAttribute("respuesta");
		
		//Recoger datos del formulario que se envía con método post
		int ppregunta = Integer.parseInt(request.getParameter("pregunta"+numPregunta));
		
		/*System.out.println("El número de pregunta es " + numPregunta);
		System.out.println("La respuesta es " + respuesta);
		System.out.println("La opción del formulario es " + ppregunta);*/
		
		int preguntaSiguiente = numPregunta+1;
		
		//Hacer las comprobaciones pertinentes y en función de si está bien, 
		//guardar en la sesión el OK y el KO
			
		if (ppregunta == respuesta) {
			sesion.setAttribute("resultado"+numPregunta,"OK");
		} else {
			sesion.setAttribute("resultado"+numPregunta,"KO");
		}
		
		//Redirigir a la siguiente pregunta o a la pantalla final si pasa de 10
		RequestDispatcher rd = null;
		
		if (preguntaSiguiente <=5 ) {
			//System.out.println("Pregunta siguiente es " + preguntaSiguiente);
			rd = request.getRequestDispatcher("/pregunta" + jop + preguntaSiguiente +".jsp");
		} else {
			rd = request.getRequestDispatcher("/final" + jop + ".jsp");
		}
		
		rd.forward(request, response);
				
	}

}
