---
title: jekyll post 타입 여러개 만들기
layout: post
excerpt_separator: <!--more-->
---

포스트 타입을 여러개 만들어 다양한 레이아웃을 적용할 수 있다.

<!--more-->


#### 1. 포스트 폴더 구성을 변경 한다.  

    root
    | -- index.html  
    | -- portfolio  
            | -- main.html  
            | -- _posts  
                    | -- 2012-01-12-portfolio.dm  
            
    | -- posts  
            | -- _posts  
                    | -- 2012-06-12-post1.dm  


#### 2. main.html 파일에 레이아웃을 구성한다  
테마 홈페이지에서 마음에 드는 레이아웃을 찾아서 필요한 코드 복사


#### 3. category로 분류한다.

    pagnation.posts -> site.categories..(posts  or portfolios)

#### 4. 메뉴와 연결 한다


소스코드 다운로드 : <https://github.com/unalog/unalog.github.io>

