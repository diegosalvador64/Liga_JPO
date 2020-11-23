package modelo;

import java.io.InputStream;
import java.io.Serializable;

public class Usuarios implements Serializable {
	
	private static final long serialVersionUID = 1L;
	//Atributos
	private int id_usuario; 
	private String nombre; 	 	
	private String apellidos;
	private String pass; 
	private String email;
	private String perfil;
	//private byte[] passcifrada;
	
	//Constructores
	public Usuarios() {
		super();
	}

	public Usuarios(int id_usuario, String nombre, String apellidos, String pass, String email, String perfil) {
		super();
		this.id_usuario = id_usuario;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.pass = pass;
		this.email = email;
		this.perfil = perfil;
	}
	
	//Getters & setters
	
	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPerfil() {
		return perfil;
	}
	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
	
}