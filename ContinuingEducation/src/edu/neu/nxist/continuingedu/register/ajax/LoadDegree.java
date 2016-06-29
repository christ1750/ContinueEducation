package edu.neu.nxist.continuingedu.register.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.register.model.Degree;
import edu.neu.nxist.continuingedu.register.service.DegreeService;

public class LoadDegree {

	private DegreeService degreeService;

	public String execute() {
		System.out.println("LoadDegree");
		List<Degree> DegreeList = new ArrayList<Degree>();
		DegreeList = (List<Degree>) degreeService.getDegree();
		try {
			JSONArray jsonArray = JSONArray.fromObject(DegreeList);

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

	public DegreeService getDegreeService() {
		return degreeService;
	}

	public void setDegreeService(DegreeService degreeService) {
		this.degreeService = degreeService;
	}

}
