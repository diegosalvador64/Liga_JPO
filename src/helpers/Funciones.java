package helpers;

public class Funciones {

	//Formatear una fecha en milisegundos en horas:minutos:segundos
	public static String tiempoFormateado(double milliseconds) {
		String tiempoFormato=null;
		int seconds = (int) (milliseconds / 1000) % 60;
		int minutes = (int) ((milliseconds / (1000 * 60)) % 60);
		int hours = (int) ((milliseconds / (1000 * 60 * 60)) % 24);
		tiempoFormato = hours + " h " + minutes + " m " + seconds + " s ";
		return tiempoFormato;
	}
	//Método resultado: traduce el resultado ko o ko a un literal en los JPO
		
	public static String resultado(String resul) {
		String resul1;
		if (resul == "KO") {
			resul1 = "<span class=\"resultadoko\">Vaya, fallaste...</span>";
		} else {
			resul1 = "<span class=\"resultadook\">¡Estupendo, acertaste!</span>";
		}
		return resul1;
	}
	
	// Función destino: según el número de respuestas acertadas, redirige hacia uno
	// u otro certificado
	
	public static String destino(int resulOK) {
		String destinoX=null;
		if (resulOK <= 3) {
			destinoX = "<a href='certificado3.pdf' target='_blank' class='comenzar'>Descarga tu certificado</a>";
		} else if (resulOK > 3 && resulOK <= 8){
			destinoX = "<a href='certificado2.pdf' target='_blank' class='comenzar'>Descarga tu certificado</a>";
		} else if (resulOK > 8) {
			destinoX = "<a href='certificado1.pdf' target='_blank' class='comenzar'>Descarga tu certificado</a>";
	}
		return destinoX;
	}

}
