
-- DISTINCT(중복값 제거)와 COUNT

-- 1. 아이돌 멤버테이블에서 아이돌 그룹 이름을 출력하시오 (단, 중복제거)
select distinct group_name from idol_member;


-- 아이돌 멤버테이블에 있는 모든 멤버의 총 인원 수 출력
select count(*) from idol_member;


-- 아이돌 멤버테이블에 있는 그룹의 총 개수를 출력
select count(distinct group_name) from idol_member;


-- 트와이스 그룹의 총 멤버 수를 출력하시오
select count(*) from idol_member where group_name = '트와이스';


-- 각 그룹별 총 멤버 수를 출력하시오
SELECT GROUP_NAME, COUNT(GROUP_NAME) FROM IDOL_MEMBER GROUP BY GROUP_NAME;

