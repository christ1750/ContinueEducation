package edu.neu.nxist.continuingedu.fileupload.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.neu.nxist.continuingedu.fileupload.model.FileInfo;
import edu.neu.nxist.continuingedu.fileupload.service.FileUploadService;
import edu.neu.nxist.continuingedu.register.dto.ConfigUtil;
import edu.neu.nxist.continuingedu.register.dto.Notification;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class FileUploadAction extends ActionSupport implements
		ModelDriven<FileInfo> {

	private static final long serialVersionUID = 1L;
	private FileUploadService fileUploadService;
	private File upload;
	private FileInfo fileInfo = new FileInfo();
	private String uploadFileName;
	private String id;
	private int page;
	private int pageSize = 15;
	private String queryFileName;
	private String time1;
	private String time2;
	private PageBean pageBean;

	public String deleteFile() {
		FileInfo fileInfo = this.fileUploadService.findFileById(id);
		fileUploadService.deleteFile(fileInfo); // 删除数据库记录
		File file = new File(fileInfo.getFilePath()); // 具体文件路径（可以从数据库里面读取出来）
		if (file.isFile()) {
			file.delete();// 删除文件
		}
		Notification notification = new Notification();
		notification.setClassType(ConfigUtil.getConfig().getString(
				"css.class.success"));
		notification.setTitle(ConfigUtil.getConfig().getString(
				"msg.title.delete"));
		notification.setMessage(ConfigUtil.getConfig().getString(
				"msg.message.delete"));
		ActionContext.getContext().getSession().put("Notification",
				notification);
		return "deleteFile";
	}

	public String queryFileForPage() {
		this.setPageBean(fileUploadService.queryFileForPage(0,queryFileName,
				time1, time2, page, pageSize));
		return "queryFileForPage";
	}

	public String addFile() throws Exception {

		// 文件保存目录路径
		String savePath = ServletActionContext.getServletContext().getRealPath(
				"/")
				+ "file/";
		// 创建文件夹
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";

		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		// 检查扩展名
		String fileExt = uploadFileName.substring(
				uploadFileName.lastIndexOf(".") + 1).toLowerCase();

		// 重构文件名称
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_"
				+ new Random().nextInt(1000) + "." + fileExt;
		byte[] buffer = new byte[1024];
		// 获取文件输出流
		FileOutputStream fos = new FileOutputStream(savePath + "/"
				+ newFileName);
		// 获取内存中当前文件输入流
		InputStream in = new FileInputStream(upload);
		try {
			int num = 0;
			while ((num = in.read(buffer)) > 0) {
				fos.write(buffer, 0, num);
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
		} finally {
			in.close();
			fos.close();
		}
		fileInfo.setFileName(uploadFileName);
		fileInfo.setFileSize(fileUploadService.getFileSize(upload));
		fileInfo.setFilePath(savePath + "/" + newFileName);

		this.fileUploadService.saveFile(fileInfo);
		Notification notification = new Notification();
		notification.setClassType(ConfigUtil.getConfig().getString(
				"css.class.success"));
		notification.setTitle(ConfigUtil.getConfig().getString(
				"msg.title.upload"));
		notification.setMessage(ConfigUtil.getConfig().getString(
				"msg.message.upload"));
		ActionContext.getContext().getSession().put("Notification",
				notification);

		upload = null;
		return "addFile";
	}

	public FileUploadService getFileUploadService() {
		return fileUploadService;
	}

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
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

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public FileInfo getModel() {
		// TODO Auto-generated method stub
		return fileInfo;
	}

}
