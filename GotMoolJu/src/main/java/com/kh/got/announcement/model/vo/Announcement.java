package com.kh.got.announcement.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Announcement {
	
	private String announcementNo;
	private String announcementTitle;
	private String announcementContent;
	private String announcementWriter;
	private String announcementCount;
	private Date announcementCreateDate;
	private String announcementStatus;

}
