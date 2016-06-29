package edu.neu.nxist.continuingedu.fileupload.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.fileupload.model.FileInfo;

public interface FileUploadDAO {

	public void saveFile(FileInfo file);

	public void deleteFile(FileInfo file);

	public List findFileList(String hql);

	public FileInfo findFileById(String id);

	public int getAllRowCount(String hql);
	
	public List queryFileForPage(String hql, int offset, int length);

	public List listAllFile(String string);

}
