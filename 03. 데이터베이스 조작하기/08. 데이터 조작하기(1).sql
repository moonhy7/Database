
DML(Data Manipulation Language)
: 검색/등록/삭제/갱신을 위한 데이터베이스 언어

비대면 접속정보
mysql -u bitcamp -h 221.148.138.87 -p


[Member Table] 실습------------------------------------------

[INSERT] 등록/생성

    1. 모든 필드 값을 입력하기

        INSERT INTO lecture.member 
        VALUES(
            'hong01',
            '1234',
            '홍길동',
            '남',
            '2021-09-03',
            '010-1234-5678',
            '2021-09-03',
            'hong01@gmail.com'
        );
        SELECT * FROM lecture.member;


    2. 원하는 필드만, 원하는 순서대로 입력하기

        INSERT INTO member(ID, PWD) VALUES('lim02','6789');
        필수(입력) 정보 외에는 NULL로 채워짐

    3. member테이블에 회원정보 생성하기
       INSERT INTO `lecture`.`member`(
            `ID`,
            `PWD`,
            `NAME`,
            `GENDER`,
            `BIRTHDAY`,
            `PHONE`,
            `EMAIL`)
       VALUES(
            'ykjung',
            '1234',
            '정용관',
            'M',
            '1970-10-21',
            '010-2753-0885',
            'call1212@narospace.com'
       );

       notice테이블에 가입인사 생성하기
       INSERT INTO `lecture`.`notice`(
            `TITLE`,
            `WRITER_ID`,
            `CONTENT`,
       )VALUES(
            '가입인사^^ 드립니다.',
            'ykjung',
            'HI~ JAVA211',
       );



[SELECT] 검색
    
    1. 레코드 꺼내 보기

         전체컬럼 모두 조회
         SELECT * FROM member;

         보고싶은 컬럼만 조회
         SELECT `ID`, `NAME`, `PWD` FROM member;
         select id, pwd from member;
         * 예약어, 컬럼명은 대소문자를 가리지 않는다.
         * 비교할 값은 대소문자를 구별한다.
    
    
    2. 별칭(alias) 사용하기

       > 열이름(컬럼명) 별칭

         SELECT 1+3+8*9+21+1+12+54+56+23+567-123/5;
         SELECT 1+3+8*9+21+1+12+54+56+23+567-123/5; AS RESULT;

         'AS' 생략가능
         SELECT `ID` AS `USER_ID`, `PWD` AS `PASSWORD` FROM member;
         SELECT `ID`    `USER ID`, `PWD`    `PASSWORD` FROM member;
         * 빈공백 및 대소문자 그대로 반영하려면 `Xxx Xxx` backtick 이용

       > 테이블 이름 별칭
         'AS' 생략가능
         SELECT *
         FROM lecture.member AS `M`
         WHERE `M`.GENDER = 'F'; 
         

    3. 결과값(레코드) 제한하기
         SELECT *
         FROM world.city
         LIMIT 10;
         
         SELECT *
         FROM world.city
         LIMIT 10,10; -- 10번 이후부터 10개 추출 (11번~20번)


----------------------------------------------------------------