create table user_auth ( 
-- 유저의 정보중 인증 아이디, 비번쌍에 대한 조회만 빈번하므로 테이블 따로 분리
auth_id VARCHAR(60) PRIMARY KEY, 
-- 인증 아이디, 아이디를 조건으로한 검색이 많아서 PK가 되었다. 별도의 id를 안둔이유는 인증 서버가 auth_id기준으로 식별하기 때문에,
-- 별도의 식별 id는 의미가 없어진다.
auth_pwd CHAR(60) NOT NULL, -- 인증 비밀번호
auth_authority NOT NULL --인증이 가진 권한
);
