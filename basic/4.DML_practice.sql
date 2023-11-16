insert into author (id, name, email) values(1, 'song', 'fa7271@naver.com')

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
update author set email = 'abc@naver.com',name = 'abc' where id = 4; 

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

