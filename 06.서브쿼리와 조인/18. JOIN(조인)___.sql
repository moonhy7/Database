--------------

JOIN(조인)

관계를 맺고 있는 2개 이상의 테이블을 묶어서
하나의 결과 테이블을 만드는 것
INNER JOIN
LEFT/RIGHT/FULL OUTER JOIN
UNION

https://sql-joins.leopard.in.ua

________________________________________________

: 데이터베이스는 데이터의 중복저장, 저장공간의 낭비등을 
피하고 데이터의 무결성을 보장하기 위해 여러 개의 테이블
에 나누어 저장한다. 이러한 정규화 과정에 의해 서로 관계
를 맺고 있는 분리된 테이블을 일상적 질의를 처리하기 위해
조립하는 방법


-- 비정규화(Denormalization 데이터 베이스화 전)

사번    이름   부서코드  부서명       입사일
______________________________________________
10001	Georgi	 d005	  Development	 1986-06-26
10002	Bezalel	 d007	  Sales	       1985-11-21
10003	Parto	   d004	  Production	 1986-08-28


사번    이름   부서코드  부서명       직급      연봉
___________________________________________________
10001	Georgi	 d005	   Development  Staff     3500
10002	Bezalel	 d007	   Sales        Engineer  7000
10003	Parto	   d004	   Production   Manager   9000



-- 정규화(Normalized 데이터 베이스화 후)

  부서코드    부서명           
  ______________________________
  d001       Marketing          
  d002       Finance            
  d009       Customer Service   

  사번    이름          입사일
  _____________________________
  10001	Georgi	     1986-06-26
  10002	Bezalel	     1985-11-21 
  10003	Parto	       1986-08-28

  사번  부서코드      
  _______________
  10001  d005      
  10002  d007       
  10010  d004      

  사번   연봉      직급
  ________________________
  10001	 3500 	 Staff
  10002	 7000 	 Engineer
  10003	 9000 	 Manager
  

  -- 잘라서 저장하고 붙여서 사용하고... 스마트 하게~ 하는 방법 JOIN !!!
  -- 실습테이블 : LECTURE.MEMBER / LECTURE.NOTICE
  --                     1      :      N


  > MEMBER 중 게시글을 등록한 회원정보를 모두 조회하시오
  --1. INNER JOIN
    
    SELECT ID, NAME, GENDER 
    FROM MEMBER;
    SELECT TITLE, WRITER_ID, HIT 
    FROM NOTICE;

    SELECT ID, NAME, GENDER 
    FROM MEMBER JOIN NOTICE ON ID = WRITER_ID;
    -- !  Column 'ID' in field list is ambiguous ERROR


    SELECT M.ID, M.NAME, M.GENDER,
           N.TITLE, N.WRITER_ID, N.HIT 
    FROM 
           MEMBER AS M JOIN NOTICE AS N 
           ON M.ID = N.WRITER_ID;

    -- ! ID와 WRITER_ID 중복 제거   
    SELECT M.ID, M.NAME, M.GENDER,
           N.TITLE, N.HIT 
    FROM 
           MEMBER AS M JOIN NOTICE AS N 
           ON M.ID = N.WRITER_ID;    

  ---------------------------------------------------------------------


  > MEMBER 중 게시글을 등록하지 않은 회원정보를 조회하시오
  --2. LEFT OUTER JOIN

    SELECT M.ID, M.NAME, M.GENDER,
           N.TITLE, N.HIT
    FROM 
           MEMBER AS M LEFT OUTER JOIN NOTICE AS N 
           ON M.ID = N.WRITER_ID;    

    SELECT M.ID, M.NAME, M.GENDER,
           N.TITLE, N.HIT 
    FROM 
           MEMBER AS M LEFT OUTER JOIN NOTICE AS N 
           ON M.ID = N.WRITER_ID
    WHERE  N.TITLE IS NULL;    

  ---------------------------------------------------------------------


  > 비회원 작성자의 게시글을 조회하시오
  -- 3. RIGHT OUTER JOIN

    SELECT M.ID, M.NAME, M.GENDER,
           N.TITLE, N.HIT 
    FROM 
           MEMBER AS M RIGHT OUTER JOIN NOTICE AS N 
           ON M.ID = N.WRITER_ID;

    -- ! 작성자 ID가 필요 
    SELECT M.ID, M.NAME, M.GENDER,
           N.TITLE, N.WRITER_ID, N.HIT 
    FROM 
           MEMBER AS M RIGHT OUTER JOIN NOTICE AS N 
           ON M.ID = N.WRITER_ID;

    -- ! 회원정보 불필요       
    SELECT 
           N.TITLE, N.WRITER_ID, N.HIT 
    FROM 
           MEMBER AS M RIGHT OUTER JOIN NOTICE AS N 
           ON M.ID = N.WRITER_ID
    WHERE  M.ID IS NULL; 


  ---------------------------------------------------------------------

  
  -- 4. FULL OUTER JOIN
    SELECT M.ID, M.NAME, M.GENDER,
           N.TITLE, N.WRITER_ID, N.HIT 
    FROM 
           MEMBER AS M LEFT OUTER JOIN NOTICE AS N 
           ON M.ID = N.WRITER_ID  

    UNION

    SELECT M.ID, M.NAME, M.GENDER,
           N.TITLE, N.WRITER_ID, N.HIT 
    FROM 
           MEMBER AS M RIGHT OUTER JOIN NOTICE AS N 
           ON M.ID = N.WRITER_ID;            
  
  ---------------------------------------------------------------------




  

