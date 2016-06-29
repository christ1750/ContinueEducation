package edu.neu.nxist.continuingedu.emailverify.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.neu.nxist.continuingedu.emailverify.model.MailInfo;
import edu.neu.nxist.continuingedu.emailverify.service.MailService;
import edu.neu.nxist.continuingedu.register.dto.ConfigUtil;
import edu.neu.nxist.continuingedu.register.dto.Notification;

public class EmailVerifyAction extends ActionSupport implements
		ModelDriven<MailInfo> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MailService mailService;
	// xml文件中字段对应的javabean对象
	private MailInfo mailInfo = new MailInfo();
	private String from;
	private String type="logmessage";
	private String to;
	private String content;
	private String password;
	private String searchMailInfoID;
	// 配置文件xml的路径

	private final static String XML_PATH = System.getProperty("user.dir")+"/SendMail.xml";
	File file = new File(XML_PATH);

	// 添加邮箱信息之前的初始化
	public String beforeAddEmail() {
		System.out.println("初始化  start......");
		
		return "beforeAddEmail";
	}
	public String saveMailInfo() {
		this.mailService.addMail(mailInfo);
		Notification notification =  new Notification();
        notification.setClassType(ConfigUtil.getConfig().getString("css.class.success"));
        notification.setTitle(ConfigUtil.getConfig().getString("msg.title.add"));
        notification.setMessage(ConfigUtil.getConfig().getString("msg.message.add"));
		ActionContext.getContext().getSession().put("Notification", notification);
		return "saveMailInfo";
	}

	public String updateMailInfo() {
		this.mailService.updateMail(mailInfo);
		Notification notification =  new Notification();
        notification.setClassType(ConfigUtil.getConfig().getString("css.class.success"));
        notification.setTitle(ConfigUtil.getConfig().getString("msg.title.update"));
        notification.setMessage(ConfigUtil.getConfig().getString("msg.message.update"));
		ActionContext.getContext().getSession().put("Notification", notification);
		return "updateMailInfo";
	}

	public String deleteMailInfo() {
		MailInfo mailInfo = findMailInfoById();
		this.mailService.deleteMail(mailInfo);
		Notification notification =  new Notification();
        notification.setClassType(ConfigUtil.getConfig().getString("css.class.success"));
        notification.setTitle(ConfigUtil.getConfig().getString("msg.title.delete"));
        notification.setMessage(ConfigUtil.getConfig().getString("msg.message.delete"));
		ActionContext.getContext().getSession().put("Notification", notification);
		return "deleteMailInfo";
	}

	// 后台修改时回填信息
	public void getMailInfoByID() {
		MailInfo mailInfo = findMailInfoById();
		try {
			JSONArray jsonArray = JSONArray.fromObject(mailInfo);
			HttpServletResponse response = ServletActionContext.getResponse();
			try {
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().print(jsonArray.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MailInfo findMailInfoById() {
		return this.mailService.findMailById(searchMailInfoID);
	}

	public String findMailInfoAll() {
		List list = this.mailService.findMailAll();
		ActionContext.getContext().put("mailInfoList", list);
		return "findMailInfoAll";
	}

	// 对密码进行加密的方法
	public void DoEncrypt() {
		this.mailService.DoDecrypt(password);
	}

	// 对密码进行解密的方法
	public void DoDecrypt(String str) {
		this.mailService.DoDecrypt(password);
	}

	/**
	 * 根据邮箱地址动态获取host名称
	 * 
	 * @return
	 */
	public void getSmtpHost() {
		// 通过邮箱地址解析出smtp服务器，对大多数邮箱都管用

		String host = "[{'host':'smtp." + from.split("@")[1] + "'}]";

		try {
			JSONArray jsonArray = JSONArray.fromObject(host);

			HttpServletResponse response = ServletActionContext.getResponse();
			try {
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().print(jsonArray.getString(0));// 去掉json串的中括号，取到里面的host
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 修改管理员邮箱的基本信息
	 */
	public String changeMailInfo() {
		MailInfo mailInfo=this.mailService.findMailById(searchMailInfoID);
		this.mailService.changeMailInfo(type, file, mailInfo);
		
		Notification notification =  new Notification();
        notification.setClassType(ConfigUtil.getConfig().getString("css.class.success"));
        notification.setTitle(ConfigUtil.getConfig().getString("msg.title.set"));
        notification.setMessage(ConfigUtil.getConfig().getString("msg.message.set"));
		ActionContext.getContext().getSession().put("Notification", notification);
		return "changeMailInfo";
	}

//	/**
//	 * Title: sendMail Description:外部程序调用的入口
//	 * 
//	 * @param type
//	 *            邮件的类型,目前有三种，即logmessage、checkmessage、ordermessage,type只能传这三个值中一个
//	 *            ,传其他的任何值都不行
//	 * @param content
//	 *            邮件的内容
//	 * @throws Exception
//	 */
//	public void sendMail() throws Exception {
//
//		if (null == type || "".equals(type) || null == content
//				|| "".equals(content)) {
//			throw new Exception("方法的入参type和content字段的值都不能为空或null");
//		}
//
//		/**
//		 * 如果xml存在，则进行解析，如果不存在则先创建文件
//		 */
//		if (this.mailService.xmlExists(file))
//			this.mailService.parseXML(type, file, mailInfo);// 解析xml字符串，把对应字段的值放入到mailInfo对象中
//
//		else{
//			MailInfo mailInfo=this.mailService.findMailById(searchMailInfoID);
//			this.mailService.createXML(type, file,mailInfo);
//		}
//
//		mailInfo.setContent(content);// 设置发送的内容
//		this.mailService.sendMailOfValidate(mailInfo);// 发送邮件
//	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public MailService getMailService() {
		return mailService;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public void setSearchMailInfoID(String searchMailInfoID) {
		this.searchMailInfoID = searchMailInfoID;
	}

	public String getSearchMailInfoID() {
		return searchMailInfoID;
	}

	public MailInfo getModel() {
		// TODO Auto-generated method stub
		return mailInfo;
	}

}
