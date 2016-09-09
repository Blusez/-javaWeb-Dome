package com.sosee.exception;

public class ExcelConfigException extends Exception {
	private static final long serialVersionUID = 1L;

	public ExcelConfigException() {
		this("Excel 读取或解析错误！");
	}

	public ExcelConfigException(String message) {
		super(message);
	}

	public ExcelConfigException(Throwable cause) {
		super(cause);
	}

	public ExcelConfigException(String message, Throwable cause) {
		super(message, cause);
	}
}
