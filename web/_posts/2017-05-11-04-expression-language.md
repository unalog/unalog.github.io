---
layout: post
title: Expression Language 문법
excerpt_separator: <!--more-->
---
#### Expression Language 문법


<!--more-->

#### 1. EL 문자열
```el
${true}
${false}
${1234}
${3.14}
${"JAVA"}
${"java"}
```

#### 2. EL 연산자
```el
산술 연산자 : +, -, *, /, %, mod
논리 연산자 : &&, ||, !, and, or, not
비교 연산자 : ==, !=, <, >, <=, >=, eq, ne, lt, get, le, ge
empty 연산자 : 값이 null이나 공백 문자인지 판단하는 연산자
```

#### 3. 예약어
- and
- eq
- gt
- true
- instanceof
- or
- ne
- le
- false
- empty
- not
- lt
- ge
- null
- div
- nod

#### 4. 내장 객체
- pageContext
- pageScope
- reuestScope
- sessionScope
- applicationScope
- param
- paramValues
- header
- headerValues
- cookie
- initParam

#### 5.  getAttribute()메소드 실행 우선 순위

request -> session -> application
