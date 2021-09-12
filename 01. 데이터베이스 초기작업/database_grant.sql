-- 사용자 목록 보기
show databases;
use mysql;
show tables;
desc user;
select current_user(); -- 현재 유저 출력
select * from user; -- 모든 열 출력
select `host`, `user`, `plugin`, `authentication_string` from user; -- 선택한 열만 출력

-- 사용자(계정) 추가하기
CREATE USER moon@'%' IDENTIFIED BY '1234';

-- cmd 실행 접속확인
alter user 'moon'@'%' identified with mysql_native_password by '1111';
flush privileges;

-- 데이터베이스 사용 권한 부여하기
GRANT ALL ON *.* TO 'moon'@'%'; -- 모든 DB의 모든 테이블
 GRANT ALL ON mysql.* TO 'moon'@'%'; -- 특정 DB(db1)의 모든 테이블
 GRANT SELECT, INSERT, UPDATE ON mysql.db TO 'moon'@'%'; -- 일부 권한 부여하기
 REVOKE INSERT, UPDATE ON mysql.* FROM 'moon'@'%'; -- 권한 제거하기
 DROP USER 'moon'@'%'; -- 계정 삭제하기
 flush privileges; -- 권한 변경을 적용
 
 