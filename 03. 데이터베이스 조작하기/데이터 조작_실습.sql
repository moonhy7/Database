-- DML (CRUD)

-- 1. INSERT 구문
INSERT INTO `TBL`(
	`COL1`,
    `COL2`
)VALUE(
	'VAL1',
    'VAL2'
);

-- 2. SELECT 구문
SELECT `ID`, `NAME` 
FROM `TBL` 
WHERE '조건'; 
-- 뒤에 WHERE, GROUP BY, ORDER BY 등이 온다.

-- 3. UPDATE 구문
UPDATE `TDL` 
SET `COL1` = 'VAL1',
	`COL2` = 'VAL2'
WHERE '조건';

-- 4. DELETE 구문
DELETE FROM `TBL`
WHERE '조건';

-- 5. 테이블 열 정보 출력
DESC MEMBER;

-- 6. column명 대체 별칭 사용하기 
SELECT ID `STUDENT ID`, PWD PW, NAME `STUDENT NAME`, GENDER `남 여` FROM MEMBER;
