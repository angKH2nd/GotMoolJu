package com.kh.got.qna.model.vo;

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
public class QnaAnswer {
	
	private String qnaAnswerNo;
	private String qnaAnswerRefNo;
	private String qnaAnswerContent;
	private String qnaAnswerWriter;
	private Date qnaAnswerCreateDate;
	private Date qnaAnswerModifyDate;
	private String qnaAnswerType;
	private String qnaAnswerStatus;
	
}
