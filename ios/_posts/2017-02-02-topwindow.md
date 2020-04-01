---
title: 최 상위 UIViewController 찾기
layout: post
excerpt_separator: <!--more-->
---
#### 최 상위 UIViewController 찾기

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
