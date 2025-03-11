-- 07-01. built - in - functions - string

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
