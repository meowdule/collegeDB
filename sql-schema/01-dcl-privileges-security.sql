-- 01. dcl - privileges - security
-- 새로운 사용자 계정 생성
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

CREATE USER 'college'@'%' IDENTIFIED BY 'college';

-- 사용자가 college 데이터베이스에 대해 모든 권한을 부여
GRANT ALL PRIVILEGES ON college.* TO 'college'@'%';

-- 사용자가 college 데이터베이스의 특정 테이블에 대해 SELECT 권한만 부여
GRANT SELECT ON college.department TO 'college'@'%';

-- 사용자가 college 데이터베이스의 특정 테이블에 대해 SELECT와 INSERT 권한을 부여
GRANT SELECT, INSERT ON college.student TO 'college'@'%';

-- 권한 변경 사항을 즉시 적용
FLUSH PRIVILEGES;

-- 사용자가 college 데이터베이스에서 SELECT 권한을 회수
REVOKE SELECT ON college.* FROM 'college'@'%';

-- 사용자가 college 데이터베이스의 특정 테이블에서 SELECT 권한을 회수
REVOKE SELECT ON college.department FROM 'college'@'%';

-- 사용자가 college 데이터베이스에서 모든 권한을 회수
REVOKE ALL PRIVILEGES ON college.* FROM 'college'@'%';

-- 권한 회수 후 즉시 적용
FLUSH PRIVILEGES;

-- 사용자 계정 삭제
DROP USER 'college'@'%';