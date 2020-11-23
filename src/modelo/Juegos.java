package modelo;

public class Juegos {
	// Atributos
	private int id_jpo;
	private String nombre_jpo;
	private String tematica;
	private String imagen;

	//Constructores
	public Juegos() {
		super();
	}
	
	public Juegos(int id_jpo, String nombre_jpo, String tematica, String imagen) {
		super();
		this.id_jpo = id_jpo;
		this.nombre_jpo = nombre_jpo;
		this.tematica = tematica;
		this.imagen = imagen;
	}
	
	//ToString
	@Override
	public String toString() {
		return "Juegos [id_jpo=" + id_jpo + ", nombre_jpo=" + nombre_jpo + ", tematica=" + tematica + ", imagen="
				+ imagen + "]";
	}
	
	//Getters & Setters
	public int getId_jpo() {
		return id_jpo;
	}
	public void setId_jpo(int id_jpo) {
		this.id_jpo = id_jpo;
	}
	public String getNombre_jpo() {
		return nombre_jpo;
	}
	public void setNombre_jpo(String nombre_jpo) {
		this.nombre_jpo = nombre_jpo;
	}
	public String getTematica() {
		return tematica;
	}
	public void setTematica(String tematica) {
		this.tematica = tematica;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
}
