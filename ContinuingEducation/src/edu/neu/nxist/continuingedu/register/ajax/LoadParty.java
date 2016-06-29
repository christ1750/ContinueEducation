package edu.neu.nxist.continuingedu.register.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.register.model.Party;
import edu.neu.nxist.continuingedu.register.service.PartyService;

public class LoadParty {

	private PartyService partyService;

	public void setPartyService(PartyService partyService) {
		this.partyService = partyService;
	}

	public String execute() {
		System.out.println("LoadParty");
		List<Party> partyList = new ArrayList<Party>();
		partyList = (List<Party>) partyService.getParty();
		try {
			JSONArray jsonArray = JSONArray.fromObject(partyList);

			HttpServletResponse response = ServletActionContext.getResponse();
			try {
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().print(jsonArray.toString());
				System.out.print(partyList);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
