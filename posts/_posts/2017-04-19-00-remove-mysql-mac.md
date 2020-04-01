---
title: Mac에서 Mysql 삭제하기
layout: post
excerpt_separator: <!--more-->
---

맥에서 터미널을 이용하여 Mysql 삭제하는 방법

    $ sudo rm /usr/local/mysql
    $ sudo rm -rf /usr/local/mysql*
    $ sudo rm -rf /Library/StartupItems/MySQLCOM
    $ sudo rm -rf /Library/PreferencePanes/My*
    $ vim /etc/hostconfig and removed the line MYSQLCOM=-YES-
    $ rm -rf ~/Library/PreferencePanes/My*
    $ sudo rm -rf /Library/Receipts/mysql*
    $ sudo rm -rf /Library/Receipts/MySQL*
    $ sudo rm -rf /var/db/receipts/com.mysql.*
<!--more-->

sql 임시 비밀번호를 잊어버렸을 때 지우고 재설치 하면 비밀번호가 다시 뜬다.
