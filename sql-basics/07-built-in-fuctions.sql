-- 07. built - in - functions

-- 07.01. string functions
-- 1. 문자열 길이 관련 함수 

-- 1) CHAR_LENGTH(str) : 문자열의 문자수 반환
-- 2) LENGTH(str) : 문자열의 바이트(byte) 수 반환
-- 3) BIT_LENGTH(str) : 문자열의 비트(bit) 수 반환

-- 알파벳은 1바이트, 한글은 3바이트 기준
SELECT
	  'Hello' AS sample,
	  CHAR_LENGTH('Hello') AS char_len,
	  LENGTH('Hello') AS byte_len,
	  BIT_LENGTH('Hello') AS bit_len
UNION ALL
SELECT
	  '안녕' AS sample,
	  CHAR_LENGTH('안녕') AS char_len,
	  LENGTH('안녕') AS byte_len,
	  BIT_LENGTH('안녕') AS bit_len;



-- 2. 아스키 코드 변환 함수

-- 1) ASCII(char) : 해당 문자의 아스키 코드 반환
-- 2) CHAR(code) : 아스키 코드에 해당하는 문자 반환

-- 문자 ↔ 숫자 간 변환
SELECT
	  ASCII('A') AS ascii_A,
	  CHAR(65) AS char_65;



-- 3. 문자열 결합 함수
-- 1) CONCAT
-- 단순 문자열 이어 붙이기
SELECT CONCAT('대', '한', '민', '국') AS result;

-- 2) CONCAT_WS
-- 구분자를 포함하여 연결
SELECT
		  CONCAT_WS('-', '2025', '03', '10') AS formatted_date
		, CONCAT_WS(', ', '홍길동', '컴퓨터공학과', '3학년') AS student_info;



-- 4. 문자 추출 함수
-- 1) LEFT 
-- 왼쪽에서 len만큼 문자 추출
-- 2) RIGHT
-- 오른쪽에서 len만큼 문자 추출
SELECT LEFT('HelloWorld', 5) AS left_result,
	   RIGHT('HelloWorld', 5) AS right_result;

-- 3) SUBSTRING
-- 특정 위치에서 len만큼 문자 추출
SELECT SUBSTRING('abcdefg', 3, 2) AS sub_result;

-- 4) SUBSTRING_INDEX
-- 구분자 기준 앞 또는 뒤 추출
SELECT
	  SUBSTRING_INDEX('student@college.edu', '@', 1) AS email_id,
	  SUBSTRING_INDEX('student@college.edu', '.', -1) AS domain_last;



-- 5. 대소문자 변환 함수
-- 1) UPPER
-- 대문자로 변환
-- 2) LOWER
-- 소문자로 변환
SELECT
	  UPPER('welcome To SQL!') AS upper_case,
	  LOWER('WELCOME TO SQL!') AS lower_case;



-- 6. 문자열 위치 찾기 함수
SELECT
	-- 1) INSTR(str, substr)
	-- str 문자열에서 substr이 처음 등장하는 위치(인덱스)를 반환
	  INSTR('데이터베이스시스템', '이') AS instr_result,
	  
	-- 2) LOCATE(substr, str)
	-- INSTR()과 동일하나 인자 순서만 반대
	  LOCATE('이', '데이터베이스시스템') AS locate_result,
	  
	-- 3) FIELD(str, str1, str2, …)
	-- INSTR()과 동일하나 인자 순서만 반대
	  FIELD('컴공', '영문', '수학', '컴공', '사회') AS field_result,
	  
	-- 4) FIND_IN_SET(str, list)
	-- list가 쉼표로 구분된 문자열일 때 str이 위치한 순서를 반환
	  FIND_IN_SET('컴공', '국문,영문,컴공,수학') AS find_in_set_result,
	  
	-- 5) ELT(index, str1, str2, …)
	-- index 번째에 해당하는 문자열 반환
	  ELT(3, '국문', '영문', '컴공', '수학') AS elt_result;



-- 7. 문자열 치환, 삽입, 반복
SELECT 
	-- 1) REPLACE(str, find, replace)
	-- str에서 find를 찾아 replace로 바꾼 문자열 반환
	REPLACE('마리아DB는 재밌어', '마리아', 'MySQL') AS replaced,
	
	-- 2) INSERT(str, pos, len, newstr)
	-- str에서 pos 위치부터 len만큼 삭제하고 newstr을 삽입
	INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동') AS inserted,
	
	-- 3) REPEAT(str, count)
	-- str을 count만큼 반복한 문자열 반환
	REPEAT('재밌어!', 3) AS repeated;
	


-- 8. 공백/지정문자 제거 및 채우기
SELECT
	-- 1) TRIM, LTRIM, RTRIM 
	-- 앞뒤 / 왼쪽 / 오른쪽 공백 제거
	CONCAT('[', TRIM('   앞뒤 공백   '), ']') AS trim_result,
	CONCAT('[', LTRIM('   왼쪽 공백'), ']') AS ltrim_result,
	CONCAT('[', RTRIM('오른쪽 공백   '), ']') AS rtrim_result,
	
	-- 2) TRIM([{LEADING|TRAILING|BOTH} remstr FROM str])
	-- 특정 문자 제거 가능
	TRIM(BOTH '@' FROM '@@안녕하세요@@') AS both_trim,
	TRIM(LEADING '@' FROM '@@안녕하세요@@') AS lead_trim,
	TRIM(TRAILING '@' FROM '@@안녕하세요@@') AS trail_trim,
	
	-- 3) LPAD , RPAD
	-- str을 총 len 길이가 되도록 왼쪽또는 오른쪽에 padstr을 반복해 채움
	LPAD('123', 6, '0') AS left_pad,   -- 000123
	RPAD('123', 6, '*') AS right_pad;  -- 123***



-- 9. 기타 문자열 함수
SELECT 
	-- 1) REVERSE(str)
	-- 문자열 순서를 반대로 뒤집음
	REVERSE('desserts') AS reversed,
	
	-- 2) SPACE(n)
	-- 공백 문자열을 n개 생성
	CONCAT('이름:', SPACE(5), '홍길동') AS spaced_name;






-- 07.02. num functions
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






-- 07.03. date time functions
-- 1. 오늘 날짜 & 현재 시간
SELECT 
	-- 1) NOW()
	-- 현재 날짜와 시간(YYYY-MM-DD HH:MM:SS) 반환
	NOW() AS now_time,
	
	-- 2) SYSDATE()
	-- 현재 날짜와 시간(YYYY-MM-DD HH:MM:SS) 반환
	SYSDATE() AS sysdate_time,
	
	-- 3) CURDATE()
	-- 현재 날짜(YYYY-MM-DD)만 반환
	CURDATE() AS today,
	
	-- 4) CURTIME()
	-- 현재 시간(HH:MM:SS)만 반환
	CURTIME() AS `current_time`;



-- 2. 날짜 구성 요소 추출 함수
SELECT 
	-- 1) YEAR : 연도 추출
	YEAR(NOW()) AS year_now,
	
	-- 2) MONTH : 월 추출
	MONTH(NOW()) AS month_now,
	
	-- 3) DAY : 일 추출
	DAY(NOW()) AS day_now,
	DAYOFMONTH(NOW()) AS day_now2,
	
	-- 4) HOUR : 시간 추출
	HOUR(NOW()) AS hour_now,
	
	-- 5) MINUTE : 분 추출
	MINUTE(NOW()) AS minute_now,
	
	-- 6) SECOND : 초 추출
	SECOND(NOW()) AS second_now;



-- 3. 날짜와 시간 분리
SELECT 
	-- 1) DATE(datetime)
	-- YYYY-MM-DD 형식으로 날짜만 추출
	DATE(NOW()) AS date_part,
	
	-- 2) TIME(datetime)
	-- HH:MM:SS 형식으로 시간만 추출
	TIME(NOW()) AS time_part;



-- 4. 날짜 및 시간 간 차이 계산
SELECT 
	-- 1) DATEDIFF(date1, date2)
	-- 날짜 간 일 수 차이를 계산 (date1 - date2)
	DATEDIFF('2024-06-30', '2024-06-01') AS 날짜차이,
	
	-- 2) TIMEDIFF(time1, time2)
	-- 시간 간 차이를 HH:MM:SS 형식으로 반환
	TIMEDIFF('10:00:00', '08:30:00') AS 시간차이;



-- 5. 날짜 및 시간 더하기 / 빼기
SELECT 
	-- 1) ADDDATE(date, INTERVAL n unit)
	-- 날짜에 기간을 더함
	ADDDATE('2024-03-01', INTERVAL 30 DAY) AS 한달후,
	
	-- 2) SUBDATE(date, INTERVAL n unit)
	-- 날짜에서 기간을 뺌
	SUBDATE('2024-03-01', INTERVAL 7 DAY) AS 일주일전,
	
	-- 3) ADDTIME(datetime, time)
	-- 시간 단위의 더하기
	ADDTIME('2024-03-01 09:00:00', '2:30:00') AS 수업종료예정,
	
	-- 4) SUBTIME(datetime, time)
	-- 시간 단위의 빼기
	SUBTIME('2024-03-01 09:00:00', '0:15:00') AS 준비시간;



-- 6. 유용한 날짜 함수 모음
SELECT 
	-- 1) LAST_DAY(date)
	-- 해당 월의 마지막 날 반환
	LAST_DAY('2024-02-10') AS 이달마지막날,
	
	-- 2) DAYOFWEEK(date)
	-- 요일 반환 (1=일요일, 7=토요일)
	DAYOFWEEK('2024-03-01') AS 요일번호,
	
	-- 3) MONTHNAME(date)
	-- 월의 이름 반환
	MONTHNAME('2024-03-01') AS 월이름,
	
	-- 4) DAYOFYEAR(date)
	-- 1년 중 몇 번째 날인지 반환
	DAYOFYEAR('2024-03-01') AS 누적일수;

SELECT 
	-- 5) QUARTER(date)
	-- 해당 날짜가 몇 분기인지 반환 (1~4)
	QUARTER('2024-03-01') AS 분기,
	
	-- 6) TIME_TO_SEC(time)
	-- 시간을 **초(seconds)**로 변환
	TIME_TO_SEC('01:30:00') AS 초로환산,
	
	-- 7) MAKEDATE(year, day_of_year)
	-- 지정한 연도의 n번째 날을 날짜로 반환
	MAKEDATE(2024, 60) AS 날짜환산,
	
	-- 8) MAKETIME(hour, minute, second)
	-- 시, 분, 초를 조합하여 TIME 형식으로 반환
	MAKETIME(9, 30, 0) AS 수업시작시간;









