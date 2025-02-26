-- 새로운 사용자 계정 생성
CREATE USER 'college'@'%' IDENTIFIED BY 'college';

-- 사용자가 college 데이터베이스에 대해 모든 권한을 부여
GRANT ALL PRIVILEGES ON college.* TO 'college'@'%';

-- 권한 변경 사항을 즉시 적용
FLUSH PRIVILEGES;