---
title: cocoapods 사용하기
layout: post
excerpt_separator: <!--more-->
---
- 설치하기
> sudo gem install cocoapods
- pod 설정
>pod setup --verbose
- 제거하기
>sudo gem uninstall cocoapods

- 프로젝트에 profile  생성
> pod init

- 프로젝트에 설치
> pod install

- 프로파일 업데이트
>pod update

- pod install 시 Updating spec repo master 에러 발생시 아래커맨드로 해결
>pod repo remove master
pod setup --verbose


<!--more-->
