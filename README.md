# 1. 프로젝트 소개

더존 미니프로젝트 2 1팀, 맛집 웹앱

## 1.1 팀원 구성

- 팀장 강현구
- 팀원 류정수
- 팀원 이기찬
- 팀원 전지현

# 2. 프로젝트 종속성 라이브러리

## 2.1. JRE
	
- JavaSE 11

## 2.1. Maven Dependencies
	
- Spring Web MVC 5.3.23
    - 최신 버전

- MyBatis Spring 2.0.7
    - 최신 버전
	- Spring Web 5.3.23과 호환
	
- OJDBC8 19.3.0
    - DB 서버인 windows x64 oracle db 19c 19.3.0.0 과 호환
	
- Lombok 1.18.24
    - 서버 개발 환경에 설치된 버전.
    
- Spring JDBC 5.1.3
    - ojdbc8 19.3.0 연동 가능

## 2.2. 서버 런타임 라이브러리

Tomcat v9.0.65 종속 라이브러리

- el-api
- jsp-api
- servlet-api
- etc...

# 3. RESTful API

## 3.1. Notice

### 3.1.1. Create

**Request**

- URL : /notice

- Method : post

- Body : 
     
    ```json
    {
        "noticeTitle" : "공지제목",
        "noticeContent" : "공지내용"    
    }
    ```

### 3.1.2. Read


#### 3.1.2.1. 단일 요청

**Request**

- URL : /notice/{공지 번호}

- Method : get

**Response**

단일 Notice 표현 Json 객체.


#### 3.1.2.2. 페이지 단위 요청

**Request**

- URL : /notice/page/{페이지 번호}

- Method : get

**Response**

단일 페이지 내의 Notice 리스트 표현 Json 객체.

### 3.1.3. Update

**Request**

- URL : /notice/{공지 번호}

- Method : patch

- Body : 
     
    ```json
    {
        "noticeTitle" : "공지제목",
        "noticeContent" : "공지내용"    
    }
    ```

### 3.1.4. Delete


**Request**

- URL : /notice/{공지 번호}

- Method : delete

## 3.2. FAQ

### 3.2.1. Create

**Request**

- URL : /faq

- Method : post

- Body : 
     
    ```json
    {
        "faqTitle" : "FAQ 제목",
        "faqContent" : "FAQ 내용"    
    }
    ```

### 3.2.2. Read


#### 3.2.2.1. 단일 요청

**Request**

- URL : /faq/{FAQ 번호}

- Method : get

**Response**

단일 FAQ 표현 Json 객체.


#### 3.2.2.2. 페이지 단위 요청

**Request**

- URL : /faq/page/{페이지 번호}

- Method : get

**Response**

단일 페이지 내의 FAQ 리스트 표현 Json 객체.

### 3.2.3. Update

**Request**

- URL : /faq/{FAQ 번호}

- Method : patch

- Body : 
     
    ```json
    {
        "faqTitle" : "FAQ 제목",
        "faqContent" : "FAQ 내용"    
    }
    ```

### 3.2.4. Delete


**Request**

- URL : /faq/{FAQ 번호}

- Method : delete

