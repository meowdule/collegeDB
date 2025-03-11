-- 07-02. built - in - functions - num
-- 1. 기본 숫자 연산 함수
SELECT 
	-- 1) ABS(n) – 절대값 반환
	ABS(-123) AS absolute_value,
	
	-- 2) ROUND(n, d) – 반올림 (d자리까지)
	ROUND(123.4567, 2) AS rounded,
	
	-- 3) CEILING(n) / FLOOR(n) – 올림 / 버림
	CEILING(123.1) AS ceiling_result, 
	FLOOR(123.9) AS floor_result,
	
	-- 4) TRUNCATE(n, d) – 소수점 자르기 (버림)
	TRUNCATE(123.4567, 2) AS truncated;



-- 2. 진수 변환 함수
SELECT 
	-- 1) BIN(n) – 2진수
	BIN(65) AS `binary`,
	
	-- 2) OCT(n) – 8진수
	OCT(65) AS octal,
	
	-- 3) HEX(n) – 16진수
	HEX(255) AS hexadecimal,
	
	-- 4) CONV(n, from_base, to_base) – 진수 간 변환
	CONV('A', 16, 2) AS hex_to_bin;



-- 3. 나머지, 부호 관련 함수
SELECT 
	-- 1) MOD(n1, n2) 또는 n1 % n2
	MOD(75, 10) AS mod_result, 
	75 % 10 AS percent_mod,
	
	-- 2) SIGN(n) – 수의 부호 판단
	SIGN(50) AS '+', 
	SIGN(0) AS '0', 
	SIGN(-20) AS '-';



-- 4. 제곱 및 제곱근 함수
SELECT 
	-- 1) POW(n1, n2) – 제곱
	POW(2, 4) AS power, 
	
	-- 2) SQRT(n) – 제곱근
	SQRT(16) AS sqrt;



-- 5. 랜덤 관련 함수
SELECT 
	-- 1) RAND() – 0 이상 1 미만의 랜덤 실수
	RAND() AS random_float,

	-- 2) FLOOR(RAND() * (n - m) + m) – 정수 범위 랜덤 추출
	FLOOR(RAND() * (10 - 1) + 1) AS random_int_1_to_9;

