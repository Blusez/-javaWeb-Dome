package com.sosee.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.Locale;

public class CommonUtil {
	/**
	 * String to Date
	 * 
	 * @param source
	 * @return
	 */
	public static Date toDate(String source) {
		try {
			if (source.length() <= 8)
				return DateFormat.getDateInstance(DateFormat.SHORT).parse(source);
			else
				return DateFormat.getDateInstance(DateFormat.DEFAULT).parse(source);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * String to datetime
	 * 
	 * @param source
	 * @return
	 */
	public static Date toDateTime(String source) {
		try {
			return DateFormat.getDateTimeInstance(DateFormat.DEFAULT, DateFormat.DEFAULT, Locale.SIMPLIFIED_CHINESE).parse(source);
		} catch (Exception e) {
			return null;
		}
	}

	public static Date toTime(String source) {
		try {
			return DateFormat.getTimeInstance(DateFormat.DEFAULT, Locale.SIMPLIFIED_CHINESE).parse(source);
		} catch (Exception e) {
			return null;
		}
	}

	public static Date getDateByString(String source) {
		if (source == null || source.length() < 1) {
			return null;
		}
		if (source.length() == 8)
			source = "20" + source;
		if (source.length() <= 10){
			return toDate(source.replaceAll("/", "-"));
		}
		return toDateTime(source.replaceAll("/", "-"));
	}

	public static BigDecimal getBigDecimalByString(String source) {
		if (source == null || source.length() < 1) {
			return null;
		}
		Number number;
		try {
			number = NumberFormat.getNumberInstance().parse(source);
			return new BigDecimal(number.doubleValue());
		} catch (ParseException e) {
			return null;
		}
	}

	public static String toDateChar(Date date) {
		return DateFormat.getDateInstance(DateFormat.DEFAULT, Locale.SIMPLIFIED_CHINESE).format(date);
	}

	public static String toDateTimeChar(Date date) {
		return DateFormat.getDateTimeInstance(DateFormat.DEFAULT, DateFormat.DEFAULT, Locale.SIMPLIFIED_CHINESE).format(date);
	}

	public static String toTimeChar(Date date) {
		return DateFormat.getTimeInstance(DateFormat.DEFAULT, Locale.SIMPLIFIED_CHINESE).format(date);
	}

	public static String getFormatString(String str, int maxLength) {
		if (str == null || str.length() < 1) {
			return "";
		}
		if (str.length() > maxLength && maxLength > 0) {
			return str.substring(0, maxLength);
		}
		return str;
	}

	public static String nullToString(String str) {
		if (str == null) {
			str = "";
		}
		return str;
	}

	public static Object getObjectByDefaultConstructor(Class classType) throws Exception {
		Constructor constructor = classType.getDeclaredConstructor(new Class[] {});
		return constructor.newInstance(new Object[] {});
	}

	public static Object getObjectByConstructor(Class classType, Object value) throws Exception {

		Constructor constructor = classType.getDeclaredConstructor(new Class[] { value.getClass() });
		return constructor.newInstance(new Object[] { value });
	}

	public static void invokeSetMethod(Object obj, String fieldName, Object value) throws Exception {
		String setMethodName = "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
		Method setMethod = obj.getClass().getDeclaredMethod(setMethodName, new Class[] { value.getClass() });
		setMethod.invoke(obj, new Object[] { value });
	}

	public static void invokeSetMethod(Object obj, String fieldName, int i, Object value) throws Exception {
		String setMethodName = "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
		Method setMethod = obj.getClass().getDeclaredMethod(setMethodName, new Class[] { Integer.class, value.getClass() });
		setMethod.invoke(obj, new Object[] { i, value });
	}

	public static Object invokeGetMethod(Object obj, String fieldName) throws Exception {
		String getMethodName = "get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
		Method getMethod = obj.getClass().getDeclaredMethod(getMethodName, new Class[] {});
		return getMethod.invoke(obj, new Object[] {});
	}

	public static Integer getIntegerByString(String source) {
		try {
			return Integer.parseInt(source);
		} catch (Exception e) {
			return null;
		}
	}

	public static String replaceAll(String source, String regex, String replacement) {
		if (source == null || source.length() < 1) {
			return "";
		}
		return source.replaceAll(regex, replacement);
	}

	public static Date toDateUSShort(String source) {
		try {
			return DateFormat.getDateInstance(DateFormat.SHORT, Locale.US).parse(source);
		} catch (Exception e) {
			return null;
		}
	}

	public static Date toDateUSShortByString(String source) {
		if (source == null || source.length() < 1) {
			return null;
		}
		return toDateUSShort(source.replaceAll("-", "/"));
	}

	public static String toStringUSShort(Date date) {
		return DateFormat.getDateInstance(DateFormat.SHORT, Locale.US).format(date);
	}

}
