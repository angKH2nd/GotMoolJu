package com.kh.got.community.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class TownReply {

	private int townReplyNo;
	private int townReplyRefNo;
	private String townReplyWriter;
	private String townReplyWriterImg;
	private String townReplyContent;
	private String townReplyCreateDate;
	private String townReplyModifyDate;
	
}
