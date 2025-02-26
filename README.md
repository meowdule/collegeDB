# 📌 대학 데이터베이스 스키마

## 📖 소개
이 프로젝트는 **대학 관리 시스템**을 위한 **관계형 데이터베이스 스키마**를 정의합니다. <br>
해당 데이터베이스는 **학생, 교수, 강의, 수강 신청, 성적, 출석, 시험, 장학금** 등의 테이블을 포함하며, <br>
**기본 키, 외래 키, 제약 조건, 계산 필드** 등을 활용하여 **데이터 무결성을 보장**합니다.

<br>

## 📁 스키마 개요

다음과 같은 테이블로 구성됩니다:

| 테이블명         | 설명 |
|----------------|-------------|
| `DEPARTMENT`   | 대학 학과 정보를 저장합니다. |
| `SCHOLARSHIP`  | 장학금 명칭 및 금액 정보를 저장합니다. |
| `STUDENT`      | 학생 정보를 관리하며 학과 및 장학금 정보를 포함합니다. |
| `PROFESSOR`    | 교수 정보를 관리하며 학과와 연결됩니다. |
| `COURSE`       | 강의 정보를 관리하며 학점, 교수 및 학과와 연결됩니다. |
| `ENROLLMENT`   | 학생의 수강 신청 정보를 저장합니다. |
| `GRADE`        | 학생 성적을 관리하며, 자동으로 최종 점수를 계산합니다. |
| `ATTENDANCE`   | 학생 출석 정보를 저장합니다. |
| `EXAM`         | 시험 정보를 관리하며, 시험 유형 및 날짜를 포함합니다. |

<br>


## 🚀 사용 방법
데이터베이스를 생성하고 초기화하려면 다음 단계를 따르세요:
1. `college_test_ddl` 문을 실행하여 데이터베이스와 테이블을 생성합니다.
2. `college_test_initial_dat` 문을 실행하여 데이터베이스의 기초데이터를 입력합니다.
3. `college_user_grant` 문을 실행하여 해당 실습을 위한 사용자를 개별 생성하여 사용합니다.
4. 자세한 설명은 [이 게시글](https://meowdule.tistory.com/109)을 순서대로 따라가세요.

<br>

## 🏛 Git 브랜치 구조 (SQL 학습 및 프로젝트 관리)

### 🌱 **DDL 및 초기 데이터 브랜치 (`sql-schema`)**  
- **설명**: DDL을 사용하여 테이블을 생성하고 초기 데이터를 삽입하는 브랜치  
- **포함 내용**: 데이터베이스 테이블 정의, 제약 조건 설정, 기본 데이터 입력  

```plaintext
sql-schema/
├── 01-database-setup.sql            # 데이터베이스 및 사용자 생성
├── 02-table-schema.sql              # DDL - 테이블 생성 및 제약 조건 설정
└── 03-insert-initial-data.sql       # 초기 데이터 삽입
```

<br>

### 🌱 **SQL 기본 학습 브랜치 (`sql-basics`)**  
- **설명**: SQL 기초 학습을 위한 브랜치  
- **포함 내용**: DDL, DML, SELECT, 집합 연산, 함수 등

📌 **폴더 및 파일 구조 (`sql-basics` 브랜치)**  
```plaintext
sql-basics/
├── 02-ddl-create-table.sql          # DDL - 테이블 생성 및 구조 변경
├── 03-data-types-constraints.sql    # 데이터 타입과 제약 조건
├── 04-dml-insert-update-delete.sql  # DML - 데이터 삽입, 수정, 삭제
├── 05-select-basics.sql             # SELECT 기본 쿼리
├── 06-set-operators.sql             # UNION, INTERSECT, EXCEPT
└── 07-built-in-functions.sql        # 내장 함수 활용
```

<br>

### 🚀 **SQL 심화 및 트랜잭션 브랜치 (`sql-advanced`)**  
- **설명**: SQL 심화 개념을 다루는 브랜치  
- **포함 내용**: 트랜잭션, 인덱스, 뷰, 저장 프로시저, 트리거, DCL 등

📌 **폴더 및 파일 구조 (`sql-advanced` 브랜치)**  
```plaintext
sql-advanced/
├── 08-transactions-integrity.sql    # 트랜잭션과 데이터 무결성
├── 09-view-concepts.sql             # VIEW 개념 및 활용
├── 10-index-performance.sql         # 인덱스와 성능 최적화
├── 11-stored-procedure-function.sql # 저장 프로시저 & 함수
├── 12-trigger-usage.sql             # 트리거 개념 및 사용법
├── 13-dcl-privileges-security.sql   # DCL - 권한 관리 및 보안
└── 14-advanced-sql.sql              # 고급 SQL 활용
```

### 🔧 **기능 개발 브랜치 (`feature/*`)**  
- **설명**: 테스트케이스 등 특정 기능을 개발하거나 실습을 위한 브랜치  
- **포함 내용**:  --

<br>


## 🎯 **브랜치 사용 방법**
| 브랜치명         | 설명 |
|----------------|-------------|
| `main`        | 프로젝트 기본 브랜치 (전체 코드 및 문서) |
| `sql-schema`  | DDL 생성 및 초기 데이터 입력 브랜치 |
| `sql-basics`  | SQL 기초 학습 브랜치 |
| `sql-advanced`| SQL 심화 학습 브랜치 |
| `feature/*`   | 특정 기능 추가 및 실험용 브랜치 |




<br>

## 📜 라이선스
이 프로젝트는 오픈 소스로 제공되며 자유롭게 수정 및 확장할 수 있습니다.


