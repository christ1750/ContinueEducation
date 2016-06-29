package edu.neu.nxist.continuingedu.register.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import edu.neu.nxist.continuingedu.register.model.UserInfo;
import edu.neu.nxist.continuingedu.register.service.UserInfoService;
public class LoginAction {

	private String result; // loginParam返回类型
	private String userName;
	private String userPassword;
	private String userRole;
	private UserInfoService userInfoService;

	@SuppressWarnings("unchecked")
	public String login() {
		System.out.println("login  start..");
		System.out.println("wwwwwwwwwww" + this.userName);
		System.out.println("qqqqqqqqqqq" + this.userPassword.trim());
		System.out.println("ccccccccccc" + this.userRole);
		List<UserInfo> user = this.userInfoService
				.findUserInfoByName(this.userName);
		UserInfo userLogin = user.get(0);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");// 
        String ymd = sdf.format(new Date());
	    System.out.println(ymd);
	    if((userLogin != null) && (!userLogin.equals("")) && userLogin.getRole().equals("4"))
	    {
	    	if((userLogin.getDeadline().compareTo(ymd)<0))
	    		{
	    		 sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 
	             ymd = sdf.format(new Date());
	    		userLogin.setHide("1");
	    		userLogin.setHidetime(ymd);
	    	     this.userInfoService.updateUserInfo(userLogin);
	    		}
	    	
	    }
	    
		
		
		
		if ((userLogin != null) && (!userLogin.equals(""))&&(userLogin.getHide().equals("0")))
		{// 存在该用户
			System.out.println("存在该用户");
			 if (!userLogin.getUserPassword().equals(this.userPassword.trim()))
            {
				System.out.println("密码错误");
				setResult("3"); // 密码错误
			} else {
				if (userLogin.getRole().equals(this.userRole)
						&& userLogin.getRole().equals("1"))
					setResult("1");
				else if (userLogin.getRole().equals(this.userRole)
						&& userLogin.getRole().equals("2"))
					setResult("0");
				else if (userLogin.getRole().equals(this.userRole)
						&& userLogin.getRole().equals("3"))
					setResult("5");
				else if (userLogin.getRole().equals(this.userRole)
						&& userLogin.getRole().equals("4"))
					setResult("6");
				else if (userLogin.getRole() != this.userRole)
					setResult("4");
				System.out.println("1111111111@@"+userLogin.getRole().equals(this.userRole));
				System.out.println("2222222222@@"+this.userRole);
				System.out.println("3333333333@@"+getResult());
			    }
		} else {
			System.out.println("没有这个用户");
			setResult("2"); // 没有这个用户
			if(userLogin.getHide().equals("1"))
				setResult("7");
		}// else

		if (this.result.equals("1") || this.result.equals("0")|| this.result.equals("5")|| this.result.equals("6")) {// 登陆成功
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", userLogin);
			System.out.println("session用户" + userLogin.getUserName() + "登陆成功");
		}// if

		return "login";

	}

	public String logout() {
		ActionContext.getContext().getSession().clear();
		return "logout";
	}

	// public List showUserInfo(String userName){ //返回账户和用户真实姓名及用户基本信息
	// System.out.println("showUserInfo start...."+userName);
	// // Map map = new LinkedHashMap();
	// List list = new ArrayList();
	// Object[] object = getPersonInfo(userName);
	// list.add(object[0]);//用户名
	// String name ="";
	// if(null!= object[1]){
	// if(object[1] instanceof Students){
	// Students student = (Students)object[1];
	// name = student.getStudentsName();
	// // map.put(name, student);
	// list.add(name);//真实姓名
	// list.add(student);
	// }else if(object[1] instanceof Staff){
	// Staff staff = (Staff)object[1];
	// name = staff.getStaffName();
	// // map.put(name, staff);
	// list.add(name);
	// list.add(staff);
	// }
	// list.add("userName");
	// list.add("userPassword");
	// }
	// System.out.println("showUserInfo end.....");
	// return list;
	// }

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

}
