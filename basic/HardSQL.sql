-- group by 예제
select author_id, count(*), sum(price),round(avg(price),0) from post group by author_id;

-- 1. author_id 별로 price 평균 건 별로 1000원 이상인 데이터만
select author_id,avg(price) from post where price >= 1000;
-- 2. author_id 별로 price 평균값을 구하되 평균값이 1000원 이상건만 
select author_id,avg(price) from post group by author_id having avg(price) >= 1000;
-- 1 + 2
select author_id,avg(price) from post where price >= 1000 group by author_id having avg(price) >= 1000;

