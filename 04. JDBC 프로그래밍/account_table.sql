-- 계좌 테이블 생성
CREATE TABLE `ACCOUNT`(
	`ACCNUM` CHAR(6) NOT NULL,
    `NAME` VARCHAR(50) NOT NULL,
    `BALANCE` BIGINT UNSIGNED DEFAULT 0,
    `UPDATE` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW(),
    PRIMARY KEY(`ACCNUM`)
);

-- 통장개설
INSERT INTO `ACCOUNT` (`ACCNUM`, `NAME`) VALUES('01-111','둘리');
INSERT INTO `ACCOUNT` (`ACCNUM`, `NAME`) VALUES('01-222','길동');

INSERT INTO `ACCOUNT` (`ACCNUM`, `NAME`) VALUES('01-333','짱구');

-- 입금
UPDATE `ACCOUNT` SET `BALANCE` = `BALANCE` + 10000 WHERE `ACCNUM` = '01-111';
UPDATE `ACCOUNT` SET `BALANCE` = `BALANCE` + 10000 WHERE `ACCNUM` = '01-222';

UPDATE `ACCOUNT` SET `BALANCE` = `BALANCE` + 30000 WHERE `ACCNUM` = '01-222';

-- 계좌이체
UPDATE `ACCOUNT` SET `BALANCE` = `BALANCE` - 5000 WHERE `ACCNUM` = '01-111';
UPDATE `ACCOUNT` SET `BALANCE` = `BALANCE` + 5000 WHERE `ACCNUM` = '01-222';

-- 
COMMIT;
SELECT * FROM ACCOUNT;



