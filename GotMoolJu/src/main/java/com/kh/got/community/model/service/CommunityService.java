package com.kh.got.community.model.service;

import java.util.ArrayList;

import com.google.gson.JsonElement;
import com.kh.got.community.model.vo.Town;
import com.kh.got.community.model.vo.TownReply;
import com.kh.got.community.model.vo.TownStar;

public interface CommunityService {

	// 1. 커뮤니티 조회 서비스
	ArrayList<Town> selectTownList();
	ArrayList<TownStar> isMyTown(int userNo);

	// 2. 커뮤니티 좋아요 서비스
	int updateTownLikes(int townNo);

	// 3. 커뮤니티 즐겨찾기 서비스
	int updateTownStar(int townNo, int userNo);
	
	// 4. 커뮤니티 내 최고 인기글 서비스
	Town selectMyBestTown(String userNickname);
	
	// 5. 커뮤니티 즐겨찾기 목록 조회 서비스
	ArrayList<Town> selectTownStarList(int userNo);
	
	// 6. 커뮤니티 내가 받은 별 조회 서비스
	int selectMyStarCount(String userNickname);
	
	// 7. 커뮤니티 글 작성 서비스
	int insertTown(Town t);
	
	// 8. 커뮤니티 조회수 증가 서비스
	int increaseTownClick(int townNo);
	
	// 9. 커뮤니티 상세조회서비스
	boolean isMyStarTown(int userNo, int townNo);
	Town selectTownDetail(int townNo);
	ArrayList<TownReply> selectTownReplyList(int townNo);
	
	// 10. 커뮤니티 댓글 등록 서비스
	int insertTownReply(TownReply tr);
	
	// 11. 커뮤니티 인기 동네소식 사진 조회 서비스
	Town selectBestTownPicture();
	
	// 12. 커뮤니티 조회수 감소 서비스
	int decreaseTownClick(int townNo);
	
	// 13. 커뮤니티 삭제 서비스
	int deleteTown(int townNo);
	
	// 14. 커뮤니티 수정 서비스
	int updateTown(Town t);
	
	// 15. 핫이슈 조회 서비스
	ArrayList<Town> selectTownHotList();
	
	// 16. 명예의 전당 조회 서비스
	ArrayList<Town> selectTownRankCount();
	
}
