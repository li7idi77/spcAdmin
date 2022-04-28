-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.6.21-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- testdb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `testdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `testdb`;

-- 테이블 testdb.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(300) NOT NULL,
  `content` text,
  `writer` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `register_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.board:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 testdb.board_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_reply` (
  `reply_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `board_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `reply_content` text,
  `reply_writer` varchar(100) NOT NULL,
  `reply_password` varchar(300) NOT NULL,
  `register_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.board_reply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_reply` ENABLE KEYS */;

-- 테이블 testdb.books 구조 내보내기
CREATE TABLE IF NOT EXISTS `books` (
  `bookID` char(5) NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `bookOriginPrice` double NOT NULL,
  `bookType` varchar(10) NOT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.books:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- 테이블 testdb.books_sell 구조 내보내기
CREATE TABLE IF NOT EXISTS `books_sell` (
  `bookID` char(5) NOT NULL,
  `bookSellPrice` double NOT NULL,
  `bookType` varchar(10) NOT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.books_sell:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `books_sell` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_sell` ENABLE KEYS */;

-- 프로시저 testdb.CREATE_TABLE 구조 내보내기
DELIMITER //
CREATE PROCEDURE `CREATE_TABLE`(IN _tableName VARCHAR(200), IN _tableNameTag VARCHAR(200) ,OUT RESULT INT)
BEGIN
	/* 가격을 변경할 변수를 선언한다. */
	DECLARE _SELLPRICE DOUBLE;

	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	  BEGIN
		ROLLBACK;        
		SET RESULT = -1;  
	END;

	/* 트랜젝션 시작 */
	START TRANSACTION;
		SET @s = CONCAT('create table books_',_tableNameTag, ' SELECT * FROM books WHERE 1=2');

		PREPARE stmt1 FROM @s;
		EXECUTE stmt1;
		DEALLOCATE PREPARE stmt1;
	/* 커밋 */
	COMMIT;
	SET RESULT = 0;
END//
DELIMITER ;

-- 프로시저 testdb.CREATE_TABLE1 구조 내보내기
DELIMITER //
CREATE PROCEDURE `CREATE_TABLE1`(IN _tableName VARCHAR(200), IN _tableNameTag VARCHAR(200), OUT RESULT INT)
BEGIN
	/* 가격을 변경할 변수를 선언한다. */
	DECLARE _SELLPRICE DOUBLE;

	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	  BEGIN
		ROLLBACK;        
		SET RESULT = -1;  
	END;

	/* 트랜젝션 시작 */
	START TRANSACTION;
		SET @s = CONCAT('create table ', _tableName , '_',_tableNameTag, ' SELECT * FROM ' , _tableName ,' WHERE 1=2');

		PREPARE stmt1 FROM @s;
		EXECUTE stmt1;
		DEALLOCATE PREPARE stmt1;
	/* 커밋 */
	COMMIT;
	SET RESULT = 0;
END//
DELIMITER ;

-- 프로시저 testdb.CREATE_TABLE2 구조 내보내기
DELIMITER //
CREATE PROCEDURE `CREATE_TABLE2`(IN _tableName VARCHAR(200), IN _tableNameTag VARCHAR(200))
BEGIN
	/* 가격을 변경할 변수를 선언한다. */
	DECLARE _SELLPRICE DOUBLE;

	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	  BEGIN
		ROLLBACK;        
	
	END;

	/* 트랜젝션 시작 */
	START TRANSACTION;
		SET @s = CONCAT('create table ', _tableName , '_',_tableNameTag, ' SELECT * FROM ' , _tableName ,' WHERE 1=2');

		PREPARE stmt1 FROM @s;
		EXECUTE stmt1;
		DEALLOCATE PREPARE stmt1;
	/* 커밋 */
	COMMIT;
	
END//
DELIMITER ;

-- 테이블 testdb.department 구조 내보내기
CREATE TABLE IF NOT EXISTS `department` (
  `DEPTID` varchar(10) NOT NULL,
  `DEPTNAME` varchar(100) NOT NULL,
  `SUPERDEPTID` varchar(10) NOT NULL,
  `DEPTH` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DEPTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.department:~19 rows (대략적) 내보내기
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`DEPTID`, `DEPTNAME`, `SUPERDEPTID`, `DEPTH`, `DESCRIPTION`) VALUES
	('1000', '경영기획실', '1000', 1, ''),
	('1100', '회식메뉴혁신팀', '1000', 2, '매번 삼겹살 지겹지 않으세요? 저희 회식메뉴혁신팀에서는 지속적인 즐거운 회사문화 조성을 위해...'),
	('1200', '점심메뉴기획팀', '1000', 2, '점심시간마다 반복되는 오늘은 뭘먹을까? 고민은 점심시간의 즐거움을 저하시키며 점심메뉴 추천자에게 심한 스트레스를 유발 시킬수 있습니다. 저희 점심메뉴기획팀은 날씨,뉴스등 주변여건을 고려하여 가장 베스트 점심메뉴를 추천해 드리는 최신식 점심메뉴프로그램을 도입하여...'),
	('1300', '야근금지역량팀', '1000', 2, '오후 6시 이후엔 소등 및 사원들의 의자에 고압전류를...'),
	('1400', '사랑의짝대기팀', '1000', 2, '늘어가는 솔로 사원들을 위한 회사의 고민이 많습니다. 저의 사짝팀은 회사내 솔로 보틀넥현상을 근본적으로 해결하고자 옆 건물 fun company와 소개팅을 지속적으로...'),
	('2000', '경영지원실', '2000', 1, ''),
	('2100', '재무팀', '2000', 2, '저희 재무팀은 빚/보증/채무변제/사채와는 아무런 관계가 없습니다.'),
	('2200', '친절한인사팀', '2000', 2, '안녕하세요. 채용/승진/조직관련 업무를 담당하는 친절한 인사팀입니다. 저희 인사팀은 친절에 사활을...'),
	('2300', '사원복지만땅팀', '2000', 2, '일은 열심히 하는데 회사가 챙겨주는건 이것 저것 부족한게 많으시죠? 예산이 부족하면 몸으로 때워 드립니다. 연락주세요.'),
	('2400', '사내커플관리팀', '2000', 2, '사내 커플이란 이유로 차별을 받으시나요? 저희에게 연락 주시면 즉각 응징..?'),
	('3000', 'IT연구소', '3000', 1, ''),
	('3200', '노가다방지 도구개발팀', '3000', 2, '반복적인 단순 업무 지겹지 않으세요? 손건강을 위해서 저희 도구를 이용해 보세요. 손이 행복해집니다.'),
	('3300', '9to5솔루션개발팀', '3000', 2, '정시에 출근해서 한시간 일찍 퇴근하자. 이게 말이 되냐구요? 저희 솔루션을 사용해 보세요.'),
	('4000', '공공사업부', '4000', 1, ''),
	('4200', '도로교통시스템팀', '4000', 2, '안녕하세요. 도로교통시스템팀입니다.'),
	('4300', '연말정산이익증대팀', '4000', 2, '연말정산하면 마이너스. 이거 왜이럴까요?'),
	('5000', '금융사업부', '5000', 1, ''),
	('5100', '카드수수료할인팀', '5000', 2, '카드수수료를 절약하는 금융어플리케이션이 필요하세요? 저희가 도와 드리겠습니다. 아니, 고객님은 카드수수료를 올리는게 필요하시다구요? 그건...'),
	('5200', '증권대박팀', '5000', 2, '정확한 증권 시세 분석을 위한 첨단 시스템을 제공합니다. 어떻게 시스템이 분석할수 있냐구요? 음 ...');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- 테이블 testdb.employee 구조 내보내기
CREATE TABLE IF NOT EXISTS `employee` (
  `EMPLOYEEID` varchar(20) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `AGE` int(11) DEFAULT NULL,
  `DEPARTMENTID` varchar(10) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.employee:~30 rows (대략적) 내보내기
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`EMPLOYEEID`, `NAME`, `AGE`, `DEPARTMENTID`, `PASSWORD`, `EMAIL`) VALUES
	('1', '김길동', 28, '1200', '1', 'kkd@easycompany.com'),
	('10', '어시구', 44, '1200', '10', 'elvis@easycompany.com'),
	('11', '황달수', 55, '1200', '11', 'James@easycompany.com'),
	('12', '박영업', 73, '2100', '12', 'sales@easycompany.com'),
	('13', '노가리', 59, '3200', '13', 'foxylady@easycompany.com'),
	('14', '이기자', 20, '4100', '14', 'expensive@easycompany.com'),
	('15', '이마애', 15, '5100', '15', 'soexpensive@easycompany.com'),
	('16', '제임수ㅇ', 28, '5300', '16', 'james@easycompany.com'),
	('17', '황커플', 34, '1400', '17', 'hwang@easycompany.com'),
	('18', '김나리ㅇ', 37, '1400', '18', 'godfather@easycompany.com'),
	('19', '박사랑', 60, '1400', '19', 'lovelove@easycompany.com'),
	('2', '김길수', 39, '1100', '2', 'kks@easycompany.com'),
	('20', '용파리ㅇ', 60, '4100', '20', 'king@easycompany.com'),
	('21', '맹주사', 66, '2200', '21', 'maeng@easycompany.com'),
	('22', '이만세', 44, '5100', '22', 'lovelymouse@easycompany.com'),
	('23', '허허실', 27, '5200', '23', 'master@easycompany.com'),
	('24', '마장수', 55, '4100', '24', 'flame@easycompany.com'),
	('25', '아리요', 28, '4100', '25', 'srisri@easycompany.com'),
	('26', '홍길동', 33, '4200', '26', 'hkd@easycompany.com'),
	('27', '박박네', 25, '2300', '27', 'ppn@easycompany.com'),
	('28', '반짝이', 28, '2400', '28', 'soul@easycompany.com'),
	('29', '우기자', 31, '2100', '29', 'mamama@easycompany.com'),
	('3', '강감찬', 17, '1200', '3', 'kkc@easycompany.com'),
	('30', '남남이', 25, '3100', '30', 'namnam@easycompany.com'),
	('4', '김앤젤', 56, '3300', '4', 'uri@easycompany.com'),
	('5', '박찬후', 36, '2400', '5', 'ppc@easycompany.com'),
	('6', '재기찬', 34, '1300', '6', 'jackie@easycompany.com'),
	('7', '호호만', 18, '5200', '7', 'holly@easycompany.com'),
	('8', '봉다리', 33, '5200', '8', '2u@easycompany.com'),
	('9', '기마긴', 60, '4200', '9', 'kmk@easycompany.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- 테이블 testdb.ids 구조 내보내기
CREATE TABLE IF NOT EXISTS `ids` (
  `TABLE_NAME` varchar(16) NOT NULL,
  `NEXT_ID` decimal(30,0) NOT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.ids:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;

-- 프로시저 testdb.INSERT_BOOK 구조 내보내기
DELIMITER //
CREATE PROCEDURE `INSERT_BOOK`(IN _BOOKID CHAR(5), IN _BOOKNAME VARCHAR(20), _PRICE DOUBLE, _BOOKTYPE VARCHAR(10), OUT RESULT INT)
BEGIN
	/* 가격을 변경할 변수를 선언한다. */
	DECLARE _SELLPRICE DOUBLE;

	/* 만약 SQL에러라면 ROLLBACK 처리한다. */
	DECLARE exit handler for SQLEXCEPTION
	  BEGIN
		ROLLBACK;        
		SET RESULT = -1;  
	END;

	/* 트랜젝션 시작 */
	START TRANSACTION;
		/* BOOK에 인서트 */
		INSERT INTO BOOKS(bookID, bookName, bookOriginPrice, bookType)
		VALUE(_BOOKID, _BOOKNAME, _PRICE, _BOOKTYPE);		

		/* 책종류에 맞게 가격조정 */
		IF _BOOKTYPE = 'novel' THEN
			SET _SELLPRICE = _PRICE + _PRICE * (10/100);
		ELSEIF _BOOKTYPE = 'art' THEN
			SET _SELLPRICE = _PRICE + _PRICE * (15/100);
		ELSE
			SET _SELLPRICE = _PRICE + _PRICE * (20/100);
		END IF;

		/* 조정된 값을 BOOKS_SELL에 저장한다. */
		INSERT INTO BOOKS_SELL(bookID, bookSellPrice, bookType)
		VALUE(_BOOKID, _SELLPRICE, _BOOKTYPE);

	/* 커밋 */
	COMMIT;
	SET RESULT = 0;
END//
DELIMITER ;

-- 테이블 testdb.rtetngoods 구조 내보내기
CREATE TABLE IF NOT EXISTS `rtetngoods` (
  `GOODS_ID` char(20) NOT NULL DEFAULT '',
  `GOODS_NM` varchar(255) DEFAULT NULL,
  `PRICE` decimal(16,0) DEFAULT NULL,
  `CTGRY_ID` varchar(20) DEFAULT NULL,
  `MAKR` varchar(20) DEFAULT NULL,
  `DETAIL_INFO_IMAGE_ID` char(20) DEFAULT NULL,
  `GOODS_IMAGE_ID` char(20) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.rtetngoods:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `rtetngoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `rtetngoods` ENABLE KEYS */;

-- 테이블 testdb.sample 구조 내보내기
CREATE TABLE IF NOT EXISTS `sample` (
  `ID` varchar(16) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `USE_YN` char(1) DEFAULT NULL,
  `REG_USER` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.sample:~114 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sample` DISABLE KEYS */;
INSERT INTO `sample` (`ID`, `NAME`, `DESCRIPTION`, `USE_YN`, `REG_USER`) VALUES
	('SAMPLE-00001', 'Runtime Environment', 'Foundation Layer', 'Y', 'eGov'),
	('SAMPLE-00002', 'Runtime Environment', 'Persistence Layer', 'Y', 'eGov'),
	('SAMPLE-00003', 'Runtime Environment', 'Presentation Layer', 'Y', 'eGov'),
	('SAMPLE-00004', 'Runtime Environment', 'Business Layer', 'Y', 'eGov'),
	('SAMPLE-00005', 'Runtime Environment', 'Batch Layer', 'Y', 'eGov'),
	('SAMPLE-00006', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00007', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00008', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00009', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00010', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00011', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00012', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00013', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00014', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00015', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00016', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00017', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00018', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00019', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00020', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00021', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00022', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00023', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00024', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00025', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00026', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00027', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00028', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00029', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00030', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00031', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00032', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00033', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00034', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00035', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00036', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00037', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00038', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00039', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00040', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00041', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00042', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00043', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00044', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00045', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00046', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00047', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00048', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00049', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00050', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00051', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00052', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00053', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00054', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00055', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00056', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00057', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00058', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00059', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00060', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00061', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00062', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00063', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00064', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00065', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00066', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00067', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00068', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00069', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00070', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00071', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00072', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00073', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00074', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00075', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00076', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00077', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00078', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00079', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00080', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00081', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00082', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00083', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00084', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00085', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00086', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00087', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00088', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00089', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00090', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00091', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00092', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00093', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00094', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00095', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00096', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00097', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00098', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00099', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00100', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00101', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00102', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00103', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00104', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00105', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00106', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00107', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00108', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00109', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00110', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00111', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00112', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00113', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov'),
	('SAMPLE-00114', 'Runtime Environment', 'Integration Layer', 'Y', 'eGov');
/*!40000 ALTER TABLE `sample` ENABLE KEYS */;

-- 테이블 testdb.tb_address 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_address` (
  `ADDRESS_NAME` varchar(100) DEFAULT NULL,
  `ADDRESS_HP` varchar(100) DEFAULT NULL,
  `INS_DATE` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.tb_address:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_address` DISABLE KEYS */;
INSERT INTO `tb_address` (`ADDRESS_NAME`, `ADDRESS_HP`, `INS_DATE`) VALUES
	('증명발급기1', '01012134567', '2020-03-21 10:57:42'),
	('증명발급기2', '01012134568', '2020-03-21 10:57:42'),
	('증명발급기3', '01012134569', '2020-03-21 10:57:42'),
	('증명발급기4', '01012134570', '2020-03-21 10:57:42'),
	('증명발급기5', '01012134571', '2020-03-21 10:57:42');
/*!40000 ALTER TABLE `tb_address` ENABLE KEYS */;

-- 테이블 testdb.tb_admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_admin` (
  `ID` varchar(100) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `INS_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.tb_admin:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` (`ID`, `PASSWORD`, `INS_DATE`) VALUES
	('admin', 'rJaJ4ickJwheNbnT4+i+2IyzQ0gotDuG/AWWytTG4nA=', '2020-03-25 21:22:54'),
	('kjs2300', 'ls5lohnmd/RyWKVTJrNK9SJnV2BXGTArZoz8VFLpPIc=', '2020-03-25 21:23:07');
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;

-- 테이블 testdb.tb_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_board` (
  `BOARD_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '순번',
  `BOARD_RE_REF` int(11) DEFAULT NULL COMMENT '원글번호',
  `BOARD_RE_LEV` int(11) DEFAULT NULL COMMENT '원글레벨',
  `BOARD_RE_SEQ` int(11) DEFAULT NULL COMMENT '원글순번',
  `BOARD_WRITER` varchar(300) DEFAULT NULL COMMENT '글쓴이',
  `BOARD_SUBJECT` varchar(300) DEFAULT NULL COMMENT '글제목',
  `BOARD_CONTENT` text COMMENT '글내용',
  `BOARD_HITS` int(11) DEFAULT NULL COMMENT '조회수',
  `INS_USER_ID` varchar(300) DEFAULT NULL COMMENT '최초입력자',
  `INS_DATE` datetime DEFAULT NULL COMMENT '최초입력시간',
  `UPD_USER_ID` varchar(300) DEFAULT NULL COMMENT '수정자',
  `UPD_DATE` datetime DEFAULT NULL COMMENT '수정시간',
  `DEL_YN` varchar(10) DEFAULT NULL COMMENT '삭제여부',
  `PASSWORD` varchar(300) DEFAULT NULL COMMENT '삭제암호',
  `FILE_UUID` varchar(300) DEFAULT NULL COMMENT '파일UUID',
  PRIMARY KEY (`BOARD_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.tb_board:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_board` DISABLE KEYS */;
INSERT INTO `tb_board` (`BOARD_SEQ`, `BOARD_RE_REF`, `BOARD_RE_LEV`, `BOARD_RE_SEQ`, `BOARD_WRITER`, `BOARD_SUBJECT`, `BOARD_CONTENT`, `BOARD_HITS`, `INS_USER_ID`, `INS_DATE`, `UPD_USER_ID`, `UPD_DATE`, `DEL_YN`, `PASSWORD`, `FILE_UUID`) VALUES
	(1, 1, 0, 0, '김종서', '김종서ㅇ', '김종서 이미지ㅇㅇㅇㅇㅇㅇ', 2, 'NONMEMBER', '2020-03-16 21:10:22', 'NONMEMBER', '2020-03-25 23:37:09', NULL, NULL, NULL),
	(2, 2, 0, 0, 'ㄷㄷㄷ', 'ddㄷ', 'ㄷㄷㄷㄷ', 7, 'NONMEMBER', '2020-03-16 23:09:51', 'NONMEMBER', '2022-01-08 21:41:58', NULL, NULL, NULL),
	(3, 2, 1, 1, 'kii000jk', 'kkk', 'hh\r\nj\r\nj\r\n', 3, 'NONMEMBER', '2020-03-16 23:28:40', 'NONMEMBER', '2022-01-08 21:41:40', NULL, NULL, NULL),
	(4, 3, 0, 0, 's', 's', 's', 0, 'NONMEMBER', '2020-03-18 04:42:54', 'NONMEMBER', '2020-03-18 04:42:54', NULL, NULL, NULL),
	(7, 6, 0, 0, 'd', 'd', 'd', 0, 'NONMEMBER', '2020-03-18 05:17:01', 'NONMEMBER', '2020-03-18 05:17:01', NULL, NULL, NULL),
	(8, 2, 2, 2, 'ㄴㄴㄴ', 'kkk 답변', 'ㄴㄴㄴ', 0, 'NONMEMBER', '2020-03-18 05:27:52', 'NONMEMBER', '2020-03-18 05:27:52', NULL, NULL, NULL),
	(11, 7, 0, 0, '이이ㅏㄹㅇㄹㅇ', 'ddd', 'ㅇㄹㅇㄹㅇㄹ', 15, 'NONMEMBER', '2020-03-19 23:02:45', 'NONMEMBER', '2020-03-20 00:27:23', NULL, NULL, '171bb9a4a82c4e38875b686240ce9a2b'),
	(12, 8, 0, 0, 'ㄹㄹ', 'fffㄹㄹㄹㄹ', 'ㄹㄹㄹㄹㄹㄹ\nㄹㄹ\nㄹ', 4, 'NONMEMBER', '2020-03-20 00:28:09', 'NONMEMBER', '2020-03-20 00:43:07', NULL, NULL, 'e4bb0be45c2b49029655762e9473b5f0');
/*!40000 ALTER TABLE `tb_board` ENABLE KEYS */;

-- 테이블 testdb.tb_board_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_board_file` (
  `FILE_UUID` varchar(300) DEFAULT NULL,
  `FILE_NAME` varchar(300) DEFAULT NULL,
  `FILE_FULL_PATH` varchar(500) DEFAULT NULL,
  `FILE_SEQ` int(10) unsigned zerofill DEFAULT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.tb_board_file:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_board_file` DISABLE KEYS */;
INSERT INTO `tb_board_file` (`FILE_UUID`, `FILE_NAME`, `FILE_FULL_PATH`, `FILE_SEQ`, `FILE_SIZE`) VALUES
	('171bb9a4a82c4e38875b686240ce9a2b', '평생교육론 3주_1.pdf', 'c://livrio//upload\\171bb9a4a82c4e38875b686240ce9a2b.pdf', 0000000001, NULL),
	('75498ee9082d49febcd8a2664327635a', '노인복지론_1주-7주.pdf', 'c://livrio//upload\\75498ee9082d49febcd8a2664327635a.pdf', 0000000004, 10975500),
	('c68133b2e9ed40e3b9560965243d05a3', 'tb_board.sql', 'c://livrio//upload\\c68133b2e9ed40e3b9560965243d05a3.sql', 0000000005, 891),
	('e4bb0be45c2b49029655762e9473b5f0', 'mysql tip1.sql', 'c://livrio//upload\\e4bb0be45c2b49029655762e9473b5f0.sql', 0000000002, 1248);
/*!40000 ALTER TABLE `tb_board_file` ENABLE KEYS */;

-- 테이블 testdb.tb_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_member` (
  `ID` varchar(200) NOT NULL COMMENT '아이디(핸드폰번호)',
  `PASSWORD` varchar(200) NOT NULL COMMENT '암호',
  `EMAIL` varchar(200) DEFAULT NULL COMMENT '이메일',
  `NAME` varchar(200) DEFAULT NULL COMMENT '이름',
  `SMS_YN` enum('Y','N') DEFAULT NULL COMMENT '이벤트, 프로모션 알림 SMS수신 여부',
  `ACCOUNT_YN` enum('Y','N') DEFAULT NULL COMMENT '장기 미접속 시 계정 활성 상태 유지 여부',
  `INS_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPD_DATE` datetime DEFAULT NULL,
  `DEL_YN` enum('Y','N') DEFAULT 'N',
  `SMS_PRICE` int(11) DEFAULT NULL,
  `LMS_PRICE` int(11) DEFAULT NULL,
  `MMS_PRICE` int(11) DEFAULT NULL,
  `MEMBER_SEQ` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.tb_member:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_member` DISABLE KEYS */;
INSERT INTO `tb_member` (`ID`, `PASSWORD`, `EMAIL`, `NAME`, `SMS_YN`, `ACCOUNT_YN`, `INS_DATE`, `UPD_DATE`, `DEL_YN`, `SMS_PRICE`, `LMS_PRICE`, `MMS_PRICE`, `MEMBER_SEQ`) VALUES
	('01055762304', '99NTHL8Ktyz5W/NvVjWyCuvguC6AIgVbgqkWKoPoNQk=', NULL, NULL, 'Y', 'Y', '2020-03-24 22:59:11', NULL, 'N', NULL, NULL, NULL, 0),
	('01077715056', 'a++8z+09LM4w8EdaVvRTKQio9QfGLqUu5igeFWezuz4=', NULL, NULL, 'Y', 'Y', '2020-03-24 23:05:07', NULL, 'N', NULL, NULL, NULL, 0),
	('kjs2300', 'ls5lohnmd/RyWKVTJrNK9SJnV2BXGTArZoz8VFLpPIc=', NULL, NULL, NULL, NULL, '2020-03-23 21:25:31', '2020-03-27 04:46:51', 'N', NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `tb_member` ENABLE KEYS */;

-- 테이블 testdb.tb_vendor 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_vendor` (
  `VENDOR_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '벤더키',
  `NAME` varchar(300) DEFAULT NULL COMMENT '벤더 이름',
  `MANAGER` varchar(300) DEFAULT NULL COMMENT '벤더 담당자',
  `MANAGER_TEL` varchar(300) DEFAULT NULL COMMENT '벤더 담당자 전화번호',
  `company` varchar(300) DEFAULT NULL COMMENT '벤더 회사명',
  `company_TEL` varchar(300) DEFAULT NULL COMMENT '벤더 회사 전화번호',
  `comment` text COMMENT '기타사항',
  `INS_DATE` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_DATE` datetime DEFAULT NULL COMMENT '수정일',
  `REG_DATE` varchar(300) DEFAULT NULL COMMENT '계약시작일',
  `DEL_YN` enum('Y','N') DEFAULT 'N' COMMENT '사용여부(Y,N)',
  `end_date` varchar(300) DEFAULT NULL COMMENT '계약종료일',
  `SMS_PRICE` decimal(10,2) DEFAULT NULL COMMENT 'SMS 단가',
  `LMS_PRICE` decimal(10,2) DEFAULT NULL COMMENT 'LMS 단가',
  `MMS_PRICE` decimal(10,2) DEFAULT NULL COMMENT 'MMS 단가',
  PRIMARY KEY (`VENDOR_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.tb_vendor:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_vendor` DISABLE KEYS */;
INSERT INTO `tb_vendor` (`VENDOR_SEQ`, `NAME`, `MANAGER`, `MANAGER_TEL`, `company`, `company_TEL`, `comment`, `INS_DATE`, `UPD_DATE`, `REG_DATE`, `DEL_YN`, `end_date`, `SMS_PRICE`, `LMS_PRICE`, `MMS_PRICE`) VALUES
	(1, '한진', '한진메니저', '010-2123-6564', 'company', '02-2346-6589', 'ㅇㅇㅇ\r\nㅇㅇㄷ33\r\nㅇ3', '2020-03-29 18:34:00', '2020-03-29 19:07:18', '2020-03-02', 'Y', '2020-05-28', 1.86, 2.87, 3.68);
/*!40000 ALTER TABLE `tb_vendor` ENABLE KEYS */;

-- 테이블 testdb.test 구조 내보내기
CREATE TABLE IF NOT EXISTS `test` (
  `aa` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 testdb.test:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- 프로시저 testdb.UPDATE_BOOK 구조 내보내기
DELIMITER //
CREATE PROCEDURE `UPDATE_BOOK`(IN _NOVEL_ADD_PRICE DOUBLE, IN _ART_ADD_PRICE DOUBLE, IN _ETC_ADD_PRICE DOUBLE, OUT RESULT INT)
BEGIN
	/* 종료 구분 변수 */
	DECLARE _done INT DEFAULT FALSE;
	/* 처리된 건수 */
	DECLARE _row_count INT DEFAULT 0;

	/* BOOKS테이블의  각각 컬럼값을 담을 변수 */
	DECLARE _bookID CHAR(5);
	DECLARE _bookOriginPrice DOUBLE;
	DECLARE _bookType VARCHAR(10);

	/* BOOKS_SELL에 bookSellPrice을 담을 변수 */
	DECLARE _bookSellPrice DOUBLE;

	/* 새로운 원가 */
	DECLARE _NEW_ORIGIN_PRICE DOUBLE;
	/* 새로운 판매가 */
	DECLARE _NEW_SELL_PRICE DOUBLE;
	/* BOOKS테이블을 읽어오는 커서를 만든다. */
	DECLARE CURSOR_BOOK CURSOR FOR SELECT bookID, bookOriginPrice, bookType FROM BOOKS;

	/* 커서 종료조건 : 더이상 없다면 종료 */
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _done = TRUE;

	OPEN CURSOR_BOOK;
	REPEAT
		/* bookID => _bookID, bookOriginPrice => _bookOriginPrice, bookType = _bookType 로 할당한다. */
		FETCH CURSOR_BOOK INTO _bookID, _bookOriginPrice, _bookType;
		IF NOT _done THEN
			SELECT bookSellPrice INTO _bookSellPrice FROM BOOKS_SELL WHERE bookID = _bookID;
			IF _bookType = 'novel' THEN
				/* 원래 책원가에 추가 */
				SET _NEW_ORIGIN_PRICE = _bookOriginPrice + _NOVEL_ADD_PRICE;
				/* 판매책값 변경된 원가에 다시 마진 적용 */
				SET _NEW_SELL_PRICE = _NEW_ORIGIN_PRICE + _NEW_ORIGIN_PRICE * (10/100);
			ELSEIF _bookType = 'art' THEN
				/* 원래 책원가에 추가 */
				SET _NEW_ORIGIN_PRICE = _bookOriginPrice + _ART_ADD_PRICE;
				/* 판매책값 변경된 원가에 다시 마진 적용 */
				SET _NEW_SELL_PRICE = _NEW_ORIGIN_PRICE + _NEW_ORIGIN_PRICE * (15/100);
			ELSE
				/* 원래 책원가에 추가 */
				SET _NEW_ORIGIN_PRICE = _bookOriginPrice + _ETC_ADD_PRICE;
				SET _NEW_SELL_PRICE = _NEW_ORIGIN_PRICE + _NEW_ORIGIN_PRICE * (20/100);

			END IF;
			UPDATE BOOKS SET bookOriginPrice = _NEW_ORIGIN_PRICE WHERE bookID = _bookID;
			UPDATE BOOKS_SELL SET bookSellPrice = _NEW_SELL_PRICE WHERE bookID = _bookID;
			SET _row_count = _row_count + 1;
			SET _done = FALSE;
		END IF;
	UNTIL _done END REPEAT;

	/* 커서를 닫아준다. */
	CLOSE CURSOR_BOOK;
	SET RESULT = _row_count;	 
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
