CREATE TABLE `member` (
  `ID` varchar(50) NOT NULL,
  `PWD` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  
  `GENDER` char(6) DEFAULT NULL,
  /* '남' OR '여'	수정*/
  /* 'M' OR 'F'	수정*/
  
  `AGE` tinyint unsigned DEFAULT NULL,
  /* 삭제 */
  
  `BIRTHDAY` char(10) DEFAULT NULL,
  `PHONE` char(13) DEFAULT NULL,
  
  /* EMAIL	추가 */
  
  `REGDATE` timestamp DEFAULT NULL,member
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE member ADD `EMAIL` VARCHAR(200);

ALTER TABLE member MODIFY `GENDER` CHAR(3);
ALTER TABLE member MODIFY `ID` VARCHAR(100);
ALTER TABLE member MODIFY `PWD` VARCHAR(100);
ALTER TABLE member MODIFY `NAME` VARCHAR(100);

ALTER TABLE member DROP COLUMN `AGE`;









