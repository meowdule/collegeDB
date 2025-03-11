-- 04. dml - insert - update - delete
-- DML - 데이터 삽입, 수정, 삭제
TRUNCATE TABLE TEMP_STUDENT;

-- 1. 데이터 삽입 ( INSERT )

-- 1) STUDENT 테이블에 학생 추가
-- 모든 컬럼에 값을 삽입
INSERT INTO temp_student
VALUES ('홍길동', 'hong2@example.com', 'D01', 21);

-- 특정 컬럼에만 값을 삽입 (나머지는 기본값 적용)
INSERT INTO temp_student (TEMP_STUDENT_NAME, EMAIL, DEPT_ID)
VALUES ('이순신', 'lee@example.com', 'D02');

-- 다중 행 삽입
INSERT INTO TEMP_STUDENT (TEMP_STUDENT_NAME, EMAIL) 
VALUES ('박영희', 'park@example.com'),
       ('김민수', 'kim@example.com');


SELECT * FROM temp_student;



-- 2. 데이터 수정 ( UPDATE )
-- 단일 행 업데이트
-- TEMP_STUDENT_ID가 1인 학생의 EMAIL을 변경
UPDATE temp_student
   SET EMAIL = 'newemail@example.com'
 WHERE TEMP_STUDENT_ID = 1;


-- 다중 컬럼 업데이트
-- TEMP_STUDENT_ID가 2인 학생의 이름과 나이를 동시에 변경
UPDATE temp_student
   SET TEMP_STUDENT_NAME = '김서연',
       AGE = 22
 WHERE TEMP_STUDENT_ID = 2;


SELECT * FROM temp_student;

-- 조건에 따른 업데이트
-- 이메일 도메인이 example.com인 모든 학생의 학과를 D02로 변경
UPDATE temp_student
   SET DEPT_ID = 'D02'
 WHERE EMAIL LIKE '%example.com';


-- SUBQUERY를 활용한 업데이트
-- '이순신' 학생의 DEPT_ID를 '전자공학과'의 DEPT_ID로 업데이트
UPDATE temp_student
   SET DEPT_ID = (SELECT DEPT_ID
                    FROM temp_department
                   WHERE DEPT_NAME = '전자공학과')
 WHERE TEMP_STUDENT_NAME = '이순신';


SELECT * FROM temp_student;



-- 3. 데이터 삭제 ( DELETE )
-- 특정 조건에 따른 행 삭제
-- TEMP_STUDENT_ID가 1인 학생 삭제
DELETE
  FROM temp_student
 WHERE TEMP_STUDENT_ID = 1;
 
 SELECT * FROM temp_student;
 
-- 특정 조건에 따라 다수의 행 삭제
-- TEMP_STUDENT_NAME에 'example.com' 도메인을 사용하는 학생 삭제
DELETE
  FROM temp_student
 WHERE TEMP_STUDENT_NAME LIKE '김%';
 
 SELECT * FROM temp_student;

-- 조건 없이 전체 행 삭제
-- 경고: 테이블의 모든 데이터를 삭제하므로 주의가 필요함
DELETE
  FROM temp_student;

SELECT * FROM temp_student;



-- 4. 데이터 교체 ( REPLACE )
-- 기존 데이터와 PRIMARY KEY 또는 UNIQUE KEY가 충돌하면 덮어씌우고,
-- 그렇지 않으면 새로 추가
-- TEMP_STUDENT_ID가 2인 학생의 데이터를 교체
REPLACE INTO temp_student
(TEMP_STUDENT_ID, TEMP_STUDENT_NAME, EMAIL, DEPT_ID, AGE)
VALUES (2, '장영실', 'jang@example.com', 'D03', 23);

-- UNIQUE KEY가 충돌하지 않는 새로운 데이터 추가
REPLACE INTO temp_student
(TEMP_STUDENT_ID, TEMP_STUDENT_NAME, EMAIL, DEPT_ID, AGE)
VALUES (3, '신사임당', 'shin@example.com', 'D01', 20);

SELECT * FROM temp_student;
