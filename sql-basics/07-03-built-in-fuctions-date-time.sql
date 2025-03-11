-- 07-03. built - in - functions - date - time
-- 1. 오늘 날짜 & 현재 시간
SELECT 
	-- 1) NOW()
	-- 현재 날짜와 시간(YYYY-MM-DD HH:MM:SS) 반환
	NOW() AS now_time,
	
	-- 2) SYSDATE()
	-- 현재 날짜와 시간(YYYY-MM-DD HH:MM:SS) 반환
	SYSDATE() AS sysdate_time,
	
	-- 3) CURDATE()
	-- 현재 날짜(YYYY-MM-DD)만 반환
	CURDATE() AS today,
	
	-- 4) CURTIME()
	-- 현재 시간(HH:MM:SS)만 반환
	CURTIME() AS `current_time`;



-- 2. 날짜 구성 요소 추출 함수
SELECT 
	-- 1) YEAR : 연도 추출
	YEAR(NOW()) AS year_now,
	
	-- 2) MONTH : 월 추출
	MONTH(NOW()) AS month_now,
	
	-- 3) DAY : 일 추출
	DAY(NOW()) AS day_now,
	DAYOFMONTH(NOW()) AS day_now2,
	
	-- 4) HOUR : 시간 추출
	HOUR(NOW()) AS hour_now,
	
	-- 5) MINUTE : 분 추출
	MINUTE(NOW()) AS minute_now,
	
	-- 6) SECOND : 초 추출
	SECOND(NOW()) AS second_now;



-- 3. 날짜와 시간 분리
SELECT 
	-- 1) DATE(datetime)
	-- YYYY-MM-DD 형식으로 날짜만 추출
	DATE(NOW()) AS date_part,
	
	-- 2) TIME(datetime)
	-- HH:MM:SS 형식으로 시간만 추출
	TIME(NOW()) AS time_part;



-- 4. 날짜 및 시간 간 차이 계산
SELECT 
	-- 1) DATEDIFF(date1, date2)
	-- 날짜 간 일 수 차이를 계산 (date1 - date2)
	DATEDIFF('2024-06-30', '2024-06-01') AS 날짜차이,
	
	-- 2) TIMEDIFF(time1, time2)
	-- 시간 간 차이를 HH:MM:SS 형식으로 반환
	TIMEDIFF('10:00:00', '08:30:00') AS 시간차이;



-- 5. 날짜 및 시간 더하기 / 빼기
SELECT 
	-- 1) ADDDATE(date, INTERVAL n unit)
	-- 날짜에 기간을 더함
	ADDDATE('2024-03-01', INTERVAL 30 DAY) AS 한달후,
	
	-- 2) SUBDATE(date, INTERVAL n unit)
	-- 날짜에서 기간을 뺌
	SUBDATE('2024-03-01', INTERVAL 7 DAY) AS 일주일전,
	
	-- 3) ADDTIME(datetime, time)
	-- 시간 단위의 더하기
	ADDTIME('2024-03-01 09:00:00', '2:30:00') AS 수업종료예정,
	
	-- 4) SUBTIME(datetime, time)
	-- 시간 단위의 빼기
	SUBTIME('2024-03-01 09:00:00', '0:15:00') AS 준비시간;



-- 6. 유용한 날짜 함수 모음
SELECT 
	-- 1) LAST_DAY(date)
	-- 해당 월의 마지막 날 반환
	LAST_DAY('2024-02-10') AS 이달마지막날,
	
	-- 2) DAYOFWEEK(date)
	-- 요일 반환 (1=일요일, 7=토요일)
	DAYOFWEEK('2024-03-01') AS 요일번호,
	
	-- 3) MONTHNAME(date)
	-- 월의 이름 반환
	MONTHNAME('2024-03-01') AS 월이름,
	
	-- 4) DAYOFYEAR(date)
	-- 1년 중 몇 번째 날인지 반환
	DAYOFYEAR('2024-03-01') AS 누적일수;

SELECT 
	-- 5) QUARTER(date)
	-- 해당 날짜가 몇 분기인지 반환 (1~4)
	QUARTER('2024-03-01') AS 분기,
	
	-- 6) TIME_TO_SEC(time)
	-- 시간을 **초(seconds)**로 변환
	TIME_TO_SEC('01:30:00') AS 초로환산,
	
	-- 7) MAKEDATE(year, day_of_year)
	-- 지정한 연도의 n번째 날을 날짜로 반환
	MAKEDATE(2024, 60) AS 날짜환산,
	
	-- 8) MAKETIME(hour, minute, second)
	-- 시, 분, 초를 조합하여 TIME 형식으로 반환
	MAKETIME(9, 30, 0) AS 수업시작시간;