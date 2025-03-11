-- 05-07. select - conditional - quarter - data
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