-- 09. view - concepts
-- 1. VIEW의 생성 및 조회

-- 1) 뷰 생성
CREATE OR REPLACE VIEW student_d01_view AS
SELECT 
    STUDENT_ID, STUDENT_NAME, DEPT_ID, EMAIL
  FROM student
 WHERE DEPT_ID = 'D01';

-- 2) 뷰 조회
SELECT * FROM student_d01_view;

-- 3) 뷰 동적 갱신 확인
-- STUDENT 테이블에 새로운 D01 학생 추가
INSERT INTO STUDENT (STUDENT_ID, STUDENT_NAME, BIRTHDATE, DEPT_ID, EMAIL)
VALUES ('S9999999', '테스트학생', '2000-01-01', 'D01', 'test@example.com');

-- VIEW 다시 조회하면 새 데이터가 반영됨
SELECT * FROM student_d01_view;
SELECT * FROM student;



-- 2. VIEW 를 통한 DML 조작

-- 1) INSERT
INSERT INTO student_d01_view (STUDENT_ID, STUDENT_NAME, DEPT_ID, EMAIL)
VALUES ('S9999998', '홍길동', 'D01', 'hong@example.com');

SELECT * FROM student_d01_view;

-- 2) UPDATE
UPDATE student_d01_view
SET STUDENT_NAME = '임꺽정'
WHERE STUDENT_ID = 'S9999998';

SELECT * FROM student_d01_view;

-- 3) DELETE
DELETE FROM student_d01_view
WHERE STUDENT_ID = 'S9999998' OR STUDENT_ID = 'S9999999';

SELECT * FROM student_d01_view;

-- 4) DML 이 불가능한 VIEW 예시
CREATE OR REPLACE VIEW student_count_by_dept AS
SELECT 
		  DEPT_ID
		, COUNT(*) AS student_count
  FROM student
 GROUP BY DEPT_ID;

SELECT * FROM student_count_by_dept;



-- 3. VIEW 삭제
DROP VIEW IF EXISTS student_d01_view;

SELECT * FROM student_d01_view;



-- 4. VIEW 옵션

-- 1) ON REPLACE
-- 기존 뷰를 삭제 하지 않고 다시 생성
CREATE OR REPLACE VIEW professor_contact_view AS
SELECT PROF_ID, PROF_NAME, EMAIL, PHONE
  FROM PROFESSOR;

SELECT * FROM professor_contact_view;

-- 2) WITH CHECK OPTION
CREATE OR REPLACE VIEW student_d01_strict_view AS
SELECT STUDENT_ID, STUDENT_NAME, DEPT_ID, EMAIL
  FROM student
 WHERE DEPT_ID = 'D01'
 WITH CHECK OPTION;

-- 2-1) 뷰에 데이터 삽입
-- 허용
INSERT INTO student_d01_strict_view 
VALUES ('S7777778', '김영희', 'D01', 'kim2@example.com');

SELECT * FROM student_d01_strict_view;

-- 허용 X
-- DEPT_ID가 'D02'이므로 조건 위반
INSERT INTO student_d01_strict_view 
VALUES ('S7777777', '김철수', 'D02', 'kim@example.com');

-- 2-2) 뷰 업데이트
-- 허용
UPDATE student_d01_strict_view
SET EMAIL = 'kim3@example.com'
WHERE STUDENT_ID = 'S7777778';

SELECT * FROM student_d01_strict_view;

-- 허용 X
-- 뷰 조건 위반
UPDATE student_d01_strict_view
SET DEPT_ID = 'D02'
WHERE STUDENT_ID = 'S7777778';
