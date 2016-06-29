package edu.neu.nxist.continuingedu.emailverify.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.emailverify.model.MailInfo;

public interface MailDAO {
	public void addMail(MailInfo mail);

	public void deleteMail(MailInfo mail);

	public void updateMail(MailInfo mail);

	public MailInfo findMailById(String id);

	public List findMailAll(String hql);
}
