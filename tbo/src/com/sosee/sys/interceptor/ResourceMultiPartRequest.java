package com.sosee.sys.interceptor;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.JakartaMultiPartRequest;

public class ResourceMultiPartRequest extends JakartaMultiPartRequest {

	@Override
	public void parse(HttpServletRequest servletRequest, String saveDir) throws IOException {
		// TODO Auto-generated method stub
	        DiskFileItemFactory fac = new DiskFileItemFactory();
	        fac.setSizeThreshold(0);
	        if (saveDir != null) {
	            fac.setRepository(new File(saveDir));
	        }
	        
	        // Parse the request

	        try {

	            ServletFileUpload upload = new ServletFileUpload(fac);
	            upload.setSizeMax(maxSize);
	            //MyListener progressListener = new MyListener(servletRequest,"ing");//新建一个监听器

	            //upload.setProgressListener(progressListener);//添加自己的监听器
	            List items = upload.parseRequest(servletRequest);

	            for (Object item1 : items) {

	                FileItem item = (FileItem) item1;
	                //if (LOG.isDebugEnabled()) LOG.debug("Found item " + item.getFieldName());
	                if (item.isFormField()) {
	                    //LOG.debug("Item is a normal form field");
	                    List<String> values;
	                    if (params.get(item.getFieldName()) != null) {
	                        values = params.get(item.getFieldName());
	                    } else {
	                        values = new ArrayList<String>();
	                    }
	                    String charset = servletRequest.getCharacterEncoding();
	                    if (charset != null) {
	                        values.add(item.getString(charset));
	                    } else {
	                        values.add(item.getString());
	                    }
	                    params.put(item.getFieldName(), values);

	                } else {
	                    //LOG.debug("Item is a file upload");
	                    // Skip file uploads that don't have a file name - meaning that no file was selected.
	                    if (item.getName() == null || item.getName().trim().length() < 1) {
	                       // LOG.debug("No file has been uploaded for the field: " + item.getFieldName());
	                        continue;
	                    }
	                    List<FileItem> values;
	                    if (files.get(item.getFieldName()) != null) {
	                        values = files.get(item.getFieldName());
	                    } else {
	                        values = new ArrayList<FileItem>();
	                    }
	                    values.add(item);
	                    files.put(item.getFieldName(), values);
	                }
	            }

	        } catch (FileUploadException e) {
	           
	        }


	}

	
}
