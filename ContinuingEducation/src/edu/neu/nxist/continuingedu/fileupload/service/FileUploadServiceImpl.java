package edu.neu.nxist.continuingedu.fileupload.service;

import java.io.File;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.util.List;

import edu.neu.nxist.continuingedu.fileupload.dao.FileUploadDAO;
import edu.neu.nxist.continuingedu.fileupload.model.FileInfo;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class FileUploadServiceImpl implements FileUploadService {
	private FileUploadDAO fileUploadDao;

	public void deleteFile(FileInfo file) {
		// TODO Auto-generated method stub
		fileUploadDao.deleteFile(file);
	}

	public PageBean queryFileForPage(int categoryId,String queryFileName, String time1,
			String time2, int page, int pageSize) {
		// TODO Auto-generated method stub
		String hql = "from FileInfo where 1=1";// 查询语句
		if (categoryId != 0) {
			hql += " and fileCategory.categoryId =" + categoryId;
		}
		if (!"".equals(queryFileName) && queryFileName != null) {
			hql += " and fileName like '%" + queryFileName + "%'";
		}
		if (!"".equals(time1) && time1 != null) {
			hql += " and time >= '" + time1 + "'";
		}
		if (!"".equals(time2) && time2 != null) {
			hql += " and time <= '" + time2 + "'";
		}
		hql += " order by time desc";// 查询语句

		int allRow = fileUploadDao.getAllRowCount(hql);// 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数	
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page, totalPage);
		final int offset = PageBean.countOffset(pageSize, currentPage);// 当前页开始记录
		List list = fileUploadDao.queryFileForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		pageBean.init();
		return pageBean;
	}

	public void saveFile(FileInfo file) {
		// TODO Auto-generated method stub
		fileUploadDao.saveFile(file);
	}

	public FileInfo findFileById(String id) {
		// TODO Auto-generated method stub
		return this.fileUploadDao.findFileById(id);
	}

	public String getFileSize(File f) throws Exception {// 取得文件大小
		long size = 0;
		if (f.exists()) {
			FileInputStream fis = null;
			fis = new FileInputStream(f);
			size = fis.available();
		}
		DecimalFormat df = new DecimalFormat("#.00");
		String fileSize = "";
		if (size < 1024) {
			fileSize = df.format((double) size) + "B";
		} else if (size < 1048576) {
			fileSize = df.format((double) size / 1024) + "K";
		} else if (size < 1073741824) {
			fileSize = df.format((double) size / 1048576) + "M";
		}
		return fileSize;
	}
	
	public List getFileCategory() {
		// TODO Auto-generated method stub
		return fileUploadDao.listAllFile("from FileCategory");
	}

	public FileUploadDAO getFileUploadDao() {
		return fileUploadDao;
	}

	public void setFileUploadDao(FileUploadDAO fileUploadDao) {
		this.fileUploadDao = fileUploadDao;
	}

}
