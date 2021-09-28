/*
    <함수>
        컬럼값을 읽어서 계산한 결과를 반환한다.
            - 단일행 함수 : N 개의 값을 읽어서 N 개의 결과를 리턴한다. (매 행 함수 실행 결과 반환)
            - 그룹 함수 : N 개의 값을 읽어서 1개의 결과를 리턴한다. (하나의 그룹별로 함수 실행 결과 반환)
            - SELECT 절에 단일행 함수와 그룹함수를 함께 사용하지 못 한다. (결과 행의 개수가 다르기 때문)
            - 함수를 기술할 수 있는 위치는 SELECT, WHERE, ORDER BY, GROUP BY, HAVING 절에 기술할 수 있다.
*/

--------------------------------------- 단일행 함수 ----------------------------------

-- LENGTH / LENGTHB
-- DUAL 테이블 : sys가 소유하고 있는 테이블이며 모든 사용자가 접근 가능. 한 행, 한 컬럼을 가지고 있는 더미(DUMMY) 테이블이며 계산시 임시로 사용

SELECT LENGTH('오라클'), LENGTHB('오라클')
FROM DUAL;

SELECT LENGTH('SHOWMETHEMONEY'), LENGTH('SHOW ME THE MONEY'), LENGTHB('SHOWMETHEMONEY'), LENGTHB('SHOW ME THE MONEY')
FROM DUAL;

SELECT EMP_NAME, LENGTHB(EMP_NAME), PHONE, LENGTH(PHONE)
FROM EMPLOYEE;

-- INSTR : 지정한 위치부터 지정된 숫자 번째로 나타난는 문자의 시작 위치를 반환한다.

SELECT INSTR('AABAACAABBAA', 'B')
FROM DUAL;

SELECT INSTR('AABAACAABBAA', 'B', 1, 2)
FROM DUAL;

SELECT INSTR('AABAACAABBAA', 'B', 1, 3)
FROM DUAL;

SELECT INSTR('AABAACAABBAA', 'B', -1, 1)
FROM DUAL;

SELECT INSTR('AABAACAABBAA', 'B', -1, 2)
FROM DUAL;

SELECT INSTR('AABAACAABBAA', 'B', -1, 3)
FROM DUAL;

-- LPAD /  RPAD

-- 20만큼의 길이 중 EMAIL 값은 오른쪽으로 정렬하고 공백을 왼쪽으로 채운다.
SELECT LPAD(EMAIL, 20)
FROM EMPLOYEE;

SELECT LPAD(EMAIL, 10)
FROM EMPLOYEE;

SELECT RPAD(EMAIL, 10)
FROM EMPLOYEE;

-- 991212-2******을 출력
SELECT RPAD('991212-2', 14, '*')
FROM DUAL;

SELECT RPAD(SUBSTR('991212-2222222', 1, 8), 14, '*')
FROM DUAL;

-- LTRIM / RTRIM
SELECT LTRIM('     KH')
FROM DUAL;

SELECT LTRIM('00045648787', '0')
FROM DUAL;

SELECT LTRIM('123123451', '123')
FROM DUAL;

SELECT LTRIM('123123451123', '123')
FROM DUAL;

SELECT RTRIM('KH     ')
FROM DUAL;

SELECT RTRIM('001230000456000', '0')
FROM DUAL;

-- TRIM
SELECT TRIM('       KH     ')
FROM DUAL;

SELECT TRIM( 'Z' FROM 'ZZZZKHZZZZ')
FROM DUAL;

SELECT TRIM( BOTH 'Z' FROM 'ZZZZKHZZZZ')
FROM DUAL;

SELECT TRIM(LEADING 'Z' FROM 'ZZZZKHZZZZ')
FROM DUAL;

SELECT TRIM(TRAILING 'Z' FROM 'ZZZZKHZZZZ')
FROM DUAL;

-- SUBSTR
SELECT SUBSTR('SHOWMETHEMONEY' , 7) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY' , 3, 8) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY' , 1, 6) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY' , -8, 3) FROM DUAL;

-- LOWER / UPPER / INITCAP

SELECT LOWER('Welcome To My World!') FROM DUAL;
SELECT UPPER('Welcome To My World!') FROM DUAL;
SELECT INITCAP('welcome to my world!') FROM DUAL;

-- CONCAT
SELECT CONCAT('안녕하', 'ABC') "콘켓" FROM DUAL;
SELECT '안녕하' || 'ABC' FROM DUAL;
-- SELECT CONCAT('안녕하', 'ABC', '세요') FROM DUAL;
SELECT '안녕하' || 'ABC' || '세요' FROM DUAL;

-- REPLACE
SELECT REPLACE('인천시 연수구 송도동', '송도동', '동춘동') FROM DUAL; 

-- TRUNC
SELECT TRUNC(123.456) FROM DUAL;
SELECT TRUNC(123.456, 1) FROM DUAL;
SELECT TRUNC(123.456, -2) FROM DUAL;

-- SYSDATE
SELECT SYSDATE FROM DUAL;

-- MONTHS_BETWEEN
SELECT EMP_NAME, HIRE_DATE, FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) || '개월' AS "근무기간"
FROM EMPLOYEE;

-- ADD_MONTHS
SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;

-- NEXT_DAY
SELECT NEXT_DAY(SYSDATE, '금요일') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL;

-- LAST DAY
SELECT LAST_DAY(SYSDATE) FROM DUAL;

-- EXTRACT
SELECT EMP_NAME, EXTRACT(YEAR FROM HIRE_DATE) AS "입사년도"
FROM EMPLOYEE
ORDER BY 2;

-- 날짜 포맷 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD';

SELECT SYSDATE FROM DUAL;

-- TO_CHAR
SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(1234, '999999') FROM DUAL;
SELECT TO_CHAR(1234, '000000') FROM DUAL;
SELECT TO_CHAR(1234, 'L9999') FROM DUAL;

SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'RR-MM-DD(DAY)') FROM DUAL;

-- 숫자 -> 날짜
SELECT TO_DATE(20210918) FROM DUAL;
SELECT TO_DATE(20210918, 'YYYYMMDD') FROM DUAL;
SELECT TO_DATE('20210918 232313', 'YYYYMMDD HH24MISS') FROM DUAL;

-- TO_NUMBER
SELECT TO_NUMBER('0123456789') FROM DUAL;
SELECT '123' + '456' FROM DUAL; -- 자동형변환 및 연산
SELECT '1,000,000' + '500,000' FROM DUAL; -- 에러발생
SELECT TO_NUMBER('1,000,000', '9,999,999') + TO_NUMBER('500,000', '999,999') FROM DUAL;

-- NVL
SELECT EMP_NAME, NVL(BONUS, 0)
FROM EMPLOYEE;
SELECT EMP_NAME, NVL(DEPT_CODE, '부서없음')
FROM EMPLOYEE;

-- NVL2
SELECT EMP_NAME, NVL2(BONUS, 0.1, 0)
FROM EMPLOYEE;

-- DECODE
SELECT EMP_ID,
       EMP_NAME,
       DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', 2, '여', '잘못된 주민등록번호입니다.')
FROM EMPLOYEE;

SELECT EMP_ID,
       EMP_NAME,
       SALARY,
       DECODE(JOB_CODE, 'J7', SALARY * 1.1, 'J6', SALARY * 1.15, 'J5', SALARY * 1.2, SALARY * 1.05) AS "인상된 급여"
FROM EMPLOYEE;

-- CASE
SELECT EMP_ID, EMP_NAME, EMP_NO,
       CASE WHEN SUBSTR(EMP_NO, 8, 1) = '1' THEN '남자'
            WHEN SUBSTR(EMP_NO, 8, 1) = '2' THEN '여자'
            ELSE '잘못된 주민등록번호입니다.'
       END AS "성별"
FROM EMPLOYEE;

SELECT EMP_ID, EMP_NAME, EMP_NO,
       CASE WHEN SALARY > 5000000 THEN '1등급'
            WHEN SALARY > 3500000 THEN '2등급'
            WHEN SALARY > 2000000 THEN '3등급'
            ELSE '4등급'
       END AS "급여등급"
FROM EMPLOYEE;

------------------------------------------------- 그룹 함수 ---------------------------------------------------
-- SUM
SELECT SUM(SALARY)
FROM EMPLOYEE;

SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '1';

SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '2';

SELECT SUM(SALARY * 12)
FROM EMPLOYEE;

-- AVG
-- EMPLOYEE 테이블의 전사원의 급여 평균을 조회
SELECT TO_CHAR(ROUND(AVG(NVL(SALARY, 0))), 'L9,999,999') AS "급여평균"
FROM EMPLOYEE;

-- COUNT
SELECT COUNT(*)
FROM EMPLOYEE;

SELECT COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;


















