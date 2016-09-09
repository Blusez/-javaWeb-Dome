package com.sosee.excel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.sosee.exception.ExcelConfigException;

public class ExcelMappingConfig {
    private String configFileName;     //�����ļ����
    private String ClassName;          //�����ļ���Ӧ���������д��EXCEL�ļ�������
    private String label;              //��ǩ
    private List<Map<String,String>> cells = new ArrayList<Map<String,String>>();   //���EXCEL�ļ����ݵı�ǩ��Ϣ����
    private Map<String,String> data = new HashMap<String,String>();   //���EXCEL�ļ����ݵ�������Ϣ()

    /**
     * ����EXCEL�����ļ�
     *
     * @param configFileName  EXCEL�����ļ���
     *
     * @throws ExcelConfigException �����ļ��쳣
     */
    public ExcelMappingConfig(String configFileName) throws ExcelConfigException
    {
        this.configFileName = configFileName;
        init();
    }

    public String getClassName()
    {
        return ClassName;
    }
    
    public String getLabel()
    {
    	return label;
    }
    
    public java.util.Map<String,String> getData()
    {
        return data;
    }

    public List<Map<String,String>> getCells()
    {
        return cells;
    }

    /**
     * ����EXCEL�����ļ�
     *
     * @throws ExcelConfigException  �����ļ��쳣
     */
    @SuppressWarnings("rawtypes")
	protected void init() throws ExcelConfigException
    {
        SAXReader saxReader = new SAXReader();
        Document doc;
        try
        {
            doc = saxReader.read(getClass().getResourceAsStream(configFileName));
        }
        catch (Exception e)
        {
            throw new ExcelConfigException("�޷����������ļ�"+configFileName+"!");
        }
        Element classNameElement = (Element)doc.selectSingleNode("excel-mapping-config/className");
        if (classNameElement == null)
        {
            throw new ExcelConfigException("�������ļ�" + configFileName + "��û���ҵ�excel-mapping-config/className��㣡");
        }
        ClassName=classNameElement.getTextTrim();
        if(ClassName==null||ClassName.length()<1)
        {
            throw new ExcelConfigException("�������ļ�" + configFileName + "�н��excel-mapping-config/classNameû���������ݣ�");
        }
        Element cellsNode = (Element)doc.selectSingleNode("excel-mapping-config/cells");
        if(cellsNode==null)
        {
           throw new ExcelConfigException("�������ļ�" + configFileName + "��û���ҵ�excel-mapping-config/cells��㣡");
        }
        label=cellsNode.attributeValue("label");
        List cellsList = doc.selectNodes("excel-mapping-config/cells/cell");
        if(cellsList==null)
        {
           throw new ExcelConfigException("�������ļ�" + configFileName + "��û���ҵ�excel-mapping-config/cells/cell��㣡");
        }
        final int cellsLength=cellsList.size();
        for(int i=0;i<cellsLength;i++)
        {
            Element cellElement=(Element)cellsList.get(i);
            Map<String,String> cellMap=new HashMap<String,String>();
            ExcelUtils.setMapIntegerByElementAttribute(cellMap, cellElement, "column",false,configFileName);
            ExcelUtils.setMapIntegerByElementAttribute(cellMap, cellElement, "row",false,configFileName);
            ExcelUtils.setMapStringByElementAttribute(cellMap, cellElement, "field",false,configFileName);
            ExcelUtils.setMapIntegerByElementAttribute(cellMap, cellElement, "maxLength",true,configFileName); 
            ExcelUtils.setMapStringByElementAttribute(cellMap, cellElement, "type",true,configFileName);
            cellMap.put("label",cellElement.getTextTrim());
            cells.add(cellMap);
        }
        
        Element dataElement = (Element) doc.selectObject("excel-mapping-config/data");
        if (dataElement == null)
        {
             throw new ExcelConfigException("�������ļ�" + configFileName + "��û���ҵ�excel-mapping-config/data��㣡");  
        }
        ExcelUtils.setMapIntegerByElementAttribute(data, dataElement, "begin",false,configFileName);
        ExcelUtils.setMapIntegerByElementAttribute(data, dataElement, "end",true,configFileName);
    }
}