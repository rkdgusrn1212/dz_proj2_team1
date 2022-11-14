create table user_auth ( 
id NUMBER PRIMARY KEY, 
-- auth 레코드의 pk
auth_id VARCHAR(60) UNIQUE NOT NULL, 
auth_pwd CHAR(60) NOT NULL,
 -- 인증 비밀번호
auth_authority VARCHAR(500) NOT NULL,
 --인증이 가진 권한
auth_email VARCHAR(320) UNIQUE NOT NULL,
--본인인증된 email 인증만 하면 바꿀 수 있다. 이메일 최대크기는 320
auth_name VARCHAR(60) NOT NULL,
refresh_token CHAR(60)
-- 사용자 이름
);
