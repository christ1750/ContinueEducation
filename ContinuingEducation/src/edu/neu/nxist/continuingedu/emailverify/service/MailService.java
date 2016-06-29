package edu.neu.nxist.continuingedu.emailverify.service;

import java.io.File;
import java.util.List;

import edu.neu.nxist.continuingedu.emailverify.model.MailInfo;

public interface MailService {
	public String DoEncrypt(String str);

	public String DoDecrypt(String str);

	public void addMail(MailInfo mail);

	public void deleteMail(MailInfo mail);

	public void updateMail(MailInfo mail);

	public MailInfo findMailById(String id);

	public List findMailAll();

	public boolean xmlExists(File file);

	public void createXML(String type, File file, MailInfo mailInfo);

	public void changeMailInfo(String type, File file, MailInfo mailInfo);

	public void parseXML(String type, File file, MailInfo mailInfo);

	public void sendMailOfValidate(MailInfo mailInfo);

	public void sendMail(String type, File file, MailInfo mailInfo, List list)
			throws Exception;
}
