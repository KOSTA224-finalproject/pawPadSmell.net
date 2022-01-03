----------------현재테이블 조회
SELECT * FROM tab;
---------------------------------------------------------------------------
---------------------------------------------------------------------------
--회원 

select * from G_MEMBER;


SELECT g.email,a.user_id,a.authority
FROM g_member g, authorities a
WHERE g.member_id=a.user_id;

drop table authorities;
select * from authorities;
create table authorities(
	user_id 	NUMBER not null,
	authority varchar2(30) not null,
	constraint fk_authorities foreign key(user_id) references g_member(member_id)on delete cascade,
	constraint member_authorities primary key(user_id,authority)
);

update g_member set name='12', password='12', address='12', phonenum='12', birth=to_date('2000-02-02','YYYY-MM-DD') where email='2@2';
commit
drop table g_member;
CREATE TABLE g_member(
	member_id NUMBER PRIMARY KEY,
	email VARCHAR2(100)  NOT NULL,
	name VARCHAR2(100) NOT NULL,
    nickname VARCHAR2(100) NOT NULL,
    address VARCHAR2(100) NOT NULL,
    phonenum VARCHAR2(100) NOT NULL,
    password VARCHAR2(100) NOT NULL,
    birth date not null,
	enable NUMBER default 1 NOT NULL
);
CREATE SEQUENCE member_seq;
INSERT INTO g_member(
    member_id,
    email, 
    name, 
    nickname, 
    address, 
    phonenum, 
    password, 
    birth, 
    enable) 
VALUES(member_seq.nextval,'abc@naver.com', '김동동', '동동이', '성남', '01012345678', '1004', to_date('2000-02-02','YYYY-MM-DD'), 1);
SELECT * FROM g_member;
DELETE 
  FROM g_member
 WHERE g_member_id = 1;
delete from g_member where member_id=2;
commit;

-----------------------------------------------------------------------------------------------
-- 알림 카테고리
CREATE TABLE noti_category(
  noti_category NUMBER PRIMARY KEY, 
  noti_message VARCHAR2(100) NOT NULL
);

drop table noti_category;

DROP SEQUENCE noti_category_seq;
TRUNCATE TABLE noti_category;
CREATE SEQUENCE noti_category_seq;

INSERT INTO noti_category(noti_category, noti_message) 
VALUES(noti_category_seq.nextval, '게시물에 댓글이 달렸습니다^^');
INSERT INTO noti_category(noti_category, noti_message) 
VALUES(noti_category_seq.nextval, '게시물에 댓글이 달렸습니다^^');

delete from noti_category where noti_category=1;
SELECT * FROM noti_category;

COMMIT;
-----------------------------------------------------------------------------------------------
-- 알림 테이블
drop table notification;
CREATE TABLE notification(
    noti_id NUMBER PRIMARY KEY,
    event_url VARCHAR2(20) not null,
    member_id NUMBER NOT NULL,
    noti_category NUMBER NOT NULL,
	CONSTRAINT fk_noti_member_id FOREIGN KEY(member_id) REFERENCES g_member(member_id)on delete cascade,    
	CONSTRAINT fk_noti_category FOREIGN KEY(noti_category) REFERENCES noti_category(noti_category)on delete cascade
);

CREATE SEQUENCE notification_seq;
INSERT INTO notification(noti_id, event_url, member_id, noti_category) 
VALUES(notification_seq.nextval, '경기도 성남시',1, 2);
SELECT * FROM notification;

--------------------------------------------------------------------------------------
-- 인가 테이블 
drop table authorities;
create table authorities(
	user_id number not null,
	authority varchar2(30) not null,
	constraint fk_authorities foreign key(user_id) references g_member(member_id)on delete cascade,
	constraint g_member_authorities primary key(user_id,authority)
);
select * from authorities;
insert into authorities values('1','roll_member');
commit

-----------------------------------------------------------------------------------------------
-- 마이페이지 테이블
insert into mypage(member_id, profile_filename,profile_filepath,profile_text) values(4,'2','3','4');
insert into mypage(member_id, profile_filename,profile_filepath,profile_text) values(5,'4','5','6');
drop table mypage;

DROP TABLE mypage CASCADE CONSTRAINTS;

create table mypage(
    member_id number primary key,
    profile_filename varchar2(100) ,
    profile_filepath varchar2(100) ,
    profile_text varchar2(100) ,
    CONSTRAINT pk_mypage_member_id foreign key (member_id) references g_member(member_id)
    on delete cascade
);
insert into mypage values('1','사진test','we','안녕하세요');
select * from mypage;
-- casecade test
delete from mypage where member_id=4;

select profile_filename,profile_filepath,profile_text from mypage where member_id=4
-----------------------------------------------------------------------------------------------
-- 친구

drop table friend;
create table friend(
    friendrequest_id number primary key,
    friend_id number not null,
    member_id number not null,
    constraint fk_friend_member_id foreign key(member_id) references g_member(member_id)on delete cascade
);
create sequence friend_seq;
insert into friend values(friend_seq.nextval,'2','1');
select * from friend;

--게시판 세부 카테고리

drop table category;

create table category(
	category_id number primary key,
	category_name varchar2(100) not null
);

-- create sequence
create sequence category_seq;

insert into category(category_id,category_name) values(category_seq.nextval,'고양이');
insert into category(category_id,category_name) values(category_seq.nextval,'강아지');
insert into category(category_id,category_name) values(category_seq.nextval,'조류');
insert into category(category_id,category_name) values(category_seq.nextval,'파충류');
insert into category(category_id,category_name) values(category_seq.nextval,'물고기');
insert into category(category_id,category_name) values(category_seq.nextval,'그 외');

commit

select * from category;


--게시판 종류
drop table boardtype;

create table boardtype(
	board_id number primary key,
	board_name varchar2(100) not null
)

create sequence board_type_seq;

insert into boardtype(board_id,board_name) values(board_type_seq.nextval,'커뮤니티');
insert into boardtype(board_id,board_name) values(board_type_seq.nextval,'중고거래');

commit

select * from boardtype;
-- 전체 게시판





drop table g_board;

CREATE TABLE g_board(
	post_id NUMBER PRIMARY KEY,
	title VARCHAR2(100) NOT NULL,
	content CLOB NOT NULL,
	member_id number not null,
  regdate date NOT NULL,
	hits number default 0,
	board_id number not null,
	category_id number not null,
	comment_count number default 0,
	filename varchar2(100),
	filepath varchar2(100),
	constraint fk_board_category_id foreign key(category_id) references category(category_id)on delete cascade,
	constraint fk_board_board_id foreign key(board_id) references boardtype(board_id)on delete cascade,
	constraint fk_board_member_id foreign key(member_id) references g_member(member_id)on delete cascade
)
alter table board add(regdate varchar2(30));
alter table board drop column regdate;
drop sequence board_seq;

select * from g_board

create sequence board_seq;

SELECT count(*)
FROM g_board
WHERE member_id=1


insert into g_board values(board_seq.nextval,'123갱얼쥐용품팔아여','강아지사용품이에여진',4,
sysdate,0,2,2,0,null,null);





delete from g_board where member_id=1;

select * from g_board;

drop table store;

create table store(
   post_id number primary key,
   price number not null,
   place varchar2(100) not null,
   locinfo_x number,
   locinfo_y number,
   constraint fk_store_post_id foreign key(post_id) references g_board(post_id) on delete cascade
)
create sequence store_id_seq;
select * from store;

insert into store values(1,3000,'서울시 강남구 삼성동 어쩌구');




-----------------------------------------------------------------------------------------------
-- 댓글

drop table comment_board;
create table comment_board(
    comment_id number primary key,
    member_id number not null,
    post_id number not null,
    comment_content varchar2(200) not null,
    regdate date not null,
    constraint fk_comment_member_id foreign key(member_id) references g_member(member_id)on delete cascade,
    constraint fk_comment_post_id foreign key(post_id) references g_board(post_id)on delete cascade
);
create sequence comment_id_seq;
drop sequence comment_id_seq;
insert into comment_board values(comment_id_seq.nextval,'1','1','댓글내용',
to_date(sysdate,'yy-mm-dd hh24:mi'));
select * from comment_board;

---------------------------------------------------------------------
--신고
commit
drop table report;
create table report(
    report_id number primary key,
    report_reason varchar2(100) not null,
    member_id number not null,
    post_id number null,
    comment_id number null,
    constraint fk_report_member_id foreign key(member_id) references g_member(member_id)on delete cascade,
    constraint fk_report_post_id foreign key(post_id) references g_board(post_id)on delete cascade,
    constraint fk_report_comment_id foreign key(comment_id) references comment_board(comment_id)on delete cascade
);
drop sequence report_id_seq;
create sequence report_id_seq;
--댓글신고
insert into report(report_id,report_reason,member_id,comment_id) values
(report_id_seq.nextval,'신고사유','1','22');
--게시물신고
insert into report(report_id,report_reason,member_id,post_id) values
(report_id_seq.nextval,'신고사유','1','1');
select * from report;
----------------------------------------------------------------------------------------------------------------------------
commit;

-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------





-- 회원 번호가 1인 회원 게시글 찾기

select g.post_id, g.title, g.content, g.hits, c.category_name, g.comment_count, b.board_name, m.nickname, g.filename
from (
	select n.category_name
	from category n, board b
	where b.category_id = n.category_id
) c, (
	select e.board_name
	from boardtype e, board d
	where e.board_id = d.board_id
) b, board g , member m
where m.member_id = g.member_id and g.member_id = 1



DROP TABLE g_board;


select rnum, post_id, title, to_char(regdate, 'yyyy-mm-dd') as regdate, nickname, hits, category_name,board_name
from ( 
select row_number() over(
order by b.regdate desc) 
as rnum, b.post_id, b.title, b.regdate, m.nickname, b.hits, t.board_name, c.category_name
from g_board b, g_member m ,boardtype t,category c
where b.member_id=m.member_id and b.member_id=2 and c.category_id=b.category_id and t.board_id=b.board_id
) 
where rnum between 1 and 5
order by post_id desc



