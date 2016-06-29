package edu.neu.nxist.continuingedu.register.model;

public class Certificate {
	private int certificateKind;
	private String certificateName;

	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}

	public String getCertificateName() {
		return certificateName;
	}

	public void setCertificateKind(int certificateKind) {
		this.certificateKind = certificateKind;
	}

	public int getCertificateKind() {
		return certificateKind;
	}

}
