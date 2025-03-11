-- 05-03. select - join
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

