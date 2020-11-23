package persistencia;

import java.sql.CallableStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import modelo.Clasificacion;
import modelo.Juegos;
import modelo.Pass;
import modelo.Usuarios;
import modelo.UsuariosJuegos;

public class AccesoLigaJPO extends Conexion {
	// Recoger los datos del usuario
	public Usuarios verificar(String email) throws ClassNotFoundException, SQLException {
		// Declarar variables
		String sql = "call liga_jpo.verifica(?,?,?,?,?,?);";
		CallableStatement st = null;
		Usuarios u1 = new Usuarios();
		// Abrir conexión
		abrirConexion();
		// Obtener el statement de la conexión
		st = miConexion.prepareCall(sql);
		// Asignar el parámetro de entrada a la variable del procedimiento almacenado
		st.setString(1, email);
		// Asignar los parámetros de salida a las variables del procedimiento almacenado
		st.registerOutParameter(2, Types.VARCHAR);
		st.registerOutParameter(3, Types.VARCHAR);
		st.registerOutParameter(4, Types.INTEGER);
		st.registerOutParameter(5, Types.VARCHAR);
		st.registerOutParameter(6, Types.VARCHAR);
		// Ejecutar la llamada a la BBDD
		st.execute();

		// Obtener los parámetros de salida del procedimiento almacenado y moverlos a
		// sus campos de la clase Usuario
		if (st.getString(2) == null) {
			u1.setPass(" ");
			u1.setPerfil(" ");
			u1.setId_usuario(0);
			u1.setNombre(" ");
			u1.setApellidos(" ");
		} else {
			u1.setPass(st.getString(2));
			u1.setPerfil(st.getString(3));
			u1.setId_usuario(st.getInt(4));
			u1.setNombre(st.getString(5));
			u1.setApellidos(st.getString(6));
		}

		return u1;
	}

	// Dar de alta un usuario en la tabla usuario
	public boolean altausuario(Usuarios su1) throws ClassNotFoundException, SQLException {

		CallableStatement st;
		String sql = "call liga_jpo.altausuario(?,?,?,?);";

		// abrir conexion
		abrirConexion();

		// obtener el Statement de la conexion
		st = miConexion.prepareCall(sql);
		st.setString(1, su1.getNombre());
		st.setString(2, su1.getApellidos());
		st.setString(3, su1.getPass());
		st.setString(4, su1.getEmail());

		// Ejecutar el Statement

		int registros = st.executeUpdate();

		cerrarConexion();

		return registros > 0;
	}

	// Dar de alta un usuario en la tabla usuario
	public boolean altaJpo(Juegos sju1) throws ClassNotFoundException, SQLException {

		CallableStatement st;
		String sql = "call liga_jpo.altajpo(?,?,?);";

		// abrir conexion
		abrirConexion();

		// obtener el Statement de la conexion
		st = miConexion.prepareCall(sql);
		st.setString(1, sju1.getNombre_jpo());
		st.setString(2, sju1.getTematica());
		st.setString(3, sju1.getImagen());

		// Ejecutar el Statement

		int registros = st.executeUpdate();

		cerrarConexion();

		return registros > 0;
	}
	
	// Dar de alta un usuario_jpo en la tabla usuario_jpo
		public boolean altaUsuarioJpo(UsuariosJuegos sju1) throws ClassNotFoundException, SQLException {

			CallableStatement st;
			String sql = "call liga_jpo.altausuariojpo(?,?,?,?);";

			// abrir conexion
			abrirConexion();

			// obtener el Statement de la conexion
			st = miConexion.prepareCall(sql);
			st.setInt(1, sju1.getId_usuario());
			st.setInt(2, sju1.getId_jpo());
			st.setInt(3, sju1.getNum_preguntas());
			st.setDouble(4, sju1.getTiempo());
			
			// Ejecutar el Statement

			int registros = st.executeUpdate();

			cerrarConexion();

			return registros > 0;
		}
	// Obtener juegos disponibles

	public List<Juegos> obtenerJuegosDisponibles(int pusuario) throws ClassNotFoundException, SQLException {
		// Definición de variables

		CallableStatement st;
		ResultSet rs = null;
		List<Juegos> juegos = new ArrayList<Juegos>();

		String sql = "call liga_jpo.obtenerJuegosDisponibles(?);";

		// abrir conexion
		abrirConexion();

		// obtener el Statement de la conexion
		st = miConexion.prepareCall(sql);

		// Asignar variable al procedimiento almacenado
		st.setInt(1, pusuario);

		// Ejecutar el Statement
		rs = st.executeQuery();

		// Recorrer el ResultSet
		while (rs.next()) {
			// Instanciar el juego con el constructor completo
			Juegos ju1 = new Juegos(rs.getInt("id_jpo"), rs.getString("nombre_jpo"), rs.getString("tematica"),
					rs.getString("imagen"));

			juegos.add(ju1);
		}

		// Cerrar la conexion
		cerrarConexion();
		return juegos;

	}
	
	// Obtener juegos disponibles

	public List<UsuariosJuegos> obtenerJuegosRealizados(int pusuario) throws ClassNotFoundException, SQLException {	
		// Definición de variables
					
		CallableStatement st;
		ResultSet rs = null;
		List<UsuariosJuegos> juegos = new ArrayList<UsuariosJuegos>();
					
		String sql = "call liga_jpo.obtenerJuegosRealizados(?);";

		// abrir conexion
		abrirConexion();

		// obtener el Statement de la conexion
		st = miConexion.prepareCall(sql);
					
		//Asignar variable al procedimiento almacenado
		st.setInt(1, pusuario);

		// Ejecutar el Statement
		rs = st.executeQuery();

		// Recorrer el ResultSet
		while (rs.next()) {
		// Instanciar el Usuariojuego con el constructor adecuado
		UsuariosJuegos ju1 = new UsuariosJuegos(rs.getInt("uj.num_preguntas"),
												rs.getDouble("uj.tiempo"),
												rs.getString("j.imagen"), 
												rs.getString("j.tematica")		
												);
		juegos.add(ju1);
					}

		// Cerrar la conexion
		cerrarConexion();
		return juegos;
					
		}
	// Obtener Clasificación

		public List<Clasificacion> clasificacionLiga() throws ClassNotFoundException, SQLException {	
			// Definición de variables
						
			CallableStatement st;
			ResultSet rs = null;
			List<Clasificacion> clasificacion = new ArrayList<Clasificacion>();
						
			String sql = "call liga_jpo.clasificacionLiga();";

			// abrir conexion
			abrirConexion();

			// obtener el Statement de la conexion
			st = miConexion.prepareCall(sql);
						
			//Asignar variable al procedimiento almacenado
			//No hay variable en este caso

			// Ejecutar el Statement
			rs = st.executeQuery();

			// Recorrer el ResultSet
			while (rs.next()) {
			// Instanciar el Clasificación con el constructor adecuado
			Clasificacion cla1 = new Clasificacion(rs.getString("persona"),
													rs.getInt("sumpreguntas"),
													rs.getDouble("sumtiempo") 		
													);
			clasificacion.add(cla1);
						}

			// Cerrar la conexion
			cerrarConexion();
			return clasificacion;
						
			}

	/*
	 * ******Estos métodos lo usé para obtener el campo tipo blob de la tabla Pass
	 * para probar el cifrado. aunque voy a usar en la aplicación la contraseña sin
	 * cifrar *******
	 */
	public Pass obtenerPass(int pid_usuario) throws ClassNotFoundException, SQLException {
		// Declarar variables
		abrirConexion();
		// Definir variables
		String sql = "SELECT id_usuario_pass, pass " + "FROM pass " + "WHERE id_usuario_pass = " + pid_usuario + ";";

		System.out.println("El sql de obtenerPass es " + sql);
		Pass p1 = null;
		Statement comando;
		ResultSet rs;
		// Obtener el Statement
		comando = miConexion.createStatement();
		// Recoger resultado en ResultSet
		rs = comando.executeQuery(sql);
		// 5.- Recibir los datos del resultSet. En este caso es una sola fila. Devuelve
		// false
		// cuando no haya más registros. En este caso con if
		if (rs.next()) {
			p1 = new Pass(rs.getInt("id_usuario_pass"), rs.getBytes("pass"));
		}

		// 6. Cerrar conexión
		cerrarConexion();
		return p1;
	}

	public boolean altaPass(Pass p1) throws ClassNotFoundException, SQLException {
		// 1.-Abrimos conexión
		abrirConexion();
		// 2- Definir variables
		// Los que llevan comillas simples es porque son String
		String sql = "INSERT INTO pass " + "VALUES " + "(" + p1.getId_usuario_pass() + "," + "'" + p1.getPass() + "');"; // No
																															// funciona
																															// si
																															// no
																															// le
																															// pongo
																															// comillas
																															// simples
		System.out.println("El comando sql es " + sql);
		Statement comando;
		int registros;
		// 3.-Obtener comando
		comando = miConexion.createStatement();
		// 4.- Ejecutar la sentencia
		registros = comando.executeUpdate(sql);
		// 5.- Cerrar conexión
		cerrarConexion();
		return registros > 0;// Se devuelve el número de registros, que en caso del insert es 1
	}

}
