---
title: UITableCell 높이 자동 처리 할 때 라벨 처리 방법
layout: post
excerpt_separator: <!--more-->
---

테이블 셀의 높이 동적으로 처리 할때 Label 내용이 길면 ...으로 보이는 버그가 발생한다.

이때 Label의 preferredMaxLayoutWidth 값이 bound값이 변할 때 마다 자동으로 설정되게 하면 해결 할 수 있다.

<!--more-->
#### 1. AutoSizingLabel Class를 생성 한다.
```swift

import UIKit

class AutoSizingLabel: UILabel {


override var bounds: CGRect{
    didSet{

        if self.numberOfLines == 0
        {
            let boundsWidth = bounds.width

            if (self.preferredMaxLayoutWidth != boundsWidth) {
                self.preferredMaxLayoutWidth = boundsWidth;

                self.setNeedsUpdateConstraints();
                self.updateConstraints();
            }
        }
    }
}

override var intrinsicContentSize: CGSize{
    get{

        var size = super.intrinsicContentSize;

        if self.numberOfLines == 0
        {
            size.height += 1;
        }

        return size;
    }
}

}

```

#### 2. 뷰컨트롤러에 [UITableView [UITableCell[AutoSizingLabel]]]를 붙인다

#### 3. Label의 Constraint 값을 수정한다.
  - Bottom Space 의 Priority : 250
  - Content Hugging Priority Horizontal : 252
  - Content Hugging Priority Vertical : 251
  - Content Compressing Resistance Priority Horizontal: 741
  - Content Compressing Resistance Priority Vertical : 749

  <img src="/public/images/post/auto_sizing_label.png"/>


소스코드 다운로드 : <https://github.com/unalog/AutoSizingLabel>
