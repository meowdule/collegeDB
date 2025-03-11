-- 05. select - where - basics
-- 1) SELECT : 데이터 조회

-- 모든 컬럼 조회
SELECT * FROM student;

-- 특정 컬럼 조회
SELECT 
		  student_id
		, student_name
		, dept_id
		, email
  FROM student;

-- 출력 컬럼명 변경
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student;

-- 2) DISTINCT : 특정 컬럼의 중복 값을 제거하고 고유한 값만 반환

-- 단일열 DISTINCT
SELECT DISTINCT dept_id
  FROM student;

-- NULL값을 포함한 열의 DISTINCT 사용
SELECT DISTINCT scholarship_id
  FROM student;

-- 다중열 DISTINCT 사용
-- 다중열의 값들이 모두 동일하면 중복된 것으로 판별
SELECT 
		  DISTINCT dept_id
		, scholarship_id
  FROM student;

-- 3) Limit : 결과 집합에서 반환할 행의 수를 제한

-- 지정된 순서의 행만 출력
-- limit a, b; a번째부터 b개의 행만 출력
SELECT
		  student_id 학생번호
		, student_name 이름
  FROM student
 ORDER BY student_id
 LIMIT 10, 5;
 
-- 상위 행만 출력
-- ORDER BY 속성 ASC : 해당 속성을 기준으로 오름차순 정렬
-- LIMIT a : a 개수 만큼의 행만 출력
SELECT
		  student_id 학생번호
		, student_name 이름
  FROM student
 ORDER BY student_id ASC
 LIMIT 5;

-- 하위 행만 출력
-- ORDER BY 속성 DESC : 해당 속성을 기준으로 내림차순 정렬
-- LIMIT a : a 개수 만큼의 행만 출력
SELECT
		  student_id 학생번호
		, student_name 이름
  FROM student
 ORDER BY student_id DESC
 LIMIT 5;



-- Where 절 사용
-- 학과 ID가 D01인 학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student
 WHERE dept_id = 'D01';
