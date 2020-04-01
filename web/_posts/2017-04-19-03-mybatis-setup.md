---
layout: post
title: MyBatis 설정하기
excerpt_separator: <!--more-->
---
#### Spring 프로젝트 MyBatis 빌드 하기
빌드 하기 전 Mysql로 table 생성후 테스트 한다.

<!--more-->
#### 1. pom.xml dependency 추가
```xml
<!-- mysql -->
<dependency>
  <groupId>mysql</groupId>
	<artifactId>mysql-connector-java</artifactId>
	<version>6.0.5</version>
</dependency>

<!-- Test -->
<dependency>
	<groupId>junit</groupId>
	<artifactId>junit</artifactId>
	<version>4.12</version>
	<scope>test</scope>
</dependency>
<!-- mybatis -->
<dependency>
  <groupId>org.mybatis</groupId>
  <artifactId>mybatis</artifactId>
  <version>3.4.1</version>
</dependency>
<dependency>
  <groupId>org.mybatis</groupId>
  <artifactId>mybatis-spring</artifactId>
  <version>1.3.0</version>
</dependency>
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-jdbc</artifactId>
  <version>${org.springframework-version}</version>
</dependency>
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-test</artifactId>
  <version>${org.springframework-version}</version>
</dependency>
<dependency>
	<groupId>org.bgee.log4jdbc-log4j2</groupId>
	<artifactId>log4jdbc-log4j2-jdbc4</artifactId>
	<version>1.16</version>
</dependency>
```
#### 2. src/main/resource 경로에 설정파일 추가
- mybatis-config.xml 추가

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
	PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
</configuration>
```
- log4jdbc.log4j2.properties 추가

```properties
log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator
```

- back.xml 추가

```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
	<include resource="org/springframework/boot/logging/logback/base.xml"/>

	<!-- log4jdbc-log4j2 -->

	<logger name="jdbc.sqlonly" level="DEBUG"/>
	<logger name="jdbc.sqltiming" level="INFO"/>
	<logger name="jdbc.audit" level="WARN"/>
	<logger name="jdbc.resultset" level="ERROR"/>
	<logger name="jdbc.resultsettable" level="ERROR"/>
	<logger name="jdbc.connection" level="INFO"/>

</configuration>
```

- mappers/mapper.xml 추가
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.una.mapper.MamberMapper">
  <select id="getTime" resultType="string">
		select now()
	</select>
</mapper>
```


#### 3. root-context.xml에 네임스페이스 추가 및 bean 추가
 - aop
 - beans
 - context
 - jdbc
 - mybatis-spring

```xml
<bean id="dataSource"
  class="org.springframework.jdbc.datasource.DriverManagerDataSource">
  <property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"></property>
  <property name="url" value="jdbc:log4jdbc:mysql://127.0.0.1:3306/member_ex?useSSL=false&amp;serverTimezone=Asiz/Seoul"></property>
  <property name="username" value="una"></property>
  <property name="password" value="una"></property>
</bean>
<bean id="sqlSessionFectory"
  class="org.mybatis.spring.SqlSessionFactoryBean">
  <property name="dataSource" ref="dataSource"></property>
  <property name="configLocation" value="classpath:/mybatis-config.xml"></property>
  <property name="mapperLocations" value="classpath:mappers/**/*Mapper.xml"></property>
</bean>

<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate" destroy-method="clearCache">
	<constructor-arg name="sqlSessionFactory" ref="sqlSessionFectory"></constructor-arg>
	</bean>

  <context:component-scan base-package="com.una.persistence"></context:component-scan>
```


#### 4. src/test/java 폴더에 생성할때 만든 패키지와 동일한 패키지의 Class 생성  

```java
package org.zerock.web;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MyBatisTest {

	@Inject
	private SqlSessionFactory sqlFactory;

	@Test
	public void testFactory(){
		System.out.println(sqlFactory);
	}

	@Test
	public void testSession()throws Exception{
		try(SqlSession session = sqlFactory.openSession()) {
			System.out.println(session);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}

```
#### 5. Run As > jUnit Test
    com.mysql.cj.jdbc.ConnectionImpl@942a29c
    org.apache.ibatis.session.defaults.DefaultSqlSessionFactory@4d5650ae
    org.apache.ibatis.session.defaults.DefaultSqlSession@1e0b4072

> 객체가 프린트 됨


#### 6. UTF-8 인코딩 필터 추가
 -  web.xml

 ```xml
 <filter>

		<filter-name>encoding</filter-name>
		<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
		<init-param>
			<param-name>encoding</param-name>
			<param-value>UTF-8</param-value>
		</init-param>
	</filter>
 ```
