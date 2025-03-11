-- 05-02-select-operator
-- 1. 기본 연산자

-- 1) = : 같다
-- 학과 ID가 D05인 학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student
 WHERE dept_id = 'D05';

-- 2) !=  & <>  : 같지 않다
-- 학과 ID가 D02가 아닌 학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student
 WHERE dept_id != 'D02';

SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student
 WHERE dept_id <> 'D02';

-- 3) > : 크다
-- 학생 번호가 20230060 보다 큰 학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student
 WHERE student_id > 20230060;

-- 4) < : 작다
-- 학생 번호가 20230004 보다 작은 학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student
 WHERE student_id < 20230004;

-- 5) >= : 크거나 같다
-- 학생 번호가 20230060 보다 크거나 같은  학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student
 WHERE student_id >= 20230060;

-- 6) < : 작거나 같다
-- 학생 번호가 20230004 보다 작거나 같은  학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student
 WHERE student_id <= 20230004;




-- 2. 논리 연산자

-- 1) AND : 모든 조건이 참일때 참
-- 학과 ID가 D05면서 생년월일이 '2001-01-01' 이후인 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE dept_id = 'D05'
   AND birthdate >= '2001-01-01';

-- 2) OR : 하나라도 조건이 참이면 참
-- 학생 번호가 20230060 이상이거나 생년월일이 '1999-01-01' 이전인 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE student_id >= 20230060
    OR birthdate <= '1999-01-01';

-- 3) NOT : 조건이 거짓일 때 참
-- 학과 ID가 D05면서 생년월일이 '2001-01-01' 이후인 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
		, scholarship_id '장학금 ID'
  FROM student
 WHERE NOT scholarship_id < 10;




-- 3. 특수 연산자

-- 1) BETWEEN A AND B
-- 생년월일이 '2001-01-01' 와 '2002-01-01' 사이인 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE birthdate BETWEEN '2001-01-01' AND '2002-01-01';

-- 2) IN (value1, value2, ...)
-- 학과 ID가 D01이거나 D05인 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE dept_id IN ('D01', 'D05');

-- 3) LIKE
-- 성이 김씨인 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE student_name LIKE '김%';

-- 이름이 희로 끝나는 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE student_name LIKE '__희';

-- 4) IS NULL / IS NOT NULL
INSERT 
  INTO STUDENT (STUDENT_ID, STUDENT_NAME, DEPT_ID, PHONE) 
VALUES 
	('20230063', '김해민', 'D02', '010-3287-2303'),
	('20230064', '이가영', 'D04', '010-4326-9875'),
	('20230065', '한지연', 'D08', '010-9287-7205');

-- IS NULL : 값이 NULL인 경우
-- 생일 속성이 NULL 인 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE birthdate IS NULL;


-- IS NOT NULL : 값이 존재하는 경우
-- 이메일 값이 존재하는 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE email IS NOT NULL;



-- 4. 복합 조건

-- 1) AND, OR의 우선순위를 고려하지 않음
-- 우선 순위를 고려하지 않은 잘못된 예시
-- 학과ID가 D02 이거나 D04이면서 생일이 5월인 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE dept_id = 'D02' OR dept_id = 'D04'
   AND birthdate LIKE '%-05-%';

-- 괄호를 통한 우선순위를 명확히 한 예시
-- 학과ID가 D02 이거나 D04이면서 생일이 5월인 학생
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
  FROM student
 WHERE (dept_id = 'D02' OR dept_id = 'D04')
   AND birthdate LIKE '%-05-%';

-- 2) NOT의 적용 범위가 불명확함
-- NOT의 적용 범위가 불명확한 잘못된 예시
-- 학과ID가 D05이거나 장학금 ID가 3 이상인 학생만 제외하고 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
		, scholarship_id '장학금 ID'
  FROM student
 WHERE NOT dept_id = 'D05' OR scholarship_id > 3;
 
-- NOT의 적용 범위를 괄호로 명확히 지정한  예시
-- 학과ID가 D05이거나 장학금 ID가 3 이상인 학생만 제외하고 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
		, scholarship_id '장학금 ID'
  FROM student
 WHERE NOT (dept_id = 'D05' OR scholarship_id > 3);

-- 3) 중복 조건으로 가독성이 떨어지는 예시
-- 중복 조건으로 인해 가독성이 떨어지는  예시
-- 학과ID가 D07이고 장학금 ID가 7 또는 8인 학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
		, scholarship_id '장학금 ID'
  FROM student
 WHERE (dept_id = 'D07' AND scholarship_id = 8)
    OR (dept_id = 'D07' AND scholarship_id = 7);

-- 중복 조건을 IN으로 정리한  예시
-- 학과ID가 D07이고 장학금 ID가 3 또는 5인 학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, birthdate 생년월일
		, email 이메일
		, scholarship_id '장학금 ID'
  FROM student
 WHERE dept_id = 'D07' 
   AND scholarship_id IN (8, 7);

-- 4) WHERE 절 생략으로 인한 전체 데이터 수정
-- WHERE 절 없이 전체 데이터 수정하는 예시
-- 학과ID가 D07이고 장학금 ID가 7 또는 8인 학생 조회
UPDATE temp_student
   SET temp_student_name = '이혜진'; 

SELECT * FROM temp_student;