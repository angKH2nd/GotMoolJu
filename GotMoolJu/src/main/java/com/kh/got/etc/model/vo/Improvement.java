package com.kh.got.etc.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Improvement {

	private int impReplyNo;
	private String impReplyContent;
	private String impReplyWriter;
	private String impReplyProfile;
	private String impReplyType;
	private String impReplyCreateDate;
	private String impReplyModifyDate;
	private String impReplyStatus;
	private String impReplyLikes;
	private String impReplyDislikes;
	
}
