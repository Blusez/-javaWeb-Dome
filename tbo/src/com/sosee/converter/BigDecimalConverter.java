package com.sosee.converter;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

/**
 * 将字符串转化为BigDecimal类型
 * @author Administrator
 *
 */
public class BigDecimalConverter extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		if (toClass == BigDecimal.class) {
			Number number;
			try {
				number = NumberFormat.getNumberInstance().parse((String) values[0]);
				return new BigDecimal(number.doubleValue());
			} catch (ParseException e) {
				return null;
			}
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map context, Object o) {
		if (o != null)
			return o.toString();
		return null;
	}
}
