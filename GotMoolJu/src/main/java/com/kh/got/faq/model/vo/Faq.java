package com.kh.got.faq.model.vo;

import java.sql.Date;

public class Faq {
	
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqWriter;
	private int faqCount;
	private Date faqCreateDate;
	private Date faqModifyDate;
	private String faqStatus;

	public Faq() {}

	public Faq(int faqNo, String faqTitle, String faqContent, String faqWriter, int faqCount, Date faqCreateDate,
			Date faqModifyDate, String faqStatus) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqWriter = faqWriter;
		this.faqCount = faqCount;
		this.faqCreateDate = faqCreateDate;
		this.faqModifyDate = faqModifyDate;
		this.faqStatus = faqStatus;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	public int getFaqCount() {
		return faqCount;
	}

	public void setFaqCount(int faqCount) {
		this.faqCount = faqCount;
	}

	public Date getFaqCreateDate() {
		return faqCreateDate;
	}

	public void setFaqCreateDate(Date faqCreateDate) {
		this.faqCreateDate = faqCreateDate;
	}

	public Date getFaqModifyDate() {
		return faqModifyDate;
	}

	public void setFaqModifyDate(Date faqModifyDate) {
		this.faqModifyDate = faqModifyDate;
	}

	public String getFaqStatus() {
		return faqStatus;
	}

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqWriter="
				+ faqWriter + ", faqCount=" + faqCount + ", faqCreateDate=" + faqCreateDate + ", faqModifyDate="
				+ faqModifyDate + ", faqStatus=" + faqStatus + "]";
	}
	
}
