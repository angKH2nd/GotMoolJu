-- 계정 생성용 구문
-- CREATE USER got IDENTIFIED BY got;
-- GRANT CONNECT, RESOURCE TO got;

-----------------삭제------------------
--접속유저의 모든테이블 및 제약조건 삭제
/*
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--접속유저의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
*/
--------------------------------------------------
----------------- AREA 관련 ----------------	
--------------------------------------------------
CREATE TABLE TB_AREA (
    AREA_NO NUMBER CONSTRAINT AREA_NO_PK PRIMARY KEY,
    AREA_NAME VARCHAR2(30) CONSTRAINT AREA_NAME_NN NOT NULL
);

COMMENT ON COLUMN TB_AREA.AREA_NO IS '지역 번호';
COMMENT ON COLUMN TB_AREA.AREA_NAME IS '지역 이름';

CREATE SEQUENCE SEQ_AREA_NO
NOCACHE;

INSERT INTO TB_AREA VALUES (SEQ_AREA_NO.NEXTVAL, '지역1');
INSERT INTO TB_AREA VALUES (SEQ_AREA_NO.NEXTVAL, '지역2');
INSERT INTO TB_AREA VALUES (SEQ_AREA_NO.NEXTVAL, '지역3');
--------------------------------------------------
----------------- MEMBER 관련 ---------------------	
--------------------------------------------------
CREATE TABLE TB_MEMBER (
    USER_NO NUMBER CONSTRAINT USER_NO_PK PRIMARY KEY,               
    USER_ID VARCHAR2(30) CONSTRAINT USER_ID_NN NOT NULL,
    USER_PWD VARCHAR2(100) CONSTRAINT USER_PWD_NN NOT NULL,  
    USER_NAME VARCHAR2(15) CONSTRAINT USER_NAME_NN NOT NULL, 
    USER_NICKNAME VARCHAR2(45) CONSTRAINT USER_NICKNAME_NN NOT NULL,
    USER_PHONE VARCHAR2(13) CONSTRAINT USER_PHONE_NN NOT NULL,              
    USER_EMAIL VARCHAR2(100) CONSTRAINT USER_EMAIL_NN NOT NULL,    
    USER_GENDER VARCHAR2(1) CONSTRAINT USER_GENDER_CK CHECK (USER_GENDER IN('M', 'F')),
    USER_ADDRESS VARCHAR2(100) CONSTRAINT USER_ADDRESS_NN NOT NULL,
    USER_AREA_NO NUMBER CONSTRAINT USER_AREA_NO_NN NOT NULL,
    USER_ENROLL_DATE DATE DEFAULT SYSDATE,
    USER_MODIFY_DATE DATE DEFAULT SYSDATE,
    USER_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT USER_STATUS_CK CHECK (USER_STATUS IN('Y', 'A', 'B', 'N')),
    USER_ORIGIN_NAME VARCHAR2(100),
    USER_UPDATE_NAME VARCHAR2(100),
    CONSTRAINT USER_ID_UQ UNIQUE (USER_ID),
    CONSTRAINT USER_AREA_NO_FK FOREIGN KEY (USER_AREA_NO) REFERENCES TB_AREA(AREA_NO)
);

COMMENT ON COLUMN TB_MEMBER.USER_NO IS '회원 번호';
COMMENT ON COLUMN TB_MEMBER.USER_ID IS '회원 아이디';
COMMENT ON COLUMN TB_MEMBER.USER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN TB_MEMBER.USER_NAME IS '회원 이름';
COMMENT ON COLUMN TB_MEMBER.USER_NICKNAME IS '회원 닉네임';
COMMENT ON COLUMN TB_MEMBER.USER_PHONE IS '회원 전화번호';
COMMENT ON COLUMN TB_MEMBER.USER_EMAIL IS '회원 이메일';
COMMENT ON COLUMN TB_MEMBER.USER_GENDER IS '회원 성별';
COMMENT ON COLUMN TB_MEMBER.USER_ADDRESS IS '회원 주소';
COMMENT ON COLUMN TB_MEMBER.USER_AREA_NO IS '회원 관심지';
COMMENT ON COLUMN TB_MEMBER.USER_ENROLL_DATE IS '회원 가입일';
COMMENT ON COLUMN TB_MEMBER.USER_MODIFY_DATE IS '회원 수정일';
COMMENT ON COLUMN TB_MEMBER.USER_STATUS IS '회원 상태값 (Y : 사용중 / N : 탈퇴 / A : 관리자 / B : 블랙리스트)';
COMMENT ON COLUMN TB_MEMBER.USER_ORIGIN_NAME IS '회원 프로필 원본';
COMMENT ON COLUMN TB_MEMBER.USER_UPDATE_NAME IS '회원 프로필 변경';

INSERT INTO TB_MEMBER VALUES (0, 'admin', '$2a$10$aY0LWsAmndgyE8oRH4Tneu5eAQC7UdlVXj2rk.Ob9cchdtqY/hbg.', '리상룡', '관리자', '010-1234-5678', 'admin@kh.or.kr', 'M', '서울시 강남구 역삼동', 1, '2024-03-26', '2024-03-26', 'A', 'got_admin.png', 'resources/images/member/got_admin.png');

CREATE SEQUENCE SEQ_USER_NO
NOCACHE;

INSERT INTO TB_MEMBER VALUES (SEQ_USER_NO.NEXTVAL, 'user01', '$2a$10$aY0LWsAmndgyE8oRH4Tneu5eAQC7UdlVXj2rk.Ob9cchdtqY/hbg.', '김재영', '돼지불백집이쑤시개도둑', '010-0526-1564', 'nano@kh.or.kr', 'M', '서울시 강동구 천호동', 1, '2024-03-26', '2024-03-26', 'Y', 'got_nano.png', 'resources/uploadFiles/member/2024032609000082221.png');
INSERT INTO TB_MEMBER VALUES (SEQ_USER_NO.NEXTVAL, 'user02', '$2a$10$aY0LWsAmndgyE8oRH4Tneu5eAQC7UdlVXj2rk.Ob9cchdtqY/hbg.', '류은송', '공중화장실휴지도둑', '010-1593-8423', 'resong@kh.or.kr', 'F', '서울시 광진구 중곡동', 1, '2024-03-26', '2024-03-26', 'Y', 'got_eunsong.png', 'resources/uploadFiles/member/2024032609000082222.png');
INSERT INTO TB_MEMBER VALUES (SEQ_USER_NO.NEXTVAL, 'user03', '$2a$10$aY0LWsAmndgyE8oRH4Tneu5eAQC7UdlVXj2rk.Ob9cchdtqY/hbg.', '박민규', '기사식당명함도둑', '010-7513-1513', 'park@kh.or.kr', 'M', '서울시 강동구 천호동', 1, '2024-03-26', '2024-03-26', 'Y', 'got_kyuu.jpg', 'resources/uploadFiles/member/2024032609000082223.jpg');
INSERT INTO TB_MEMBER VALUES (SEQ_USER_NO.NEXTVAL, 'user04', '$2a$10$aY0LWsAmndgyE8oRH4Tneu5eAQC7UdlVXj2rk.Ob9cchdtqY/hbg.', '신나리', '휴게소컵도둑', '010-5238-1728', 'shin@kh.or.kr', 'F', '서울시 강동구 천호동', 1, '2024-03-26', '2024-03-26', 'Y', 'got_berry.jpg', 'resources/uploadFiles/member/2024032609000082224.jpg');
INSERT INTO TB_MEMBER VALUES (SEQ_USER_NO.NEXTVAL, 'user05', '$2a$10$aY0LWsAmndgyE8oRH4Tneu5eAQC7UdlVXj2rk.Ob9cchdtqY/hbg.', '이상용', '주호민이알려주는고데기사용법', '010-4215-9178', 'leessang@kh.or.kr', 'M', '서울시 강동구 천호동', 1, '2024-03-26', '2024-03-26', 'Y', 'got_lee.jpeg', 'resources/uploadFiles/member/2024032609000082225.jpeg');
--------------------------------------------------
-------------- ANNOUNCEMENT 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_ANNOUNCEMENT (
    ANNOUNCEMENT_NO NUMBER CONSTRAINT ANNOUNCEMENT_NO_PK PRIMARY KEY,
    ANNOUNCEMENT_TITLE VARCHAR2(100) CONSTRAINT ANNOUNCEMENT_TITLE_NN NOT NULL,
    ANNOUNCEMENT_CONTENT VARCHAR2(4000) CONSTRAINT ANNOUNCEMENT_CONTENT_NN NOT NULL,
    ANNOUNCEMENT_WRITER NUMBER CONSTRAINT ANNOUNCEMENT_WRITER_NN NOT NULL,
    ANNOUNCEMENT_COUNT NUMBER DEFAULT 0,
    ANNOUNCEMENT_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT ANNOUNCEMENT_CREATE_DATE_NN NOT NULL,
    ANNOUNCEMENT_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT ANNOUNCEMENT_STATUS_CK CHECK (ANNOUNCEMENT_STATUS IN('Y', 'N')),
    CONSTRAINT ANNOUNCEMENT_WRITER_FK FOREIGN KEY(ANNOUNCEMENT_WRITER) REFERENCES TB_MEMBER(USER_NO)
);

COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_NO IS '공지 번호';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_TITLE IS '공지 제목';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_CONTENT IS '공지 내용';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_WRITER IS '공지 작성자회원번호';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_COUNT IS '공지 조회수';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_CREATE_DATE IS '공지 작성일';
COMMENT ON COLUMN TB_ANNOUNCEMENT.ANNOUNCEMENT_STATUS IS '공지 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_ANNOUNCEMENT_NO
NOCACHE;

INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '오픈! 갓물주!', '안녕하세요. 갓물주 입니다. 갓물주는 부동산 정보 조회 사이트로 이제 여러분을 찾아뵙습니다.', 0, DEFAULT, '2024-03-26', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목2!', '공지내용2', 0, DEFAULT, '2024-03-27', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목3!', '공지내용3', 0, DEFAULT, '2024-03-28', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목4!', '공지내용4', 0, DEFAULT, '2024-03-29', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목5!', '공지내용5', 0, DEFAULT, '2024-03-30', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목6!', '공지내용6', 0, DEFAULT, '2024-03-31', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목7!', '공지내용7', 0, DEFAULT, '2024-04-01', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목8!', '공지내용8', 0, DEFAULT, '2024-04-02', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목9!', '공지내용9', 0, DEFAULT, '2024-04-03', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목10!', '공지내용10', 0, DEFAULT, '2024-04-04', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목11!', '공지내용11', 0, DEFAULT, '2024-04-05', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목12!', '공지내용12', 0, DEFAULT, '2024-04-06', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목13!', '공지내용13', 0, DEFAULT, '2024-04-07', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목14!', '공지내용14', 0, DEFAULT, '2024-04-08', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목15!', '공지내용15', 0, DEFAULT, '2024-04-09', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목16!', '공지내용16', 0, DEFAULT, '2024-04-10', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목17!', '공지내용17', 0, DEFAULT, '2024-04-11', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목18!', '공지내용18', 0, DEFAULT, '2024-04-12', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목19!', '공지내용19', 0, DEFAULT, '2024-04-13', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목20!', '공지내용20', 0, DEFAULT, '2024-04-14', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목21!', '공지내용21', 0, DEFAULT, '2024-04-15', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목22!', '공지내용22', 0, DEFAULT, '2024-04-16', DEFAULT);
INSERT INTO TB_ANNOUNCEMENT VALUES (SEQ_ANNOUNCEMENT_NO.NEXTVAL, '공지제목23!', '공지내용23', 0, DEFAULT, '2024-04-17', DEFAULT);
--------------------------------------------------
----------------- FAQ 게시판 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_FAQ (
    FAQ_NO NUMBER CONSTRAINT FAQ_NO_PK PRIMARY KEY,
    FAQ_TITLE VARCHAR2(100) CONSTRAINT FAQ_TITLE_NN NOT NULL,
    FAQ_CONTENT VARCHAR2(4000) CONSTRAINT FAQ_CONTENT_NN NOT NULL,
    FAQ_WRITER NUMBER CONSTRAINT FAQ_WRITER_NN NOT NULL,
    FAQ_COUNT NUMBER DEFAULT 0,
    FAQ_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT FAQ_CREATE_DATE_NN NOT NULL,
    FAQ_MODIFY_DATE DATE DEFAULT SYSDATE,
    FAQ_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT FAQ_STATUS_CK CHECK (FAQ_STATUS IN('Y', 'N')),
    CONSTRAINT FAQ_WRITER_FK FOREIGN KEY(FAQ_WRITER) REFERENCES TB_MEMBER(USER_NO)
);

COMMENT ON COLUMN TB_FAQ.FAQ_NO IS '자주묻는질문 번호';
COMMENT ON COLUMN TB_FAQ.FAQ_TITLE IS '자주묻는질문 질문';
COMMENT ON COLUMN TB_FAQ.FAQ_CONTENT IS '자주묻는질문 답변';
COMMENT ON COLUMN TB_FAQ.FAQ_WRITER IS '자주묻는질문 작성자회원번호';
COMMENT ON COLUMN TB_FAQ.FAQ_COUNT IS '자주묻는질문 조회수';
COMMENT ON COLUMN TB_FAQ.FAQ_CREATE_DATE IS '자주묻는질문 작성일';
COMMENT ON COLUMN TB_FAQ.FAQ_MODIFY_DATE IS '자주묻는질문 수정일';
COMMENT ON COLUMN TB_FAQ.FAQ_STATUS IS '자주묻는질문 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_FAQ_NO
NOCACHE;

INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '회원 정보 변경은 어떻게 하나요?', '마이페이지 내 회원정보수정에서 언제든 변경할 수 있어요.', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '질문2', '답변2', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '질문3', '답변3', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '질문4', '답변4', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '질문5', '답변5', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '질문6', '답변6', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '질문7', '답변7', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '질문8', '답변8', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '질문9', '답변9', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
INSERT INTO TB_FAQ VALUES (SEQ_FAQ_NO.NEXTVAL, '질문10', '답변10', 0, DEFAULT, '2024-03-26', '2024-03-26', DEFAULT);
--------------------------------------------------
----------------- QNA 게시판 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_QNA (
    QNA_NO NUMBER CONSTRAINT QNA_NO_PK PRIMARY KEY,
    QNA_WRITER NUMBER CONSTRAINT QNA_WRITER_NN NOT NULL,
    QNA_TITLE VARCHAR2(100) CONSTRAINT QNA_TITLE_NN NOT NULL,
    QNA_CONTENT VARCHAR2(4000) CONSTRAINT QNA_CONTENT_NN NOT NULL,
    QNA_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT QNA_CREATE_DATE_NN NOT NULL,
    QNA_MODIFY_DATE DATE DEFAULT SYSDATE,
    QNA_ANSWER_STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT QNA_ANSWER_STATUS_CK CHECK(QNA_ANSWER_STATUS IN('Y', 'N')),
    QNA_TYPE NUMBER CONSTRAINT QNA_TYPE_CK CHECK(QNA_TYPE IN(1, 2)),
    QNA_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT QNA_STATUS_CK CHECK(QNA_STATUS IN('Y', 'N')),
    CONSTRAINT QNA_WRITER_FK FOREIGN KEY (QNA_WRITER) REFERENCES TB_MEMBER(USER_NO)
);

COMMENT ON COLUMN TB_QNA.QNA_NO IS 'QNA 번호';
COMMENT ON COLUMN TB_QNA.QNA_WRITER IS 'QNA 작성자회원번호';
COMMENT ON COLUMN TB_QNA.QNA_TITLE IS 'QNA 제목';
COMMENT ON COLUMN TB_QNA.QNA_CONTENT IS 'QNA 내용';
COMMENT ON COLUMN TB_QNA.QNA_CREATE_DATE IS 'QNA 작성일';
COMMENT ON COLUMN TB_QNA.QNA_MODIFY_DATE IS 'QNA 수정일';
COMMENT ON COLUMN TB_QNA.QNA_ANSWER_STATUS IS 'QNA 답변 상태값 (Y : 답변완료 / N : 답변대기)';
COMMENT ON COLUMN TB_QNA.QNA_TYPE IS 'QNA 유형 (1 : 일반 / 2 : 비밀)';
COMMENT ON COLUMN TB_QNA.QNA_STATUS IS 'QNA 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_QNA_NO
NOCACHE;

INSERT INTO TB_QNA(QNA_NO, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_TYPE, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 2, '문의 제목1', '문의 내용1', '2024-03-26', 'N', 1, 'Y');

INSERT INTO TB_QNA(QNA_NO, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_TYPE, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 3, '문의 제목2', '문의 내용2', '2024-03-27', 'N', 1, 'Y');

INSERT INTO TB_QNA(QNA_NO, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_TYPE, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 4, '문의 제목3', '문의 내용3', '2024-03-28', 'N', 1, 'Y');

INSERT INTO TB_QNA(QNA_NO, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_TYPE, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 5, '문의 제목4', '문의 내용4', '2024-03-29', 'N', 1, 'Y');

INSERT INTO TB_QNA(QNA_NO, QNA_WRITER, QNA_TITLE, QNA_CONTENT, QNA_CREATE_DATE, QNA_ANSWER_STATUS, QNA_TYPE, QNA_STATUS) 
VALUES(SEQ_QNA_NO.NEXTVAL, 2, '문의 제목5', '문의 내용5', '2024-03-30', 'N', 1, 'Y');
--------------------------------------------------
----------------- QNA 답변 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_QNA_ANSWER (
    QNA_ANSWER_NO NUMBER CONSTRAINT QNA_ANSWER_NO_PK PRIMARY KEY,
    QNA_ANSWER_REF_NO NUMBER CONSTRAINT QNA_ANSWER_REF_NO_NN NOT NULL,
    QNA_ANSWER_CONTENT VARCHAR2(1000) CONSTRAINT QNA_ANSWER_CONTENT NOT NULL,
    QNA_ANSWER_WRITER NUMBER CONSTRAINT QNA_ANSWER_WRITER_NN NOT NULL,
    QNA_ANSWER_CREATE_DATE DATE,
    QNA_ANSWER_MODIFY_DATE DATE,
    QNA_ANSWER_TYPE NUMBER CONSTRAINT QNA_ANSWER_TYPE_NN NOT NULL,
    QNA_ANSWER_STATUS VARCHAR2(1),
    CONSTRAINT QNA_ANSWER_REF_NO_FK FOREIGN KEY (QNA_ANSWER_REF_NO) REFERENCES TB_QNA(QNA_NO)
);

COMMENT ON COLUMN TB_QNA_ANSWER.QNA_ANSWER_NO IS '답변 번호';
COMMENT ON COLUMN TB_QNA_ANSWER.QNA_ANSWER_REF_NO IS '참조 QNA 번호';
COMMENT ON COLUMN TB_QNA_ANSWER.QNA_ANSWER_CONTENT IS '답변 내용';
COMMENT ON COLUMN TB_QNA_ANSWER.QNA_ANSWER_WRITER IS '답변 작성자 회원번호';
COMMENT ON COLUMN TB_QNA_ANSWER.QNA_ANSWER_CREATE_DATE IS '답변 작성일';
COMMENT ON COLUMN TB_QNA_ANSWER.QNA_ANSWER_MODIFY_DATE IS '답변 수정일';
COMMENT ON COLUMN TB_QNA_ANSWER.QNA_ANSWER_TYPE IS '답변 유형 (1 : 일반 / 2 : 비밀)';
COMMENT ON COLUMN TB_QNA_ANSWER.QNA_ANSWER_STATUS IS '답변 상태값 (Y : 게시 / N : 비게시)';

CREATE SEQUENCE SEQ_QNA_ANSWER_NO
NOCACHE;
--------------------------------------------------
-------------------- APT 관련 ----------------------	
--------------------------------------------------
ALTER TABLE TB_APT
ADD CONSTRAINT APT_NO_PK PRIMARY KEY (APT_NO);

COMMENT ON COLUMN TB_APT.APT_NO IS '아파트 번호';
COMMENT ON COLUMN TB_APT.APT_SELLING_TYPE IS '아파트 거래방식';
COMMENT ON COLUMN TB_APT.APT_LOCATION IS '아파트 좌표';
COMMENT ON COLUMN TB_APT.APT_NAME IS '아파트 이름';
COMMENT ON COLUMN TB_APT.APT_INTRODUCE IS '아파트 소개말';
COMMENT ON COLUMN TB_APT.APT_PRICE IS '아파트 가격';
COMMENT ON COLUMN TB_APT.APT_IMG_URL IS '아파트 대표이미지';
COMMENT ON COLUMN TB_APT.APT_IMG_URLS IS '아파트 세부이미지';
COMMENT ON COLUMN TB_APT.APT_DESC IS '아파트 층고 / 평수 / 관리비';
COMMENT ON COLUMN TB_APT.APT_REVIEW IS '아파트 리뷰';
COMMENT ON COLUMN TB_APT.APT_COUNT IS '아파트 조회수';
COMMENT ON COLUMN TB_APT.APT_CREATE_DATE IS '아파트 수정일';
COMMENT ON COLUMN TB_APT.APT_STATUS IS '아파트 상태';
COMMENT ON COLUMN TB_APT.APT_MEMO IS '아파트 상세설명';
COMMENT ON COLUMN TB_APT.APT_ROOM_SIZE IS '아파트 전용면적';
COMMENT ON COLUMN TB_APT.APT_PROVISION_SIZE IS '아파트 공급면적';
COMMENT ON COLUMN TB_APT.APT_ADDRESS IS '아파트 주소';
COMMENT ON COLUMN TB_APT.APT_DONG IS '아파트 동';
COMMENT ON COLUMN TB_APT.APT_HO IS '아파트 호';
COMMENT ON COLUMN TB_APT.APT_TAGS IS '아파트 단기/주차/풀옵션/보안 등';
COMMENT ON COLUMN TB_APT.APT_BEDS IS '아파트 방 수';
COMMENT ON COLUMN TB_APT.APT_BATH IS '아파트 화장실 수';
COMMENT ON COLUMN TB_APT.APT_ENTRANCE_TYPE IS '아파트 계단식/복도식';
--------------------------------------------------
-------------------- TOWN 관련 --------------------	
--------------------------------------------------
CREATE TABLE TB_TOWN (
    TOWN_NO NUMBER CONSTRAINT TOWN_NO_PK PRIMARY KEY,
    TOWN_WRITER VARCHAR2(50) CONSTRAINT TOWN_WRITER_NN NOT NULL,
    TOWN_WRITER_IMG VARCHAR2(100) CONSTRAINT TOWN_WRITER_IMG_NN NOT NULL,
    TOWN_TITLE VARCHAR2(100) CONSTRAINT TOWN_TITLE_NN NOT NULL,
    TOWN_CONTENT VARCHAR2(4000) CONSTRAINT TOWN_CONTENT_NN NOT NULL,
    TOWN_STAR NUMBER DEFAULT 0,
    TOWN_LIKES NUMBER DEFAULT 0,
    TOWN_CLICK NUMBER DEFAULT 0,
    TOWN_REPLY_COUNT NUMBER DEFAULT 0,
    TOWN_CREATE_DATE DATE DEFAULT SYSDATE,
    TOWN_MODIFY_DATE DATE DEFAULT SYSDATE,
    TOWN_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT TOWN_STATUS_CK CHECK(TOWN_STATUS IN('Y', 'N')),
    TOWN_THUMBNAIL VARCHAR2(1000),
    TOWN_DETAIL_IMG1 VARCHAR2(1000),
    TOWN_DETAIL_IMG2 VARCHAR2(1000),
    TOWN_DETAIL_IMG3 VARCHAR2(1000),
    TOWN_DETAIL_IMG4 VARCHAR2(1000),
    TOWN_DETAIL_IMG5 VARCHAR2(1000)
);

COMMENT ON COLUMN TB_TOWN.TOWN_NO IS '동네소식 번호';
COMMENT ON COLUMN TB_TOWN.TOWN_WRITER IS '동네소식 작성자';
COMMENT ON COLUMN TB_TOWN.TOWN_WRITER_IMG IS '동네소식 작성자 프로필';
COMMENT ON COLUMN TB_TOWN.TOWN_TITLE IS '동네소식 제목';
COMMENT ON COLUMN TB_TOWN.TOWN_CONTENT IS '동네소식 내용';
COMMENT ON COLUMN TB_TOWN.TOWN_STAR IS '동네소식 즐겨찾기';
COMMENT ON COLUMN TB_TOWN.TOWN_LIKES IS '동네소식 좋아요';
COMMENT ON COLUMN TB_TOWN.TOWN_CLICK IS '동네소식 조회수';
COMMENT ON COLUMN TB_TOWN.TOWN_REPLY_COUNT IS '동네소식 댓글수';
COMMENT ON COLUMN TB_TOWN.TOWN_CREATE_DATE IS '동네소식 작성일';
COMMENT ON COLUMN TB_TOWN.TOWN_MODIFY_DATE IS '동네소식 수정일';
COMMENT ON COLUMN TB_TOWN.TOWN_STATUS IS '동네소식 상태(Y : 게시 / N : 비게시)';
COMMENT ON COLUMN TB_TOWN.TOWN_THUMBNAIL IS '동네소식 대표이미지';
COMMENT ON COLUMN TB_TOWN.TOWN_DETAIL_IMG1 IS '동네소식 상세이미지';
COMMENT ON COLUMN TB_TOWN.TOWN_DETAIL_IMG2 IS '동네소식 상세이미지';
COMMENT ON COLUMN TB_TOWN.TOWN_DETAIL_IMG3 IS '동네소식 상세이미지';
COMMENT ON COLUMN TB_TOWN.TOWN_DETAIL_IMG4 IS '동네소식 상세이미지';
COMMENT ON COLUMN TB_TOWN.TOWN_DETAIL_IMG5 IS '동네소식 상세이미지';

CREATE SEQUENCE SEQ_TOWN_NO
NOCACHE;

INSERT INTO TB_TOWN (TOWN_NO, TOWN_WRITER, TOWN_WRITER_IMG, TOWN_TITLE, TOWN_CONTENT) VALUES (SEQ_TOWN_NO.NEXTVAL, '돼지불백집이쑤시개도둑', 'resources/uploadFiles/member/2024032609000082221.png', '동네소식 제목1', '동네소식 내용1');
INSERT INTO TB_TOWN (TOWN_NO, TOWN_WRITER, TOWN_WRITER_IMG, TOWN_TITLE, TOWN_CONTENT) VALUES (SEQ_TOWN_NO.NEXTVAL, '돼지불백집이쑤시개도둑', 'resources/uploadFiles/member/2024032609000082221.png', '동네소식 제목2', '동네소식 내용2');
INSERT INTO TB_TOWN (TOWN_NO, TOWN_WRITER, TOWN_WRITER_IMG, TOWN_TITLE, TOWN_CONTENT) VALUES (SEQ_TOWN_NO.NEXTVAL, '돼지불백집이쑤시개도둑', 'resources/uploadFiles/member/2024032609000082221.png', '동네소식 제목3', '동네소식 내용3');
INSERT INTO TB_TOWN (TOWN_NO, TOWN_WRITER, TOWN_WRITER_IMG, TOWN_TITLE, TOWN_CONTENT) VALUES (SEQ_TOWN_NO.NEXTVAL, '돼지불백집이쑤시개도둑', 'resources/uploadFiles/member/2024032609000082221.png', '동네소식 제목4', '동네소식 내용4');
INSERT INTO TB_TOWN (TOWN_NO, TOWN_WRITER, TOWN_WRITER_IMG, TOWN_TITLE, TOWN_CONTENT) VALUES (SEQ_TOWN_NO.NEXTVAL, '돼지불백집이쑤시개도둑', 'resources/uploadFiles/member/2024032609000082221.png', '동네소식 제목5', '동네소식 내용5');
INSERT INTO TB_TOWN (TOWN_NO, TOWN_WRITER, TOWN_WRITER_IMG, TOWN_TITLE, TOWN_CONTENT) VALUES (SEQ_TOWN_NO.NEXTVAL, '돼지불백집이쑤시개도둑', 'resources/uploadFiles/member/2024032609000082221.png', '동네소식 제목6', '동네소식 내용6');
--------------------------------------------------
----------------- TOWN-REPLY 관련 -----------------	
--------------------------------------------------
CREATE TABLE TB_TOWN_REPLY (
    TOWN_REPLY_NO NUMBER CONSTRAINT TOWN_REPLY_NO_PK PRIMARY KEY,
    TOWN_REPLY_REF_NO NUMBER CONSTRAINT TOWN_REPLY_REF_NO_NN NOT NULL,
    TOWN_REPLY_WRITER VARCHAR2(50) CONSTRAINT TOWN_REPLY_WRITER_NN NOT NULL,
    TOWN_REPLY_WRITER_IMG VARCHAR2(100) CONSTRAINT TOWN_REPLY_WRITER_IMG_NN NOT NULL,
    TOWN_REPLY_CONTENT VARCHAR2(4000) CONSTRAINT TOWN_REPLY_CONTENT_NN NOT NULL,
    TOWN_REPLY_CREATE_DATE DATE DEFAULT SYSDATE,
    TOWN_REPLY_MODIFY_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT TOWN_REPLY_REF_NO_FK FOREIGN KEY (TOWN_REPLY_REF_NO) REFERENCES TB_TOWN(TOWN_NO)
);

COMMENT ON COLUMN TB_TOWN_REPLY.TOWN_REPLY_NO IS '동네소식 댓글 번호';
COMMENT ON COLUMN TB_TOWN_REPLY.TOWN_REPLY_REF_NO IS '동네소식 번호';
COMMENT ON COLUMN TB_TOWN_REPLY.TOWN_REPLY_WRITER IS '동네소식 댓글 작성자';
COMMENT ON COLUMN TB_TOWN_REPLY.TOWN_REPLY_WRITER_IMG IS '동네소식 댓글 작성자 프로필';
COMMENT ON COLUMN TB_TOWN_REPLY.TOWN_REPLY_CONTENT IS '동네소식 댓글 내용';
COMMENT ON COLUMN TB_TOWN_REPLY.TOWN_REPLY_CREATE_DATE IS '동네소식 댓글 작성일';
COMMENT ON COLUMN TB_TOWN_REPLY.TOWN_REPLY_MODIFY_DATE IS '동네소식 댓글 수정일';

CREATE SEQUENCE SEQ_TOWN_REPLY_NO
NOCACHE;

INSERT INTO TB_TOWN_REPLY (TOWN_REPLY_NO, TOWN_REPLY_REF_NO, TOWN_REPLY_WRITER, TOWN_REPLY_WRITER_IMG, TOWN_REPLY_CONTENT)
VALUES (SEQ_TOWN_REPLY_NO.NEXTVAL, 1, '공중화장실휴지도둑', 'resources/uploadFiles/member/2024032609000082222.png', '댓글달아봅니다1');
INSERT INTO TB_TOWN_REPLY (TOWN_REPLY_NO, TOWN_REPLY_REF_NO, TOWN_REPLY_WRITER, TOWN_REPLY_WRITER_IMG, TOWN_REPLY_CONTENT)
VALUES (SEQ_TOWN_REPLY_NO.NEXTVAL, 1, '공중화장실휴지도둑', 'resources/uploadFiles/member/2024032609000082222.png', '댓글달아봅니다2');
INSERT INTO TB_TOWN_REPLY (TOWN_REPLY_NO, TOWN_REPLY_REF_NO, TOWN_REPLY_WRITER, TOWN_REPLY_WRITER_IMG, TOWN_REPLY_CONTENT)
VALUES (SEQ_TOWN_REPLY_NO.NEXTVAL, 1, '기사식당명함도둑', 'resources/uploadFiles/member/2024032609000082223.png', '댓글달아봅니다3');
INSERT INTO TB_TOWN_REPLY (TOWN_REPLY_NO, TOWN_REPLY_REF_NO, TOWN_REPLY_WRITER, TOWN_REPLY_WRITER_IMG, TOWN_REPLY_CONTENT)
VALUES (SEQ_TOWN_REPLY_NO.NEXTVAL, 3, '휴게소컵도둑', 'resources/uploadFiles/member/2024032609000082224.png', '댓글달아봅니다4');
INSERT INTO TB_TOWN_REPLY (TOWN_REPLY_NO, TOWN_REPLY_REF_NO, TOWN_REPLY_WRITER, TOWN_REPLY_WRITER_IMG, TOWN_REPLY_CONTENT)
VALUES (SEQ_TOWN_REPLY_NO.NEXTVAL, 3, '주호민이알려주는고데기사용법', 'resources/uploadFiles/member/2024032609000082225.png', '댓글달아봅니다5');
INSERT INTO TB_TOWN_REPLY (TOWN_REPLY_NO, TOWN_REPLY_REF_NO, TOWN_REPLY_WRITER, TOWN_REPLY_WRITER_IMG, TOWN_REPLY_CONTENT)
VALUES (SEQ_TOWN_REPLY_NO.NEXTVAL, 4, '주호민이알려주는고데기사용법', 'resources/uploadFiles/member/2024032609000082225.png', '댓글달아봅니다6');
--------------------------------------------------
----------------- TOWN-STAR 관련 -----------------	
--------------------------------------------------
CREATE TABLE TB_TOWN_STAR (
    TOWN_STAR_REF_NO NUMBER CONSTRAINT TOWN_STAR_REF_NO_NN NOT NULL,
    TOWN_STAR_USER_NO NUMBER CONSTRAINT TOWN_STAR_USER_NO_NN NOT NULL
);

COMMENT ON COLUMN TB_TOWN_STAR.TOWN_STAR_REF_NO IS '즐겨찾기 동네소식 번호';
COMMENT ON COLUMN TB_TOWN_STAR.TOWN_STAR_USER_NO IS '즐겨찾기 회원번호';

INSERT INTO TB_TOWN_STAR VALUES(1, 2);
INSERT INTO TB_TOWN_STAR VALUES(2, 3);
INSERT INTO TB_TOWN_STAR VALUES(4, 3);
INSERT INTO TB_TOWN_STAR VALUES(4, 4);
INSERT INTO TB_TOWN_STAR VALUES(5, 5);
INSERT INTO TB_TOWN_STAR VALUES(5, 2);
--------------------------------------------------
----------------- NOTICE 알림 관련 -----------------	
--------------------------------------------------
CREATE TABLE TB_NOTICE (
    NOTICE_NO NUMBER CONSTRAINT NOTICE_NO_PK PRIMARY KEY,
    NOTICE_TITLE VARCHAR2(100) CONSTRAINT NOTICE_TITLE_NN NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) CONSTRAINT NOTICE_CONTENT_NN NOT NULL,
    NOTICE_WRITER NUMBER CONSTRAINT NOTICE_WRITER_NN NOT NULL,
    NOTICE_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT NOTICE_CREATE_DATE_NN NOT NULL,
    NOTICE_TYPE NUMBER DEFAULT 1 CONSTRAINT NOTICE_TYPE_CK CHECK (NOTICE_TYPE IN(1, 2, 3, 4)),
    NOTICE_STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT NOTICE_STATUS_CK CHECK (NOTICE_STATUS IN('Y', 'N')),
    NOTICE_RECEIVER_NO NUMBER,
    NOTICE_ANNOUNCEMENT_NO NUMBER,
    NOTICE_QNA_NO NUMBER,
    NOTICE_APT_NO NUMBER,
    NOTICE_REVIEW_NO NUMBER,
    CONSTRAINT NOTICE_WRITER_FK FOREIGN KEY(NOTICE_WRITER) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT NOTICE_ANNOUNCEMENT_NO_FK FOREIGN KEY(NOTICE_ANNOUNCEMENT_NO) REFERENCES TB_ANNOUNCEMENT(ANNOUNCEMENT_NO),
    CONSTRAINT NOTICE_QNA_NO_FK FOREIGN KEY(NOTICE_QNA_NO) REFERENCES TB_QNA(QNA_NO),
    CONSTRAINT NOTICE_APT_NO_FK FOREIGN KEY(NOTICE_APT_NO) REFERENCES TB_APT(APT_NO),
    CONSTRAINT NOTICE_REVIEW_NO_FK FOREIGN KEY(NOTICE_REVIEW_NO) REFERENCES TB_REVIEW(REVIEW_NO)
);

COMMENT ON COLUMN TB_NOTICE.NOTICE_NO IS '알림 번호';
COMMENT ON COLUMN TB_NOTICE.NOTICE_TITLE IS '알림 제목';
COMMENT ON COLUMN TB_NOTICE.NOTICE_CONTENT IS '알림 내용';
COMMENT ON COLUMN TB_NOTICE.NOTICE_WRITER IS '알림 작성자회원번호';
COMMENT ON COLUMN TB_NOTICE.NOTICE_CREATE_DATE IS '알림 작성일';
COMMENT ON COLUMN TB_NOTICE.NOTICE_TYPE IS '알림 유형 (1 : 일반 공지 / 2 : 프로젝트 알림 / 3 : QNA 알림)';
COMMENT ON COLUMN TB_NOTICE.NOTICE_STATUS IS '알림 상태값 (Y : 읽음 / N : 안읽음)';
COMMENT ON COLUMN TB_NOTICE.NOTICE_RECEIVER_NO IS '알림 수신자';
COMMENT ON COLUMN TB_NOTICE.NOTICE_ANNOUNCEMENT_NO IS '알림 참조글 (공지)';
COMMENT ON COLUMN TB_NOTICE.NOTICE_QNA_NO IS '알림 참조글 (QNA)';
COMMENT ON COLUMN TB_NOTICE.NOTICE_APT_NO IS '알림 참조글 (부동산)';
COMMENT ON COLUMN TB_NOTICE.NOTICE_REVIEW_NO IS '알림 참조글 (임장)';

CREATE SEQUENCE SEQ_NOTICE_NO
NOCACHE;

INSERT INTO TB_NOTICE (NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_WRITER, NOTICE_CREATE_DATE, NOTICE_TYPE, NOTICE_ANNOUNCEMENT_NO)
VALUES (SEQ_NOTICE_NO.NEXTVAL, '공지사항', '안녕하세요. 갓물주 입니다. 갓물주는 부동산 정보 조회 사이트로 이제 여러분을 찾아뵙습니다.', 1, '2024-03-26', 1, 1);
--------------------------------------------------
------------------ DIBS 관련 ---------------------	
--------------------------------------------------
CREATE TABLE TB_DIBS (
    DIBS_USER_NO NUMBER, 
    DIBS_APT_NO NUMBER, 
    DIBS_CREATE_DATE DATE DEFAULT SYSDATE CONSTRAINT DIBS_CREATE_DATE_NN NOT NULL,
    DIBS_STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT DIBS_STATUS_CK CHECK(DIBS_STATUS IN('Y', 'N')),
    CONSTRAINT DIBS_PK PRIMARY KEY (DIBS_USER_NO, DIBS_APT_NO),
    CONSTRAINT DIBS_USER_NO_FK FOREIGN KEY (DIBS_USER_NO) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT DIBS_APT_NO_FK FOREIGN KEY (DIBS_APT_NO) REFERENCES TB_APT(APT_NO)
);

COMMENT ON COLUMN TB_DIBS.DIBS_USER_NO IS '찜 회원번호';
COMMENT ON COLUMN TB_DIBS.DIBS_APT_NO IS '찜 프로젝트번호';
COMMENT ON COLUMN TB_DIBS.DIBS_CREATE_DATE IS '찜 등록일';
COMMENT ON COLUMN TB_DIBS.DIBS_STATUS IS '찜 상태값 (Y : 찜 / N : 찜 해제)';

CREATE SEQUENCE SEQ_DIBS_NO
NOCACHE;
--------------------------------------------------
----------------- ATTACHMENT 관련 -----------------	
--------------------------------------------------
CREATE TABLE TB_ATTACHMENT (
    ATTACHMENT_NO NUMBER CONSTRAINT ATTACHMENT_NO_PK PRIMARY KEY,
    ATTACHMENT_TOWN_NO NUMBER,
    ATTACHMENT_REVIEW_NO NUMBER,
    ATTACHMENT_ORIGIN_NAME VARCHAR2(255) CONSTRAINT ATTACHMENT_ORIGIN_NAME_NN NOT NULL,
    ATTACHMENT_UPDATE_NAME VARCHAR2(255) CONSTRAINT ATTACHMENT_UPDATE_NAME_NN NOT NULL,
    ATTACHMENT_PATH VARCHAR2(1000),
    ATTACHMENT_UPLOAD_DATE DATE DEFAULT SYSDATE CONSTRAINT ATTACHMENT_UPLOAD_DATE_NN NOT NULL,
    ATTACHMENT_LEVEL NUMBER CONSTRAINT ATTACHMENT_LEVEL_NN NOT NULL,
    ATTACHMENT_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT ATTACHMENT_STATUS_CK CHECK(ATTACHMENT_STATUS IN('Y', 'N')),
    CONSTRAINT ATTACHMENT_REVIEW_NO_FK FOREIGN KEY (ATTACHMENT_REVIEW_NO) REFERENCES TB_REVIEW(REVIEW_NO)
);

COMMENT ON COLUMN TB_ATTACHMENT.ATTACHMENT_NO IS '파일 번호';
COMMENT ON COLUMN TB_ATTACHMENT.ATTACHMENT_TOWN_NO IS '파일 참조게시글번호 (TOWN)';
COMMENT ON COLUMN TB_ATTACHMENT.ATTACHMENT_REVIEW_NO IS '파일 참조게시글번호 (QNA)';
COMMENT ON COLUMN TB_ATTACHMENT.ATTACHMENT_ORIGIN_NAME IS '파일 원본파일명';
COMMENT ON COLUMN TB_ATTACHMENT.ATTACHMENT_UPDATE_NAME IS '파일 수정파일명';
COMMENT ON COLUMN TB_ATTACHMENT.ATTACHMENT_PATH IS '파일 저장폴더경로';
COMMENT ON COLUMN TB_ATTACHMENT.ATTACHMENT_UPLOAD_DATE IS '파일 업로드일';
COMMENT ON COLUMN TB_ATTACHMENT.ATTACHMENT_LEVEL IS '파일 레벨 (1 : 메인 / 2 : 서브)';
COMMENT ON COLUMN TB_ATTACHMENT.ATTACHMENT_STATUS IS '파일 상태값 (Y : 유효 / N : 비유효)';

CREATE SEQUENCE SEQ_ATTACHMENT_NO
NOCACHE;

INSERT INTO TB_ATTACHMENT (ATTACHMENT_NO, ATTACHMENT_TOWN_NO, ATTACHMENT_ORIGIN_NAME, ATTACHMENT_UPDATE_NAME, ATTACHMENT_PATH, ATTACHMENT_LEVEL)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, 2, 'TOWN_SAMPLE1.jpg', '202404180900050001.jpg', 'resources/uploadFiles/town/', 1);

INSERT INTO TB_ATTACHMENT (ATTACHMENT_NO, ATTACHMENT_TOWN_NO, ATTACHMENT_ORIGIN_NAME, ATTACHMENT_UPDATE_NAME, ATTACHMENT_PATH, ATTACHMENT_LEVEL)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, 2, 'TOWN_SAMPLE1.jpg', '202404180900050002.jpg', 'resources/uploadFiles/town/', 2);
INSERT INTO TB_ATTACHMENT (ATTACHMENT_NO, ATTACHMENT_TOWN_NO, ATTACHMENT_ORIGIN_NAME, ATTACHMENT_UPDATE_NAME, ATTACHMENT_PATH, ATTACHMENT_LEVEL)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, 2, 'TOWN_SAMPLE1.jpg', '202404180900050003.jpg', 'resources/uploadFiles/town/', 2);
--------------------------------------------------
------------------ SHARE 관련 ---------------------	
--------------------------------------------------
CREATE TABLE TB_SHARE (
    SHARE_APT_NO NUMBER CONSTRAINT SHARE_APT_NO_NN NOT NULL,
    SHARE_COUNT NUMBER DEFAULT 0,
    CONSTRAINT SHARE_APT_NO_FK FOREIGN KEY (SHARE_APT_NO) REFERENCES TB_APT(APT_NO)
);

COMMENT ON COLUMN TB_SHARE.SHARE_APT_NO IS '공유 부동산 번호';
COMMENT ON COLUMN TB_SHARE.SHARE_COUNT IS '공유 횟수';
--------------------------------------------------
------------------- LIKES 관련 ---------------------	
--------------------------------------------------
CREATE TABLE TB_LIKES (
    LIKES_APT_NO NUMBER CONSTRAINT LIKES_APT_NO_NN NOT NULL,
    LIKES_COUNT NUMBER DEFAULT 0,
    CONSTRAINT LIKES_APT_NO_FK FOREIGN KEY (LIKES_APT_NO) REFERENCES TB_APT(APT_NO)
);

COMMENT ON COLUMN TB_LIKES.LIKES_APT_NO IS '좋아요 부동산 번호';
COMMENT ON COLUMN TB_LIKES.LIKES_COUNT IS '좋아요 횟수';

--------------------------------------------------
---------------- IMPROVEMENT 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_IMPROVEMENT (
    IMP_REPLY_NO NUMBER CONSTRAINT IMP_REPLY_NO_PK PRIMARY KEY,
    IMP_REPLY_CONTENT VARCHAR2(600) CONSTRAINT IMP_REPLY_CONTENT_NN NOT NULL,
    IMP_REPLY_WRITER VARCHAR2(50) CONSTRAINT IMP_REPLY_WRITER_NN NOT NULL,
    IMP_REPLY_PROFILE VARCHAR2(100) CONSTRAINT IMP_REPLY_PROFILE_NN NOT NULL,
    IMP_REPLY_TYPE VARCHAR2(1) DEFAULT 'O' CONSTRAINT IMP_REPLY_TYPE_CK CHECK(IMP_REPLY_TYPE IN('O', 'S')),
    IMP_REPLY_CREATE_DATE DATE DEFAULT SYSDATE,
    IMP_REPLY_MODIFY_DATE DATE DEFAULT SYSDATE,
    IMP_REPLY_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT IMP_REPLY_STATUS_CK CHECK(IMP_REPLY_STATUS IN('Y', 'N'))
);

CREATE SEQUENCE SEQ_IMP_REPLY_NO
NOCACHE;

COMMENT ON COLUMN TB_IMPROVEMENT.IMP_REPLY_NO IS '개선의견 번호';
COMMENT ON COLUMN TB_IMPROVEMENT.IMP_REPLY_CONTENT IS '개선의견 내용';
COMMENT ON COLUMN TB_IMPROVEMENT.IMP_REPLY_WRITER IS '개선의견 작성자 닉네임';
COMMENT ON COLUMN TB_IMPROVEMENT.IMP_REPLY_PROFILE IS '개선의견 작성자 이미지';
COMMENT ON COLUMN TB_IMPROVEMENT.IMP_REPLY_TYPE IS '개선의견 상태값 (O : 일반 / S : 비밀)';
COMMENT ON COLUMN TB_IMPROVEMENT.IMP_REPLY_CREATE_DATE IS '개선의견 작성일';
COMMENT ON COLUMN TB_IMPROVEMENT.IMP_REPLY_MODIFY_DATE IS '개선의견 수정일';
COMMENT ON COLUMN TB_IMPROVEMENT.IMP_REPLY_STATUS IS '개선의견 상태값 (Y : 게시 / N : 비게시)';

INSERT INTO TB_IMPROVEMENT (IMP_REPLY_NO, IMP_REPLY_CONTENT, IMP_REPLY_WRITER, IMP_REPLY_PROFILE, IMP_REPLY_TYPE) VALUES (SEQ_IMP_REPLY_NO.NEXTVAL, '사이트가 너무 이뻐요', '돼지불백집이쑤시개도둑', 'resources/uploadFiles/member/2024032609000082221.png', 'O');
INSERT INTO TB_IMPROVEMENT (IMP_REPLY_NO, IMP_REPLY_CONTENT, IMP_REPLY_WRITER, IMP_REPLY_PROFILE, IMP_REPLY_TYPE) VALUES (SEQ_IMP_REPLY_NO.NEXTVAL, '주호민이알려주는고데기사용법 저 회원 너무 시끄러워요', '돼지불백집이쑤시개도둑', 'resources/uploadFiles/member/2024032609000082221.png', 'O');
INSERT INTO TB_IMPROVEMENT (IMP_REPLY_NO, IMP_REPLY_CONTENT, IMP_REPLY_WRITER, IMP_REPLY_PROFILE, IMP_REPLY_TYPE) VALUES (SEQ_IMP_REPLY_NO.NEXTVAL, '앞으로도 화이팅!', '공중화장실휴지도둑', 'resources/uploadFiles/member/2024032609000082222.png', 'O');
INSERT INTO TB_IMPROVEMENT (IMP_REPLY_NO, IMP_REPLY_CONTENT, IMP_REPLY_WRITER, IMP_REPLY_PROFILE, IMP_REPLY_TYPE) VALUES (SEQ_IMP_REPLY_NO.NEXTVAL, '주호민 저 사람 제재해주실 수 있을까요?', '공중화장실휴지도둑', 'resources/uploadFiles/member/2024032609000082222.png', 'O');
INSERT INTO TB_IMPROVEMENT (IMP_REPLY_NO, IMP_REPLY_CONTENT, IMP_REPLY_WRITER, IMP_REPLY_PROFILE, IMP_REPLY_TYPE) VALUES (SEQ_IMP_REPLY_NO.NEXTVAL, '지도가 참 아름답네요', '기사식당명함도둑', 'resources/uploadFiles/member/2024032609000082223.jpg', 'O');
INSERT INTO TB_IMPROVEMENT (IMP_REPLY_NO, IMP_REPLY_CONTENT, IMP_REPLY_WRITER, IMP_REPLY_PROFILE, IMP_REPLY_TYPE) VALUES (SEQ_IMP_REPLY_NO.NEXTVAL, '신고 기능도 추가해주세요! 신고하고 싶은 사람이 있어요! ㅎㅎ', '휴게소컵도둑', 'resources/uploadFiles/member/2024032609000082224.jpg', 'O');
INSERT INTO TB_IMPROVEMENT (IMP_REPLY_NO, IMP_REPLY_CONTENT, IMP_REPLY_WRITER, IMP_REPLY_PROFILE, IMP_REPLY_TYPE) VALUES (SEQ_IMP_REPLY_NO.NEXTVAL, '억울해요', '주호민이알려주는고데기사용법', 'resources/uploadFiles/member/2024032609000082225.jpeg', 'O');

--------------------------------------------------
---------------- IMP_CHOOSE 관련 ------------------	
--------------------------------------------------
CREATE TABLE TB_IMP_CHOOSE (
    IMP_CHOOSE_USER_NO NUMBER,
    IMP_CHOOSE_REPLY_NO NUMBER,
    IMP_CHOOSE_CREATE_DATE DATE DEFAULT SYSDATE,
    IMP_CHOOSE_STATUS VARCHAR2(1) CONSTRAINT IMP_CHOOSE_STATUS_CK CHECK(IMP_CHOOSE_STATUS IN ('1', '2')),
    CONSTRAINT IMP_CHOOSE_USER_NO_FK FOREIGN KEY (IMP_CHOOSE_USER_NO) REFERENCES TB_MEMBER(USER_NO),
    CONSTRAINT IMP_CHOOSE_REPLY_NO_FK FOREIGN KEY (IMP_CHOOSE_REPLY_NO) REFERENCES TB_IMPROVEMENT(IMP_REPLY_NO)
);

CREATE OR REPLACE TRIGGER remove_duplicate_imp_choose
BEFORE INSERT ON TB_IMP_CHOOSE
FOR EACH ROW
DECLARE
    existing_row_count NUMBER;
BEGIN
    -- 중복된 행의 수를 카운트
    SELECT COUNT(*)
    INTO existing_row_count
    FROM TB_IMP_CHOOSE
    WHERE IMP_CHOOSE_USER_NO = :NEW.IMP_CHOOSE_USER_NO
    AND IMP_CHOOSE_REPLY_NO = :NEW.IMP_CHOOSE_REPLY_NO;

    -- 중복된 행이 있으면 삭제
    IF existing_row_count > 0 THEN
        DELETE FROM TB_IMP_CHOOSE
        WHERE IMP_CHOOSE_USER_NO = :NEW.IMP_CHOOSE_USER_NO
        AND IMP_CHOOSE_REPLY_NO = :NEW.IMP_CHOOSE_REPLY_NO;
    END IF;
END;
/

COMMENT ON COLUMN TB_IMP_CHOOSE.IMP_CHOOSE_USER_NO IS '의견 좋아요싫어요 회원번호';
COMMENT ON COLUMN TB_IMP_CHOOSE.IMP_CHOOSE_REPLY_NO IS '의견 좋아요싫어요 의견번호';
COMMENT ON COLUMN TB_IMP_CHOOSE.IMP_CHOOSE_CREATE_DATE IS '의견 좋아요싫어요 등록일';
COMMENT ON COLUMN TB_IMP_CHOOSE.IMP_CHOOSE_STATUS IS '의견 좋아요싫어요 상태 (1 : 좋아요 / 2 : 싫어요)';

INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(2, 1, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(3, 1, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(4, 1, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(5, 1, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(2, 2, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(3, 2, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(4, 2, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(5, 2, 2);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(1, 3, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(3, 3, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(4, 3, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(5, 3, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(1, 4, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(3, 4, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(4, 4, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(5, 4, 2);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(1, 5, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(2, 5, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(4, 5, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(5, 5, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(1, 6, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(2, 6, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(3, 6, 1);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(5, 6, 2);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(1, 7, 2);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(2, 7, 2);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(3, 7, 2);
INSERT INTO TB_IMP_CHOOSE(IMP_CHOOSE_USER_NO, IMP_CHOOSE_REPLY_NO, IMP_CHOOSE_STATUS) VALUES(4, 7, 2);











COMMIT;






