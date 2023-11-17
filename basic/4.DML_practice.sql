insert into author (id, name, email) values(1, 'song', 'fa7271@naver.com')
insert into author(id, name, email, password, role) values(1,'ㅂㅈㄷ','fa7271ㅈ@naver.com', 1234,'관리자');
insert into author(id, name, email, password, role) values(2,'송보석','fa7271@naver.com', 1234,'관리자');
insert into author(id, name, email, password, role) values(3,'손정민','fa7272@naver.com', 1234, '관리자');
insert into author(id, name, email, password, role) values(4,'장은지','fa7273@naver.com', 1234, '사용자');
insert into author(id, name, email, password, role) values(5,'조원우','fa7274@naver.com', 1234, '관리자');
insert into author(id, name, email, password, role) values(6,'신유정','fa7275@naver.com', 1234, '사용자');

-- INSERT 실습
-- post 데이터추가
2개는 저자가 있는 데이터
2개는 저자가 비어 있는 데이터 > author_id 에 
1개는 저자가 author 테이블에 없는 데이터 추가 >> 에러 발생확인

DESCRIBE post;

insert into post(id,title,contents,author_id) values (1,"졸려요","2시간남았어요", 1);
insert into post(id,title,contents,author_id) values (2,"6시에 끝나면","12시간 뒤에 다시 일어납니다", 2);

insert into post(id,title,contents) values (3,"내일 점심은","뭘까요");
insert into post(id,title,contents) values (4,"내일은","금요일");

insert into post(id,title,contents,autor_id) values (6,"내일은","금요일",8);

-- UPDATE 실습
-- author 데이터중 id가 4 인 데이터 email = abc@navre.com, name =abc
update author set email = 'abc@naver.com',name   = 'abc' where id = 4; 
-- 컬럼 삭제
alter table [테이블명] drop [컬럼명];
-- post에 글쓴적이 없는 author 데이터 1개 삭제
delete from author where id = (select id from post where author_id is null limit 1);
delete from author where id = 1;

-- post에 글쓴적이 있는 author 데이터 1개 삭제
에러가나옴 > 조 후 삭제
-- 1번 방법
delete from post where id = 1;
delete from post where id = 2;
--  ===
delete from post where id <= 2;

-- 2번 방법
update post set author_id = null wher author_id <= 2;
delete from author where id = 2 ;

TRUNCATE
delete 는 복구가 가능, TRUNCATE 불가능
delete 는 log남김
delete 보다 빠름 

-- 이름 중복제거하고 조회
select distinct name from author;

-- 오름 차순 
select * from author order by name asc;

-- 내림 차순
select * from author order by name desc;

-- order by 멀티 : 먼저 쓴 컬럼 우선 졍렬 , asc / desc 생략시 asc
select * from author order by name desc, email desc;

-- limit number : 특정숫자로 결과값 개수 제한
select * from author order by id desc limit 2; 

--alias 를 이용한 select 문 
select name as 이름 from author; 

--as 생략가능
select name, email from author as a;


-- DDL, DML 전체실습
create database board;
use board;

CREATE TABLE author(
id int(11) primary key,
name varchar(255) not null,
password varchar(255),
role varchar(50),
address varchar(255)
);
describe author;

CREATE TABLE post(
id int(11) primary key,
title varchar(255),
contents varchar(255),
author_id int(11),
foreign key (author_id) REFERENCES author(id)
);
describe post;

-- 실습 
-- 1. 게시판 회원은 총 5명이 되도록 만들고, 게시판에 실명으로 글이 쓰여진 게시글은 총 3건, 익명으로 글이 쓰여진 글은 총 2 건이 있도록 insert
insert into post(id,title,contents,author_id) values (1,"제목1","내용1", 1);
insert into post(id,title,contents,author_id) values (2,"제목2","내용2", 2);
insert into post(id,title,contents,author_id) values (3,"제목3","내용3", 3);
insert into post(id,title,contents) values (4,"제목10","내용10");
insert into post(id,title,contents) values (5,"제목11","내용11");
-- 2. 게시판의 회원을 모두 delete 하되, 기존에 posting 된 글은 삭제되지 않고 남아있도록 하여라

update post set author_id = null where author_id in not null;
delete from author;
-- 3. post의 글을 3개만 조회하되, title을 기준으로 오름차순하고 만약 제목이 같은경우 contents로 내림차순이 되도록 조회
select * from post order by title , contents desc limit 3;

-- 4. author 테이블에 age 데이터 tinyint unsigned 로 추가
alter table author add column age tinyint unsigned;
INSERT author(id,age) values(6,255);
INSERT author(id,age) values(7,256);

-- 5 post 에 price 라는 원고료컬럼을 추가, 원고료 컬럼은 총 자릿수 10자리 및 소수점단위는 3자리까지 가능.
ALTER Table post add price DECIMAL (10, 3);
update post set price =1234567.1243 where id = 4;

-- 6 role 타입 enum 타입으로 변경하고 'user','admin' not null 로 설정
-- 입력이 없을시

ALTER TABLE author modify column role enum("user","admin") NOT NULL DEFAULT ‘user’;

insert into author(id, name, password, role, address, age) values(1,'손정민', 1234,'admin',"수원",28);
insert into author(id, name, password, role, address, age) values(2,'송보석', 1234,'super-user',"수원",28); -- 에러
insert into author(id, name, password, address, age) values(3,'조원우', 1234,"수원",28);

-- 7 post테이블에 DATETIME 으로 createdTime 추가 및 default로 현재시간 들어가도록 설정
alter table post add column created_Time datetime(6) default current_timestamp(6);

-- 8 author 테이블의 id 가 1,2,4 가 아닌 데이터 조회 
SELECT * from author where id not in (1,2,4) ;

-- 9 post 테이블의 id가 2~4까지 데이터 조회 between, or, and
select * from author where id between 2 and 4 ;
select * from author where (id >=2 and id <=4);
select * from author where not (id <2 or id >4)

-- 10 LIKE 시작, 중간, 마지막, NOT LIKE
SELECT * FROM author WHERE name LIKE '송%';
SELECT * FROM author WHERE name LIKE '%석';
SELECT * FROM author WHERE name LIKE '%보%';
SELECT * FROM author WHERE name not LIKE '송%';

-- 한글 패턴 수행후 숫자 패턴 수행
select * from author where name REGEXP '([가-힣]\[1-9])';