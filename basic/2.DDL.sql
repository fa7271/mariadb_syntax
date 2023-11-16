-- 실습1
-- post 테이블 contents 컬럼 글자수 300 변경
ALTER TABLE post modify column contents VARCHAR(3000) NOT NULL;

-- author 테이블 address컬럼 vachar 255 로 추가.
ALTER TABLE author ADD COLUMN address VARCHAR(255);

--post테이블 생성문 미리 확인 > post테이블삭제 > post 테이블 다시생성
DROP TABLE post;
SHOW CREATE TABLE posts; -- 자세히 보기
CREATE TABLE `post` (
   `id` int(11) NOT NULL,
   `title` varchar(255) DEFAULT NULL,
   `contents` varchar(300) NOT NULL,
   `author_id` int(11) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `author_id` (`author_id`),
   CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
 SHOW TABLES;
 

