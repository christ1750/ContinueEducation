package edu.neu.nxist.continuingedu.register.dto;

import org.springframework.ui.Model;

public class Notification {

	private String classType;
	private String title;
	private String message;
	
	public Notification(){
		
	}///~~~
	
	public Notification(String classType, String title, String message) {
		this.classType = classType;
		this.title = title;
		this.message = message;
	}
	
	
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the classType
	 */
	public String getClassType() {
		return classType;
	}
	/**
	 * @param classType the classType to set
	 */
	public void setClassType(String classType) {
		this.classType = classType;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
	public static void setMsg(Model model,String type) {
		Notification notification =  new Notification();
		if(type.equalsIgnoreCase("success")){
			notification.setClassType(ConfigUtil.getConfig().getString("css.class.success"));
	        notification.setTitle(ConfigUtil.getConfig().getString("msg.title.delete"));
	        notification.setMessage(ConfigUtil.getConfig().getString("msg.message.delete"));
		}else if(type.equalsIgnoreCase("error")){
			notification.setClassType(ConfigUtil.getConfig().getString("css.class.success"));
	        notification.setTitle(ConfigUtil.getConfig().getString("msg.title.delete"));
	        notification.setMessage(ConfigUtil.getConfig().getString("msg.message.delete"));
		}else if(type.equalsIgnoreCase("warning")){
			notification.setClassType(ConfigUtil.getConfig().getString("css.class.success"));
	        notification.setTitle(ConfigUtil.getConfig().getString("msg.title.delete"));
	        notification.setMessage(ConfigUtil.getConfig().getString("msg.message.delete"));
		}else if(type.equalsIgnoreCase("info")){
			notification.setClassType(ConfigUtil.getConfig().getString("css.class.success"));
	        notification.setTitle(ConfigUtil.getConfig().getString("msg.title.delete"));
	        notification.setMessage(ConfigUtil.getConfig().getString("msg.message.delete"));
		}else{
			notification.setClassType(ConfigUtil.getConfig().getString("css.class.success"));
	        notification.setTitle(ConfigUtil.getConfig().getString("msg.title.delete"));
	        notification.setMessage(ConfigUtil.getConfig().getString("msg.message.delete"));
		}
        model.addAttribute("Notification",notification);
	}
}
