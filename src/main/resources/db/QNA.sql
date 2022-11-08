CREATE TABLE QNA( -- 고객센터 QnA 테이블
    QNA_NO          NUMBER  	    NOT NULL        PRIMARY KEY,	    -- 문의 번호 (100번부터 시작 1씩 증가)
    QNA_TITLE    	NVARCHAR2(60)	NOT NULL,       -- 문의 제목
    QNA_CONTENT 	NVARCHAR2(1000)   NOT NULL,	    -- 문의 내용
    QNA_REGDATE  	DATE            NOT NULL,		-- 작성일
    QNA_WRITER      NUMBER,						    -- 회원 작성자	FK ( MEMBER 테이블 PK 참조 )
    QNA_NONMEMBER   NVARCHAR2(60),					-- 비회원 작성자
    QNA_PWD	        CHAR(60)    NOT NULL,           -- 암호화된 비밀번호 무조건 60자
    QNA_PUBLIC      CHAR(1)	        DEFAULT 'T',    -- 공개여부 (기본값 T 비공개)
    QNA_REPLY	    NVARCHAR2(1000),	                -- 답글
    QNA_REPLY_REGDATE    DATE,
    CONSTRAINT FK_SERVICE FOREIGN KEY(QNA_WRITER) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE
);

CREATE SEQUENCE QNA_SEQ START WITH 100 INCREMENT BY 1 NOCYCLE;