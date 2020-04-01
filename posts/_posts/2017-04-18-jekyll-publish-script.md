---
title: jekyll publish shell script 만들기
layout: post
excerpt_separator: <!--more-->
---

md 파일을 github로 push 하는 스크립트를 작성하면 편리하게 글을 올릴 수 있다.

<!--more-->


#### Shell Script 파일을 만든다.  

    $ vi publish.sh

#### publish.sh
```sh
#! /bin/sh

git add --all &
wait

git commit -m "edit post" &
wait

git push -f origin master
wait
```

#### Shell Script 실행

    $ sh publish.sh
