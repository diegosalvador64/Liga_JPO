package modelo;

import java.util.Timer;

public class UsuariosJuegos {
	//Atributos
	private int id_usuario;
	private int id_jpo; 
    private int num_preguntas; 
    private double tiempo;
    private String imagen;
    private String tematica;
	
    //Constructores
    public UsuariosJuegos() {
		super();
	}

	public UsuariosJuegos(int id_usuario, int id_jpo, int num_preguntas, double tiempo) {
		super();
		this.id_usuario = id_usuario;
		this.id_jpo = id_jpo;
		this.num_preguntas = num_preguntas;
		this.tiempo = tiempo;
	}
	
	public UsuariosJuegos(int id_usuario, int id_jpo, int num_preguntas, double tiempo, String imagen) {
		super();
		this.id_usuario = id_usuario;
		this.id_jpo = id_jpo;
		this.num_preguntas = num_preguntas;
		this.tiempo = tiempo;
		this.imagen = imagen;
	}

	public UsuariosJuegos(int id_usuario, int id_jpo, int num_preguntas, double tiempo, String imagen,
			String tematica) {
		super();
		this.id_usuario = id_usuario;
		this.id_jpo = id_jpo;
		this.num_preguntas = num_preguntas;
		this.tiempo = tiempo;
		this.imagen = imagen;
		this.tematica = tematica;
	}
	
	public UsuariosJuegos(int num_preguntas, double tiempo, String imagen, String tematica) {
		super();
		this.num_preguntas = num_preguntas;
		this.tiempo = tiempo;
		this.imagen = imagen;
		this.tematica = tematica;
	}

	//ToString
	@Override
	public String toString() {
		return "UsuariosJuegos [id_usuario=" + id_usuario + ", id_jpo=" + id_jpo + ", num_preguntas=" + num_preguntas
				+ ", tiempo=" + tiempo + ", imagen=" + imagen + ", tematica=" + tematica + "]";
	}

	//Getters & setters
	public int getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}

	public int getId_jpo() {
		return id_jpo;
	}

	public void setId_jpo(int id_jpo) {
		this.id_jpo = id_jpo;
	}

	public int getNum_preguntas() {
		return num_preguntas;
	}

	public void setNum_preguntas(int num_preguntas) {
		this.num_preguntas = num_preguntas;
	}

	public double getTiempo() {
		return tiempo;
	}

	public void setTiempo(double tiempo) {
		this.tiempo = tiempo;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getTematica() {
		return tematica;
	}

	public void setTematica(String tematica) {
		this.tematica = tematica;
	}
	
	
    
	
	
}
