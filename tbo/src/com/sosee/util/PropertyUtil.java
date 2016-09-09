package com.sosee.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.Locale;
import java.util.Properties;

public class PropertyUtil {

	private Properties properties = null;
	private final String EXTENSION = ".properties";// 文件扩展名

	/**
	 * 根据传入的主文件和路径，获得完整的文件名,如message,src/
	 * 
	 * @param path
	 * @param fileName
	 * @return
	 */
	public File getFileName(String path, String fileName) {
		// 根据语言、国家简称组合生成文件名
		StringBuffer sb = new StringBuffer(fileName);

		Locale loc = Locale.getDefault();
		String language = loc.getLanguage();
		String country = loc.getCountry();

		if (language != null && !language.equals("")) {
			sb.append("_" + language);
		}
		if (country != null && !country.equals("")) {
			sb.append("_" + country);
		}

		File file = new File(path + sb.toString() + EXTENSION);

		if (!file.exists()) {
			file = new File(path + fileName + EXTENSION);
		}

		return file;
	}

	/**
	 * 把文件装载入资源流中,要求直接带路径，完整的文件名
	 * 
	 * @param fileName
	 */
	public boolean getProperties(String fileName) {
		boolean bFlag = true;
		// 资源流已申请创建完成
		if (properties != null) {
			return bFlag;
		}

		try {
			properties = new Properties();
			properties.load(new FileInputStream(fileName));
		} catch (FileNotFoundException e) {
			bFlag = false;
			e.printStackTrace();
		} catch (IOException e) {
			bFlag = false;
			e.printStackTrace();
		}

		return bFlag;
	}

	/**
	 * URL连接
	 * 
	 * @param url
	 */
	public boolean getProperties(URL url) {
		boolean bFlag = true;
		// 资源流已申请创建完成
		if (properties != null) {
			return bFlag;
		}
		try {
			properties = new Properties();
			properties.load(url.openStream());
		} catch (IOException e) {
			bFlag = false;
			e.printStackTrace();
		}

		return bFlag;
	}

	/**
	 * 把文件装载入资源流中
	 * 
	 * @param file//file
	 *            object
	 */
	public void getProperties(File file) {
		// 资源流已申请创建完成
		if (properties != null || file == null) {
			return;
		}

		try {
			properties = new Properties();
			properties.load(new FileInputStream(file));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 根据关键字得到对应值
	 */
	public String getValueByKey(String key) {
		return properties.getProperty(key);
	}

	/**
	 * 如果根据关键字没有找到值，则直接返回默认值
	 * 
	 * @param key
	 * @param defalutValue
	 * @return
	 */
	public String getValueByKey(String key, String defaultValue) {
		String str = properties.getProperty(key);
		if (str == null) {
			return defaultValue;
		}
		return str;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		PropertyUtil pu = new PropertyUtil();
		pu.getProperties(pu.getFileName("src/", "message"));
		System.out.println(pu.getValueByKey("title"));
	}

}
