package com.kh.got.faq.model.vo;

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
public class Faq {
	
	private String faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqWriter;
	private String faqCount;
	private Date faqCreateDate;
	private Date faqModifyDate;
	private String faqStatus;

}
