---
title: IBDesignable 사용하기
layout: post
excerpt_separator: <!--more-->
---

IBDesignable을 이용하면 코드가 간결해지고 스토리보드상에서 화면을 확인 할 수 있어 편리하다.


<!--more-->
1. IBDesignable을 적용시킬 View의 클래스 상단에 @IBDesignable을 선언 한다.
2. 스토리보드상 전달 받을 값 앞에 @IBInspectable을 선언 한 뒤 draw 함수를 재정의 한다.
3. 스토리 보드에서 User Defined Runtime Attributes항목에 @IBInspectable을 선언한 변수와 값을 매핑하면 draw 함수에 구현한 대로 화면에 적용되어 나타난다.

```swift

@IBDesignable
class LineAnimationTextField: UITextField {

    @IBInspectable var nomalLineColor = UIColor.clear
    @IBInspectable var focusLineColor = UIColor.clear{
    didSet
        {
            animationView.backgroundColor = focusLineColor
        }
    }
    override func draw(_ rect: CGRect) {

        let ctx = UIGraphicsGetCurrentContext()

        ctx?.setStrokeColor(self.nomalLineColor.cgColor)
        ctx?.setLineWidth(2.0)

        ctx?.move(to: CGPoint(x:0, y:self.bounds.size.height))
        ctx?.addLine(to: CGPoint(x:self.bounds.size.width, y:self.bounds.size.height ))

        ctx?.strokePath();

        super.draw(rect);
    }
}
```

![storyboard](/public/images/post/ibdesignable_01.png)
소스코드 다운로드 : <https://github.com/unalog/LineAnimationTextField>
