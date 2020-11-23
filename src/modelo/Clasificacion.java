package modelo;

public class Clasificacion {
	//Atributos
	private String persona;
	private int sumpreguntas;
	private double sumtiempo;
	
	//toString
	@Override
	public String toString() {
		return "Clasificacion [persona=" + persona + ", sumpreguntas=" + sumpreguntas + ", sumtiempo=" + sumtiempo
				+ "]";
	}
	//Constructores

	public Clasificacion() {
		super();
	}
	public Clasificacion(String persona, int sumpreguntas, double sumtiempo) {
		super();
		this.persona = persona;
		this.sumpreguntas = sumpreguntas;
		this.sumtiempo = sumtiempo;
	}
	//Getters & setters

	public String getPersona() {
		return persona;
	}

	public void setPersona(String persona) {
		this.persona = persona;
	}

	public int getSumpreguntas() {
		return sumpreguntas;
	}

	public void setSumpreguntas(int sumpreguntas) {
		this.sumpreguntas = sumpreguntas;
	}

	public double getSumtiempo() {
		return sumtiempo;
	}

	public void setSumtiempo(double sumtiempo) {
		this.sumtiempo = sumtiempo;
	}
	
}
