
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
        -- 틀린 답 : 에러 발생하는 경우
        SELECT AVG(YEAR(NOW())-YEAR(BIRTHDAY)+1)
        FROM IDOL_MEMBER;


        -- 맞는 답 - 방법 1
        SELECT GROUP_NAME, MEMBER_NAME, YEAR(NOW())-YEAR(BIRTHDAY)+1 AGE
        FROM IDOL_MEMBER
        Having AGE >= (
                        SELECT ROUND(AVG(YEAR(NOW())-YEAR(BIRTHDAY)+1)) 
                        FROM IDOL_MEMBER
                        );


        -- 맞는 답 - 방법 2
        SELECT A.GROUP_NAME, A.MEMBER_NAME, A.AGE
        FROM (SELECT GROUP_NAME, MEMBER_NAME, YEAR(NOW())-YEAR(BIRTHDAY)+1 AGE FROM IDOL_MEMBER
              ) A
              where A.AGE >= (
                              SELECT ROUND(AVG(YEAR(NOW())-YEAR(BIRTHDAY)+1)) FROM IDOL_MEMBER
                            ) order by A.AGE DESC;


        -- 맞는 답(가장 깔끔함) - 방법 3

        -- WITH 절을 사용하여 가상테이블 생성
            WITH TBL AS
            (
              SELECT GROUP_NAME, MEMBER_NAME, YEAR(NOW())-YEAR(BIRTHDAY)+1 AGE
              FROM IDOL_MEMBER
            )

            SELECT GROUP_NAME, MEMBER_NAME, AGE
            FROM TABLE 
            WHERE AGE >= (SELECT AVG(TBL.AGE) FROM TBL);

        -- 총정리 (방법2를 예시로 설명)
        SELECT A.GROUP_NAME, A.MEMBER_NAME, A.AGE
        FROM (SELECT GROUP_NAME, MEMBER_NAME, YEAR(NOW())-YEAR(BIRTHDAY)+1 AGE FROM IDOL_MEMBER
              ) A -- FROM절에서는 컬럼끼리 연결해주는 격자점을 이루는 쿼리를 작성할 수 있다.
              where A.AGE >= (
                              SELECT ROUND(AVG(YEAR(NOW())-YEAR(BIRTHDAY)+1)) FROM IDOL_MEMBER
                            ) order by A.AGE DESC; -- WHERE절 안에서 서브쿼리가 나올 경우는 단일값(평균, 최대, 최소 값)이 나올 때이다.ADD
                                                   -- 꼭 단일값만 나오는 것은 아니다. IN(인천, 서울, 대구) 등 목록이 나올 때도 WHERE절안에 서브쿼리를 사용하는 경우이다.
    
    -- SELECT절에서도 서브쿼리를 쓸 수 있다. 여기서는 단일 컬럼 '하나'가 올 수 있음
 
 ----------------------------------------------------


-- 위치에 따라 사용되는 서브쿼리

1. SELECT 절에서 사용되는 서브쿼리(Scalar Subquery)
  : 하나의 레코드에 하나의 값을 리턴하는 서브쿼리
    컬럼값이 오는 모든 자리에 사용

    > NOTICE TALBE로부터 작성자(sjpark)의 게시글 HIT 평균값
      과 HIT 수를 출력하시오
        ----------------------------------------------------

        SELECT TITLE, WRITER_ID, HIT, -- SELECT절 서브쿼리 주의점 : 하나의 컬럼만 더 만들어줄 수 있음
            (
                SELECT AVG(HIT) FROM NOTICE 
                WHERE WRITER_ID = 'sjpark'
            ) AS AVG_HIT
        FROM NOTICE
        WHERE WRITER_ID = 'sjpark';

        ----------------------------------------------------

    > CITY 정보를 조회(단, 해당 도시의 나라이름 포함)하시오
        ----------------------------------------------------


      --  방법 1 (CITY에 별칭 안주기)
      SELECT NAME, CountryCode, 
            (
              SELECT NAME FROM country
              WHERE Code = city.CountryCode
            ) AS COUNTRYNAME, POPULATION
      FROM city;

      --  방법 2 (CITY에 별칭 주기)
      SELECT A.NAME, A.CountryCode, 
            (
              SELECT B.NAME 
              FROM country B
              WHERE A.CountryCode = B.Code
            ) AS COUNTRYNAME, POPULATION
      FROM city A;

      --  방법 3 (CITY에 별칭 주기)
      SELECT A.NAME, A.CountryCode, 
            (
              SELECT NAME FROM country
              WHERE A.CountryCode = Code
            ) AS COUNTRYNAME, POPULATION
      FROM city A;


      -- 별명 주기 (알리아스) - 조인 방법
      select a.name, a.countrycode, b.name as COUNTRYNAME, a.Population
      from city a, country b
      where a.countrycode = b.code;

        ----------------------------------------------------



        
2. FROM 절에서 사용되는 서브쿼리(Inline View)

     > NOTICE TALBE로부터 작성자(sjpark)의 게시글 HIT수가 15 이상인
       게시글들을 출력하시오
        ----------------------------------------------------

      -- 방법 1. 서브쿼리 미사용
      SELECT ID, TITLE, WRITER_ID, HIT
      FROM NOTICE
      WHERE HIT >= 15
      AND WRITER_ID = 'sjpark'
      ORDER BY HIT DESC;

      -- 방법 2. FROM절에서 서브쿼리 사용하여 격자 테이블을 만들어줌
      -- 조건 중 하나만 격자테이블에 넣음
      SELECT TITLE, WRITER_ID, HIT
      FROM (SELECT *
            FROM NOTICE
            WHERE WRITER_ID = 'sjpark') X
      WHERE X.HIT >= 15
      ORDER BY HIT DESC;

      -- 방법 3. FROM절에서 서브쿼리 사용하여 격자 테이블을 만들어줌
      -- 두 조건 모두 격자테이블에 넣음
      SELECT TITLE, WRITER_ID, HIT
      FROM (SELECT *
            FROM NOTICE
            WHERE WRITER_ID = 'sjpark'
            AND HIT >= 15) X
      ORDER BY HIT DESC;



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


        SELECT TITLE, WRITER_ID, HIT
        FROM NOTICE
        WHERE WRITER_ID IN
                (
                    SELECT WRITER_ID FROM NOTICE
                    WHERE TITLE LIKE '%가입인사%' 
                    AND HIT >= 100
                ); 

     
        ----------------------------------------------------


    > EMPLOYEES 테이블에서 개발부서(Development) 소속인 직원들을 조회하시오
        ----------------------------------------------------
        SELECT * FROM EMPLOYEES LIMIT 5;
        SELECT * FROM DEPT_EMP LIMIT 5;
        SELECT * FROM DEPARTMENTS;



        -- 정답
        SELECT *
        FROM employees AS A
        WHERE A.EMP_NO IN
                (
                    SELECT B.EMP_NO 
                    FROM dept_emp B
                    WHERE B.dept_no = 'd005' 
                );

        -- 연습하기

        -- 방법 1.
        SELECT EMP_NO, FIRST_NAME, LAST_NAME
        FROM employees
        WHERE EMP_NO IN
                (
                    SELECT EMP_NO FROM dept_emp X
                    WHERE DEPT_NO = 'D005'
                ); 

        -- 방법 2.
        SELECT EMP_NO, FIRST_NAME, LAST_NAME
        FROM employees
        WHERE EMP_NO IN
                (
                    SELECT EMP_NO FROM dept_emp X, departments Y
                    WHERE Y.dept_name = 'Development' 
                );

        -- 방법3.
        SELECT *
        FROM employees AS A
        WHERE A.EMP_NO IN
                (
                    SELECT B.EMP_NO 
                    FROM dept_emp B, departments C
                    WHERE C.dept_name = 'Development' 
                );

        -- 방법4.
        SELECT *
        FROM employees AS A
        WHERE A.EMP_NO IN
                (
                    SELECT B.EMP_NO 
                    FROM dept_emp B
                    WHERE B.dept_no = 'd005' 
                );


        -- 방법 5.
        SELECT EMP_NO, FIRST_NAME, LAST_NAME
        FROM employees
        WHERE EMP_NO IN
                (
                    SELECT EMP_NO FROM dept_emp X, departments Y
                    WHERE Y.dept_name = 'Development'
                ); 

        -- 방법6. (수정중)
        SELECT EMP_NO, FIRST_NAME, LAST_NAME
        FROM employees
        WHERE emp_no in (SELECT emp_no from dept_emp WHERE dept_no = 'd005');

        SELECT EMP_NO, FIRST_NAME, LAST_NAME,
        (SELECT dept_no from dept_emp) AS dept_no
        FROM employees;


        SELECT EMP_NO, FIRST_NAME, LAST_NAME
        FROM employees
        WHERE emp_no ALL (SELECT emp_no from dept_emp WHERE dept_no = 'd005');



        -- 방법7. 별칭쓰기 (수정중)
        SELECT A.EMP_NO, A.FIRST_NAME, A.LAST_NAME, B.dept_no
        from employees A, dept_emp B
        WHERE B.DEPT_NO = 'D005';


        -- select a.id, a.name, a.countrycode, b.name
        -- from city a,
        --         country b
        -- where a.countrycode=b.code
        -- order by a.id;



        ---------------------------------------------------- 


    -- > CITY 테이블에서 인구가 가장 많은 도시의 정보를 조회하시오
        ----------------------------------------------------
        SELECT MAX(POPULATION) FROM CITY;
        SELECT MIN(POPULATION) FROM CITY;


        SELECT *
        FROM CITY A
        WHERE A.POPULATION = (SELECT MAX(POPULATION) FROM CITY
        );


      -- > CITY 테이블에서 인구가 평균 이상인 도시의 정보를 조회하시오
        SELECT *
        FROM CITY A
        WHERE A.POPULATION >= 
        (
          SELECT ROUND(AVG(POPULATION)) FROM CITY
        );



        ----------------------------------------------------         