package kr.co.pokerium.common;

import java.io.IOException;
import java.security.MessageDigest;

import org.springframework.stereotype.Component;


@Component
public class SHA256Util {

	public String encryptionData(String data, String salt) throws Exception {
		
		
		MessageDigest mDigest =  MessageDigest.getInstance("SHA-256");
		
		String str = data+salt;
		
		mDigest.update(str.getBytes());
		
		byte [] encryptMsg = mDigest.digest();	// 암호화처리해서 리턴함(10진수로 리턴됨)
		
		StringBuffer hexString = new StringBuffer();
		
		for(byte b : encryptMsg) {
			hexString.append(String.format("%02X", b)); // 10진수를 16진수로 변경
		}
		
		
		return hexString.toString();
		
	}
	
}
