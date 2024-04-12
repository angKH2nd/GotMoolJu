package com.kh.got.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MapVO {
	
	private String seq;
	private String roomType;
	private String sellingType;
	private String location;
	private String aptName;
	private String title;
	private String price;
	private String imgUrl;
	private String imgUrls;
	private String roomDesc;
	
}
