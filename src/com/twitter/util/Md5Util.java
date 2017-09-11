package com.twitter.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.applet.Main;

public class Md5Util {
	public static String getMd5(String plainText) {
		try {
			plainText = "dgdfgkpg$%^@#$@$#%@f" + plainText;
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			// 打印生成的MD5加密信息摘要
			// System.out.println(buf.toString().substring(8, 24));
			// 32位加密
			// return buf.toString();
			// 16位的加密
			return buf.toString().substring(8, 24);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
}
