create table member_tbl_02 (
    custno number(6) not null primary key,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2)
);

INSERT ALL
    INTO member_tbl_02 VALUES (100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', TO_DATE('20151202', 'YYYYMMDD'), 'A', '01')
    INTO member_tbl_02 VALUES (100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', TO_DATE('20151206', 'YYYYMMDD'), 'B', '01')
    INTO member_tbl_02 VALUES (100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', TO_DATE('20151001', 'YYYYMMDD'), 'B', '30')
    INTO member_tbl_02 VALUES (100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', TO_DATE('20151113', 'YYYYMMDD'), 'A', '30')
    INTO member_tbl_02 VALUES (100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', TO_DATE('20151225', 'YYYYMMDD'), 'B', '60')
    INTO member_tbl_02 VALUES (100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', TO_DATE('20151211', 'YYYYMMDD'), 'C', '60')
SELECT * FROM DUAL;

create table money_tbl_02 (
    custno number(6, 0) not null,
    salenol number(8, 0) not null primary key,
    pcost number(8, 0),
    amount number(4, 0),
    price number(8),
    pcode varchar2(4),
    sdate date,
    CONSTRAINT fk_money_tbl_02 FOREIGN KEY (custno) REFERENCES member_tbl_02(custno)
);

INSERT ALL
    INTO money_tbl_02 VALUES (100001, 20160001, 500, 5, 2500, 'A001', TO_DATE('20160101', 'YYYYMMDD'))
    INTO money_tbl_02 VALUES (100001, 20160002, 1000, 4, 4000, 'A002', TO_DATE('20160101', 'YYYYMMDD'))
    INTO money_tbl_02 VALUES (100001, 20160003, 500, 3, 1500, 'A008', TO_DATE('20160101', 'YYYYMMDD'))
    INTO money_tbl_02 VALUES (100002, 20160004, 2000, 1, 2000, 'A004', TO_DATE('20160102', 'YYYYMMDD'))
    INTO money_tbl_02 VALUES (100002, 20160005, 500, 1, 500, 'A001', TO_DATE('20160103', 'YYYYMMDD'))
    INTO money_tbl_02 VALUES (100003, 20160006, 1500, 2, 3000, 'A003', TO_DATE('20160103', 'YYYYMMDD'))
    INTO money_tbl_02 VALUES (100004, 20160007, 500, 2, 1000, 'A001', TO_DATE('20160104', 'YYYYMMDD'))
    INTO money_tbl_02 VALUES (100004, 20160008, 300, 1, 300, 'A005', TO_DATE('20160104', 'YYYYMMDD'))
    INTO money_tbl_02 VALUES (100004, 20160009, 600, 1, 600, 'A006', TO_DATE('20160104', 'YYYYMMDD'))
    INTO money_tbl_02 VALUES (100004, 20160010, 3000, 1, 3000, 'A007', TO_DATE('20160106', 'YYYYMMDD'))
SELECT * FROM DUAL;

select max(custNo) from member_tbl_02;

select custno,custname,phone,address,joindate,
case grade when 'A' then 'VIP'
when 'B' then '일반'
else '직원' end  as 등급, city from member_tbl_02;


select custno, custname, grade from member_tbl_02;

select mon.custno, mem.custname, 
    case mem.grade when 'A' then 'VIP'
    when 'B' then '일반' else '직원' end as grade, 
    sum(mon.price) 
    from money_tbl_02 mon, member_tbl_02 mem
    where mon.custno = mem.custno
    group by mon.custno, mem.custname, mem.grade
    order by sum(mon.price) desc;

