# SHA256 Cryptographic Function

 SHA-256 is a member of the SHA-2 family of cryptographic hash functions and is considered to be one of the most secure hashing algorithms available. It produces a 256-bit hash value, which is very difficult to brute-force or crack.

	import java.security.MessageDigest;
	import java.security.NoSuchAlgorithmException;

	public class SHA256Example {

		public static void main(String[] args) throws NoSuchAlgorithmException {
			String password = "mypassword";

			// Create a MessageDigest object for the SHA-256 algorithm
			MessageDigest digest = MessageDigest.getInstance("SHA-256");

			// Update the digest with the password
			digest.update(password.getBytes());

			// Get the hash value
			byte[] hash = digest.digest();

			// Convert the hash value to a hexadecimal string
			String hexString = new String(hash);

			// Print the hash value
			System.out.println(hexString);
		}
	}
			
## MessageDigest Class in Java

 The SHA (Secure Hash Algorithm) is one of the popular cryptographic hash functions. A cryptographic hash can be used to make a signature for a text or a data file.
	
 The SHA-256 algorithm generates an almost unique, fixed-size 256-bit (32-byte) hash. This is a one-way function, so the result cannot be decrypted back to the original value.

 Currently, SHA-2 hashing is widely used, as it is considered the most secure hashing algorithm in the cryptographic arena.
	
	MessageDigest digest = MessageDigest.getInstance("SHA-256");
	byte[] encodedhash = digest.digest(
	originalString.getBytes(StandardCharsets.UTF_8));
			
 However, here we have to use a custom byte to hex converter to get the hashed value in hexadecimal:
	
	private static String bytesToHex(byte[] hash) {
		StringBuilder hexString = new StringBuilder(2 * hash.length);
		for (int i = 0; i < hash.length; i++) {
			String hex = Integer.toHexString(0xff & hash[i]);
			if(hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}
		return hexString.toString();
	}
			
 We need to be aware that the MessageDigest is not thread-safe. Consequently, we should use a new instance for every thread.
			
## Apache Commons Codecs

 Apache Commons Codecs provides a convenient DigestUtils wrapper for the MessageDigest class.

 This library began to support SHA3-256 since version 1.11, and it requires JDK 9+ as well:

	String sha3Hex = new DigestUtils("SHA3-256").digestAsHex(originalString);