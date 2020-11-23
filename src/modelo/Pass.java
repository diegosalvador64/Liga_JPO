package modelo;

import java.util.Arrays;

public class Pass {
	//Esta clase la uso para probar el cifrado y descifrado de contraseñas. Para ello he generado una tabla
	//con un id (que coincide con el id_usuario de la tabla usuario y una pass cifrada
	//Atributos
	private int id_usuario_pass;
	private byte[] pass;
	
	//ToString
	@Override
	public String toString() {
		return "Pass [id_usuario_pass=" + id_usuario_pass + ", pass=" + Arrays.toString(pass) + "]";
	}
	
	//Constructores
	public Pass() {
		super();
	}

	public Pass(int id_usuario_pass, byte[] pass) {
		super();
		this.id_usuario_pass = id_usuario_pass;
		this.pass = pass;
	}
	
	//Getters & setters
	public int getId_usuario_pass() {
		return id_usuario_pass;
	}

	public void setId_usuario_pass(int id_usuario_pass) {
		this.id_usuario_pass = id_usuario_pass;
	}

	public byte[] getPass() {
		return pass;
	}

	public void setPass(byte[] pass) {
		this.pass = pass;
	}
	
	
	
}
