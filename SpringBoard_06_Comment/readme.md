# Java-Spring 

## Setting
 1. java 1.8.0설치
  - https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html / java 1.8.0
 2. Path 경로 설정
 3. Spring
	- https://download.springsource.com/release/STS/3.9.3.RELEASE/dist/e4.8/spring-tool-suite-3.9.3.RELEASE-e4.8.0-win32-x86_64.zip
 4. Oracle Database Express Edition (XE) Release 11.2.0.2.0
	- https://www.oracle.com/database/technologies/xe-prior-releases.html
 5. dbever(DB Tool) https://dbeaver.io/files/dbeaver-ce-latest-win32.win32.x86_64.zip
 
### Maven error
 - C:\Users\사용자\.m2\repository 에 있는 Maven관련 폴더들 삭제후 Spring프로젝트에서 MavenUpdate를 해주면 해결

## Spring-Flow
 - DB - Mapper - mybatisconfig - DTO/interface / getter, setter/ using field / (Alt,Shift,S) - DAO/interface - service - controller
 
### Spring Framework setting base
 - servlet-context.xml, root-context.xml, web.xml
 - beans - bean(객체)- bean.id(bean(객체)의 이름) - property(변수) - property.name(변수명)
 
### module과 component의 차이점
 - module 안에 component가 있고 하나의 모듈에는 여러개의 컴포넌트가 존재한다.
 
### annotaion / Django decorator와 비슷

### RedirectAttribute - return redirect:/domain

### HashMap DB 조인?

### @RestController url 매핑 자동으로 해줌?

### ResonseEntity = ???

### @GetMapping(value="/p/{pno}/{page}",produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
 - value는 url을 나타내고 produces는 받아오는 것을 나타내고 consumes는 보내는 것을 의미함
 
### Spring에서 TDD도 지원해주지만 복잡

 
