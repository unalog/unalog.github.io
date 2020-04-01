---
title: iOS 핸드폰 번호 체크 정규식
layout: post
excerpt_separator: <!--more-->
---
#### iOS 핸드폰 번호 체크 정규식

```
+(BOOL)isPhoneNumberFormet:(NSString*)phoneNumber
{
    if (phoneNumber == nil) {
        return NO;
    }

    phoneNumber = [[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet]invertedSet]]componentsJoinedByString:@""];


    NSString *someRegexp = @"^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$";
    NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", someRegexp];

    if ([myTest evaluateWithObject: phoneNumber]){
        return YES;
    }
    return NO;
}
```

<!--more-->
