package com.kh.got.community.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Town {

	private int townNo;
	private String townWriter;
	private String townWriterImg;
	private String townTitle;
	private String townContent;
	private int townLikes;
	private int townClick;
	private String townCreateDate;
	private String townModifyDate;
	private String townThumbnail;
	private int townReplyCount;
	private int townStar;
	
}
