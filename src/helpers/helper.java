package helpers;
/*
 * CÛdigo f·cil para cifrar y descifrar en Java ("encriptar" y "desencriptar").
 * No ha sido auditado, ni garantizo su seguridad.
 */

import java.security.MessageDigest;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class helper {
	
	//MÈtodos para encriptar y desencriptar. Al final no los uso porque el desencriptamiento de un campo
	//guardado en un campo BLOB de la tabla pass no chuta.
	public static byte[] cifra(String sinCifrar) throws Exception {
		final byte[] bytes = sinCifrar.getBytes("UTF-8");
		final Cipher aes = obtieneCipher(true);
		final byte[] cifrado = aes.doFinal(bytes);
		return cifrado;
	}

	public static String descifra(byte[] cifrado) throws Exception {
		final Cipher aes = obtieneCipher(false);
		final byte[] bytes = aes.doFinal(cifrado);
		final String sinCifrar = new String(bytes, "UTF-8");
		return sinCifrar;
	}

	private static Cipher obtieneCipher(boolean paraCifrar) throws Exception {
		final String frase = "FraseLargaConDiferentesLetrasNumerosYCaracteresEspeciales_·¡È…ÌÕÛ”˙⁄¸‹Ò—1234567890!#%$&()=%_NO_USAR_ESTA_FRASE!_";
		final MessageDigest digest = MessageDigest.getInstance("SHA");
		digest.update(frase.getBytes("UTF-8"));
		final SecretKeySpec key = new SecretKeySpec(digest.digest(), 0, 16, "AES");

		final Cipher aes = Cipher.getInstance("AES/ECB/PKCS5Padding");
		if (paraCifrar) {
			aes.init(Cipher.ENCRYPT_MODE, key);
		} else {
			aes.init(Cipher.DECRYPT_MODE, key);
		}

		return aes;
	}
}