package edu.neu.nxist.continuingedu.emailverify.model;

/**
 *Module: MailInfo.java Description: 定义发送邮件的所有字段的javabean
 */
public class MailInfo {
	private String id;
	private String host;// 邮件服务器域名或IP
	private String fromm;// 发件人
	private String too;// 收件人,可以为很多个，每个地址之间用";"分隔，比方说450065208@qq.com;lpf@sina.com
	private String cc;// 抄送人
	private String username;// 发件人用户名
	private String password;// 发件人密码
	private String title;// 邮件的主题
	private String content;// 邮件的内容
	private String type;// 邮件类型
	private String[] attachFileNames; // 邮件附件的文件名

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public void setFromm(String fromm) {
		this.fromm = fromm;
	}

	public String getFromm() {
		return fromm;
	}

	public void setToo(String too) {
		this.too = too;
	}

	public String getToo() {
		return too;
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public String[] getAttachFileNames() {
		return attachFileNames;
	}

	public void setAttachFileNames(String[] attachFileNames) {
		this.attachFileNames = attachFileNames;
	}

}