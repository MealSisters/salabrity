-- DB설계 컨펌이후 내용 채우기

--========================================
-- 관리자계정
--========================================
-- salabrity 계정 생성
alter session set "_oracle_script" = true; -- c##으로 시작하지않는 일반계정생성 허용

-- 일반사용자(salabrity) 추가
create user salabrity
identified by salabrity -- 비밀번호
default tablespace users; -- 실제 데이터 저장공간

grant connect, resource to salabrity;
alter user salabrity quota unlimited on users;


--========================================
-- salabrity 계정
--========================================