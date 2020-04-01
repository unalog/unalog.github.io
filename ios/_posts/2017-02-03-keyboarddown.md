---
title: iOS 키보드 내리기
layout: post
excerpt_separator: <!--more-->
---
#### 키보드 내리기

```
[vc.view endEditing:YES];
```

#### 아무화면에서나 키보드 내리기 => 최상위 뷰컨트롤러를 찾아서 해당하는 뷰컨트롤러의 뷰의 에디팅을 끝낸다

```
+ (UIViewController*) topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;

    while (topController.presentedViewController) {
        topController = topController.presentedViewController;

    }

    if ([topController isKindOfClass:[UINavigationController class]]) {
        UINavigationController * navi =  (UINavigationController*)topController;

        topController = [navi visibleViewController];
    }
    return topController;
}
```

<!--more-->
