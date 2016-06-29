package edu.neu.nxist.continuingedu.register.ajax;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.register.model.School;
import edu.neu.nxist.continuingedu.register.service.SchoolService;

public class LoadSchool {

	private SchoolService schoolService;
	private String input;

	@SuppressWarnings("unchecked")
	public String execute() throws UnsupportedEncodingException {
		System.out.println("LoadSchool");
		input = java.net.URLDecoder.decode(input, "utf-8");
		List<School> schoolList = new ArrayList<School>();
		schoolList = (List<School>) schoolService.getSchool(input);

		try {
			JSONArray jsonArray = JSONArray.fromObject(schoolList);

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
		return null;
	}

	public SchoolService getSchoolService() {
		return schoolService;
	}

	public void setSchoolService(SchoolService schoolService) {
		this.schoolService = schoolService;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

}
