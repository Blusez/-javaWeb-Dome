package com.sosee.excel;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import jxl.Sheet;
import jxl.Workbook;
import ognl.OgnlOps;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sosee.exception.ExcelConfigException;
import com.sosee.util.CommonUtil;
import com.sosee.util.StringUtils;

public class ExcelParse {
	private static final Log log = LogFactory.getLog(ExcelParse.class);

	private File excelFile; // Excel�ļ�

	private String mappingFileName;// ӳ���ļ���

	public ExcelParse() {
	}

	public ExcelParse(File excelFile, String mappingFileName) {
		this.excelFile = excelFile;
		this.mappingFileName = mappingFileName;
	}

	public File getExcelFile() {
		return excelFile;
	}

	public void setExcelFile(File excelFile) {
		this.excelFile = excelFile;
	}

	public String getMappingFileName() {
		return mappingFileName;
	}

	public void setMappingFileName(String mappingFileName) {
		this.mappingFileName = mappingFileName;
	}

	/**
	 * ����EXCEL������Ϣ������EXCEL�ļ�,����EXCEL���ݴ���List��
	 * 
	 * @return List EXCEL����
	 * 
	 * @throws ExcelConfigException
	 *             EXCEL�ļ��޷������쳣
	 */
	public List<Object> load() throws ExcelConfigException {
		ExcelMappingConfig excelMappingConfig;
		try {
			excelMappingConfig = new ExcelMappingConfig(mappingFileName);
		} catch (ExcelConfigException e) {
			throw new ExcelConfigException(e.getMessage());
		}
		Workbook workbook;
		try {
			workbook = Workbook.getWorkbook(excelFile); // ��EXCEL�ļ�
		} catch (Exception e) {
			throw new ExcelConfigException(excelFile.getName() + "������ȷ��EXCEL�ļ��������޷�����!");
		}
		List<Object> excelContent = new ArrayList<Object>();
		int sheetNum = workbook.getNumberOfSheets();
		for (int i = 0; i < sheetNum; i++) {
			Sheet sheet = workbook.getSheet(i); // �õ������
			String sheetName = sheet.getName();
			if (sheetName.equals(excelMappingConfig.getLabel())) {
				List<Object> list = getExcelContentList(sheet, excelMappingConfig, sheetName);
				if (list.size() > 0) {
					excelContent.addAll(list);
				}
			}
		}
		return excelContent;
	}

	/**
	 * ����EXCEL�ļ�,����EXCEL���ݴ���List��
	 * 
	 * @param sheet
	 *            EXCEL�����
	 * @param excelMappingConfig
	 *            EXCELӳ������
	 * @param sheetName
	 *            ��ǩ���
	 * 
	 * @return List EXCEL����
	 * 
	 * @throws ExcelConfigException
	 *             EXCEL�����ļ��쳣
	 */
	@SuppressWarnings("rawtypes")
	private List<Object> getExcelContentList(Sheet sheet, ExcelMappingConfig excelMappingConfig, String sheetName) throws ExcelConfigException {
		String className = excelMappingConfig.getClassName();
		Class classType;
		try {
			classType = Class.forName(className);
		} catch (Exception e) {
			throw new ExcelConfigException(e.getMessage());
		}
		int rowNum = sheet.getRows(); // �õ�EXCEL�ļ�������
		Map<String, String> data = excelMappingConfig.getData();
		int begin = Integer.parseInt(data.get("begin"));
		int end = rowNum;
		if (data.get("end") != null) {
			end = Integer.parseInt(data.get("end")) + 1;
		}
		end = end > rowNum ? rowNum : end;
		if (begin > end) {
			return new ArrayList<Object>();
			// throw new
			// ExcelConfigException("EXCEL�ļ���Ҫ�������ݵ���ʼ�в��ܴ��ڽ�����!");
		}
		List<Map<String, String>> cells = excelMappingConfig.getCells();
		List<Object> excelContentList = new ArrayList<Object>();
		for (int row = begin; row < end; row++) {
			Object obj = null;
			try {
				obj = CommonUtil.getObjectByDefaultConstructor(classType);
			} catch (Exception e) {
				throw new ExcelConfigException(e.getMessage());
			}
			 
			// if (label != null && label.length() > 0) {
			// try {
			// CommonUtil.invokeSetMethod(obj, label, sheetName);
			// } catch (Exception e) {
			// if (log.isErrorEnabled()) {
			// log.error("���÷��������:" + e.getMessage());
			// }
			// }
			// }
			boolean blnBreak = false;
			for (Map<String, String> cell : cells) {
				
				String content = CommonUtil.nullToString(sheet.getCell(Integer.parseInt(cell.get("column")), row).getContents());
				content = content == null ? "" : content.trim();
				if (StringUtils.isEmptyString(content)&&"caseNumber".equals(cell.get("field")))
				{
					blnBreak = true;
					break;
				}
				String maxLength = cell.get("maxLength");
				if (maxLength != null) {
					content = CommonUtil.getFormatString(content, Integer.parseInt(maxLength));
				}
				try {
					String type = cell.get("type");
					if (type != null) {
						Object value = null;
						if (type.toUpperCase().indexOf("DATE") != -1 || type.toUpperCase().indexOf("TIME") != -1)
							value = CommonUtil.getDateByString(content);
						else if (type.toUpperCase().indexOf("BIGDECIMAL") != -1 )
							value = CommonUtil.getBigDecimalByString(content);
						else
							value = OgnlOps.convertValue(content, Class.forName(type));
						CommonUtil.invokeSetMethod(obj, cell.get("field"), value);
					} else
						CommonUtil.invokeSetMethod(obj, cell.get("field"), content);
				} catch (Exception e) {
					e.printStackTrace();
					if (log.isErrorEnabled()) {
						log.error("���÷��������:" + e.getMessage());
					}
				}
			}
			if (!blnBreak)
				excelContentList.add(obj);
		}
		return excelContentList;
	}
}
