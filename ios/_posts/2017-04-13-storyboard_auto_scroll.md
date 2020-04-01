---
title: Autolayout으로 화면 스크롤 처리하기
layout: post
excerpt_separator: <!--more-->
---

코드를 이용하지 않고 Autolayout만 사용하여 화면에 스크롤 붙이기

<!--more-->

1. 뷰컨트롤러에 UIScrollView를 붙인다.

2. ScrollView 의 Content Compression Resistance Priority의 Ambiguity값을 Never Verify로 변경한다.
    <img src="/public/images/post/storyboard_auto_scroll_01.png"/>


3. ScrollView 안에 내용을 표시할 View를 추가 한다

4. 추가된 View의 Bottom Auto Layout 값을 0보다 크거나 같은 값으로 추가 한다.

<img src="/public/images/post/storyboard_auto_scroll_02.png"/>

소스코드 다운로드 : <https://github.com/unalog/ScrollTest>
