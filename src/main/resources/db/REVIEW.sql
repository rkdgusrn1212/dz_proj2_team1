CREATE TABLE REVIEW( -- 리뷰 테이블
    REVIEW_NO       	NUMBER  	NOT NULL	PRIMARY KEY,	-- 리뷰 고유번호 (100번부터 시작 1씩 증가)
    REVIEW_CONTENT  	NVARCHAR2(1000)	NOT NULL,			-- 리뷰 내용
    REVIEW_RESTAURANT   NUMBER		NOT NULL CONSTRAINT FK_REVIEW_R REFERENCES RESTAURANT(RESTAURANT_NO) ON DELETE CASCADE,			-- 리뷰할 식당 FK ( RESTAURANT 테이블의 PK 참조 )
    REVIEW_WRITER   	NUMBER		CONSTRAINT   FK_REVIEW_M REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE,			-- 작성자	 FK ( MEMBER 테이블의 PK 참조 )
    REVIEW_STAR     	NUMBER		NOT NULL,			-- 별점
    REVIEW_REGDATE  	DATE		NOT NULL			-- 작성일
);

CREATE SEQUENCE REVIEW_SEQ START WITH 100 INCREMENT BY 1 NOCYCLE;
SELECT*FROM REVIEW;