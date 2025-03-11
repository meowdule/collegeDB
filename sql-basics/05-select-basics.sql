-- 05. select - basics
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



-- 2) Where 절 사용
-- 학과 ID가 D01인 학생 조회
SELECT 
		  student_id AS '학생 번호'
		, student_name AS 이름
		, dept_id '학과 ID'
		, email 이메일
  FROM student
 WHERE dept_id = 'D01';

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




-- join
-- 1. inner join

-- 1) 학생과 학과명을 INNER JOIN하여 학생이 소속된 학과 출력
SELECT 
    	  s.STUDENT_NAME 학생이름
		, d.DEPT_NAME 학과명
  FROM STUDENT s
  JOIN DEPARTMENT d ON s.DEPT_ID = d.DEPT_ID;

-- 2) USING을 활용한 동일 컬럼명 조인
SELECT 
    	  s.STUDENT_NAME 학생이름
		, d.DEPT_NAME 학과명
  FROM STUDENT s
  JOIN DEPARTMENT d USING (DEPT_ID);



-- 2. outer join

-- 1) left (outer) join
-- 장학금이 없는 학생도 모두 포함하여 조회
SELECT 
    s.STUDENT_NAME,
    sc.SCHOLARSHIP_NAME,
    sc.AMOUNT
  FROM STUDENT s
  LEFT JOIN SCHOLARSHIP sc 
    ON s.SCHOLARSHIP_ID = sc.SCHOLARSHIP_ID;

-- 2) right (outer) join
-- 수혜 학생이 없더라도 장학금 목록 전체 출력
SELECT 
    s.STUDENT_NAME,
    sc.SCHOLARSHIP_NAME,
    sc.AMOUNT
  FROM STUDENT s
 RIGHT JOIN SCHOLARSHIP sc 
   ON s.SCHOLARSHIP_ID = sc.SCHOLARSHIP_ID;



-- 3. cross join & self join

-- 1) cross join
-- 모든 학생-장학금 조합 확인 (주의: 결과 수가 많아질 수 있음)
SELECT 
    s.STUDENT_NAME,
    sc.SCHOLARSHIP_NAME
  FROM STUDENT s
 CROSS JOIN SCHOLARSHIP sc;

-- 2) self join
-- 학생 테이블에 학번과 추천인(멘토) ID가 있는 경우의 자기조인

-- 1. MENTOR_ID 컬럼 추가
ALTER TABLE TEMP_STUDENT ADD COLUMN MENTOR_ID INT;

-- 2. 멘토와 멘티 역할을 위한 더미 학생 추가 (dept_id는 D01 또는 D02)
INSERT INTO TEMP_STUDENT (temp_student_id, temp_student_name, email, dept_id, age)
VALUES
  (1, '박민수', 'mentor1@example.com', 'D01', 25),
  (2, '김서연', 'mentor2@example.com', 'D02', 24),
  (4, '최하늘', 'mentee1@example.com', 'D02', 20),
  (5, '정지호', 'mentee2@example.com', 'D01', 21);

-- 3. 멘토 지정 (멘티 → 멘토 연결)
UPDATE TEMP_STUDENT SET MENTOR_ID = 1 WHERE temp_student_id = 3; -- 이혜진 → 박민수
UPDATE TEMP_STUDENT SET MENTOR_ID = 2 WHERE temp_student_id = 4; -- 최하늘 → 김서연
UPDATE TEMP_STUDENT SET MENTOR_ID = 1 WHERE temp_student_id = 5; -- 정지호 → 박민수

SELECT * FROM temp_student;


-- TEMP_STUDENT 내에서 멘토-멘티 관계 조회
SELECT
    mentee.temp_student_name AS 멘티,
    mentor.temp_student_name AS 멘토
FROM TEMP_STUDENT mentee
JOIN TEMP_STUDENT mentor
    ON mentee.MENTOR_ID = mentor.temp_student_id;




-- group - by & having
-- 1. GROUP BY

-- 1) 기본 GROUP BY
-- 학과별 학생 그룹화
SELECT
    DEPT_ID
  FROM STUDENT
 GROUP BY DEPT_ID;

-- 2) GROUP BY 2 개 이상의 그룹 생성
SELECT
    	  DEPT_ID
    	, SCHOLARSHIP_ID
    	, COUNT(*)
  FROM STUDENT
 GROUP BY DEPT_ID, SCHOLARSHIP_ID;



-- 2. 집계 함수
-- 1) COUNT
-- 전체 행 수 또는 NULL이 아닌 특정 컬럼 값의 개수를 셀 수 있습니다.
-- 전체 학생 수, 학과가 지정된 학생 수
SELECT
    COUNT(*) AS 전체_학생수,
    COUNT(DEPT_ID) AS 학과_지정된_학생수
  FROM STUDENT;

-- 2) SUM
-- 숫자 컬럼의 합계를 구합니다.
-- 장학금 금액 총합
SELECT 
    SUM(AMOUNT) AS 전체_장학금_금액
  FROM SCHOLARSHIP;

-- 3) AVG
-- 숫자 컬럼의 평균값을 계산합니다.
-- 과목별 평균 학점
SELECT 
    COURSE_ID,
    ROUND(AVG(TOTAL_SCORE),0) AS 평균_시험_성적
  FROM GRADE
 GROUP BY COURSE_ID;

-- 4) MIN, MAX
-- 컬럼 값 중 가장 작은 값(MIN), 가장 큰 값(MAX)을 반환합니다.
-- 과목별 최저/최고 학점
SELECT 
    COURSE_ID,
    MIN(TOTAL_SCORE) AS 최저_시험_성적,
    MAX(TOTAL_SCORE) AS 최고_시험_성적
  FROM GRADE
 GROUP BY COURSE_ID;



-- 2. HAVING 절
-- HAVING은 그룹 이후 필터링에 사용됩니다.

-- 평균 학점이 3.0 이상인 과목만 조회
SELECT 
    COURSE_ID,
    ROUND(AVG(TOTAL_SCORE),0) AS 평균_시험_성적
  FROM GRADE
 GROUP BY COURSE_ID
HAVING AVG(TOTAL_SCORE) >= 85.0;



-- 3. ROLLUP
-- GROUP BY 결과에 소계 또는 총계 행을 추가할 수 있습니다.

-- 학과별 장학금 금액 합계 + 전체 총합
SELECT 
    DEPT_ID,
    SUM(AMOUNT) AS 장학금_총합
  FROM STUDENT s
  JOIN SCHOLARSHIP sc ON s.SCHOLARSHIP_ID = sc.SCHOLARSHIP_ID
 GROUP BY DEPT_ID
  WITH ROLLUP;



-- DISTINCT & LIMIT & ORDER BY 
-- 1) DISTINCT : 특정 컬럼의 중복 값을 제거하고 고유한 값만 반환

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

-- 2) Order by : 결과 데이터의 순서를 정렬
-- 학생 이름을 가나다순으로 정렬
SELECT 
    STUDENT_NAME
  FROM STUDENT
 ORDER BY STUDENT_NAME ASC;


-- 장학금 금액 높은 순으로 정렬
SELECT 
    SCHOLARSHIP_NAME,
    AMOUNT
  FROM SCHOLARSHIP
 ORDER BY AMOUNT DESC;

-- 3) 다중 컬럼 정렬 
-- 학과 → 이름 순으로 정렬
SELECT 
    STUDENT_NAME,
    DEPT_ID
  FROM STUDENT
 ORDER BY DEPT_ID, STUDENT_NAME;

-- 이름 -> 학과 순으로 정렬
SELECT 
    STUDENT_NAME,
    DEPT_ID
  FROM STUDENT
 ORDER BY STUDENT_NAME, DEPT_ID;



-- 4) Limit : 결과 집합에서 반환할 행의 수를 제한

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




-- 조건 분기와 데이터 정리
-- 1. CASE
-- IF-ELSE처럼 조건별로 결과를 나눠 표현할 수 있게 해주는 강력한 분기문

-- 학점에 따라 등급을 나누기
SELECT 
    STUDENT_ID,
    TOTAL_SCORE,
    CASE
        WHEN TOTAL_SCORE >= 90.0 THEN '우수'
        WHEN TOTAL_SCORE >= 80.0 THEN '양호'
        WHEN TOTAL_SCORE >= 70.0 THEN '보통'
        ELSE '미흡'
    END AS 학점등급
  FROM GRADE;



-- 2. IF
-- NULL 처리나 조건적 텍스트 표현에 자주 활용

-- 1) IF(expr, 참값, 거짓값)

-- 1-1) NULL 처리
-- 장학금이 없는 학생은 '미지급'으로 표시
SELECT 
    STUDENT_NAME,
    IF(sc.AMOUNT IS NULL, '미지급', CONCAT(sc.AMOUNT, '원')) AS 장학금_금액
  FROM STUDENT s
  LEFT JOIN SCHOLARSHIP sc ON s.SCHOLARSHIP_ID = sc.SCHOLARSHIP_ID;

-- 1-2) 수치 조건 분기
-- 장학금 금액이 100만원 이상이면 '고액', 아니면 '일반'
SELECT 
    SCHOLARSHIP_NAME,
    AMOUNT,
    IF(AMOUNT >= 1000000, '고액', '일반') AS 장학금_구분
  FROM SCHOLARSHIP;

-- 1-3) 문자열 포함 여부 조건
-- 이메일이 gmail이면 '지메일 사용자', 아니면 '기타'
SELECT 
    STUDENT_NAME,
    EMAIL,
    IF(EMAIL LIKE '%gmail%', '지메일 사용자', '기타') AS 이메일_분류
  FROM STUDENT;

-- 1-4) 중첩 IF ( 다단계 조건 분류)
-- 학점 등급을 중첩 IF로 처리
SELECT 
    grade,
    TOTAL_SCORE,
    IF(TOTAL_SCORE >= 4.0, '우수',
        IF(TOTAL_SCORE >= 3.0, '양호',
            IF(TOTAL_SCORE >= 2.0, '보통', '미흡')
        )
    ) AS 학점_등급
  FROM GRADE;

-- 2) IFNULL(컬럼, 대체값)
-- 장학금 미지급자를 '해당없음'으로 표시
SELECT 
    STUDENT_NAME,
    IFNULL(sc.SCHOLARSHIP_NAME, '해당 없음') AS 장학금명
  FROM STUDENT s
  LEFT JOIN SCHOLARSHIP sc ON s.SCHOLARSHIP_ID = sc.SCHOLARSHIP_ID;



-- 3. 숫자 처리 함수 
-- 1) ROUND
-- 반올림
-- 과목별 평균 학점을 반올림 형식으로 출력
SELECT 
    COURSE_ID,
    AVG(TOTAL_SCORE) AS 평균,
    ROUND(AVG(TOTAL_SCORE), 0) AS '반올림0',
    ROUND(AVG(TOTAL_SCORE), 1) AS '반올림1',
    ROUND(AVG(TOTAL_SCORE), 2) AS '반올림2',
    ROUND(AVG(TOTAL_SCORE), 3) AS '반올림3'
  FROM GRADE
 GROUP BY COURSE_ID;
 
 
 

-- 2) FORMAT
-- 숫자 포맷
-- 과목별 평균 학점을 포맷 형식으로 출력
SELECT 
    COURSE_ID,
    AVG(TOTAL_SCORE) AS 평균,
    FORMAT(AVG(TOTAL_SCORE), 0) AS 콤마_포맷0,
    FORMAT(AVG(TOTAL_SCORE), 1) AS 콤마_포맷1,
    FORMAT(AVG(TOTAL_SCORE), 2) AS 콤마_포맷2,
    FORMAT(AVG(TOTAL_SCORE), 3) AS 콤마_포맷3
  FROM GRADE
 GROUP BY COURSE_ID;

-- 3) MOD
-- 나머지 계산
-- 학번(STUDENT_ID)의 홀짝 여부 (예: 짝수/홀수 분류)
SELECT 
    STUDENT_ID,
    MOD(STUDENT_ID, 2) AS 홀짝
  FROM STUDENT;




-- 4. 날짜 기준 문자열 처리 + 구간 분류

-- ENROLL_DATE가 NULL인 경우 '미등록', 아니면 '등록됨'
SELECT 
    STUDENT_NAME,
    IF(ENROLL_DATE IS NULL, '미등록', '등록됨') AS 수강상태
  FROM STUDENT s
  LEFT JOIN ENROLLMENT e ON s.STUDENT_ID = e.STUDENT_ID;