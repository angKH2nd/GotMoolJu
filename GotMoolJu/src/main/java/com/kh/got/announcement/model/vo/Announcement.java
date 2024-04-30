package com.kh.got.announcement.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Announcement {
	
	private int announcementNo;
	private String announcementTitle;
	private String announcementContent;
	private String announcementWriter;
	private int announcementCount;
	private Date announcementCreateDate;
	private String announcementStatus;

}
