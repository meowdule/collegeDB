-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.4.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- college 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `college` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `college`;

-- 테이블 college.temp_department 구조 내보내기
CREATE TABLE IF NOT EXISTS `temp_department` (
  `DEPT_ID` char(3) NOT NULL,
  `DEPT_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 college.temp_department:~2 rows (대략적) 내보내기
INSERT IGNORE INTO `temp_department` (`DEPT_ID`, `DEPT_NAME`) VALUES
	('D01', '컴퓨터공학과'),
	('D02', '전자공학과');

-- 테이블 college.temp_student 구조 내보내기
CREATE TABLE IF NOT EXISTS `temp_student` (
  `TEMP_STUDENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '임시 학생 ID',
  `TEMP_STUDENT_NAME` varchar(50) NOT NULL COMMENT '임시 학생 이름',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT '이메일',
  `DEPT_ID` char(3) DEFAULT NULL,
  `AGE` int(11) DEFAULT 20 COMMENT '나이',
  PRIMARY KEY (`TEMP_STUDENT_ID`),
  UNIQUE KEY `unique_email` (`EMAIL`),
  KEY `fk_department` (`DEPT_ID`),
  CONSTRAINT `fk_department` FOREIGN KEY (`DEPT_ID`) REFERENCES `temp_department` (`DEPT_ID`),
  CONSTRAINT `check_age` CHECK (`AGE` > 18)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 college.temp_student:~3 rows (대략적) 내보내기
INSERT IGNORE INTO `temp_student` (`TEMP_STUDENT_ID`, `TEMP_STUDENT_NAME`, `EMAIL`, `DEPT_ID`, `AGE`) VALUES
	(2, '이순신', 'lee@example.com', 'D02', 20),
	(3, '홍길동', 'hong@example.com', 'D01', 20),
	(4, '김순신', 'lee2@example.com', 'D02', 25);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
