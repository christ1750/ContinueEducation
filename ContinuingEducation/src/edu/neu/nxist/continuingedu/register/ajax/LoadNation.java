package edu.neu.nxist.continuingedu.register.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.register.model.Nation;
import edu.neu.nxist.continuingedu.register.service.NationService;

public class LoadNation {

	private NationService nationService;

	public String execute() {
		System.out.println("LoadNation");
		List<Nation> NationList = new ArrayList<Nation>();
		NationList = (List<Nation>) nationService.getNation();
		try {
			JSONArray jsonArray = JSONArray.fromObject(NationList);

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

	public NationService getNationService() {
		return nationService;
	}

	public void setNationService(NationService nationService) {
		this.nationService = nationService;
	}

}
