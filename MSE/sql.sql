-- 회원 테이블 생성
create table movieMember(
id varchar2(20) primary key,
password varchar2(30) not null,
name varchar2(20) not null,
nickname varchar2(30),
birthday varchar2(30),
gender varchar2(20),
mail varchar2(30),
role varchar(5) default 'User'
)

drop table movieMember
select * from movieMember
alter table movieMember modify mail varchar2(100)

-- 관리자 계정
insert into movieMember
values('Admin','admin123','관리자', '관리자', '2023-05-15','관리자','Admin@movieStation.com','Admin');

-- 유저 계정
insert into movieMember(id, password, name, nickname, birthday, gender, mail) values('park','park123','박명수', '바다의왕자','1970-09-27','남성','park@naver.com');

--게시판 테이블 생성
create table movieBoard(
seq number(5) primary key,
subject varchar2(30) not null,
title varchar2(200) not null,
nickname varchar2(30) not null,
content varchar2(2000) not null,
regdate date default sysdate,
cnt number(5) default 0,
id varchar2(20) constraint movieBoardFK references movieMember(id)
)

select * from movieBoard

--영화 한줄평 테이블 생성
create table movieComment(
rseq number(10) primary key,
movieId varchar2(20),
movieSeq varchar2(30),  
nickname varchar2(30) not null,
content varchar2(300) not null,
starpoint number(2) not null,
regdate date default sysdate,
id varchar2(50) constraint movieCommentFK references movieMember(id)
)

select * from movieComment
drop table movieComment

insert into movieComment(rseq,movieId,movieSeq,nickname,content,starpoint,id) values((select nvl(max(rseq),0)+1 from movieComment),'F','58089','바다의왕자','재미없어요',1,'park')
update movieComment set content=?, starpoint=? where rseq=?

select * from movieComment where movieId='F' and movieSeq='58089' order by rseq desc