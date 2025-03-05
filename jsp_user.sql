-- SYSTEM 스키마
-- 사용자 생성
CREATE USER C##jsp_user IDENTIFIED BY 1234;

-- CONNECT: 사용자가 DB에 접속할 수 있는 권한
-- RESOURCE: 데이터를 생성, 수정, 삭제할 수 있는 권한
GRANT CONNECT, RESOURCE TO C##jsp_user;

--system 에서 유저 권한 줘야 에러 없이 DB 에 저장 가능
--QUOTA : 테이블 공간 사용 
ALTER USER C##jsp_user DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-------------------------------------------------------------------------------------------------------------
-- jsp_user 스키마
CREATE TABLE member (
    id VARCHAR2(10) PRIMARY KEY,
    pwd VARCHAR2(10),
    name VARCHAR2(50),
    email VARCHAR2(50),
    joinDate DATE DEFAULT SYSDATE
);

insert into member values('hong', 1234, '홍길동', 'hong@test.com', sysdate);
insert into member values('lee', 1234, '이순신', 'lee@test.com', sysdate);
insert into member values('yoo', 1234, '유관순', 'yoo@test.com', sysdate);

select * from member;