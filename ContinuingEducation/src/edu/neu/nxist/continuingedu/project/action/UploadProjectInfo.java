package edu.neu.nxist.continuingedu.project.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.project.model.Project;
import edu.neu.nxist.continuingedu.project.service.ProjectService;

public class UploadProjectInfo {

	/**
		 * 
		 */
	private static final long serialVersionUID = 7990765658027314488L;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public Project getProject() {
		return Project;
	}

	public void setProject(Project project) {
		Project = project;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private ProjectService myProjectService;
	private File upload;
	private String uploadFileName;
	private String savePath;// strusts 文件中配置的属性

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getAllowTypes() {
		return allowTypes;
	}

	public void setAllowTypes(String allowTypes) {
		this.allowTypes = allowTypes;
	}

	private String allowTypes;// strusts 文件中配置的属性
	private String path;
	private String downloadFileName;
	private File download;

	private Project Project = new Project();

	public String saveProject() throws Exception {

		String savePath = ServletActionContext.getServletContext().getRealPath(
				"/")
				+ "upload\\file\\word\\project\\";// 得到项目的绝对路径

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");// 描述时间的格式
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";
		byte[] buffer = new byte[2048];
		FileInputStream fis = null;
		fis = new FileInputStream(upload);

		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		String fileExt = uploadFileName.substring(
				uploadFileName.lastIndexOf(".") + 1).toLowerCase();

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newProjectName = df.format(new Date()) + "_"
				+ new Random().nextInt(1000) + "." + fileExt;

		FileOutputStream fos = new FileOutputStream(savePath + "/"
				+ newProjectName);

		int len = 0;
		while ((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}
		Project.setIntroStr(savePath + newProjectName);

		this.myProjectService.addProject(Project);

		return "saveProject";
	}

	public InputStream getDownloadFile() throws Exception {

		File file = new File("/" + Project.getIntroduction());
		InputStream is = new FileInputStream(file);
		return is;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDownloadFileName() {
		return downloadFileName;
	}

	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}

	public File getDownload() {
		return download;
	}

	public void setDownload(File download) {
		this.download = download;
	}

	public void setMyProjectService(ProjectService myProjectService) {
		this.myProjectService = myProjectService;
	}

	public ProjectService getMyProjectService() {
		return myProjectService;
	}

	// public String downloadProject() {
	// Project = this.ProjectService
	// .findProjectById(searchProjectID);
	// String fileExt1 = Project.getPath().substring(
	// Project.getPath().lastIndexOf(".") + 1).toLowerCase();
	// downloadFileName=Project.getTitle()+"."+fileExt1;
	// path=Project.getPath();
	// return "downloadProject";
	// }
}
