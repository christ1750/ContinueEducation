package edu.neu.nxist.continuingedu.register.service;

import java.util.List;

import edu.neu.nxist.continuingedu.register.dao.CertificateDAO;
import edu.neu.nxist.continuingedu.register.dao.PartyDAO;

public class CertificateServiceImpl implements CertificateService {
	private CertificateDAO certificateDao;

	public List getCertificate() {
		return certificateDao
				.listAllCertificate("select c.certificateKind,c.certificateName from Certificate as c");
	}

	public CertificateDAO getCertificateDao() {
		return certificateDao;
	}

	public void setCertificateDao(CertificateDAO certificateDao) {
		this.certificateDao = certificateDao;
	}

}
