-- 06 - set - operators
-- 1. UNION
-- 동일한 컬럼 구조를 가진 두 SELECT 결과를 합쳐 중복 없이 반환
-- 장학금 수혜를 받지 않았거나  컴퓨터 공학과(D01) 소속 학생
SELECT student_id, student_name, dept_id, scholarship_id
  FROM student
 WHERE scholarship_id IS NULL
UNION
SELECT student_id, student_name, dept_id, scholarship_id
  FROM student
 WHERE dept_id = 'D02';



-- 2. UNION ALL
-- 중복을 제거하지 않고 결과를 그대로 모두 합집합하여 출력
-- 장학금 수혜를 받지 않았거나  전자 공학과(D02) 소속 학생
SELECT student_id, student_name, dept_id, scholarship_id
  FROM student
 WHERE scholarship_id IS NULL
UNION ALL
SELECT student_id, student_name, dept_id, scholarship_id
  FROM student
 WHERE dept_id = 'D02';



-- 3. INTERSECT
-- 교집합으로 두 조건을 모두 만족하는 경우만 출력
-- 장학금 수혜자 중 컴퓨터공학과(D01) 학생

-- in 사용하여 구현
SELECT student_id, student_name, dept_id
  FROM student
 WHERE dept_id = 'D01'
   AND student_id IN (
        SELECT student_id
          FROM student
         WHERE scholarship_id IS NOT NULL
      );

-- Inner join 방식
SELECT a.student_id, a.student_name, a.dept_id
  FROM student a
  JOIN (
        SELECT student_id FROM student WHERE scholarship_id IS NOT NULL
       ) b ON a.student_id = b.student_id
 WHERE a.dept_id = 'D01';



-- 4. Minus
-- 첫 SELECT 결과에서, 두 번째 SELECT 결과에 포함된 레코드를 제외

-- 전자 공학과(D02) 학생 중 장학금 수혜자가 아닌 학생
SELECT a.student_id, a.student_name, a.dept_id
  FROM student a
  LEFT JOIN (
        SELECT student_id FROM student WHERE scholarship_id IS NOT NULL
      ) b ON a.student_id = b.student_id
 WHERE a.dept_id = 'D02'
   AND b.student_id IS NULL;
