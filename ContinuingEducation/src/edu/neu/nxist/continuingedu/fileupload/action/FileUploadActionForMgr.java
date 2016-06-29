package edu.neu.nxist.continuingedu.fileupload.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.neu.nxist.continuingedu.fileupload.service.FileUploadService;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class FileUploadActionForMgr extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private FileUploadService fileUploadService;
	private String uploadFileName;
	private String id;
	private int page;
	private int pageSize = 15;
	private int categoryId;
	private String queryFileName;
	private PageBean pageBean;

	public String queryFileForPage() {
		List tabList = this.fileUploadService.getFileCategory();
		this.setPageBean(fileUploadService.queryFileForPage(categoryId,null,
				null, null, page, pageSize));
		ActionContext.getContext().getSession().put("tabList", tabList);
		return "queryFileForPage";
	}

	public FileUploadService getFileUploadService() {
		return fileUploadService;
	}

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPage() {
		return page;
	}

	public String getQueryFileName() {
		return queryFileName;
	}

	public void setQueryFileName(String queryFileName) {
		this.queryFileName = queryFileName;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

}
