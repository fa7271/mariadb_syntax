-- insert, select, update, delete

-- insert
insert into author (id, name, email) values(1, 'song', 'fa7271@naver.com')

-- update
update author set email = 'windy7271@naver.com' where id = 2;

-- delete
delete from table 
-- WHERE 조건 안 걸면 그 테이블 다 삭제함
-- **delete 할 때 pk,fk 걸렸있어도 데이터를 쓰고 있지 않으면 지울 수 있다.**

-- select 
select * from author;
select name, email from author;
select * from author where id = 1;
select * from author where id < 10;
select * from author where id < 10 and name = '송보석';





