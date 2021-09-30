
-----------
SELECT 구절
________________________
구절 내용과 작성순서 숙지!

SELECT 
FROM 
WHERE 
GROUP BY 
HAVING 
ORDER BY 
_______________



[SELECT 구절 처리 과정]


1. FROM city
 : 데이터 가공 처리를 위한 격자형 데이터 구조(테이블/레코드 연산)를 마련
+----+----------------+-------------+---------------+------------+
| ID | Name           | CountryCode | District      | Population |
+----+----------------+-------------+---------------+------------+
|  1 | Kabul          | AFG         | Kabol         |    1780000 |
|  2 | Qandahar       | AFG         | Qandahar      |     237500 |
|  3 | Herat          | AFG         | Herat         |     186800 |
|  4 | Mazar-e-Sharif | AFG         | Balkh         |     127800 |
|  5 | Amsterdam      | NLD         | Noord-Holland |     731200 |
|  6 | Rotterdam      | NLD         | Zuid-Holland  |     593321 |
|  7 | Haag           | NLD         | Zuid-Holland  |     440900 |
|  8 | Utrecht        | NLD         | Utrecht       |     234323 |
|  9 | Eindhoven      | NLD         | Noord-Brabant |     201843 |
| 10 | Tilburg        | NLD         | Noord-Brabant |     193238 |

                        ...............
                        ...............

+----+----------------+-------------+---------------+------------+

2. WHERE `Population` > 200000
 : 레코드 필터링
+----+-----------+-------------+---------------+------------+
| ID | Name      | CountryCode | District      | Population |
+----+-----------+-------------+---------------+------------+
|  1 | Kabul     | AFG         | Kabol         |    1780000 |
|  2 | Qandahar  | AFG         | Qandahar      |     237500 |
|  5 | Amsterdam | NLD         | Noord-Holland |     731200 |
|  6 | Rotterdam | NLD         | Zuid-Holland  |     593321 |
|  7 | Haag      | NLD         | Zuid-Holland  |     440900 |
|  8 | Utrecht   | NLD         | Utrecht       |     234323 |
|  9 | Eindhoven | NLD         | Noord-Brabant |     201843 |
| 34 | Tirana    | ALB         | Tirana        |     270000 |
| 35 | Alger     | DZA         | Alger         |    2168000 |
| 36 | Oran      | DZA         | Oran          |     609823 |
+----+-----------+-------------+---------------+------------+

3. GROUP BY `CountryCode` 
 : 집계(COUNT/AVG/MIN/MAX)
+-------------+-----+
| CountryCode | CNT |
+-------------+-----+
| AFG         |   2 |
| NLD         |   5 |
| ALB         |   1 |
| DZA         |   2 |
+-------------+-----+

4. HAVING `CNT` >= 2
 : 집계된 레코드에서 필터링
 ★집계함수(COUNT/AVG/MIN/MAX)는 WHERE 절에서 사용 할 수 없다.
+-------------+-----+
| CountryCode | CNT |
+-------------+-----+
| AFG         |   2 |
| NLD         |   5 |
| DZA         |   2 |
+-------------+-----+

5. SELECT 

6. ORDER BY `CNT` DESC
 : 정렬
+-------------+-----+
| CountryCode | CNT |
+-------------+-----+
| NLD         |   5 |  
| AFG         |   2 |
| DZA         |   2 | 
+-------------+-----+


    SELECT COUNTRYCODE, COUNT(COUNTRYCODE) CNT
    FROM CITY
    WHERE POPULATION > 5000000
    GROUP BY COUNTRYCODE
    HAVING CNT >=2
    ORDER BY CNT DESC, COUNTRYCODE ASC;




[SELECT 구절 사용]


1. 정렬하기(ORDER BY) 
 : 오름차순(ASC) / 내림차순(DESC)

    > 공지사항 테이블에서 조회수가 가장 많은 순서로 출력하시오
        ----------------------------------------------------

         SELECT ID, TITLE, WRITER_ID, HIT, REGDATE
         FROM NOTICE
         ORDER BY HIT;
         
         -- 2차 정렬
         SELECT ID, TITLE, WRITER_ID, HIT, REGDATE
         FROM NOTICE
         ORDER BY HIT DESC, REGDATE DESC;

         
        ----------------------------------------------------


2. 집계 함수와 GROUP BY
 : SUM, MIN, MAX, COUNT, AVG

    -- 컬럼 전체를 대상으로 집계(분석)
        ----------------------------------------------------     
        SELECT SUM(HIT) FROM NOTICE;
        SELECT AVG(HIT) FROM NOTICE;
        ----------------------------------------------------       

    -- 소규모 그룹으로 나눠서 집계(분석)
        ----------------------------------------------------  
        SELECT COUNT(ID) FROM NOTICE;
        
        SELECT COUNT(ID) FROM NOTICE GROUP BY WRITER_ID;
        ---------------------------------------------------- 

    -- HAVING 절 
        ----------------------------------------------------      
        SELECT WRITER_ID, COUNT(ID)
        FROM NOTICE
        WHERE COUNT(ID) >= 2;
        GROUP BY WRITER_ID;      

        순서: FROM, 
              WHERE, 
              GROUP BY, HAVING, SELECT, ORDER BY
                       |----- 집계함수 사용가능 영역 ------>
        ----------------------------------------------------  



    > 공지사항 테이블에서 작성자별 글 올린 개수를 출력하시오
      단, 게시글 수가 2회 이상인 작성자만 출력 
        ----------------------------------------------------  

        SELECT WRITER_ID, COUNT(ID) CNT 
        FROM NOTICE 
        GROUP BY WRITER_ID
        HAVING CNT >= 2 
        ORDER BY CNT DESC;

        ----------------------------------------------------   


3. 순위함수
 : ROW_NUMBER() OVER()
   RANK OVER()
   DENSE_RANK OVER()

         ----------------------------------------------------  

        > 조회수에 따른 순위    
         SELECT TITLE, WRITER_ID, HIT, 
         ROW_NUMBER() OVER(ORDER BY HIT DESC) `RANK`
         FROM NOTICE;
        
         SELECT TITLE, WRITER_ID, HIT,
         RANK() OVER(ORDER BY HIT DESC) `RANK`
         FROM NOTICE;

         SELECT TITLE, WRITER_ID, HIT,
         DENSE_RANK() OVER(ORDER BY HIT DESC) `RANK`
         FROM NOTICE;         

         SELECT WRITER_ID, TITLE, HIT,
         DENSE_RANK() OVER(PARTITION BY WRITER_ID 
                           ORDER BY HIT DESC) `RANK`
         FROM NOTICE;        

        ----------------------------------------------------          