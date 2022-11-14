CREATE TABLE MANAGER( -- 관리자 테이블
M_ID  		VARCHAR2(128)	NOT NULL	PRIMARY KEY,	-- 아이디
M_PWD  		CHAR(60)  	NOT NULL,			-- 비밀번호
M_MAIL    	VARCHAR2(128)   	NOT NULL    	UNIQUE,		-- 이메일
M_ROOT 		CHAR(1),			-- 루트관리자
M_RESTAURANT  	CHAR(1),			-- 식당관리
M_REPORT    	CHAR(1),			-- 신고관리
M_QNA   	CHAR(1),			-- QnA 관리
M_MEMBER    	CHAR(1),			-- 회원관리
M_FAQ   		CHAR(1),			-- FAQ관리
M_NOTICE    	CHAR(1)			-- 공지관리
);
