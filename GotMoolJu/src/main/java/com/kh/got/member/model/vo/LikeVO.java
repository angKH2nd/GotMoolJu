package com.kh.got.member.model.vo;

import org.springframework.security.access.annotation.Secured;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class LikeVO {

	private int dibsUserNo;
	private int dibsAptNo;
	private String dibsCreateDate;
	private String dibsStatus;
	
}
