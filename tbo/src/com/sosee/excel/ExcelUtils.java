package com.sosee.excel;

import java.util.Map;

import org.dom4j.Element;

import com.sosee.exception.ExcelConfigException;


public class ExcelUtils {

    public static void setMapIntegerByElementAttribute(Map<String,String> map, Element element, String attributeName,boolean isOptional,String configFileName) throws ExcelConfigException
    {
        String attributeValue = element.attributeValue(attributeName);
        if (attributeValue == null || attributeValue.trim().length() < 1)
        {
            if(!isOptional)
            {
               throw new ExcelConfigException("�������ļ�" + configFileName + "�н��"+element.getName()+"������"+attributeName+"û�����ã�");
            }
        }
        else
        {
            try
            {
                new Integer(attributeValue.trim());
            }
            catch (NumberFormatException nfe)
            {
                throw new ExcelConfigException("�������ļ�" + configFileName + "�н��"+element.getName()+"������"+attributeName+"�������֣�");
            }
            map.put(attributeName, attributeValue.trim());
        }
    }

    /**
     * ȡ��EXCEL�����ļ���һ����Ԫ�ص�������Ϣ���������MAP��
     *
     * @param map             �洢EXCEL�����ļ���Ϣ
     * @param element         EXCEL�����ļ���һ����Ԫ��
     * @param attributeName   EXCEL�����ļ���һ����Ԫ�ص�������
     * @param isOptional      EXCEL�����ļ���һ����Ԫ�ص������Ƿ�Ϊ��ѡ��
     * @param configFileName  EXCEL�����ļ���
     *
     * @throws ExcelConfigException  �����ļ��쳣
     */
    public static void setMapStringByElementAttribute(Map<String,String> map, Element element, String attributeName,boolean isOptional,String configFileName) throws ExcelConfigException
    {
        String attributeValue = element.attributeValue(attributeName);
        if (attributeValue == null || attributeValue.trim().length() < 1)
        {
            if(!isOptional)
            {
                throw new ExcelConfigException("�������ļ�" + configFileName + "�н��"+element.getName()+"������"+attributeName+"û�����ã�");
            }
        }
        else
        {
            map.put(attributeName,attributeValue.trim());
        }
    }
}
