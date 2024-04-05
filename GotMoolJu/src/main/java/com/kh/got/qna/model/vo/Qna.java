package com.kh.got.qna.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Qna {
	
	private int qnaNo;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaCreateDate;
	private Date qnaModifyDate;
	private String qnaAnswerStatus;
	private String qnaType;
	private String qnaStatus;
	
}
