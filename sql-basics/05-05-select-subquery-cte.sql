-- 05-05. select - subquery - cte
-- 1. SUBQUERY

-- 1) 기본 SUBQUERY
-- '이산수학'이라는 과목의 교수 ID를 가져온 뒤, 해당 교수가 강의하는 다른 과목 조회
SELECT 
    COURSE_ID,
    COURSE_NAME
  FROM COURSE
 WHERE PROF_ID = (
    SELECT PROF_ID
      FROM COURSE
     WHERE COURSE_NAME = '컴퓨터 프로그래밍 기초'
);

-- 2) FROM 절에 사용하는 서브쿼리 (인라인 뷰)
-- 학과별 학생 수를 구한 뒤, 가장 많은 학생 수 출력
SELECT 
    MAX(cnt) AS 최대학생수
  FROM (
    SELECT 
        DEPT_ID,
        COUNT(*) AS cnt
      FROM STUDENT
     GROUP BY DEPT_ID
  ) AS grouped;




-- 2) 상관 서브쿼리
-- 각 학생의 장학금 금액보다 높은 장학금이 존재하는지 여부 확인
SELECT 
    STUDENT_NAME,
    AMOUNT
  FROM STUDENT s
  JOIN SCHOLARSHIP sc ON s.SCHOLARSHIP_ID = sc.SCHOLARSHIP_ID
 WHERE AMOUNT < (
    SELECT MAX(AMOUNT)
      FROM SCHOLARSHIP
     WHERE SCHOLARSHIP_ID != s.SCHOLARSHIP_ID
);


-- 3) EXISTS
-- 과목을 개설한 적이 있는 교수만 조회
SELECT 
    PROF_NAME
  FROM PROFESSOR p
 WHERE EXISTS (
    SELECT 1
      FROM COURSE c
     WHERE c.PROF_ID = p.PROF_ID
);


-- 4)  CTE (Common Table Expressions)
-- 학과별 평균 학점이 가장 높은 학과 찾기 (GPA는 GRADE 테이블 기준)
WITH avg_gpa AS (
    SELECT 
        s.DEPT_ID,
        ROUND(AVG(g.TOTAL_SCORE), 0) AS 평균시험성적
      FROM STUDENT s
      JOIN GRADE g ON s.STUDENT_ID = g.STUDENT_ID
     GROUP BY s.DEPT_ID
)
SELECT *
  FROM avg_gpa
 WHERE 평균시험성적 = (SELECT MAX(평균시험성적) FROM avg_gpa);

-- 과목별 수강 인원 수 집계
WITH course_count AS (
    SELECT 
        COURSE_ID,
        COUNT(*) AS 수강인원
      FROM ENROLLMENT
     GROUP BY COURSE_ID
)
SELECT 
    c.COURSE_NAME,
    cc.수강인원
  FROM COURSE c
  JOIN course_count cc ON c.COURSE_ID = cc.COURSE_ID;