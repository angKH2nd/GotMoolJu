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
	
	private String aptNo; // 아파트번호
	private String aptRoomType; // 
	private String aptSellingType; // 전월세매매
	private String aptLocationX; // x좌표
	private String aptLocationY; // y좌표
	private String aptName;
	private String aptIntroduce;
	private String aptPrice;
	private String aptImgUrl; // 대표이지미
	private String aptImgUrls; // 상세이미지
	private String aptImgUrls1; // 상세이미지1
	private String aptImgUrls2; // 상세이미지2
	private String aptImgUrls3; // 상세이미지3
	private String aptImgUrls4; // 상세이미지4
	private String aptImgUrls5; // 상세이미지5
	private String aptDesc; // 층고, 평수, 관리비
	private String aptDesc1; // 층고
	private String aptDesc2; // 평수
	private String aptDesc3; // 관리비
	private String aptReview; // 리뷰
	private String aptCount; 
	private String aptCreateDate;
	private String aptStatus; // 상태
	private String aptMemo; // 상세 설명
	private String aptRoomSize; // 전용면적
	private String aptProvisionSize; // 공급면적
	private String aptAddress; // 서울시 xx구 xx동
	private String AptDong; // 아파트동
	private String AptHo; // 아파트호
	private String AptTags; // ex)단기,주차,풀옵션,보안/안전,큰길가
	private String AptTags1; // 주차
	private String AptTags2; // 보안/안전
	private String AptTags3; // 풀옵션
	private String AptBeds; // 방 수
	private String AptBath; // 화장실 수
	private String AptEntranceType; // 계단식 복도식
	
}
