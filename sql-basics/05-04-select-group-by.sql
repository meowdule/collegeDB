-- 05-04. select - group - by
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





