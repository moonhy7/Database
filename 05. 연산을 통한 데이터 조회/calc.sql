-- 1. 산술연산자(+,-,*,/)
select 2+3 as sum; -- as 생략 가능
select 1 + '1'; -- java에서는 11이 출력되지만 SQL에서는 2가 출력됨 -> SQL은 '문자'를 '숫자'로 바꾸는 경향이 있음
select '2' + '3';



-- 2. 비교연산자(=, !=, <>, >, >=, <=)
-- 같지 않다 (!=, <>)

-- 아이돌그룹 테이블로 실습해보기
select * from idol_group;

-- 1) JYP 엔터테인먼트만 조회
select * from idol_group where company = 'JYP 엔터테인먼트';

-- 2) 2015년 이전 데뷔한 그룹만 조회
select * from idol_group where DEBUT_YEAR < 2015;

-- 아이돌멤버 테이블로 실습해보기
select * from idol_member;

-- 3) 본명이 입력되지 않은 멤버들만 조회
select * from idol_member where REAL_NAME = '';

-- 4) 본명이 입력된 멤버들만 조회
select * from idol_member where REAL_NAME != '';
select * from idol_member where NOT REAL_NAME = '';




-- 3. 관계연산자(NOT, AND, OR, BETWEEN, IN)

-- 아이돌그룹 테이블로 실습해보기
select * from idol_group;

-- 1) 데뷔년도가 2013년부터 2017년까지의 그룹을 조회 (즉, 연속적인 데이터)
select * from idol_group where DEBUT_YEAR >= '2013' and DEBUT_YEAR <= '2017' order by DEBUT_YEAR;
select * from idol_group where DEBUT_YEAR between '2013' and '2017' order by DEBUT_YEAR;

-- 2) 데뷔년도가 2013, 2015, 2017 년도인 그룹을 조회 (즉, 비연속적인 데이터)
select * from idol_group where DEBUT_YEAR = 2013 or DEBUT_YEAR = 2015 or DEBUT_YEAR = 2017 order by DEBUT_YEAR;
select * from idol_group where DEBUT_YEAR IN('2013', '2015', '2017') order by DEBUT_YEAR;


-- 3) 데뷔가 2013, 2015, 2017 년도가 아닌 그룹을 조회
select * from idol_group where DEBUT_YEAR != 2013 and DEBUT_YEAR != 2015 and DEBUT_YEAR != 2017 order by DEBUT_YEAR;
select * from idol_group where DEBUT_YEAR NOT IN('2013', '2015', '2017') order by DEBUT_YEAR;



-- 4. 패턴 비교연산자( LIKE, %, _ )

-- 아이돌멤버 테이블로 실습해보기
select * from idol_member;

-- 1) 본명이 박씨인 멤버들만 조회
select * from idol_member WHERE REAL_NAME LIKE '박%';

-- 2) 본명이 '김ㅇ준'인 멤버 조회
select * from idol_member WHERE REAL_NAME LIKE '김_준';

-- 3) 본명이 '~ 사나'인 멤버 조회
select * from idol_member WHERE REAL_NAME LIKE '%사나';

-- 4) 박씨 성을 제외한 멤버들만 조회
select * from idol_member WHERE NOT REAL_NAME LIKE '박%';

-- 5) 본명에 '나'자가 들어간 멤버를 조회
select * from idol_member WHERE REAL_NAME LIKE '%나%';


-- 6) lecture.member 테이블에서 유효하지 않은 번호(PHONE)만 조회
select * from lecture.notice where CONTENT LIKE '%악취%';



-- 5. 정규식(regex)을 이용한 패턴 연산 : 텍스트에서 사용하는 검색 패턴 기호

-- 1) https://ko.wikipedia.org/

-- 2) https://regexlib.com/






-- 6. lecture.member 테이블에서 유효하지 않은 번호(PHONE)만 조회








