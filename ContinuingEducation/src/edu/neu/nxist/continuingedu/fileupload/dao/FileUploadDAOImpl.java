package edu.neu.nxist.continuingedu.fileupload.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.fileupload.model.FileInfo;

public class FileUploadDAOImpl implements FileUploadDAO {
	private BasicDAO basicDao;

	public void deleteFile(FileInfo file) {
		// TODO Auto-generated method stub
		this.basicDao.deleteRecord(file);
	}

	public List findFileList(String hql) {
		// TODO Auto-generated method stub
		return this.basicDao.listAllRecord(hql);
	}

	public void saveFile(FileInfo file) {
		// TODO Auto-generated method stub
		this.basicDao.addRecord(file);
	}

	public FileInfo findFileById(String id) {
		// TODO Auto-generated method stub
		return (FileInfo) basicDao.findById(FileInfo.class, id);
	}

	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return this.basicDao.getAllRowCount(hql);
	}

	public List queryFileForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.basicDao.queryForPage(hql, offset, length);
	}
	
	public List listAllFile(String hql) {
		// TODO Auto-generated method stub
		return this.basicDao.listAllRecord(hql);
	}
	public void setBasicDao(BasicDAO basicDao) {
		this.basicDao = basicDao;
	}

	public BasicDAO getBasicDao() {
		return basicDao;
	}

}
