CREATE TABLE FAQ( -- FAQ 테이블
    FAQ_NO       		NUMBER  	NOT NULL	PRIMARY KEY,	-- 공지 번호 (100번부터 시작 1씩 증가)
    FAQ_TITLE    		VARCHAR2(1024)	NOT NULL,			-- 공지 제목
    FAQ_CONTENT  	VARCHAR2(4000)	NOT NULL,			-- 공지내용
    FAQ_REGDATE  	DATE			NOT NULL			-- 작성일
);

CREATE SEQUENCE FAQ_SEQ START WITH 100 INCREMENT BY 1 NOCYCLE;
SELECT*FROM FAQ;