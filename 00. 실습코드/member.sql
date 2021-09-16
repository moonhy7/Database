-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 221.148.138.87    Database: database_modeling
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `database_modeling`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `database_modeling` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `database_modeling`;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` varchar(50) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `lecture`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lecture` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `lecture`;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `ID` int DEFAULT NULL,
  `CONTENT` text,
  `REGDATE` timestamp NULL DEFAULT NULL,
  `WRITER_ID` varchar(100) DEFAULT NULL,
  `NOTICE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idol_group`
--

DROP TABLE IF EXISTS `idol_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idol_group` (
  `COMPANY` varchar(300) NOT NULL,
  `GROUP_NAME` varchar(300) NOT NULL COMMENT '그룹명',
  `DEBUT_YEAR` varchar(4) DEFAULT NULL COMMENT '데뷔년도',
  `DEBUT_ALBUM` varchar(300) DEFAULT NULL COMMENT '데뷔앨범',
  `GENDER` varchar(10) DEFAULT NULL COMMENT '성별'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idol_group`
--

LOCK TABLES `idol_group` WRITE;
/*!40000 ALTER TABLE `idol_group` DISABLE KEYS */;
INSERT INTO `idol_group` VALUES ('빅히트 엔터테인먼트','BTS','2013','2 COOL 4 SCHOOL','boy'),('JYP 엔터테인먼트','트와이스','2015','THE STORY BEGINS','girl'),('YG 엔터테인먼트','블랙핑크','2016','SQUARE ONE','girl'),('판타지오','아스트로','2016','SPRING UP','boy'),('울림 엔터테인먼트','러블리즈','2014','Girls Invasion','girl'),('스타쉽 엔터테인먼트','우주소녀','2016','Would You Like','girl'),('스윙 엔터테인먼트','Wanna One','2017','1X1=1','boy'),('큐브 엔터테인먼트','(여자)아이들','2018','I am','girl'),('SM 엔터테인먼트','레드벨벳','2014','행복','girl'),('SM 엔터테인먼트','EXO','2012','마마','boy'),('JYP 엔터테인먼트','갓세븐','2014','Got it?','boy'),('오프더레코드 엔터테인먼트','아이즈원','2018','컬러라이즈','girl'),('플랜에이 엔터테인먼트','에이핑크','2011','Seven Springs of Apink','girl'),('큐브 엔터테인먼트','비투비','2012','비밀','boy'),('쏘스뮤직','여자친구','2015','Season of Glass','girl'),('YG 엔터테인먼트','위너','2014','2014 S/S','boy'),('스타쉽 엔터테인먼트','몬스타엑스','2015','TRESPASS','boy'),('WM 엔터테인먼트','오마이걸','2015','OH MY GIRL','girl'),('DSP미디어','에이프릴','2015','Dreaming','girl'),('젤리피쉬 엔터테인먼트','구구단','2016','The Little Mermaid','girl');
/*!40000 ALTER TABLE `idol_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idol_member`
--

DROP TABLE IF EXISTS `idol_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idol_member` (
  `GROUP_NAME` varchar(300) NOT NULL,
  `MEMBER_NAME` varchar(100) NOT NULL,
  `REAL_NAME` varchar(100) DEFAULT NULL,
  `BIRTHDAY` varchar(8) DEFAULT NULL,
  `SNS_INFO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idol_member`
--

LOCK TABLES `idol_member` WRITE;
/*!40000 ALTER TABLE `idol_member` DISABLE KEYS */;
INSERT INTO `idol_member` VALUES ('BTS','RM','김남준','19940912','V LIVE'),('BTS','슈가','민윤기','19930309','V LIVE'),('BTS','진','김석진','19921204','V LIVE'),('BTS','제이홉','장호석','19940218','V LIVE'),('BTS','지민','박지민','19951013','V LIVE'),('BTS','정국','전정국','19970901','V LIVE'),('트와이스','나연','임나연','19950922','V LIVE'),('트와이스','정연','유정연','19961101','V LIVE'),('트와이스','모모','히라이 모모','19961109','V LIVE'),('트와이스','사나','미나토자키 사나','19961229','V LIVE'),('트와이스','지효','박지효','19970201','V LIVE'),('트와이스','미나','묘이 미나','19970324','V LIVE'),('트와이스','다현','김다현','19980528','V LIVE'),('트와이스','채영','손채영','19990423','V LIVE'),('트와이스','쯔위','저우 쯔위','19990614','V LIVE'),('아스트로','차은우','이동민','19970330','인스타그램'),('아스트로','문빈','문빈','19980126','인스타그램'),('아스트로','MJ','김명준','19940305','인스타그램'),('아스트로','진진','박진우','19960315','인스타그램'),('아스트로','라키','박민혁','19990225','인스타그램'),('아스트로','윤산하','윤산하','20000321','인스타그램'),('(여자)아이들','미연','','19970131','V LIVE'),('(여자)아이들','민니','','19971023','V LIVE'),('(여자)아이들','수진','','19980309','V LIVE'),('(여자)아이들','소연','','19980826','V LIVE'),('(여자)아이들','우기','','19990923','V LIVE'),('(여자)아이들','수화','','20000106','V LIVE');
/*!40000 ALTER TABLE `idol_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `ID` varchar(100) NOT NULL,
  `PWD` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `GENDER` enum('M','F') DEFAULT NULL,
  `BIRTHDAY` char(10) DEFAULT NULL,
  `PHONE` char(13) DEFAULT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EMAIL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('AAAA','00000','TESTER01','M',NULL,NULL,'2021-09-14 08:59:33',NULL),('AAAAA','00000','TESTER01','M',NULL,NULL,'2021-09-14 08:58:59',NULL),('ABCDABCD','00000','TESTER01','M',NULL,NULL,'2021-09-14 09:00:57',NULL),('admin','admin','admin','M','000000','010-1234-4567','2021-09-14 09:00:50','aaa@naver.com'),('AP_JOPS','***','잡스','M','0000-00-00','010-0000-0000','2021-09-10 05:42:52','apple_jobs@gmail.com'),('ASVDD','00000','TESTER01','M',NULL,NULL,'2021-09-14 09:00:54',NULL),('BBBBB','00000','TESTER01','M',NULL,NULL,'2021-09-14 09:00:29',NULL),('CCC','00000','TESTER01','M',NULL,NULL,'2021-09-15 06:49:49',NULL),('ccccc','1111','TESTER01','M',NULL,NULL,'2021-09-14 09:26:45',NULL),('Code_Angel','***','코딩의요정','F','1234-56-78','010-1234-1234','2021-09-10 05:42:52','Code_Angel@gmail.com'),('dahyeon','***','강다현','F','1994-01-03','010-4449-6930','2021-09-10 05:42:52','kangdahyeon123@gmail.com'),('GOD','GOD','신','F','아심심하다','코딩하기 싫다...','2021-09-10 06:05:32','God@create.the.world'),('han','***','한용원','M','','','2021-09-10 05:42:52',''),('harry','***','하헌민','M','1993-11-26','010-7254-7761','2021-09-10 05:49:06','hhm12345@naver.com'),('hong01','***','홍길동','M','2021-09-03','010-1234-5678','2021-09-10 05:42:52','hong01@gmail.com'),('hyunseok','1234','정현석','M','1994-11-07','-18650','2021-09-10 06:13:34',NULL),('instructor Jung','졸려요','TT','F','살려','주세요','2021-09-10 06:03:44','ALT128564@windowemogi'),('JAVA_KIM','***','김자바','M','1111-11-11','010-9999-9999','2021-09-10 05:42:52','sorry_java@gmail.com'),('jec','1234','정의찬','M','199405223','010-2470-3757','2021-09-10 06:05:20','jec555@naver.com'),('jju','1234','한남주','F','123456','01020296374','2021-09-10 06:02:30','na2004go@naver.com'),('jun51','***','원준','M','18990116','010-5117-5627','2021-09-10 05:42:52','adfljhaj@afjklasdjf.com'),('kimmundo','xxx','NotNull','M','2021-01-01','010-1234-5678','2021-09-10 06:06:36',NULL),('kkk','***',NULL,NULL,NULL,NULL,'2021-09-10 05:42:52',NULL),('kogi','***','고기천','M',NULL,'010-4544-7180','2021-09-10 05:42:52',NULL),('mocha','choco','최재석','M','1992-05-21','010-2940-0649','2021-09-10 05:58:46','asdasf@gmail.com'),('moonhy7','***','문하윤','F','1996-06-01','010-4964-3169','2021-09-10 10:14:48','moonhy7@naver.com'),('moonhy77','00000','JDBC프로그래밍','F','1996-06-01','010-4964-3169','2021-09-14 09:17:20','moonhy7@naver.com'),('neo','culture','NCT','M','2016-01-27','010-****-7777','2021-09-10 05:59:27','NULL'),('pch','2345','찬호','M','1993-01-03','010-1234-4567','2021-09-10 06:14:40','bongja1203@gamil.com'),('qkrwlsgud','***','박진형','M','1994-08-14','010-2374-1566','2021-09-10 05:42:52','qkrwlsgud890@gmail.com'),('samsung','***','이재용','M','1980-05-01','010-1111-1111','2021-09-10 05:49:54','jaeDragon@samsung.com'),('SecRet_JIN','00000','TESTER_PARK','M',NULL,NULL,'2021-09-14 08:53:15',NULL),('SecRet_JIN2','12345','TESTER_PARK2','M',NULL,NULL,'2021-09-14 08:59:46',NULL),('SILBIA','***','최실비아','F','1991-11-14','010-4166-4612','2021-09-10 05:42:52','shbm13@naver.com'),('son07','***','케냐도련님정의찬','M','1992-07-08','010-1234-5678','2021-09-10 06:14:49','son07@naver.com'),('teemo','0404','티모','M',NULL,NULL,'2021-09-14 09:02:45',NULL),('tomthecat','foshizzlemynizzle','Thom Lee','M',NULL,NULL,'2021-09-14 09:04:02',NULL),('une_ji','패스워드!!!!','지은혜','F','1993-03-18','010-2106-3050','2021-09-10 05:45:48','help.extinguisher@gmail.com'),('yh.thomas.lee','nflpatriot','이영호','M','1987-05-07','010-4111-7971','2021-09-11 04:52:51','yh.thomas.lee@gmail.com'),('yj971020','5252','김예진','F','19971020','010-3705-1938','2021-09-10 05:44:36','yj971020@gmail.com'),('ykjung','***','정용관','F','19701023','010-2753-0885','2021-09-10 06:03:55','lim02@naver.com'),('yoon','***','지윤지','F','1994-10-03','010-4252-8323','2021-09-10 05:44:22','yoonzi1003@gmail.com'),('군만두','a','김시범','M','2021-09-03','010-4725-4324','2021-09-10 05:51:19','godua7@naver.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_role`
--

DROP TABLE IF EXISTS `member_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_role` (
  `MEMBER_ID` varchar(100) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_role`
--

LOCK TABLES `member_role` WRITE;
/*!40000 ALTER TABLE `member_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(300) NOT NULL,
  `WRITER_ID` varchar(100) NOT NULL,
  `CONTENT` text,
  `REGDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HIT` int unsigned DEFAULT '0',
  `FILES` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'[쿠마네서진이] [오후 5:07] #안내드립니다.','sjpark','\"STEP공공콘텐츠\" 수업을 듣는 학생들을 대상으로 하여 수료일정에 맞춰 \"이수자평가\"가 진행됩니다.','2021-09-08 03:00:36',18,NULL),(2,'퇴실안내','sjpark','김혜지, 박진형, 박찬호, 양승인, 오석, 유철우, 이윤진, 정의찬, 정현석, 지은혜, 최실비아 > 미퇴실입니다. 꼭 퇴실체크하시고, 스터디 진행해주세요.','2021-09-08 03:05:59',7,NULL),(3,'안내드립니다.','sjpark','지문입퇴실에 잦은 오류 발생으로, 될 수 있으면 QR 또는 비콘, 신호로 부탁드립니다. 지문의 경우 화면에 입실이라고 뜨더라도, HRD-net어플에서 입실이 되었는지 한번 더 확인해주세요.','2021-09-08 03:07:10',5,NULL),(4,'안내드립니다.','sjpark','요새 코로나백신접종으로 인해 결석하시는 분들이 생겨, 안내드립니다.\n     코로나백신은 당일과 그 다음날 1일만 출석공가로 적용됩니다. (접종확인서제출필수)\n    ','2021-09-08 03:08:38',17,NULL),(5,'안내드립니다.','sjpark','오늘(8/30)부터, 09:30분에 입실, 14:10분에 중간신호전송, 18:00에 퇴실 신호 전송예정입니다.\n     신호는 매니저가 전송예정이니 입퇴실신호를 놓치신 분은 매니저에게 요청해주세요.\n    ','2021-09-08 03:09:37',3,NULL),(6,'안내드립니다.','sjpark','현재 화장실 세면대에서 악취가 나고 있습니다. 해당 사건은 아랫층 공사로 인한 문제인 것으로 확인되었습니다. 다시 한번 공사담당자분께, 그리고 건물측에 말씀드려놓은 상태이며, 당분간 양치는 정수기를 이용해주시기 바랍니다.\n	 이용에 불편을 드려서 죄송합니다.\n    ','2021-09-08 03:10:55',25,NULL),(7,'스터디 강의장 개방 관련 안내','sjpark','코로나로 인해 다중이용시설의 이용이 어려운 수강생들을 위해,\n평일 저녁 및 주말에 강의장 개방을 해드리려고 합니다.\n주말은 신청자가 있는 경우에만 개방해드릴 예정이니, 주말 이용을 원하시는 경우 담당매니저를 통해 신청해주시기 바랍니다.\n\n1. 강의장 개방시간\n  *평일: 수업 끝난 후~9시까지\n  *토요일: 9:30~18:00\n\n2. 신청방법\n  *매주 월요일 담당매니저 개인톡으로 신청\n  *주말 선착순 10명\n  *10명 초과될 경우, 미사용으로 안내드립니다.\n\n감사합니다.\n    ','2021-09-08 03:12:20',1,NULL),(8,'09:30분에 신호전송예정입니다.','sjpark','(QR, 비콘, 신호는 상호연동이 됩니다. 사무실에 들려서 QR찍고 올라가기에 늦으실 것 같으면 신호로 출결해주셔도 됩니다. 입실체크 했던 방식과 다르다고 하더라도 퇴실시 신호로 체크하셔도 된다는 점 참고해주세요. / 단 지문은 유일무이하게 지문입실, 지문퇴실만 가능합니다.)\n    ','2021-09-08 03:15:03',25,NULL),(9,'입실안내','sjpark','전원입실하셨습니다.\n     (지은혜 > 코로나공가 처리되었습니다.\n	','2021-09-08 03:16:49',10,NULL),(10,'이번달(9월) 점심시간 안내','sjpark','다른 기수와 동선이 겹치지 않도록, 또한 많은 인원이 이동하며 거리두기 유지가 파괴되지 않도록 잘 지켜주시기 바랍니다. \n	','2021-09-08 03:17:54',20,NULL),(11,'#안내드립니다.','sjpark','지난 평가에 대한 서명이 필요합니다. 사무실에 내려오실 일이 있으시다면, 오셔서 서명 부탁드립니다. \n	','2021-09-08 03:18:38',13,NULL),(12,'양해부탁드립니다.','sjpark','오늘만 QR로 퇴실 부탁드립니다. HRD 접속오류가 생겨서, 양해부탁드립니다. \n	','2021-09-08 03:19:19',2,NULL),(13,'공지사항','sjpark','오늘과 내일은 PC셋팅부분이라 크게 치우지 않아되됩니다.\n대신 담주금요일엔 꼭꼭 치워주세요, 둘 자리 없으면 사무실 제자리에서라도 보관해드릴게요! \n	','2021-09-08 03:20:50',9,NULL),(14,'#중간신호안내','sjpark','14:10분에 중간신호를 전송할 예정이니, 비대면수업참여하시는 분들 준비해주세요\n	','2021-09-08 03:22:10',1,NULL),(15,'가입인사: 안녕하세요','mocha','asdf','2021-09-10 05:02:14',178,NULL),(16,'[가입인사] 방가방가~ ^^ ','une_ji','SQL여러분 반갑습니당~~!','2021-09-10 05:02:14',123,NULL),(17,'가입인사드립니다.','jec','하읭~!','2021-09-10 05:02:21',0,NULL),(18,'가입 인사','hhm12345','안녕하세요~','2021-09-10 05:02:58',29,NULL),(19,'가입인사드립니다','jdragon','갤럭시많이사랑해주세요','2021-09-10 05:03:20',111,NULL),(20,'[가입인사]반갑습니다','moonhy7','반갑습니다','2021-09-10 05:04:06',100,NULL),(21,'한남주 가입인사','강아지','안녕하세요 가입인사합니다. 오늘도 날씨가 아주 좋네요 다들 열공합시다! ','2021-09-10 05:04:18',80,''),(22,'가입인사 안녕하세요 ㅎㅎ','SILBIA','반갑습니다~~~ :)','2021-09-10 05:04:32',0,NULL),(24,'가입','만두먹고싶다','안녕하세요','2021-09-10 05:05:30',0,NULL),(25,'가입인사','dahyeon','안녕하세요??','2021-09-10 05:06:05',1,''),(26,'가입인사드립니다.','son07','토트넘 무관','2021-09-10 05:08:04',50000,NULL),(27,'가입인사','yoon','안녕하세용','2021-09-10 05:09:35',10,NULL),(28,'가입인사','yoon','안녕하세용','2021-09-10 05:09:53',10,NULL),(29,'가입인사','AP_JOPS','(광고) Aplle 스페셜 이벤트에 초대합니다.','2021-09-10 05:11:10',1165448,NULL),(30,'가입인사','test','안녕히계세요 여러분~ 저는 이 세상의 모든 굴레와 속박을 벗어던지고 제 행복을 찾아 떠납니다~! 여러분도 행복하세요~~~~~','2021-09-10 05:11:57',0,NULL),(31,'가입인사드립니다.','pch','가입인사 드립니다.','2021-09-10 05:12:00',9,NULL),(32,'가입인사입니다','Code_Angel','코드야 나와라 뚝딱','2021-09-10 05:15:34',22,NULL),(33,'[あいさつ]','ひとみ','お会いできて嬉しいです','2021-09-10 05:17:16',7,NULL),(34,'가입인사','han','hi','2021-09-10 05:17:50',0,''),(35,'가입인사','군만두','안녕하세요','2021-09-10 05:18:09',0,NULL),(36,'안녕하셍요','jeong','가입인사!','2021-09-10 05:18:19',1,NULL),(37,'For your information, it\'s TGIF!','yh.thomas.lee','오늘은 불금입니다.눈누난나','2021-09-10 08:40:14',0,NULL),(40,'Starving... T.T','yh.thomas.lee','배고파요.... ','2021-09-10 09:01:30',0,NULL),(41,'가입인사, 늦게왔습니다','wjheo51','네 그렇게됐습니다','2021-09-10 09:16:52',999999,NULL),(42,'가입인사, 더 늦게왔습니다','GoGyul','네 저도 그렇게됐습니다','2021-09-10 09:32:07',999998,NULL),(43,'안녕안녕하세하세요요','PARK',NULL,'2021-09-14 09:04:12',0,NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `ID` varchar(100) DEFAULT NULL,
  `DISCRIPTION` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-15 16:29:11
