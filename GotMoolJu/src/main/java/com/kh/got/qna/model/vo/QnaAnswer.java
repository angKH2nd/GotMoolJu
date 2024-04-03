package com.kh.got.qna.model.vo;

import java.sql.Date;

public class QnaAnswer {
	
	private int qnaAnswerNo;
	private int qnaAnswerRefNo;
	private String qnaAnswerContent;
	private String qnaAnswerWriter;
	private Date qnaAnswerCreateDate;
	private Date qnaAnswerModifyDate;
	private int qnaAnswerType;
	private String qnaAnswerStatus;
	
	public QnaAnswer() {}
	
	public QnaAnswer(int qnaAnswerNo, int qnaAnswerRefNo, String qnaAnswerContent, String qnaAnswerWriter,
			Date qnaAnswerCreateDate, Date qnaAnswerModifyDate, int qnaAnswerType, String qnaAnswerStatus) {
		super();
		this.qnaAnswerNo = qnaAnswerNo;
		this.qnaAnswerRefNo = qnaAnswerRefNo;
		this.qnaAnswerContent = qnaAnswerContent;
		this.qnaAnswerWriter = qnaAnswerWriter;
		this.qnaAnswerCreateDate = qnaAnswerCreateDate;
		this.qnaAnswerModifyDate = qnaAnswerModifyDate;
		this.qnaAnswerType = qnaAnswerType;
		this.qnaAnswerStatus = qnaAnswerStatus;
	}

	public int getQnaAnswerNo() {
		return qnaAnswerNo;
	}

	public void setQnaAnswerNo(int qnaAnswerNo) {
		this.qnaAnswerNo = qnaAnswerNo;
	}

	public int getQnaAnswerRefNo() {
		return qnaAnswerRefNo;
	}

	public void setQnaAnswerRefNo(int qnaAnswerRefNo) {
		this.qnaAnswerRefNo = qnaAnswerRefNo;
	}

	public String getQnaAnswerContent() {
		return qnaAnswerContent;
	}

	public void setQnaAnswerContent(String qnaAnswerContent) {
		this.qnaAnswerContent = qnaAnswerContent;
	}

	public String getQnaAnswerWriter() {
		return qnaAnswerWriter;
	}

	public void setQnaAnswerWriter(String qnaAnswerWriter) {
		this.qnaAnswerWriter = qnaAnswerWriter;
	}

	public Date getQnaAnswerCreateDate() {
		return qnaAnswerCreateDate;
	}

	public void setQnaAnswerCreateDate(Date qnaAnswerCreateDate) {
		this.qnaAnswerCreateDate = qnaAnswerCreateDate;
	}

	public Date getQnaAnswerModifyDate() {
		return qnaAnswerModifyDate;
	}

	public void setQnaAnswerModifyDate(Date qnaAnswerModifyDate) {
		this.qnaAnswerModifyDate = qnaAnswerModifyDate;
	}

	public int getQnaAnswerType() {
		return qnaAnswerType;
	}

	public void setQnaAnswerType(int qnaAnswerType) {
		this.qnaAnswerType = qnaAnswerType;
	}

	public String getQnaAnswerStatus() {
		return qnaAnswerStatus;
	}

	public void setQnaAnswerStatus(String qnaAnswerStatus) {
		this.qnaAnswerStatus = qnaAnswerStatus;
	}

	@Override
	public String toString() {
		return "QnaAnswer [qnaAnswerNo=" + qnaAnswerNo + ", qnaAnswerRefNo=" + qnaAnswerRefNo + ", qnaAnswerContent="
				+ qnaAnswerContent + ", qnaAnswerWriter=" + qnaAnswerWriter + ", qnaAnswerCreateDate="
				+ qnaAnswerCreateDate + ", qnaAnswerModifyDate=" + qnaAnswerModifyDate + ", qnaAnswerType="
				+ qnaAnswerType + ", qnaAnswerStatus=" + qnaAnswerStatus + "]";
	}
	
}
