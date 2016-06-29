package edu.neu.nxist.continuingedu.emailverify.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import edu.neu.nxist.continuingedu.emailverify.dao.MailDAO;
import edu.neu.nxist.continuingedu.emailverify.model.MailInfo;

public class MailServiceImpl implements MailService {
	private MailDAO mailDao;

	public MailDAO getMailDao() {
		return mailDao;
	}

	public void setMailDao(MailDAO mailDao) {
		this.mailDao = mailDao;
	}

	/**
	 * @Title: DoEncrypt
	 * @Description: 对密码进行加密的方法
	 * @param @param str
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	public String DoEncrypt(String str) {
		StringBuffer enStrBuff = new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			int tmpch = str.charAt(i);
			tmpch ^= 1;
			tmpch ^= 0xa;
			enStrBuff.append(Integer.toHexString(tmpch));
		}

		return enStrBuff.toString().toUpperCase();
	}

	/**
	 * @Title: DoDecrypt
	 * @Description: 对密码进行解密的方法
	 * @param @param str
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	public String DoDecrypt(String str) {
		String deStr = str.toLowerCase();
		StringBuffer deStrBuff = new StringBuffer();
		for (int i = 0; i < deStr.length(); i += 2) {
			String subStr = deStr.substring(i, i + 2);
			int tmpch = Integer.parseInt(subStr, 16);
			tmpch ^= 1;
			tmpch ^= 0xa;
			deStrBuff.append((char) tmpch);
		}

		return deStrBuff.toString();
	}

	public void addMail(MailInfo mail) {
		// TODO Auto-generated method stub
		this.mailDao.addMail(mail);
	}

	public void deleteMail(MailInfo mail) {
		// TODO Auto-generated method stub
		this.mailDao.deleteMail(mail);
	}

	public MailInfo findMailById(String id) {
		// TODO Auto-generated method stub
		return this.mailDao.findMailById(id);
	}

	public List findMailAll() {
		// TODO Auto-generated method stub
		return this.mailDao.findMailAll("from MailInfo");
	}

	public void updateMail(MailInfo mail) {
		// TODO Auto-generated method stub
		this.mailDao.updateMail(mail);
	}

	public boolean xmlExists(File file) {
		if (file.exists()) {
			return true;
		} else
			return false;
	}

	public void createXML(String type, File file, MailInfo mailInfo) {
		try {
			XMLWriter writer = null;// 声明写XML的对象
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("GBK");// 设置XML文件的编码格式
			// 新建SendEmail.xml文件并新增内容
			Document _document = DocumentHelper.createDocument();
			Element _root = _document.addElement("mail");
			Element _node = _root.addElement(type);
			Element _host = _node.addElement("host");
			_host.setText(mailInfo.getHost());
			Element _from = _node.addElement("from");
			_from.setText(mailInfo.getFromm());
			Element _title = _node.addElement("title");
			_title.setText(mailInfo.getTitle());
			Element _content = _node.addElement("content");
			_content.setText(mailInfo.getContent());// 给密码加密
			Element _to = _node.addElement("to");
			_to.setText("");
			Element _cc = _node.addElement("cc");
			_cc.setText("");
			Element _username = _node.addElement("username");
			_username.setText(mailInfo.getUsername());
			Element _password = _node.addElement("password");
			_password.setText(DoEncrypt(mailInfo.getPassword()));// 给密码加密

			writer = new XMLWriter(new FileOutputStream(file), format);
			writer.write(_document);
			writer.close();
			System.out.println("操作结束! ");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void changeMailInfo(String type, File file, MailInfo mailInfo) {
		if (xmlExists(file))
			file.delete();// 如果想删除已经存在的SendMail.xml文件
		createXML(type, file, mailInfo);
	}

	/**
	 * Title: parseXML Description:发送邮件给指定的收件人和抄送人,同时进行一些简单的校验判断,如必填项的字段、type的值
	 * 
	 * @param xml
	 *            配置文件的内容
	 * @param type
	 *            邮件类型
	 */
	public void parseXML(String type, File file, MailInfo mailInfo) {
		// 忽略type字段的大小写
		type = type.toLowerCase();
		try {
			SAXReader reader = new SAXReader();
			Document doc = reader.read(file);// 读取XML文件

			// 判断type的值是否正确,type的值应是报文二级节点中的一个
			String flag = doc.getRootElement().element(type) + "";
			if (null == flag || flag.equals("null"))
				throw new DocumentException(
						"传入的type值不对,type的值应是SendMail.xml报文中二级节点的一个,请查看文件然后重新传入type的值");

			// 设置主机名称
			Element hostEle = (Element) doc.selectSingleNode("/mail/" + type
					+ "/host");
			if (null == hostEle || "".equals(hostEle.getTextTrim())) {
				throw new DocumentException(
						"邮件服务器域名或IP不能为空,请检查配置文件SendMail.xml");
			}
			mailInfo.setHost(hostEle == null ? "" : hostEle.getTextTrim());

			// 设置发件人
			Element fromEle = (Element) doc.selectSingleNode("/mail/" + type
					+ "/from");
			if (null == fromEle || "".equals(fromEle.getTextTrim())) {
				throw new DocumentException("发件人地址不能为空,请检查配置文件SendMail.xml");
			}
			mailInfo.setFromm(fromEle == null ? "" : fromEle.getTextTrim());

			// 设置邮件主题
			Element titleEle = (Element) doc.selectSingleNode("/mail/" + type
					+ "/title");
			mailInfo.setTitle(titleEle == null ? "" : titleEle.getTextTrim());

			// 设置邮件内容
			Element contentEle = (Element) doc.selectSingleNode("/mail/" + type
					+ "/content");
			mailInfo.setContent(contentEle == null ? "" : contentEle
					.getTextTrim());

			// // 设置收件人，对多个收件人的处理放在后面
			// Element toEle = (Element) doc.selectSingleNode("/mail/" + type
			// + "/to");
			// if (null == toEle || "".equals(toEle.getTextTrim())) {
			// throw new DocumentException("收件人地址不能为空,请检查配置文件SendMail.xml");
			// }
			// mailInfo.setTo(toEle == null ? "" : toEle.getTextTrim());

			// 设置抄送，对多个抄送人的处理放在后面
			Element ccEle = (Element) doc.selectSingleNode("/mail/" + type
					+ "/cc");
			mailInfo.setCc(ccEle == null ? "" : ccEle.getTextTrim());

			// 设置发件人用户名
			Element nameEle = (Element) doc.selectSingleNode("/mail/" + type
					+ "/username");
			if (null == nameEle || "".equals(nameEle.getTextTrim())) {
				throw new DocumentException("发件人用户名不能为空,请检查配置文件SendMail.xml");
			}
			mailInfo.setUsername(nameEle == null ? "" : nameEle.getTextTrim());

			// 设置发件人密码
			Element passEle = (Element) doc.selectSingleNode("/mail/" + type
					+ "/password");
			if (null == passEle || "".equals(passEle.getTextTrim())) {
				throw new DocumentException("发件人密码不能为空,请检查配置文件SendMail.xml");
			}
			mailInfo.setPassword(passEle == null ? "" : passEle.getTextTrim());

		} catch (DocumentException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Title: sendMailOfValidate Description:发送邮件的方法,Authenticator类验证
	 */
	public void sendMailOfValidate(MailInfo mailInfo) {
		Properties props = System.getProperties();
		props.put("mail.smtp.host", mailInfo.getHost());// 设置邮件服务器的域名或IP
		props.put("mail.smtp.auth", "true");// 授权邮件,mail.smtp.auth必须设置为true

		String password = mailInfo.getPassword();// 密码
		try {
			password = DoDecrypt(password);// 如果密码经过加密用此方法对密码进行解密
		} catch (NumberFormatException e1) {
			// 如果密码未经过加密,则对密码不做任何处理
		}
		// 传入发件人的用户名和密码,构造MyAuthenticator对象
		MyAuthenticator myauth = new MyAuthenticator(mailInfo.getUsername(),
				password);

		// 传入props、myauth对象,构造邮件授权的session对象
		Session session = Session.getDefaultInstance(props, myauth);

		// 将Session对象作为MimeMessage构造方法的参数传入构造message对象
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(mailInfo.getFromm()));// 发件人

			// 对多个收件人的情况进行处理,配置文件SendMail.xml中每个收件人之间必须用逗号隔开的
			if (mailInfo.getToo() != null && !"".equals(mailInfo.getToo())) {
				String to[] = mailInfo.getToo().split(",");
				for (int i = 0; i < to.length; i++) {
					message.addRecipient(Message.RecipientType.TO,
							new InternetAddress(to[i]));// 收件人
					System.out.print("kkkkkkkkkkkkkkkkkkkkkk"+to[i]+"\n");
				}
			}

			// 对多个抄送人的情况进行处理,每个抄送人之间用逗号隔开的
			if (mailInfo.getCc() != null && !"".equals(mailInfo.getCc())) {
				String cc[] = mailInfo.getCc().split(",");
				for (int j = 0; j < cc.length; j++) {
					message.addRecipient(Message.RecipientType.CC,
							new InternetAddress(cc[j]));// 抄送
				}
			}
			message.setSubject(mailInfo.getTitle());// 主题

			htmlMail(mailInfo, message);// 发送html内容

			//Transport.send(message);// 调用发送邮件的方法
			message.saveChanges();//存储邮件信息
			Transport transport=session.getTransport("smtp");
			transport.connect(mailInfo.getHost(),mailInfo.getUsername(),password);//以smtp方式登录邮箱
			transport.sendMessage(message,message.getAllRecipients());//发送邮件,其中第二个参数是所有
			//已设好的收件人地址
			transport.close(); 

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 以TEXT格式发送邮件
	 * 
	 * @param mailInfo
	 * @param message
	 */
	public void textMail(MailInfo mailInfo, MimeMessage message) {
		// 设置邮件消息的主要内容
		String mailContent = mailInfo.getContent();
		try {
			message.setText(mailContent);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 以HTML格式发送邮件
	 * 
	 * @param mailInfo
	 * @param message
	 */
	public void htmlMail(MailInfo mailInfo, MimeMessage message) {
		try {
			// MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
			Multipart mainPart = new MimeMultipart();
			// 创建一个包含HTML内容的MimeBodyPart
			BodyPart html = new MimeBodyPart();
			// 设置HTML内容 建立第一部分： 文本正文
			html.setContent(mailInfo.getContent(), "text/html; charset=UTF-8");
			mainPart.addBodyPart(html);
			// 将MiniMultipart对象设置为邮件内容 建立第二部分：附件
			message.setContent(mainPart);
			// if (mailInfo.getAttachFileNames().length > 0) {
			// for (int i = 0; i < mailInfo.getAttachFileNames().length; i++) {
			// if (!mailInfo.getAttachFileNames()[i].equals("")) {
			// // 建立第二部分：附件
			// html = new MimeBodyPart();
			// // 获得附件
			// DataSource source = new FileDataSource(mailInfo
			// .getAttachFileNames()[i]);
			// // 设置附件的数据处理器
			// html.setDataHandler(new DataHandler(source));
			// // 设置附件文件名
			// html.setFileName(mailInfo.getAttachFileNames()[i]);
			// // 加入第二部分
			// mainPart.addBodyPart(html);
			// }
			// }
			// }
		} catch (MessagingException ex) {
			ex.printStackTrace();
		}
	}

	public void sendMail(String type, File file, MailInfo mailInfo, List list)
			throws Exception {

		if (null == type || "".equals(type)) {
			throw new Exception("方法的入参type不能为空或null");
		}
		/**
		 * 如果xml存在，则进行解析，如果不存在则先创建文件
		 */
		// if (!xmlExists(file))
		// createXML(type, file,mailInfo);

		// file.delete();//如果想删除已经存在的SendMail.xml文件
		parseXML(type, file, mailInfo);// 解析xml字符串，把对应字段的值放入到mailInfo对象中
		String content = mailInfo.getContent();
		System.out.print("////////////////////////////////////////"+content);
		content = content.replaceAll("attr0", list.get(0).toString());
		content = content.replaceAll("attr1", list.get(1).toString());
		content = content.replaceAll("attr2", list.get(2).toString());
		content = content.replaceAll("attr3", list.get(3).toString());
		content = content.replaceAll("attr4", list.get(4).toString());
		content = content.replaceAll("attr5", list.get(5).toString());
		mailInfo.setContent(content);// 设置发送的内容
		sendMailOfValidate(mailInfo);// 发送邮件
	}
}
