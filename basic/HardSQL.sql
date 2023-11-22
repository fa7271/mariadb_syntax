-- group by 예제
select author_id, count(*), sum(price),round(avg(price),0) from post group by author_id;

-- 1. author_id 별로 price 평균 건 별로 1000원 이상인 데이터만
select author_id,avg(price) from post where price >= 1000;
-- 2. author_id 별로 price 평균값을 구하되 평균값이 1000원 이상건만 
select author_id,avg(price) from post group by author_id having avg(price) >= 1000;
-- 1 + 2
select author_id,avg(price) from post where price >= 1000 group by author_id having avg(price) >= 1000;

-- 인덱스 지우기
ALTER TABLE author DROP INDEX name; 
-- name index
CREATE INDEX author_name ON author(name);
-- name,email index
CREATE INDEX two_author_name on author(name,email);

-- user 생성
CREATE USER 'testuser'@'localhost' IDENTIFIED BY '1234';
-- show grant
show grants for 'testuser'@'localhost';
-- grant insert 권한 부여
GRANT insert ON board.author TO 'testuser'@'localhost';
-- 권한 변경사항 적용
flush privileges;
-- 특정 권한 삭제
REVOKE INSERT ON board.author from 	'testuser'@'localhost';

-- author 의 name, email 정도만 알 수 있는 view 생성
CREATE VIEW author_for_view AS select name, email from author;

-- test user의 기존의 author 관련 view테이블에 조회권한 부여
CREATE USER 'testuser'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON board.author_for_view TO 'testuser'@'localhost';
flush privileges;
-- testuser 로그인
use board;
select * from author_for_view;

--
DELIMITER //
CREATE PROCEDURE get_user(IN userid INT)
BEGIN
select * from author 
where id = userid;
END //
DELIMITER ;

CALL get_user(2);

-- post테이블에 쉽게 insert 할 수 있는 post 프로시저생성
-- 사용자에게 title,contents,author_id 만 입력받아 insert하는 insert문 생성
DELIMITER //
CREATE PROCEDURE insert_post(IN intitle VARCHAR(255), incontents VARCHAR(255), inauthor_id INT)
BEGIN
	insert into post(title,contents,author_id) values(intitle,incontents,inauthor_id);
END //
DELIMITER ;

call insert_post("송보석","금천구",2);
select * from post;

-- post 테이블에 if 문 활용하여 고액 원고료 작가 조회
DELIMITER //
CREATE PROCEDURE high_price(IN userid INT)
BEGIN
	DECLARE money INT default 0;
    select price from post where author_id = userid into money;
    if money >= 1000 THEN
		select '고액납세자입니다';
	ELSE
		select '아닙니다';
	END if;
END //
DELIMITER ;

call high_price(2);

-- while 
DELIMITER //..0
CREATE PROCEDURE insert_author()
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE (i <= 100) DO
        INSERT INTO author(name,password,role,age,email) VALUES (concat('songboseok',i) ,1234,'user',25,concat('fa7271@naver.com',i));
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

 mysqldump -u root -p --default-character-set=utf8mb4 board > dumpfile.sql

 -- gitub 에 dump 파일업로드
 -- linux db 구축
 -- dump 파일 클론 git clone
 -- 해당 폴더로 이동하여 덤프 복원 명령어 실행
 