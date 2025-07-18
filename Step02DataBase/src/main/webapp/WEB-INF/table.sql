CREATE TABLE board(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(20) NOT NULL,
	title VARCHAR2(2) NOT NULL,
	content CLOB,
	viewCount NUMBER DEFAULT 0,
	createdAt DATE DEFAULT SYSDATE
);

CREATE SEQUENCE board_seq;


CREATE TABLE USERS(
	num NUMBER PRIMARY KEY, --회원의 고유 번호
	userName VARCHAR2(20) UNIQUE,-- 아이디
	password VARCHAR2(100) NOT NULL, -- 비밀번호
	email VARCHAR2(50) UNIQUE, -- 이메일
	profileImage VARCHAR2(100),	-- 프로필 이미지 정보 처음 가입 시 null
	role VARCHAR2(10) DEFAULT 'ROLE_USER',	-- 역할. user or staff or admin
	updatedAt DATE,	-- 수정 날짜
	createdAt DATE -- 가입 날짜
);

CREATE SEQUENCE users_seq;

CREATE TABLE member(
	num NUMBER PRIMARY KEY,
	name VARCHAR2(20),
	addr VARCHAR2(20)
);

CREATE SEQUENCE member_seq;

CREATE TABLE book(
	num NUMBER PRIMARY KEY,
	title VARCHAR2(20),
	author VARCHAR2(20),
	published_at VARCHAR2(20)
);

CREATE SEQUENCE book_seq;