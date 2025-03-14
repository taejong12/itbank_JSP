create table tbl_vote_202005 (
    v_jumin char(13) not null primary key,
    v_name varchar2(20),
    m_no char(1),
    v_time char(4),
    v_area char(20),
    v_confirm char(1)  
);

INSERT ALL
    INTO tbl_vote_202005 VALUES('99010110001', '김유권', 1, '0930', '제1투표장', 'N')
    INTO tbl_vote_202005 VALUES('89010120002', '이유권', 2, '0930', '제1투표장', 'N')
    INTO tbl_vote_202005 VALUES('69010110003', '박유권', 3, '0930', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('59010120004', '홍유권', 4, '0930', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('79010110005', '조유권', 5, '0930', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('89010120006', '최유권', 1, '0930', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('59010110007', '지유권', 1, '0930', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('49010120008', '장유권', 3, '0930', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('79010110009', '정유권', 3, '0930', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('89010120010', '강유권', 4, '0930', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('99010110011', '신유권', 5, '0930', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('79010120012', '오유권', 1, '1330', '제1투표장', 'Y')
    INTO tbl_vote_202005 VALUES('69010110013', '현유권', 4, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('89010110014', '왕유권', 2, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('99010110015', '유유권', 3, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('79010110016', '한유권', 2, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('89010110017', '문유권', 4, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('99010110018', '양유권', 2, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('99010110019', '구유권', 4, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('79010110020', '황유권', 5, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('69010110021', '배유권', 3, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('79010110022', '전유권', 3, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('99010110023', '고유권', 1, '1330', '제2투표장', 'Y')
    INTO tbl_vote_202005 VALUES('59010110024', '권유권', 3, '1330', '제2투표장', 'Y')
SELECT * FROM DUAL;

create table tbl_member_202005 (
    m_no char(1) NOT NULL PRIMARY KEY,
    m_name varchar2(20),
    p_code char(2),
    p_school char(1),
    m_jumin char(13),
    m_city varchar2(20));

INSERT All
    INTO tbl_member_202005 VALUES(1, '김후보', 'P1', 1, '6603011999991', '수선화동')
    INTO tbl_member_202005 VALUES(2, '이후보', 'P2', 3, '5503011999992', '민들레동')
    INTO tbl_member_202005 VALUES(3, '박후보', 'P3', 2, '7703011999993', '나팔꽃동')
    INTO tbl_member_202005 VALUES(4, '조후보', 'P4', 2, '8803011999994', '진달래동')
    INTO tbl_member_202005 VALUES(5, '최후보', 'P5', 3, '9903011999995', '개나리동')
SELECT * FROM DUAL;

create table tbl_party_202005 (
    p_code char(2) not null primary key,
    p_name varchar2(20),
    p_indate date,
    p_reader varchar2(20),
    p_tel1 char(3),
    p_tel2 char(4),
    p_tel3 char(4)
);
    
insert all
    into tbl_party_202005 values('P1', 'A정당', '2010-01-01','위대표','02','1111','0001')
    into tbl_party_202005 values('P2', 'B정당', '2010-02-01','명대표','02','1111','0002')
    into tbl_party_202005 values('P3', 'C정당', '2010-03-01','기대표','02','1111','0003')
    into tbl_party_202005 values('P4', 'D정당', '2010-04-01','옥대표','02','1111','0004')
    into tbl_party_202005 values('P5', 'E정당', '2010-05-01','임대표','02','1111','0005')
select * from dual;

select * from tbl_member_202005;
select p_code, p_name from tbl_party_202005;

select a.m_no, a.m_name, b.p_name,
    case a.p_school when '1' then '고졸'
    when '2' then '학사'
    when '3' then '석사'
    else '박사' end AS p_school,
    a.m_jumin, a.m_city,
    b.p_tel1 || '-' || b.p_tel2 || '-' || b.p_tel3 AS p_tel
from tbl_member_202005 a, tbl_party_202005 b 
where a.p_code = b.p_code
order by a.m_no;