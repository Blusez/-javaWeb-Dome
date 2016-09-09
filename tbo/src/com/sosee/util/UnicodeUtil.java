package com.sosee.util;

public class UnicodeUtil {
	/**
	 * 中文转unicode
	 * 
	 * @param str
	 * @return 反回unicode编码
	 */
	public static String chinaToUnicode(String str) {
		String result = "";
		for (int i = 0; i < str.length(); i++) {
			int chr1 = (char) str.charAt(i);
			result += "\\u" + Integer.toHexString(chr1);
		}
		return result;
	}

	/**
	 * unicode转中文
	 * 
	 * @param str
	 * @return 中文
	 */
	public static void unicodeToChinese(String str) {

		for (char c : str.toCharArray())

			System.out.print(c);
	}

	public static void main(String[] args) {
		System.out.println(UnicodeUtil.chinaToUnicode("成龙"));
	}
}
