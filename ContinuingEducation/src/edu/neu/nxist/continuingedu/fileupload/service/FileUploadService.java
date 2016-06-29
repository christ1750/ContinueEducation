package edu.neu.nxist.continuingedu.fileupload.service;

import java.io.File;
import java.util.List;

import edu.neu.nxist.continuingedu.fileupload.model.FileInfo;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public interface FileUploadService {
	public void saveFile(FileInfo file);

	public void deleteFile(FileInfo file);

	public PageBean queryFileForPage(int categoryId,String fileName, String time1,
			String time2, int page, int pageSize);

	public FileInfo findFileById(String id);

	public String getFileSize(File f) throws Exception;

	public List getFileCategory();

}
