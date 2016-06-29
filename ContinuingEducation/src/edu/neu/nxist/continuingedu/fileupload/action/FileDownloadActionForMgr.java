package edu.neu.nxist.continuingedu.fileupload.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import com.opensymphony.xwork2.ActionSupport;

import edu.neu.nxist.continuingedu.fileupload.model.FileInfo;
import edu.neu.nxist.continuingedu.fileupload.service.FileUploadService;

public class FileDownloadActionForMgr extends ActionSupport {
	/*** */
	private static final long serialVersionUID = 6971738557347656227L;
	protected FileUploadService fileUploadService;
	private String id;
	private String fileName;
	private String inputPath;
	private FileInfo fileInfo = new FileInfo();

	/**
	 * @getFileName 此方法对应的是struts.xml文件中的： <param*
	 *              name="contentDisposition">attachment
	 *              filename="${fileName}"</param> 这个属性设置的是下载工具下载文件时显示的文件名，
	 *              要想正确的显示中文文件名，我们需要对fileName再次编码 否则中文名文件将出现乱码，或无法下载的情况*
	 */
	public String getFileName() {
		fileInfo = fileUploadService.findFileById(id);
		try {
			fileName = new String(fileInfo.getFileName().getBytes("GBK"),
					"ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return fileName;
	}

	public InputStream getDownloadFile() throws Exception {
		File file = new File("/" + fileInfo.getFilePath().trim());
		InputStream is = new FileInputStream(file);
		return is;
	}

	public String download() {
		this.setFileName(this.getFileName());
		return "download";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public FileUploadService getFileUploadService() {
		return fileUploadService;
	}

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getInputPath() {
		return inputPath;
	}

	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}

}