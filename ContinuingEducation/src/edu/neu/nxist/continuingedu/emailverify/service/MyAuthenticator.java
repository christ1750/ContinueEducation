package edu.neu.nxist.continuingedu.emailverify.service;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *Module: MailInfo.java Description: 邮件授权类
 */

public class MyAuthenticator extends Authenticator {
	private String strUser;
	private String strPwd;

	public MyAuthenticator(String user, String password) {
		this.strUser = user;
		this.strPwd = password;
	}

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(strUser, strPwd);
	}
}