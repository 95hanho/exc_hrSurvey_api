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
INSERT INTO `common_result` VALUES (1,'한호성','ㅁㄴㅁㄹㅇㄴㅁ','021231234','01012341234','32229','충남 홍성군 홍성읍 조양로 40','12321','test1@naver.com','2','213','12321','2','','5378502360','21321','12','','','','','','','','','123132','[true, true, true]',1,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_result`
--

LOCK TABLES `page_result` WRITE;
/*!40000 ALTER TABLE `page_result` DISABLE KEYS */;
INSERT INTO `page_result` VALUES (4,'{\"R_1_etc\": null, \"R_1_multi\": \"3\", \"R_2_multi\": \"3,1\"}',12,1),(5,'{\"R_1_1_3\": 12, \"R_1_1_4\": 0, \"R_1_2_3\": 88, \"R_1_2_4\": 100, \"R_2_1_2\": 100, \"R_2_1_3\": 0, \"R_2_2_2\": null, \"R_2_2_3\": 100, \"R_3_1_3\": \"2\", \"R_3_2_3\": \"2\", \"R_3_3_3\": \"2\", \"R_4_1_3\": \"3\", \"R_4_1_4\": \"2\", \"R_4_2_3\": \"3\", \"R_4_2_4\": \"2\", \"R_4_3_3\": \"3\", \"R_4_3_4\": \"2\", \"R_5_1_3\": 12, \"R_5_2_3\": \"121-1\", \"R_5_3_3\": 112, \"R_5_4_3\": 1212, \"R_5_5_3\": 12, \"R_6_n_2\": \"9\", \"R_9_n_3_b\": \"3\", \"R_9_n_3_f\": \"3\", \"R_7_n_3_rad\": \"4\", \"R_8_n_3_che\": \"2,3\", \"R_10_1_3_bWei\": \"1\", \"R_10_2_3_bWei\": null, \"R_10_3_3_bWei\": null, \"R_10_4_3_bWei\": null, \"R_10_n_3_fWei\": \"1\"}',8,1),(6,'{\"R_1_etc\": \"12312123\", \"R_2_etc\": null}',13,1);
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
INSERT INTO `page_survey` VALUES (6,1,'{\"initData\": {\"R_1_1_3\": \"\", \"R_1_1_4\": \"\", \"R_1_2_3\": \"\", \"R_1_2_4\": \"\", \"R_2_1_2\": \"\", \"R_2_1_3\": \"\", \"R_2_2_2\": \"\", \"R_2_2_3\": \"\", \"R_3_1_3\": \"\", \"R_3_2_3\": \"\", \"R_3_3_3\": \"\", \"R_4_1_3\": \"\", \"R_4_1_4\": \"\", \"R_4_2_3\": \"\", \"R_4_2_4\": \"\", \"R_4_3_3\": \"\", \"R_4_3_4\": \"\", \"R_5_1_3\": \"\", \"R_5_2_3\": \"\", \"R_5_3_3\": \"\", \"R_5_4_3\": \"\", \"R_5_5_3\": \"\", \"R_6_n_2\": \"\", \"R_9_n_3_b\": \"\", \"R_9_n_3_f\": \"\", \"R_7_n_3_rad\": \"\", \"R_8_n_3_che\": \"\", \"R_10_1_3_bWei\": \"\", \"R_10_2_3_bWei\": \"\", \"R_10_3_3_bWei\": \"\", \"R_10_4_3_bWei\": \"\", \"R_10_n_3_fWei\": \"\"}, \"munhangs\": [{\"title\": \"비율\", \"mainAlert\": {\"color\": \"danger\", \"content\": \"메인알람을 달 수 있음.\"}, \"mainTitle\": \"메인 질문을 달 수 있어요\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"질문 제목입니다. 비율 세로 계\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"내용을 입력해주세요.\", \"R_per\", \"R_per\"], [\"$index\", \"내용을 입력해주세요.\", \"R_per\", \"R_per\"], [\"$index\", \"내용을 입력해주세요.\", \"$total\", \"$total\"]], \"table_th\": [[\"No\", \"지문 내용\", \"현재\", \"향후<br>(1~3년 내)\"]]}}, {\"qType\": \"MultiTable\", \"title\": \"질문 제목입니다. 비율 가로 계\", \"subContents\": {\"table_td\": [[\"지문\", \"R_per\", \"R_per\", \"$totalRow\"], [\"지문\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"지문\", \"교육\", \"서베이\", \"총합\"]]}}]}, {\"title\": \"가중치\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\"]], \"table_th\": [[\"No\", \"문항\", \"1\", \"2\", \"3\", \"4\", \"5\"]], \"topAlert\": [\"전혀 아님\", \"아님\", \"보통\", \"그러함\", \"매우 그러함\"]}}]}, {\"title\": \"중요도 수행도\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\", \"R_wei\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\", \"R_wei\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\", \"R_wei\"]], \"table_th\": [[\"$rowSpan1|No\", \"$rowSpan1|문항내용\", \"$colSpan4|중요도\", \"-\", \"-\", \"-\", \"-\", \"$colSpan4|수행도\", \"-\", \"-\", \"-\", \"-\"], [\"-\", \"-\", \"1\", \"2\", \"3\", \"4\", \"5\", \"1\", \"2\", \"3\", \"4\", \"5\"]], \"topAlert\": \"weightDoubleFive\"}}]}, {\"title\": \"인적자원\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"문항내용을 입력해주세요.\", \"R_people\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_year\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_won\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_term\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_time\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_resource\"]], \"table_th\": [[\"No\", \"문항\", \"인적자원\"]]}}]}, {\"title\": \"증가감소\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"증가<br>3)번 문항 이동\", \"R_increDecre\"], [\"감소<br>3)번 문항 이동, 해당 인원수(전담 사내강사)\", \"R_increDecre\"]], \"table_th\": [[\"구분\", \"$width12|1%~5%\", \"$width12|6%~25%\", \"$width12|16%~25%\", \"$width12|26%~50%\", \"$width12|51이상\"]]}}]}, {\"title\": \"단일선택\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"항목내용을 입력해주세요.\", \"R_radio\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_radio\"], [\"$index\", \"12321\", \"R_radio\"], [\"$index\", \"213321\", \"R_radio\"]], \"table_th\": [[\"No\", \"항목\", \"체크\"]]}}]}, {\"title\": \"복수선택\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"]], \"table_th\": [[\"No\", \"항목\", \"체크\"]]}}]}, {\"title\": \"연관체크\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"항목내용을 입력해주세요.\", \"R_relCheck\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relCheck\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relCheck\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relCheck\"]], \"table_th\": [[\"No\", \"항목\", \"활용여부\", \"효과성\"]]}}]}, {\"title\": \"연관가중치\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"항목내용을 입력해주세요.\", \"R_relWeight\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relWeight\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relWeight\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relWeight\"]], \"table_th\": [[\"$rowSpan1|No\", \"$rowSpan1|항목\", \"$rowSpan1|체크\", \"$colSpan4|만족도\", \"-\", \"-\", \"-\", \"-\"], [\"-\", \"-\", \"-\", \"매우<br>낮음\", \"낮음\", \"보통\", \"높음\", \"매우<br>높음\"]]}}]}], \"requiredList\": []}',9),(8,1,'{\"initData\": {\"R_1_1_3\": \"\", \"R_1_1_4\": \"\", \"R_1_2_3\": \"\", \"R_1_2_4\": \"\", \"R_2_1_2\": \"\", \"R_2_1_3\": \"\", \"R_2_2_2\": \"\", \"R_2_2_3\": \"\", \"R_3_1_3\": \"\", \"R_3_2_3\": \"\", \"R_3_3_3\": \"\", \"R_4_1_3\": \"\", \"R_4_1_4\": \"\", \"R_4_2_3\": \"\", \"R_4_2_4\": \"\", \"R_4_3_3\": \"\", \"R_4_3_4\": \"\", \"R_5_1_3\": \"\", \"R_5_2_3\": \"\", \"R_5_3_3\": \"\", \"R_5_4_3\": \"\", \"R_5_5_3\": \"\", \"R_6_n_2\": \"\", \"R_9_n_3_b\": \"\", \"R_9_n_3_f\": \"\", \"R_7_n_3_rad\": \"\", \"R_8_n_3_che\": \"\", \"R_10_1_3_bWei\": \"\", \"R_10_2_3_bWei\": \"\", \"R_10_3_3_bWei\": \"\", \"R_10_4_3_bWei\": \"\", \"R_10_n_3_fWei\": \"\"}, \"munhangs\": [{\"title\": \"비율\", \"mainAlert\": {\"color\": \"danger\", \"content\": \"메인알람을 달 수 있음.\"}, \"mainTitle\": \"메인 질문을 달 수 있어요\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"질문 제목입니다. 비율 세로 계\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"내용을 입력해주세요.\", \"R_per\", \"R_per\"], [\"$index\", \"내용을 입력해주세요.\", \"R_per\", \"R_per\"], [\"$index\", \"내용을 입력해주세요.\", \"$total\", \"$total\"]], \"table_th\": [[\"No\", \"지문 내용\", \"현재\", \"향후<br>(1~3년 내)\"]]}}, {\"qType\": \"MultiTable\", \"title\": \"질문 제목입니다. 비율 가로 계\", \"subContents\": {\"table_td\": [[\"지문\", \"R_per\", \"R_per\", \"$totalRow\"], [\"지문\", \"R_per\", \"R_per\", \"$totalRow\"]], \"table_th\": [[\"지문\", \"교육\", \"서베이\", \"총합\"]]}}]}, {\"title\": \"가중치\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\"]], \"table_th\": [[\"No\", \"문항\", \"1\", \"2\", \"3\", \"4\", \"5\"]], \"topAlert\": [\"전혀 아님\", \"아님\", \"보통\", \"그러함\", \"매우 그러함\"]}}]}, {\"title\": \"중요도 수행도\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\", \"R_wei\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\", \"R_wei\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_wei\", \"R_wei\"]], \"table_th\": [[\"$rowSpan1|No\", \"$rowSpan1|문항내용\", \"$colSpan4|중요도\", \"-\", \"-\", \"-\", \"-\", \"$colSpan4|수행도\", \"-\", \"-\", \"-\", \"-\"], [\"-\", \"-\", \"1\", \"2\", \"3\", \"4\", \"5\", \"1\", \"2\", \"3\", \"4\", \"5\"]], \"topAlert\": \"weightDoubleFive\"}}]}, {\"title\": \"인적자원\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"문항내용을 입력해주세요.\", \"R_people\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_year\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_won\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_term\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_time\"], [\"$index\", \"문항내용을 입력해주세요.\", \"R_resource\"]], \"table_th\": [[\"No\", \"문항\", \"인적자원\"]]}}]}, {\"title\": \"증가감소\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"증가<br>3)번 문항 이동\", \"R_increDecre\"], [\"감소<br>3)번 문항 이동, 해당 인원수(전담 사내강사)\", \"R_increDecre\"]], \"table_th\": [[\"구분\", \"$width12|1%~5%\", \"$width12|6%~25%\", \"$width12|16%~25%\", \"$width12|26%~50%\", \"$width12|51이상\"]]}}]}, {\"title\": \"단일선택\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"항목내용을 입력해주세요.\", \"R_radio\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_radio\"], [\"$index\", \"12321\", \"R_radio\"], [\"$index\", \"213321\", \"R_radio\"]], \"table_th\": [[\"No\", \"항목\", \"체크\"]]}}]}, {\"title\": \"복수선택\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_check\"]], \"table_th\": [[\"No\", \"항목\", \"체크\"]]}}]}, {\"title\": \"연관체크\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"항목내용을 입력해주세요.\", \"R_relCheck\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relCheck\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relCheck\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relCheck\"]], \"table_th\": [[\"No\", \"항목\", \"활용여부\", \"효과성\"]]}}]}, {\"title\": \"연관가중치\", \"questions\": [{\"alert\": null, \"qType\": \"MultiTable\", \"title\": \"\", \"subPadding\": false, \"subContents\": {\"table_td\": [[\"$index\", \"항목내용을 입력해주세요.\", \"R_relWeight\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relWeight\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relWeight\"], [\"$index\", \"항목내용을 입력해주세요.\", \"R_relWeight\"]], \"table_th\": [[\"$rowSpan1|No\", \"$rowSpan1|항목\", \"$rowSpan1|체크\", \"$colSpan4|만족도\", \"-\", \"-\", \"-\", \"-\"], [\"-\", \"-\", \"-\", \"매우<br>낮음\", \"낮음\", \"보통\", \"높음\", \"매우<br>높음\"]]}}]}], \"requiredList\": []}',10),(9,2,'{\"initData\": {\"R_1_etc\": \"\", \"R_1_multi\": \"\", \"R_2_multi\": \"\"}, \"munhangs\": [{\"title\": \"기본\", \"questions\": [{\"qType\": \"MultiChoice\", \"title\": \"하나만 선택해주세요. 일렬 단일선택\", \"subContents\": {\"plural\": false, \"choices\": [{\"notic\": \"찬성하는거\", \"content\": \"찬성\"}, {\"notic\": \"반대하는거\", \"content\": \"반대\"}, {\"notic\": \"이도저도아닌거\", \"content\": \"중립\"}, {\"notic\": null, \"content\": \"몰라\"}, {\"notic\": null, \"content\": \"R_etc\"}]}}, {\"qType\": \"MultiChoice\", \"title\": \"최대 3개까지 선택해주세요. 두 줄 복수선택\", \"subContents\": {\"half\": true, \"count\": 3, \"plural\": true, \"choices\": [{\"notic\": \"C++\", \"content\": \"C언어\"}, {\"notic\": \"spring\", \"content\": \"자바\"}, {\"notic\": \"express\", \"content\": \"nodeJS\"}, {\"notic\": \"festAPI\", \"content\": \"파이썬\"}, {\"notic\": null, \"content\": \"코틀린\"}]}}]}], \"requiredList\": []}',9),(10,3,'{\"initData\": {\"R_1_etc\": \"\", \"R_2_etc\": \"\"}, \"munhangs\": [{\"title\": \"기본\", \"questions\": [{\"alert\": {\"color\": \"info\", \"content\": \"알람을 달 수도 있구요\"}, \"qType\": \"EtcText\", \"title\": \":text 를 채워주세요.\", \"subContents\": {\"comment\": \"필수입력해야합니다.\", \"placeholder\": \"텍스트 필수 입력\", \"requiredTxt\": true}}]}, {\"title\": \"텍스트에어리어\", \"questions\": [{\"alert\": {\"color\": \"danger\", \"content\": \"필수입력은 아니에요\"}, \"qType\": \"EtcTextarea\", \"title\": \"textarea를 채워주세요.\", \"subPadding\": false, \"subContents\": {\"placeholder\": \"입력 안해도 됨.\"}}]}], \"requiredList\": []}',9),(12,2,'{\"initData\": {\"R_1_etc\": \"\", \"R_1_multi\": \"\", \"R_2_multi\": \"\"}, \"munhangs\": [{\"title\": \"기본\", \"questions\": [{\"qType\": \"MultiChoice\", \"title\": \"하나만 선택해주세요. 일렬 단일선택\", \"subContents\": {\"plural\": false, \"choices\": [{\"notic\": \"찬성하는거\", \"content\": \"찬성\"}, {\"notic\": \"반대하는거\", \"content\": \"반대\"}, {\"notic\": \"이도저도아닌거\", \"content\": \"중립\"}, {\"notic\": null, \"content\": \"몰라\"}, {\"notic\": null, \"content\": \"R_etc\"}]}}, {\"qType\": \"MultiChoice\", \"title\": \"최대 3개까지 선택해주세요. 두 줄 복수선택\", \"subContents\": {\"half\": true, \"count\": 3, \"plural\": true, \"choices\": [{\"notic\": \"C++\", \"content\": \"C언어\"}, {\"notic\": \"spring\", \"content\": \"자바\"}, {\"notic\": \"express\", \"content\": \"nodeJS\"}, {\"notic\": \"festAPI\", \"content\": \"파이썬\"}, {\"notic\": null, \"content\": \"코틀린\"}]}}]}], \"requiredList\": []}',10),(13,3,'{\"initData\": {\"R_1_etc\": \"\", \"R_2_etc\": \"\"}, \"munhangs\": [{\"title\": \"기본\", \"questions\": [{\"alert\": {\"color\": \"info\", \"content\": \"알람을 달 수도 있구요\"}, \"qType\": \"EtcText\", \"title\": \":text 를 채워주세요.\", \"subContents\": {\"comment\": \"필수입력해야합니다.\", \"placeholder\": \"텍스트 필수 입력\", \"requiredTxt\": true}}]}, {\"title\": \"텍스트에어리어\", \"questions\": [{\"alert\": {\"color\": \"danger\", \"content\": \"필수입력은 아니에요\"}, \"qType\": \"EtcTextarea\", \"title\": \"textarea를 채워주세요.\", \"subPadding\": false, \"subContents\": {\"placeholder\": \"입력 안해도 됨.\"}}]}], \"requiredList\": []}',10);
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
INSERT INTO `survey` VALUES (9,'개발','hrd_2024','제 24회 인재개발 실태조사','{\"top_menuList\": [\" Ⅰ. 2023년도 교육관련 지표\", \"Ⅱ. HRD 현황\", \"Ⅲ. HRD 활동\", \"123\"]}',2024),(10,'채용','hrm_2024','제 25회 인재채용 실태조사','{\"top_menuList\": [\"Ⅰ. 테이블\", \"Ⅱ. 객관식\", \"Ⅲ. 텍스트\"]}',2024);
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

-- Dump completed on 2024-12-26 17:36:29
