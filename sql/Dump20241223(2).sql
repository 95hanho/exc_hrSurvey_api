CREATE DATABASE  IF NOT EXISTS `hr_survey` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hr_survey`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hr_survey
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `common_info`
--

DROP TABLE IF EXISTS `common_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_info` (
  `year` int NOT NULL,
  `backcolor` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_info`
--

LOCK TABLES `common_info` WRITE;
/*!40000 ALTER TABLE `common_info` DISABLE KEYS */;
INSERT INTO `common_info` VALUES (2024,'#efefef','2024-07-26 14:00:00','2024-12-31 14:00:00'),(2025,NULL,'2024-12-18 15:56:22','2024-12-18 15:56:22');
/*!40000 ALTER TABLE `common_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_result`
--

DROP TABLE IF EXISTS `common_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_result` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `R_Name` varchar(255) DEFAULT NULL,
  `R_Position` varchar(255) DEFAULT NULL,
  `R_Tel_No` varchar(255) DEFAULT NULL,
  `R_C_Tel_No` varchar(255) DEFAULT NULL,
  `zonecode` varchar(255) NOT NULL,
  `addr_road` varchar(255) DEFAULT NULL,
  `addr_detail` varchar(255) DEFAULT NULL,
  `R_Email` varchar(255) DEFAULT NULL,
  `R_Div` varchar(255) DEFAULT NULL,
  `R_Company_Name` varchar(255) DEFAULT NULL,
  `R_Part_Name` varchar(255) DEFAULT NULL,
  `R_Cate` varchar(255) DEFAULT NULL,
  `R_Cate_Name` varchar(255) DEFAULT NULL,
  `R_Biz_Reg_No` varchar(255) DEFAULT NULL,
  `R_COMMON_1_1` varchar(255) DEFAULT NULL,
  `R_COMMON_1_2` varchar(255) DEFAULT NULL,
  `R_COMMON_1_3` varchar(255) DEFAULT NULL,
  `R_COMMON_1_4` varchar(255) DEFAULT NULL,
  `R_COMMON_1_5` varchar(255) DEFAULT NULL,
  `R_COMMON_1_6` varchar(255) DEFAULT NULL,
  `R_COMMON_1_7` varchar(255) DEFAULT NULL,
  `R_COMMON_1_8` varchar(255) DEFAULT NULL,
  `R_COMMON_1_9` varchar(255) DEFAULT NULL,
  `R_COMMON_1_10` varchar(255) DEFAULT NULL,
  `recommend` varchar(255) DEFAULT NULL,
  `progress_raw` json DEFAULT NULL,
  `complete` tinyint(1) DEFAULT '0',
  `survey_id` int DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `FK_survey_TO_common_result_1` (`survey_id`),
  CONSTRAINT `FK_survey_TO_common_result_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_result`
--

LOCK TABLES `common_result` WRITE;
/*!40000 ALTER TABLE `common_result` DISABLE KEYS */;
INSERT INTO `common_result` VALUES (1,'한호성','ㅁㄴㅁㄹㅇㄴㅁ','021231234','01012341234','32229','충남 홍성군 홍성읍 조양로 40','12321','test1@naver.com','2','213','12321','2','','5378502360','21321','12','','','','','','','','','123132',NULL,0,10);
/*!40000 ALTER TABLE `common_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_result`
--

DROP TABLE IF EXISTS `page_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_result` (
  `pr_id` int NOT NULL AUTO_INCREMENT,
  `store_data` json DEFAULT NULL,
  `p_survey_id` int DEFAULT NULL,
  `result_id` int DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `FK_page_survey_TO_page_result_1` (`p_survey_id`),
  KEY `FK_common_result_TO_page_result_1` (`result_id`),
  CONSTRAINT `FK_common_result_TO_page_result_1` FOREIGN KEY (`result_id`) REFERENCES `common_result` (`result_id`),
  CONSTRAINT `FK_page_survey_TO_page_result_1` FOREIGN KEY (`p_survey_id`) REFERENCES `page_survey` (`p_survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_result`
--

LOCK TABLES `page_result` WRITE;
/*!40000 ALTER TABLE `page_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_survey`
--

DROP TABLE IF EXISTS `page_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_survey` (
  `p_survey_id` int NOT NULL AUTO_INCREMENT,
  `sPage` int DEFAULT NULL,
  `jsonData` json DEFAULT NULL,
  `survey_id` int DEFAULT NULL,
  PRIMARY KEY (`p_survey_id`),
  KEY `page_survey_survey_idx` (`survey_id`),
  CONSTRAINT `page_survey_survey` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_survey`
--

LOCK TABLES `page_survey` WRITE;
/*!40000 ALTER TABLE `page_survey` DISABLE KEYS */;
INSERT INTO `page_survey` VALUES (6,1,'{\"initData\": {\"R_1_1_2\": \"\", \"R_1_2_2\": \"\", \"R_1_3_2\": \"\", \"R_1_4_2\": \"\", \"R_1_5_2\": \"\", \"R_2_n_2\": \"\", \"R_3_etc\": \"\", \"R_4_etc\": \"\", \"R_5_1_2\": \"\", \"R_6_1_2\": \"\", \"R_6_1_3\": \"\", \"R_6_1_4\": \"\", \"R_6_1_5\": \"\", \"R_6_1_6\": \"\", \"R_6_1_7\": \"\", \"R_6_1_8\": \"\", \"R_6_1_9\": \"\", \"R_7_1_2\": \"\", \"R_7_1_3\": \"\", \"R_7_1_4\": \"\", \"R_7_1_5\": \"\", \"R_7_1_6\": \"\", \"R_7_1_7\": \"\", \"R_7_1_8\": \"\", \"R_7_1_9\": \"\", \"R_8_1_2\": \"\", \"R_8_1_3\": \"\", \"R_8_1_4\": \"\", \"R_8_1_5\": \"\", \"R_9_1_2\": \"\", \"R_9_1_3\": \"\", \"R_9_1_4\": \"\", \"R_9_1_5\": \"\", \"R_9_1_6\": \"\", \"R_9_1_7\": \"\", \"R_7_1_10\": \"\", \"R_3_multi\": \"\", \"R_4_multi\": \"\"}, \"munhangs\": [{\"title\": \"거시지표\", \"questions\": [{\"alert\": {\"color\": \"danger\", \"content\": \"* ‘매출 총액’은 매출이 없는 공공조직의 경우 \'0\'원으로 입력해주세요.\"}, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$center|매출총액*\", \"R_won\"], [\"$center|전체 직원 수\", \"R_people\"], [\"$center|교육대상 직원 수\", \"R_people\"], [\"$center|교육예산 총액(교육부서 예산기준)\", \"R_won\"], [\"$center|교육경비 집행 총액(교육부서 집행기준)\", \"R_won\"]], \"table_th\": [[\"항목\", \"2023년 결과\"]], \"table_set\": true}}]}, {\"title\": \"교육비 증감\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"1) 22년 대비 23년도의 교육비(집행기준) 증감과 관련하여 해당 란에 체크해주세요.\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$cenBold|증가<br>2번) 문항 이동\", \"R_increDecre\"], [\"$cenBold|감소<br>3번) 문항 이동\", \"R_increDecre\"]], \"table_th\": [[\"구분\", \"$width15|1% ~ 5%\", \"$width15|6% ~ 15%\", \"$width15|16% ~ 25%\", \"$width15|26% ~ 50%\", \"$width15|51% 이상\"]], \"table_set\": true}}, {\"qType\": \"MultiChoice\", \"title\": \"2) 22년 대비 23년도의 교육비 증가 이유는 무엇입니까?<br>(복수응답 가능)\", \"subContents\": {\"plural\": true, \"choices\": [{\"notic\": \"\", \"content\": \"교육인원의 증가(교육 차수, 교육과정수 증가)\"}, {\"notic\": \"\", \"content\": \"직원 개인에 대한 교육비 지원 증가(외부 교육, 세미나 참가비 등)\"}, {\"notic\": null, \"content\": \"컨설팅, 교육과정 개발 비용 증가\"}, {\"notic\": null, \"content\": \"시스템 도입 및 구축 비용 증가\"}, {\"notic\": null, \"content\": \"R_etc\"}]}}, {\"qType\": \"MultiChoice\", \"title\": \"3) 22년 대비 23년도의 교육비 감소 이유는 무엇입니까?<br>(복수응답 가능)\", \"subContents\": {\"plural\": true, \"choices\": [{\"notic\": \"\", \"content\": \" 경영상의 사유, 환경요인 등으로 인한 교육 축소 \"}, {\"notic\": \"\", \"content\": \"교육인원의 감소(교육 차수, 교육과정수 감소)\"}, {\"notic\": null, \"content\": \" 직원 개인에 대한 교육비 지원 감소(외부 교육, 세미나 참가비 등)\"}, {\"notic\": null, \"content\": \" 컨설팅, 교육과정 개발 비용 축소\"}, {\"notic\": null, \"content\": \"R_etc\"}]}}]}, {\"title\": \"교육 시간\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"2023년에 진행된 교육대상 직원 1인당 교육시간(평균)을 기술해 주십시오.\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$center|인당 교육시간(평균)\", \"R_time\"]], \"table_th\": [[\"구분\", \"교육시간\"]]}}]}, {\"title\": \"교육 인원 비율\", \"questions\": [{\"alert\": {\"color\": \"danger\", \"content\": \"* ‘실시간 비대면 교육’ 은 zoom, webex, 구루미, 게더타운 등을 활용한 교육을 의미합니다.\"}, \"qType\": \"MultiTable\", \"title\": \" 귀사(기관)에서 실시한 교육 형태별 참가인원 비율을 기술해  주십시오.<br>(항목별 가로 합이 100%가 되도록 기술)\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"비율\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"$width5|\", \"집합<br>교육\", \"실시간<br>비대면<br>교육*\", \"이러닝\", \"플립<br>러닝\", \"독서통신<br>교육\", \"해외<br>연수\", \"국내외<br>학위 연수\", \"개인별<br>외부교육/<br>세미나\", \"계\"]], \"table_set\": true}}]}, {\"title\": \"교육비<br>지출 비율\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"1) 다음에 제시된 교육 형태 별로 교육비의 지출 비율을 기술해 주십시오.\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"비율\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"$width5|\", \"집합<br>교육비\", \"실시간<br>비대면<br>교육비\", \"이러닝<br>교육비\", \"플립<br>러닝\", \"독서<br>통신<br>교육비\", \"해외<br>연수비<br><small>(단기 연수&<br>컨퍼런스 참가 등)</small><br>\", \"국내외<br>학위<br>연수비\", \"개인별<br>교육비<br>지원<small><br>(외부교육)</small>\", \"개발<br>용역비<br><small>(컨설팅,<br>아웃소싱 등</small>\", \"계\"]]}}, {\"qType\": \"MultiTable\", \"title\": \"2) (기업) 다음에 제시된 직책자 이상 및 비직책자 교육비의 지출 비율을 기술해 주십시오. \", \"subContents\": {\"table_td\": [[\"비율\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"$width5|\", \"신입\", \"비직책자\", \"직책자(팀장)\", \"임원급 이상\", \"계\"]]}}, {\"qType\": \"MultiTable\", \"title\": \"3) (공공) 다음에 제시된 직급별 교육비의 지출 비율을 기술해 주십시오. \", \"subContents\": {\"table_td\": [[\"비율\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"$width5|\", \"신입\", \"7급 이하\", \"6급\", \"4 ~5급\", \"3급\", \"2급 이상\", \"계\"]]}}]}], \"requiredList\": [{\"attr\": \"R_2_n_2\", \"hide\": [\"4\"], \"values\": [\"1\", \"2\", \"3\", \"4\", \"5\"]}, {\"attr\": \"R_2_n_2\", \"hide\": [\"3\"], \"values\": [\"6\", \"7\", \"8\", \"9\", \"10\"]}]}',9),(8,1,'{\"initData\": {\"R_1_1_2\": \"\", \"R_1_2_2\": \"\", \"R_1_3_2\": \"\", \"R_1_4_2\": \"\", \"R_1_5_2\": \"\", \"R_2_n_2\": \"\", \"R_3_etc\": \"\", \"R_4_etc\": \"\", \"R_5_1_2\": \"\", \"R_6_1_2\": \"\", \"R_6_1_3\": \"\", \"R_6_1_4\": \"\", \"R_6_1_5\": \"\", \"R_6_1_6\": \"\", \"R_6_1_7\": \"\", \"R_6_1_8\": \"\", \"R_6_1_9\": \"\", \"R_7_1_2\": \"\", \"R_7_1_3\": \"\", \"R_7_1_4\": \"\", \"R_7_1_5\": \"\", \"R_7_1_6\": \"\", \"R_7_1_7\": \"\", \"R_7_1_8\": \"\", \"R_7_1_9\": \"\", \"R_8_1_2\": \"\", \"R_8_1_3\": \"\", \"R_8_1_4\": \"\", \"R_8_1_5\": \"\", \"R_9_1_2\": \"\", \"R_9_1_3\": \"\", \"R_9_1_4\": \"\", \"R_9_1_5\": \"\", \"R_9_1_6\": \"\", \"R_9_1_7\": \"\", \"R_7_1_10\": \"\", \"R_3_multi\": \"\", \"R_4_multi\": \"\"}, \"munhangs\": [{\"title\": \"거시지표\", \"questions\": [{\"alert\": {\"color\": \"danger\", \"content\": \"* ‘매출 총액’은 매출이 없는 공공조직의 경우 \'0\'원으로 입력해주세요.\"}, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$center|매출총액*\", \"R_won\"], [\"$center|전체 직원 수\", \"R_people\"], [\"$center|교육대상 직원 수\", \"R_people\"], [\"$center|교육예산 총액(교육부서 예산기준)\", \"R_won\"], [\"$center|교육경비 집행 총액(교육부서 집행기준)\", \"R_won\"]], \"table_th\": [[\"항목\", \"2023년 결과\"]], \"table_set\": true}}]}, {\"title\": \"교육비 증감\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"1) 22년 대비 23년도의 교육비(집행기준) 증감과 관련하여 해당 란에 체크해주세요.\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$cenBold|증가<br>2번) 문항 이동\", \"R_increDecre\"], [\"$cenBold|감소<br>3번) 문항 이동\", \"R_increDecre\"]], \"table_th\": [[\"구분\", \"$width15|1% ~ 5%\", \"$width15|6% ~ 15%\", \"$width15|16% ~ 25%\", \"$width15|26% ~ 50%\", \"$width15|51% 이상\"]], \"table_set\": true}}, {\"qType\": \"MultiChoice\", \"title\": \"2) 22년 대비 23년도의 교육비 증가 이유는 무엇입니까?<br>(복수응답 가능)\", \"subContents\": {\"plural\": true, \"choices\": [{\"notic\": \"\", \"content\": \"교육인원의 증가(교육 차수, 교육과정수 증가)\"}, {\"notic\": \"\", \"content\": \"직원 개인에 대한 교육비 지원 증가(외부 교육, 세미나 참가비 등)\"}, {\"notic\": null, \"content\": \"컨설팅, 교육과정 개발 비용 증가\"}, {\"notic\": null, \"content\": \"시스템 도입 및 구축 비용 증가\"}, {\"notic\": null, \"content\": \"R_etc\"}]}}, {\"qType\": \"MultiChoice\", \"title\": \"3) 22년 대비 23년도의 교육비 감소 이유는 무엇입니까?<br>(복수응답 가능)\", \"subContents\": {\"plural\": true, \"choices\": [{\"notic\": \"\", \"content\": \" 경영상의 사유, 환경요인 등으로 인한 교육 축소 \"}, {\"notic\": \"\", \"content\": \"교육인원의 감소(교육 차수, 교육과정수 감소)\"}, {\"notic\": null, \"content\": \" 직원 개인에 대한 교육비 지원 감소(외부 교육, 세미나 참가비 등)\"}, {\"notic\": null, \"content\": \" 컨설팅, 교육과정 개발 비용 축소\"}, {\"notic\": null, \"content\": \"R_etc\"}]}}]}, {\"title\": \"교육 시간\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"2023년에 진행된 교육대상 직원 1인당 교육시간(평균)을 기술해 주십시오.\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$center|인당 교육시간(평균)\", \"R_time\"]], \"table_th\": [[\"구분\", \"교육시간\"]]}}]}, {\"title\": \"교육 인원 비율\", \"questions\": [{\"alert\": {\"color\": \"danger\", \"content\": \"* ‘실시간 비대면 교육’ 은 zoom, webex, 구루미, 게더타운 등을 활용한 교육을 의미합니다.\"}, \"qType\": \"MultiTable\", \"title\": \" 귀사(기관)에서 실시한 교육 형태별 참가인원 비율을 기술해  주십시오.<br>(항목별 가로 합이 100%가 되도록 기술)\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"비율\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"$width5|\", \"집합<br>교육\", \"실시간<br>비대면<br>교육*\", \"이러닝\", \"플립<br>러닝\", \"독서통신<br>교육\", \"해외<br>연수\", \"국내외<br>학위 연수\", \"개인별<br>외부교육/<br>세미나\", \"계\"]], \"table_set\": true}}]}, {\"title\": \"교육비<br>지출 비율\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"1) 다음에 제시된 교육 형태 별로 교육비의 지출 비율을 기술해 주십시오.\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"비율\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"$width5|\", \"집합<br>교육비\", \"실시간<br>비대면<br>교육비\", \"이러닝<br>교육비\", \"플립<br>러닝\", \"독서<br>통신<br>교육비\", \"해외<br>연수비<br><small>(단기 연수&<br>컨퍼런스 참가 등)</small><br>\", \"국내외<br>학위<br>연수비\", \"개인별<br>교육비<br>지원<small><br>(외부교육)</small>\", \"개발<br>용역비<br><small>(컨설팅,<br>아웃소싱 등</small>\", \"계\"]]}}, {\"qType\": \"MultiTable\", \"title\": \"2) (기업) 다음에 제시된 직책자 이상 및 비직책자 교육비의 지출 비율을 기술해 주십시오. \", \"subContents\": {\"table_td\": [[\"비율\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"$width5|\", \"신입\", \"비직책자\", \"직책자(팀장)\", \"임원급 이상\", \"계\"]]}}, {\"qType\": \"MultiTable\", \"title\": \"3) (공공) 다음에 제시된 직급별 교육비의 지출 비율을 기술해 주십시오. \", \"subContents\": {\"table_td\": [[\"비율\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"$width5|\", \"신입\", \"7급 이하\", \"6급\", \"4 ~5급\", \"3급\", \"2급 이상\", \"계\"]]}}]}], \"requiredList\": [{\"attr\": \"R_2_n_2\", \"hide\": [\"4\"], \"values\": [\"1\", \"2\", \"3\", \"4\", \"5\"]}, {\"attr\": \"R_2_n_2\", \"hide\": [\"3\"], \"values\": [\"6\", \"7\", \"8\", \"9\", \"10\"]}]}',10),(9,2,'{\"initData\": {}, \"munhangs\": [{\"title\": \"기본\", \"mainAlert\": {\"color\": \"danger\", \"content\": \"123213312\"}, \"mainTitle\": \"zzzzzzzzzz\", \"questions\": [{\"title\": \"\", \"subContents\": {}}]}], \"requiredList\": []}',9),(10,3,'{\"initData\": {}, \"munhangs\": [{\"title\": \"기본\", \"questions\": [{\"title\": \"\", \"subContents\": {}}]}], \"requiredList\": []}',9),(11,4,NULL,9),(12,2,NULL,10),(13,3,NULL,10),(14,4,NULL,10),(15,5,NULL,10);
/*!40000 ALTER TABLE `page_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey` (
  `survey_id` int NOT NULL AUTO_INCREMENT,
  `survey_description` varchar(100) DEFAULT NULL,
  `survey_url` varchar(45) DEFAULT NULL,
  `survey_name` varchar(100) DEFAULT NULL,
  `top_menu_list_jsonData` json DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`survey_id`),
  KEY `common_info_survey_idx` (`year`),
  CONSTRAINT `common_info_survey` FOREIGN KEY (`year`) REFERENCES `common_info` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (9,'개발','hrd_2024','제 24회 인재개발 실태조사','{\"top_menuList\": [\" Ⅰ. 2023년도 교육관련 지표\", \"Ⅱ. HRD 현황\", \"Ⅲ. HRD 활동\", \"123\"]}',2024),(10,'채용','hrm_2024','제 25회 인재채용 실태조사','{\"top_menuList\": [\"Ⅰ. 2023년도 채용관련 지표\", \"Ⅱ. 채용관련 현황\", \"Ⅲ. 채용프로세스\", \"Ⅳ. 채용 효과성\", \"Ⅴ. 기타\"]}',2024);
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-23 15:30:40
