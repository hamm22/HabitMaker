package com.ham.habit.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {

	public static String md5(String message) {
		
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			
			byte[] bytes = message.getBytes();
			md.update(bytes); // 암호화 수행
			
			byte[] digest = md.digest();
			
			for(int i = 0; i < digest.length; i ++) {
				result += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			// 잘못된 문자열을 받았을떄
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
}
