
-----
원하는 컬럼
원하는 레코드만...
__________________


1. 산술연산자(+,-,*,/)
    ---------------------------------------------
    SELECT  2+3;
    SELECT  2+3 SUM;
    SELECT  1 +'3';
    SELECT '2'+'3';
    ---------------------------------------------
 

2. 비교연산자(=, !=, <>, >, >=, <=)
   같지않다(!=, <>)

    아이돌그룹 테이블
    ---------------------------------------------
    > JYP 엔터테인먼트만 조회
        SELECT * FROM idol_group
        WHERE COMPANY = 'JYP 엔터테인먼트';

    > 2015년 이전 데뷔한 그룹만 조회
        SELECT * FROM idol_group
        WHERE DEBUT_YEAR < '2015';
    ---------------------------------------------

    아이돌멤버 테이블
    ---------------------------------------------
    > 본명이 입력되지 않은 멤버들만 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME = '';

    > 본명이 입력된 멤버들만 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME != '';
    ---------------------------------------------


3. 관계연산자(NOT, AND, OR, BETWEEN, IN)

    아이돌그룹 테이블
    ---------------------------------------------
    > 데뷔년도가 2013년부터 2017년까지의 그룹을 조회
      (즉, 연속적인 데이터)

        SELECT * FROM idol_group
        WHERE DEBUT_YEAR >= '2013' AND
              DEBUT_YEAR <= '2017';

        SELECT * FROM idol_group
        WHERE DEBUT_YEAR BETWEEN 2013 AND 2017;  


    > 데뷔년도가 2013, 2015, 2017 년도인 그룹을 조회
      (즉, 비연속적인 데이터)

        SELECT * FROM idol_group
        WHERE DEBUT_YEAR = '2013' OR
              DEBUT_YEAR = '2015' OR
              DEBUT_YEAR = '2017';

        SELECT * FROM idol_group
        WHERE DEBUT_YEAR IN('2013', '2015', '2017'); 

    > 데뷔가 2013, 2015, 2017 년도가 아닌 그룹을 조회
        SELECT * FROM idol_group
        WHERE DEBUT_YEAR NOT IN('2013', '2015', '2017');    
        
    ---------------------------------------------


4. 패턴 비교연산자( LIKE, %, _ )
   WHERE NAME   =  '박%';  (X)
   WHERE NAME LIKE '박%';  (O)
   WHERE MEMBER_NAME LIKE '진_';
   WHERE MEMBER_NAME LIKE '진%';

    아이돌멤버 테이블
    ---------------------------------------------
    
    > 본명이 박씨인 멤버들만 조회
       SELECT * FROM idol_member
       WHERE REAL_NAME LIKE '박%';

    > 본명이 '김ㅇ준'인 멤버 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME LIKE '김_준';

    > 본명이 '~ 사나'인 멤버 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME LIKE '%사나';

    > 박씨 성을 제외한 멤버들만 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME NOT LIKE '박%';  

    > 본명에 '나'자가 들어간 멤버를 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME LIKE '%나%';

    ---------------------------------------------
