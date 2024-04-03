package com.kh.got.announcement.model.vo;

import java.sql.Date;

public class Announcement {
	
	private int announcementNo;
	private String announcementTitle;
	private String announcementContent;
	private String announcementWriter;
	private int announcementCount;
	private Date announcementCreateDate;
	private String announcementStatus;

	public Announcement() {}

	public Announcement(int announcementNo, String announcementTitle, String announcementContent,
			String announcementWriter, int announcementCount, Date announcementCreateDate, String announcementStatus) {
		super();
		this.announcementNo = announcementNo;
		this.announcementTitle = announcementTitle;
		this.announcementContent = announcementContent;
		this.announcementWriter = announcementWriter;
		this.announcementCount = announcementCount;
		this.announcementCreateDate = announcementCreateDate;
		this.announcementStatus = announcementStatus;
	}

	public int getAnnouncementNo() {
		return announcementNo;
	}

	public void setAnnouncementNo(int announcementNo) {
		this.announcementNo = announcementNo;
	}

	public String getAnnouncementTitle() {
		return announcementTitle;
	}

	public void setAnnouncementTitle(String announcementTitle) {
		this.announcementTitle = announcementTitle;
	}

	public String getAnnouncementContent() {
		return announcementContent;
	}

	public void setAnnouncementContent(String announcementContent) {
		this.announcementContent = announcementContent;
	}

	public String getAnnouncementWriter() {
		return announcementWriter;
	}

	public void setAnnouncementWriter(String announcementWriter) {
		this.announcementWriter = announcementWriter;
	}

	public int getAnnouncementCount() {
		return announcementCount;
	}

	public void setAnnouncementCount(int announcementCount) {
		this.announcementCount = announcementCount;
	}

	public Date getAnnouncementCreateDate() {
		return announcementCreateDate;
	}

	public void setAnnouncementCreateDate(Date announcementCreateDate) {
		this.announcementCreateDate = announcementCreateDate;
	}

	public String getAnnouncementStatus() {
		return announcementStatus;
	}

	public void setAnnouncementStatus(String announcementStatus) {
		this.announcementStatus = announcementStatus;
	}

	@Override
	public String toString() {
		return "Announcement [announcementNo=" + announcementNo + ", announcementTitle=" + announcementTitle
				+ ", announcementContent=" + announcementContent + ", announcementWriter=" + announcementWriter
				+ ", announcementCount=" + announcementCount + ", announcementCreateDate=" + announcementCreateDate
				+ ", announcementStatus=" + announcementStatus + "]";
	}
	
}
