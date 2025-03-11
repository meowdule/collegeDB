-- 10. index - performance

-- 0. index 용 테이블 생성 및 데이터 삽입
-- 1) 실습용 테이블 생성
CREATE TABLE phone (
    phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10, 2)
);

-- 2) 샘플 데이터 삽입
INSERT INTO phone 
VALUES
(1, '갤럭시S23', 1200000),
(2, '아이폰14', 1350000),
(3, '갤럭시S24', 1400000),
(4, '아이폰15', 1500000),
(5, '갤럭시Z플립', 1600000);

SELECT * FROM phone;



-- 1. 인덱스 생성

-- 1) 단일 인덱스 생성
CREATE INDEX idx_phone_name ON phone(phone_name);

-- 2) 복합 인덱스 생성
CREATE INDEX idx_name_price ON phone(phone_name, phone_price);

-- 3) 인덱스 확인
SHOW INDEX FROM phone;

-- 4) 인덱스 삭제
DROP INDEX idx_name_price ON phone;

SHOW INDEX FROM phone;



-- 2. EXPLAIN으로 인덱스 사용 여부 확인
DROP INDEX idx_phone_name ON phone;

-- 1) 인덱스가 없는 경우 (Full Table Scan)
EXPLAIN SELECT * FROM phone 
			WHERE phone_name = 'iPhone14pro';

-- 2) 인덱스 사용한 경우 
-- 인덱스 생성 후
CREATE OR REPLACE INDEX idx_phone_name ON phone(phone_name);

-- 다시 실행
EXPLAIN SELECT * FROM phone WHERE phone_name = 'iPhone14pro';



-- 3. 인덱스와 WHERE / LIKE / ORDER BY
SELECT 'WHERE' AS 조건, phone_name, phone_price FROM phone WHERE phone_name = '아이폰14'
UNION ALL
SELECT 'LIKE', phone_name, phone_price FROM phone WHERE phone_name LIKE '갤럭시%'
UNION ALL
SELECT 'ORDER', phone_name, phone_price FROM phone
ORDER BY 조건, phone_name;

-- 1) WHERE 절
SELECT * FROM phone WHERE phone_name = '아이폰14';

-- 2) LIKE 연산자
SELECT * FROM phone WHERE phone_name LIKE '댈럭시%';

-- 3) ORDER BY 절
SELECT * FROM phone ORDER BY phone_name;