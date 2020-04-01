---
layout: post
title: jquery Selector 문법
excerpt_separator: <!--more-->
---
#### jquery Selector 문법

<!--more-->
#### 1.직접 선택자
```jquery
$("*") : 전체 선택
$("#id") : 아이디 선택자
$(".class") : 클래스 선택자
$("element") : 요소명으로 선택
$("element1, element2, element3 ...") : 그룹 선택자
```

#### 2.인접관계 선택자
```jquery
$("element").parent() : 부모 선택
$("element").parents() : 상위 요소 선택
$("element sub element") : 하위요소 선택
$("element > children") : 자식요소 선택
$("element").prev() : 이전 요소 선택
$("element").prevAll() : 이전 요소들 선택
$("element1").prevUntil("element2"):
$("element").next()다음 요소 선택
$("element + next element")
$("element").nextAll() 다음 요소들 선택
$("element").siblings() : 모든 형제 요소 선택
```

#### 3. 탐색 선택자
```jquery
$("element:first")
$("element").first()

$("element:last")
$("element").last()

$("element:odd")

$("element:even)

$("element:first-of-type")
$("element:last-of-type")
$("element:nth-child(number)")
$("element:nth-child(number n)")
$("element:nth-last-of-type(number)")
$("element:only-child")

$("element:eq(index)")
$("element").eq(index)

$("element:gt(index)")
$("element:lt(index)")
$("element").slice(index)
```

#### 4. 속성 탐색 선택자
```jquery
$("element[attribute]")
$("element[attribute='value']")
$("element[attribute^='value']")
$("element[attribute$='value']")
$("element[attribute*='value']")

$("element:hidden")
$("element:visible")
$(":text")
$(":selected")
$(":checked")
```

#### 5. 그외 선택자
```jquery
$("element:contains('text')")
$("element").contents()
$("element:has(element)")
$("element").has(element)
$("element:not(element)")
$("element").filter("element")
$("element").find("element")
$("element").closest("element")
end()
```
