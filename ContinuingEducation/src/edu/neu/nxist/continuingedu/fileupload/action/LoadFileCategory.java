package edu.neu.nxist.continuingedu.fileupload.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.fileupload.model.FileCategory;
import edu.neu.nxist.continuingedu.fileupload.service.FileUploadService;

public class LoadFileCategory {
	/**
	 * 
	 */
	private FileUploadService fileUploadService;

	@SuppressWarnings("unchecked")
	public String execute() {
		System.out.println("LoadFileCategory");
		List<FileCategory> fileCategoryList = new ArrayList<FileCategory>();
		fileCategoryList = (List<FileCategory>) fileUploadService.getFileCategory();
		try {
			JSONArray jsonArray = JSONArray.fromObject(fileCategoryList);

			HttpServletResponse response = ServletActionContext.getResponse();
			try {
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().print(jsonArray.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public FileUploadService getFileUploadService() {
		return fileUploadService;
	}

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	} 
	
}
