CREATE DATABASE  IF NOT EXISTS `lecture` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lecture`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lecture
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
  `REGDATE` timestamp NULL DEFAULT NULL,
  `HIT` int unsigned DEFAULT '0',
  `FILES` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'[쿠마네서진이] [오후 5:07] #안내드립니다.','sjpark','\"STEP공공콘텐츠\" 수업을 듣는 학생들을 대상으로 하여 수료일정에 맞춰 \"이수자평가\"가 진행됩니다.','2021-09-08 03:00:36',18,NULL),(2,'퇴실안내','sjpark','김혜지, 박진형, 박찬호, 양승인, 오석, 유철우, 이윤진, 정의찬, 정현석, 지은혜, 최실비아 > 미퇴실입니다. 꼭 퇴실체크하시고, 스터디 진행해주세요.','2021-09-08 03:05:59',7,NULL),(3,'안내드립니다.','sjpark','지문입퇴실에 잦은 오류 발생으로, 될 수 있으면 QR 또는 비콘, 신호로 부탁드립니다. 지문의 경우 화면에 입실이라고 뜨더라도, HRD-net어플에서 입실이 되었는지 한번 더 확인해주세요.','2021-09-08 03:07:10',5,NULL),(4,'안내드립니다.','sjpark','요새 코로나백신접종으로 인해 결석하시는 분들이 생겨, 안내드립니다.\n     코로나백신은 당일과 그 다음날 1일만 출석공가로 적용됩니다. (접종확인서제출필수)\n    ','2021-09-08 03:08:38',17,NULL),(5,'안내드립니다.','sjpark','오늘(8/30)부터, 09:30분에 입실, 14:10분에 중간신호전송, 18:00에 퇴실 신호 전송예정입니다.\n     신호는 매니저가 전송예정이니 입퇴실신호를 놓치신 분은 매니저에게 요청해주세요.\n    ','2021-09-08 03:09:37',3,NULL),(6,'안내드립니다.','sjpark','현재 화장실 세면대에서 악취가 나고 있습니다. 해당 사건은 아랫층 공사로 인한 문제인 것으로 확인되었습니다. 다시 한번 공사담당자분께, 그리고 건물측에 말씀드려놓은 상태이며, 당분간 양치는 정수기를 이용해주시기 바랍니다.\n	 이용에 불편을 드려서 죄송합니다.\n    ','2021-09-08 03:10:55',25,NULL),(7,'스터디 강의장 개방 관련 안내','sjpark','코로나로 인해 다중이용시설의 이용이 어려운 수강생들을 위해,\n평일 저녁 및 주말에 강의장 개방을 해드리려고 합니다.\n주말은 신청자가 있는 경우에만 개방해드릴 예정이니, 주말 이용을 원하시는 경우 담당매니저를 통해 신청해주시기 바랍니다.\n\n1. 강의장 개방시간\n  *평일: 수업 끝난 후~9시까지\n  *토요일: 9:30~18:00\n\n2. 신청방법\n  *매주 월요일 담당매니저 개인톡으로 신청\n  *주말 선착순 10명\n  *10명 초과될 경우, 미사용으로 안내드립니다.\n\n감사합니다.\n    ','2021-09-08 03:12:20',1,NULL),(8,'09:30분에 신호전송예정입니다.','sjpark','(QR, 비콘, 신호는 상호연동이 됩니다. 사무실에 들려서 QR찍고 올라가기에 늦으실 것 같으면 신호로 출결해주셔도 됩니다. 입실체크 했던 방식과 다르다고 하더라도 퇴실시 신호로 체크하셔도 된다는 점 참고해주세요. / 단 지문은 유일무이하게 지문입실, 지문퇴실만 가능합니다.)\n    ','2021-09-08 03:15:03',25,NULL),(9,'입실안내','sjpark','전원입실하셨습니다.\n     (지은혜 > 코로나공가 처리되었습니다.\n	','2021-09-08 03:16:49',10,NULL),(10,'이번달(9월) 점심시간 안내','sjpark','다른 기수와 동선이 겹치지 않도록, 또한 많은 인원이 이동하며 거리두기 유지가 파괴되지 않도록 잘 지켜주시기 바랍니다. \n	','2021-09-08 03:17:54',20,NULL),(11,'#안내드립니다.','sjpark','지난 평가에 대한 서명이 필요합니다. 사무실에 내려오실 일이 있으시다면, 오셔서 서명 부탁드립니다. \n	','2021-09-08 03:18:38',13,NULL),(12,'양해부탁드립니다.','sjpark','오늘만 QR로 퇴실 부탁드립니다. HRD 접속오류가 생겨서, 양해부탁드립니다. \n	','2021-09-08 03:19:19',2,NULL),(13,'공지사항','sjpark','오늘과 내일은 PC셋팅부분이라 크게 치우지 않아되됩니다.\n대신 담주금요일엔 꼭꼭 치워주세요, 둘 자리 없으면 사무실 제자리에서라도 보관해드릴게요! \n	','2021-09-08 03:20:50',9,NULL),(14,'#중간신호안내','sjpark','14:10분에 중간신호를 전송할 예정이니, 비대면수업참여하시는 분들 준비해주세요\n	','2021-09-08 03:22:10',1,NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-09  9:54:33
