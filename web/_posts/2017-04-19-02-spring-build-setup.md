---
layout: post
title: Spring 프로젝트 빌드 하기
excerpt_separator: <!--more-->
---
#### Spring 프로젝트 빌드시 주의사항

<!--more-->
- 프로젝트 별로 서버를 만들어 따로 띄운다.
- 서버를 새로 만들 때 포트 번호를 확인하고 되도록이면 포트번호가 겹치지 않도록 변경해준다.
- 서버 > Open launch configuration > VM arguments: 에 변수를 추가해서 실행중 옵션값을 추가해 줄 수 있다.
  - ex ) -D{변수이름}="값"

- servlet-context.xml의 <context:component-scan base-package =""> 해당 패키지 안에 있는 어노테이션만 호출 된다.
