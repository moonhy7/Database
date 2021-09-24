-- 전체 출력
SELECT * FROM lecture.member;

-- 정상적인 번호만 출력
select * from member
where PHONE regexp('(\\d{2,3}[-.]?\\d{4}[-.]?\\d{4})');

select * from member
where PHONE regexp('\\d{2,3}[-.]?\\d{4}[-.]?\\d{4}') or phone is not null order by phone;

select * from member
where PHONE not regexp('\\d{2,3}[-.]?\\d{4}[-.]?\\d{4}') or phone is null order by phone;

select * from member
where PHONE regexp('[^(\\d{2,3}[-.]?\\d{4}[-.]?\\d{4})]');

-- 생일
select * from member
where BIRTHDAY regexp('^\\d{4}-?\\d{2}-?\\d{2}$');



