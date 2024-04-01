-- 계정 생성용 구문
-- CREATE USER got IDENTIFIED BY got;
-- GRANT CONNECT, RESOURCE TO got;

---------------------- 삭제 ----------------------
DROP TABLE TB_LIKES;                -- 부동산 좋아요
DROP TABLE TB_SHARE;                -- 부동산 공유
DROP TABLE TB_REVIEW;               -- 임장 후기
DROP TABLE TB_ATTACHMENT;           -- 파일
DROP TABLE TB_DIBS;                 -- 찜
DROP TABLE TB_RP_CATEGORY;          -- 신고 카테고리
DROP TABLE TB_REPORT;               -- 신고
DROP TABLE TB_CHAT;                 -- 채팅
DROP TABLE TB_NOTICE;               -- 알림
DROP TABLE TB_QNA;                  -- Q&A
DROP TABLE TB_FAQ;                  -- FAQ
DROP TABLE TB_ANNOUNCEMENT;         -- 공지
DROP TABLE TB_MEMBER;               -- 회원


DROP SEQUENCE SEQ_REVIEW_NO;         -- 댓글 번호 발생 시퀀스
DROP SEQUENCE SEQ_ATTACHMENT_NO;     -- 파일 번호 발생 시퀀스
DROP SEQUENCE SEQ_DIBS_NO;           -- 찜하기 번호 발생 시퀀스
DROP SEQUENCE SEQ_REPORT_NO;         -- 신고 번호 발생 시퀀스
DROP SEQUENCE SEQ_CHAT_NO;           -- 채팅 번호 발생 시퀀스
DROP SEQUENCE SEQ_NOTICE_NO;         -- 알림 번호 발생 시퀀스
DROP SEQUENCE SEQ_QNA_NO;            -- QNA 번호 발생 시퀀스
DROP SEQUENCE SEQ_FAQ_NO;            -- FAQ 번호 발생 시퀀스
DROP SEQUENCE SEQ_ANNOUNCEMENT_NO;   -- 공지 번호 발생 시퀀스
DROP SEQUENCE SEQ_USER_NO;           -- 회원 번호 발생 시퀀스


