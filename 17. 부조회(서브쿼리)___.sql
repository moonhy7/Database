
-----------
부조회(서브쿼리, INNER QUERY)
: 쿼리 안에 있는 또 다른 쿼리
________________________
서브쿼리를 사용하는 경우
:구절의 순서를 바꿔야 하는 경우
 먼저 수행해서 결과를 남겨야 하는 경우

SELECT 
FROM 
WHERE 
GROUP BY 
HAVING 
ORDER BY 
_______________




        NOTICE 테이블에서 최신 등록순으로 정렬한 결과에서 
        상위 10개의 게시글을 원하는 경우라면?


        SELECT WRITER_ID, TITLE, REGDATE,
            DENSE_RANK() OVER(ORDER BY REGDATE DESC) `NO`
        FROM NOTICE
        WHERE `NO` BETWEEN 1 AND 10;
        -- 오류발생!


        SELECT A.WRITER_ID, A.TITLE, A.REGDATE, A.`NO`
        FROM   A
        WHERE  A.`NO` BETWEEN 1 AND 10;


        SELECT WRITER_ID, TITLE, REGDATE, 
            DENSE_RANK() OVER(ORDER BY REGDATE DESC) `NO`
        FROM NOTICE;


        SELECT A.WRITER_ID, A.TITLE, A.REGDATE, A.`NO`
        FROM   
            (
                SELECT WRITER_ID, TITLE, REGDATE, 
                    DENSE_RANK() OVER(ORDER BY REGDATE DESC) `NO`
                FROM NOTICE
            ) A
        WHERE  A.`NO` BETWEEN 1 AND 10;





    > IDOL_MEMBER 테이블에서 나이가 27세 이상인 멤버를 조회하시오
        ----------------------------------------------------
         -- 틀린 답 : 에러 발생하는 경우
         SELECT GROUP_NAME, MEMBER_NAME, YEAR(NOW())-YEAR(BIRTHDAY)+1 AGE
         FROM IDOL_MEMBER
         WHERE AGE >= 27;
         -- ERROR 1054 (42S22): Unknown column 'AGE' in 'where clause'   

        -- 맞는 답 - 방법 1
        SELECT A.GROUP_NAME, A.MEMBER_NAME, A.AGE
        FROM (SELECT GROUP_NAME, MEMBER_NAME, YEAR(NOW())-YEAR(BIRTHDAY)+1 AGE
                    FROM IDOL_member) A
        where A.AGE >= 27 order by A.AGE;

        -- 맞는 답 - 방법 2
        SELECT GROUP_NAME, MEMBER_NAME, YEAR(NOW())-YEAR(BIRTHDAY)+1 AGE
        FROM IDOL_MEMBER
        Having AGE >= 27;

        ----------------------------------------------------


    > IDOL_MEMBER 테이블에서 평균 나이 이상인 멤버를 조회하시오
        ----------------------------------------------------
        SELECT AVG(YEAR(NOW())-YEAR(BIRTHDAY)+1)
        FROM IDOL_MEMBER;







        ----------------------------------------------------





-- 위치에 따라 사용되는 서브쿼리

1. SELECT 절에서 사용되는 서브쿼리(Scalar Subquery)
  : 하나의 레코드에 하나의 값을 리턴하는 서브쿼리
    컬럼값이 오는 모든 자리에 사용

    > NOTICE TALBE로부터 작성자(sjpark)의 게시글 HIT 평균값
      과 HIT 수를 출력하시오 
        ----------------------------------------------------






        ----------------------------------------------------

    > CITY 정보를 조회(단, 해당 도시의 나라이름 포함)하시오
        ----------------------------------------------------






        ----------------------------------------------------



        
2. FROM 절에서 사용되는 서브쿼리(Inline View)

     > NOTICE TALBE로부터 작성자(sjpark)의 게시글 HIT수가 15 이상인
       게시글들을 출력하시오 
        ----------------------------------------------------







        ----------------------------------------------------




3. WHERE 절에서 사용되는 서브쿼리(중첩서브쿼리)

    -- 서브쿼리 결과에 따라

    - 단일행 서브쿼리
      서브쿼리의 결과가 1개의 행만 나오는 것
      단일행 서브쿼리 연산자 : =, <, >, <>

    - 다중행 서브쿼리(Multiple-Row Subquery)
      서브쿼리의 결과가 2건 이상 출력되는 경우
      다중행 서브쿼리 연산자 : IN


    > NOTICE TALBE로부터 가입인사 관련 게시글 중 HIT 수가
      100 이상인 게시글의 작성자와 TITLE, HIT 수를 조회하시오
        ----------------------------------------------------
        SELECT TITLE, WRITER_ID, HIT
        FROM NOTICE
        WHERE TITLE LIKE '%가입인사%' AND HIT >= 100;






        ----------------------------------------------------


    > EMPLOYEES 테이블에서 개발부서(Development) 소속인 직원들을 조회하시오
        ----------------------------------------------------
        SELECT * FROM EMPLOYEES LIMIT 5;
        SELECT * FROM DEPT_EMP LIMIT 5;
        SELECT * FROM DEPARTMENTS;





        ---------------------------------------------------- 


    > CITY 테이블에서 인구가 가장 많은 도시의 정보를 조회하시오
        ----------------------------------------------------
        SELECT MAX(POPULATION) FROM CITY;






        ----------------------------------------------------         