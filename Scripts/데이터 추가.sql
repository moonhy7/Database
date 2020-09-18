SELECT * FROM lecture.member;
--  한 줄로 쓰는 방법
-- INSERT INTO member(XXX, XXX, XXX, ...) VALUES('', '', '', ...);

-- 여러줄로 쓰는 방법
INSERT INTO `lemembercture`.`member`(
	`ID`, -- 백팁(``)쓰는 이유 : 이름 안에 띄어쓰기가 있는 경우 때문에 
	`PWD`,
	`NAME`,
	`GENDER`,
	`BIRTHDAY`,
	`PHONE`,
	`EMAIL`)
VALUES(
	'AAA',
    '1111',
    'ans',
    'M',
    '1996-06-01',
    '010-4964-3169',
    'moonhy7@naver.com'
);