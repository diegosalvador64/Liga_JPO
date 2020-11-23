package modelo;

public class OError {
	//atributos
	private int numintentos;
	private String mensaje;
	private String origen;
	
	//Constructores
	public OError() {
		super();
	}
	public OError(int numintentos, String mensaje) {
		super();
		this.numintentos = numintentos;
		this.mensaje = mensaje;
	}
	
	public OError(int numintentos, String mensaje, String origen) {
		super();
		this.numintentos = numintentos;
		this.mensaje = mensaje;
		this.origen = origen;
	}
	@Override
	public String toString() {
		return "OError [numintentos=" + numintentos + ", mensaje=" + mensaje + ", origen=" + origen + "]";
	}
	
	//Getters & Setters
	public int getNumintentos() {
		return numintentos;
	}
	public void setNumintentos(int numintentos) {
		this.numintentos = numintentos;
	}
	public String getMensaje() {
		return mensaje;
	}
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	public String getOrigen() {
		return origen;
	}
	public void setOrigen(String origen) {
		this.origen = origen;
	}
	
	
	
	
}
