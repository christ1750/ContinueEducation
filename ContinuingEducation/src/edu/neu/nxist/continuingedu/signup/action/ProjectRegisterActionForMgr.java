package edu.neu.nxist.continuingedu.signup.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.neu.nxist.continuingedu.emailverify.model.MailInfo;
import edu.neu.nxist.continuingedu.emailverify.service.MailService;
import edu.neu.nxist.continuingedu.excel.ExcelException;
import edu.neu.nxist.continuingedu.excel.ExcelUtil;
import edu.neu.nxist.continuingedu.project.model.Project;
import edu.neu.nxist.continuingedu.register.dto.ConfigUtil;
import edu.neu.nxist.continuingedu.register.dto.Notification;
import edu.neu.nxist.continuingedu.register.dto.PageBean;
import edu.neu.nxist.continuingedu.register.model.UserInfo;
import edu.neu.nxist.continuingedu.signup.model.ProjectRegister;
import edu.neu.nxist.continuingedu.signup.service.ProjectRegisterService;

public class ProjectRegisterActionForMgr extends ActionSupport implements
		ModelDriven<ProjectRegister> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5621212660992602550L;
	private ProjectRegisterService projectRegisterService;
	private MailService mailService;

	private ProjectRegister projectRegister = new ProjectRegister();
	private MailInfo mailInfo = new MailInfo();
	private List<String> checkPass = new ArrayList<String>();
	private List<String> checkRefuse = new ArrayList<String>();
	private List<String> reported = new ArrayList<String>();
	private String applyId;
	private String userId;
	private String projectId;
	private String searchName;
	private String searchReportNum;
	private String searchMailInfoID;
	private int checkStatus;
	private int reportStatus;
	private PageBean pageBean;
	private String searchId;
	private int page;
	private int pageSize = 20;

	// 配置文件xml的路径
	private final static String XML_PATH = System.getProperty("user.dir")
			+ "/SendMail.xml";// 默认路径
	File file = new File(XML_PATH);

	// 生成8位预约码
	public String generateReportNum() {
		String[] chars = new String[] { "a", "b", "c", "d", "e", "f", "g", "h",
				"i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
				"u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",
				"6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H",
				"I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
				"U", "V", "W", "X", "Y", "Z" };

		StringBuffer shortBuffer = new StringBuffer();
		String uuid = UUID.randomUUID().toString().replace("-", "");
		for (int i = 0; i < 8; i++) {
			String str = uuid.substring(i * 4, i * 4 + 4);
			int x = Integer.parseInt(str, 16);
			shortBuffer.append(chars[x % 0x3E]);
		}
		return shortBuffer.toString();

	}

	@SuppressWarnings("unchecked")
	public void findAll() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] { "pjRegister" });
		List<ProjectRegister> list = new ArrayList<ProjectRegister>();
		list = (List<ProjectRegister>) this.projectRegisterService.findAll();
		try {
			JSONArray jsonArray = JSONArray.fromObject(list, config);
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

	// @SuppressWarnings("unchecked")
	// public String findByUserId() {
	// List<ProjectRegister> pjReg = new ArrayList<ProjectRegister>();
	// pjReg = (List<ProjectRegister>) this.projectRegisterService
	// .findByUserId(userId);
	// ActionContext.getContext().put("pjRegListForAll", pjReg);
	// return "findByUserId";
	// }

	public void findByProjectId() {
		this.projectRegisterService.findByProjectId(projectId);
	}

	public void findByCheckStatus() {
		this.projectRegisterService.findByCheckStatus(checkStatus);
	}

	public void findByReportStatus() {
		this.projectRegisterService.findByReportStatus(reportStatus);
	}

	 public String findByCondition() {
	 List<ProjectRegister> list = new ArrayList<ProjectRegister>();
	 list = (List<ProjectRegister>) this.projectRegisterService
	 .findByCondition(userId, projectId, checkStatus, reportStatus);
	 ActionContext.getContext().put("pjRegInfo", list);
	 return "findByCondition";
	 }

	@SuppressWarnings("unchecked")
	public String findByNameAndProjectId() {
		List<ProjectRegister> list = new ArrayList<ProjectRegister>();
		list = (List<ProjectRegister>) this.projectRegisterService
				.findByNameAndProjectId(searchName, projectId);
		ActionContext.getContext().put("nameAndPjIdList", list);
		return "findByNameAndProjectId";
	}

	@SuppressWarnings("unchecked")
	public String findByNameAndReportNum() {
		List<ProjectRegister> list = new ArrayList<ProjectRegister>();
		list = (List<ProjectRegister>) this.projectRegisterService
				.findByNameAndReportNum(searchName, searchReportNum);
		ActionContext.getContext().put("nameAndRepNumList", list);
		return "findByNameAndReportNum";
	}

	public ProjectRegister findByApplyId() {
		return this.projectRegisterService.findByApplyId(applyId);
	}

	public void updateProjectRegister() {
		this.projectRegisterService.updateProjectRegister(projectRegister);
	}

	public void deleteProjectRegister() {
		this.projectRegisterService.deleteProjectRegister(projectRegister);
	}

	public String saveProjectRegister() {
		this.projectRegisterService.saveProjectRegister(projectRegister);
		return "saveProjectRegister";
	}

	@SuppressWarnings("unchecked")
	public String batchCheck() throws Exception {
		String to = new String();
		List list = new ArrayList();

		for (String applyId : checkPass) {
			this.projectRegisterService.batchCheck(applyId, 1,
					generateReportNum());
			ProjectRegister pjReg = this.projectRegisterService
					.findByApplyId(applyId);
			UserInfo userInfo = pjReg.getUserInfo();
			SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日");// 设置日期格式
			String time = df.format(new Date());
			list.add(userInfo.getRealName());
			list.add(pjReg.getSignupTime());
			list.add(pjReg.getProject().getProjectOrder());
			list.add(pjReg.getProject().getProjectName());
			list.add(pjReg.getReportNum());
			list.add(time);

			to += userInfo.getEmail() + ",";
		}
		for (String applyId : checkRefuse) {
			this.projectRegisterService.batchCheck(applyId, 2, null);
		}

		if (to != null && !"".equals(to)) {
			to = to.substring(0, to.length() - 1);

			mailInfo.setType("logmessage");
			mailInfo.setToo(to);
			if (this.mailService.xmlExists(file)) {
				this.mailService.sendMail(mailInfo.getType(), file, mailInfo,
						list);
			}
			Notification notification = new Notification();
			notification.setClassType(ConfigUtil.getConfig().getString(
					"css.class.success"));
			notification.setTitle(ConfigUtil.getConfig().getString(
					"msg.title.send"));
			notification.setMessage(ConfigUtil.getConfig().getString(
					"msg.message.send"));
			ActionContext.getContext().getSession().put("Notification",
					notification);
		}
		checkPass.clear();
		checkRefuse.clear();

		return "batchCheck";
	}

	public String checkReported() {
		for (String applyId : reported) {
			this.projectRegisterService.checkReported(applyId, 1);
		}
		reported.clear();
		return "checkReported";
	}

	public String listPjRegisterForPage() {
		if (pageBean != null) {
			if (page < 1)
				page = 1;
			if (page > pageBean.getTotalPage())
				page = pageBean.getTotalPage();
		}
		this.pageBean = this.projectRegisterService.queryForPage(searchId,
				pageSize, page);

		return "listPjRegisterForPage";
	}

	/* Excel 导出 */
	@SuppressWarnings("unchecked")
	public String signUpListExportExcel() {
		List signUpList = new ArrayList();
		LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
		signUpList = this.projectRegisterService.queryOneSignUpList(searchId);

		if (signUpList.size() != 0) {
			fieldMap.put("userInfo.realName", "姓名");
			fieldMap.put("signupTime", "报名时间");
			fieldMap.put("reportNum", "预约码");
			fieldMap.put("reportStatus.reportName", "是否报到");
			fieldMap.put("reportStatus.reportName", "是否缴纳学费");

			HttpServletResponse response = null;
			OutputStream out = null;
		
			try {
				ProjectRegister pjR = (ProjectRegister) signUpList.get(0);
				Project project = pjR.getProject();
				response = ServletActionContext.getResponse();
				out = response.getOutputStream();
				String sheetName = new String((pjR.getProject()
						.getProjectName() + "报名情况统计表.xls").getBytes("GBK"),
						"ISO8859-1");
				response.setHeader("Content-disposition",
						"attachment;filename=" + sheetName);
				response.setContentType("application/msexcel;charset=utf-8");
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setDateHeader("Expires", 0);

				try {
					ExcelUtil.listToExcel(signUpList, fieldMap, pjR
							.getProject().getProjectName()
							+ "报名情况统计表.xls", out, project);
				} catch (ExcelException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if (out != null) {
						out.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return "signUpListExportExcel";
	}
	
//	/* Excel 导入 */
//	public String signUpListImportExcel() {
//		InputStream in;
//		String sheetName;
//		Class<T> entityClass;
//		LinkedHashMap<String, String> fieldMap;
//		String[] uniqueFields;
//		excelToList(in, sheetName,entityClass,  fieldMap, uniqueFields);
//		return "signUpListImportExcel";
//
//	}

	public List<String> getCheckPass() {
		return checkPass;
	}

	public void setCheckPass(List<String> checkPass) {
		this.checkPass = checkPass;
	}

	public List<String> getCheckRefuse() {
		return checkRefuse;
	}

	public void setCheckRefuse(List<String> checkRefuse) {
		this.checkRefuse = checkRefuse;
	}

	public int getCheckStatus() {
		return checkStatus;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchReportNum() {
		return searchReportNum;
	}

	public void setSearchReportNum(String searchReportNum) {
		this.searchReportNum = searchReportNum;
	}

	public void setReported(List<String> reported) {
		this.reported = reported;
	}

	public List<String> getReported() {
		return reported;
	}

	public void setSearchMailInfoID(String searchMailInfoID) {
		this.searchMailInfoID = searchMailInfoID;
	}

	public String getSearchMailInfoID() {
		return searchMailInfoID;
	}

	public ProjectRegisterService getProjectRegisterService() {
		return projectRegisterService;
	}

	public void setProjectRegisterService(
			ProjectRegisterService projectRegisterService) {
		this.projectRegisterService = projectRegisterService;
	}

	public ProjectRegister getProjectRegister() {
		return projectRegister;
	}

	public MailService getMailService() {
		return mailService;
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public void setProjectRegister(ProjectRegister projectRegister) {
		this.projectRegister = projectRegister;
	}

	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}

	public String getApplyId() {
		return applyId;
	}

	public String getUserId() {
		return userId;
	}

	public void setCheckStatus(int checkStatus) {
		this.checkStatus = checkStatus;
	}

	public void setReportStatus(int reportStatus) {
		this.reportStatus = reportStatus;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}

	public String getSearchId() {
		return searchId;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public ProjectRegister getModel() {
		// TODO Auto-generated method stub
		return projectRegister;
	}
}
