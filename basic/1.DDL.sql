-- 데이터베이스 생성
CREATE DATABASE board;

-- 데이터베이스 선택
USE board;

-- 테이블 신규 생성
CREATE TABLE author(
    id INT,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    test1 VARCHAR(255),
    PRIMARY KEY (ID)
);

-- 테이블 목록 조회
SHOW TABLES;

-- TABLE 컬럼조회
DESCRIBE author;

-- post 테이블 신규 생성
CREATE TABLE posts(
    id INT PRIMARY KEY,
    title VARCHAR(255),
    content VARCHAR(255),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES author(id)
);

-- 테이블 컬럼상세조회 
 SHOW FULL COLUMNS FROM author;

-- 테이블 생성문 조회 ,, 변경된 사항도 써주기 때문에 사용
SHOW CREATE TABLE posts;
-- CREATE TABLE `posts` (
--    `id` int(11) NOT NULL,
--    `title` varchar(255) DEFAULT NULL,
--    `content` varchar(255) DEFAULT NULL,
--    `author_id` int(11) DEFAULT NULL,
--    PRIMARY KEY (`id`),
--    KEY `author_id` (`author_id`),
--    CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
--  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

-- 테이블 제약조건 조회
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'posts';

-- 테이블 인덱스 조회
SHOW INDEX FROM posts;

-- 컬럽 추가 (ADD)
ALTER TABLE '테이블명' ADD COLUMNS 컬럼명 자료형(NULL,NOTNULL)
ALTER TABLE author ADD COLUMN role varchar(50);

-- 필드 타입 변경(MODIFY) 덮어쓰기
ALTER TABLE '테이블명' modify column 컬럼명 타입 [제약조건];
ALTER TABLE author modify column name VARCHAR(100) NOT NULL;

-- 컬럼 이름 변경 
ALTER TABLE '테이블명' CHANGE COLUMN 기존칼럼명 새로운컬럼명 타입 [제약조건]

-- 컬럼삭제
ALTER TABLE 테이블명 DROP COLUMN 컬럼명;

-- 테이블 삭제
DROP TABLE 테이블이름

-- 테이블 내 데이터만 삭제
DELETE FROM 테이블이름
TRUNCATE TABLE 테이블이름

IF EXISTS
-- 특정 객체가 존재하는 경우에 실행, 에러 발생 방지를 위해 쓴다.
EX) DROP DATABASE , DROP ~ IF EXISTS abc; 
