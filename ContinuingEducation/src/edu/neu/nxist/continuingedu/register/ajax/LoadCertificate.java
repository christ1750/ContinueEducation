package edu.neu.nxist.continuingedu.register.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import edu.neu.nxist.continuingedu.register.model.Certificate;
import edu.neu.nxist.continuingedu.register.service.CertificateService;

public class LoadCertificate {

	private CertificateService certificateService;

	public String execute() {
		System.out.println("LoadCertificate");
		List<Certificate> CertificateList = new ArrayList<Certificate>();
		CertificateList = (List<Certificate>) certificateService
				.getCertificate();
		try {
			JSONArray jsonArray = JSONArray.fromObject(CertificateList);

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

	public CertificateService getCertificateService() {
		return certificateService;
	}

	public void setCertificateService(CertificateService certificateService) {
		this.certificateService = certificateService;
	}

}
