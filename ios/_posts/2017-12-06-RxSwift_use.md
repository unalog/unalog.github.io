---
title: Reactive X 사용
layout: post
excerpt_separator: <!--more-->
---
 - ReactiveX는 Functional Reactive Programming 의 구현체
 - observable 스티림을 사용하는 비동기 프로그래밍 API
 - observable : 비동기적으로 다수 이벤트를 다루는 방법. Observer 패턴의 확장
 이벤트가 발생하면 이를 조작해서 구독할 수 있는 형태

<!--more-->

#### Install
>pod 'RxSwift'    
>pod 'RxCocoa'

#### ObserverType
- Observable 객체를 만들면 기본 적으로 onNext, onCompleted, onError 에 대한 이벤트를 구독 가능함

```swift

public protocol ObserverType {
    associatedtype E
    func on(_ event: Event<E>)
}

extension ObserverType {

    /// Convenience method equivalent to `on(.next(element: E))`
    ///
    /// - parameter element: Next element to send to observer(s)
    public func onNext(_ element: E) {
        on(.next(element))
    }

    /// Convenience method equivalent to `on(.completed)`
    public func onCompleted() {
        on(.completed)
    }

    /// Convenience method equivalent to `on(.error(Swift.Error))`
    /// - parameter error: Swift.Error to send to observer(s)
    public func onError(_ error: Swift.Error) {
        on(.error(error))
    }
}
```
#### observable 생성
```swift
_ = Observable.just("RxSwift!!")

_ = Observable.from([1,2,3,4])

Observable<Any>.create({ (obserbable) -> Disposable in
  return Disposables.create {
    print("disposable craeted")
  }
})        
```
#### subscript
```swift
_ = Observable.just("1").subscribe()
```
```swift
_ = Observable.just("1").subscribe(onNext: { (data) in
            print("onNext")
       }, onError: { (error) in
           print("onError")
       }, onCompleted: {
           print("completed")
       }, onDisposed: {
           print("onDisposeable")
       })
```
```swift
 _ = Observable.just("test").subscribe({ (event) in
           print("event")
       })
```

#### disposer
```swift
let disbposeBag = DisposeBag()

_ = Observable.just("1").subscribe(onNext: { (data) in
            print("onNext")
       }, onError: { (error) in
           print("onError")
       }, onCompleted: {
           print("completed")
       }, onDisposed: {
           print("onDisposeable")
       })
       .disposed(by: disbposeBag)

```
#### Subject
- PublishSubject


```swift
var publishSubject = PublishSubject<String>()
publishSubject.onNext("very first value")
publishSubject.subscribe { (event) in
  print(event)
}
publishSubject.onNext("first value")
publishSubject.onNext("second value")
publishSubject.onError(NSError(domain: "", code: 1, userInfo: nil))
publishSubject.onNext("very last value")
publishSubject.onCompleted()

```
> next(first value)    
> next(second value)    
> error(Error Domain= Code=1 "(null)")

- BehaviorSubject
```swift
var behaviorSubject = BehaviorSubject(value: "initial value")
behaviorSubject.subscribe { (event) in
  print(event)
}
behaviorSubject.onNext("first value")

```

> next(initial value)    
> next(first value)    
> completed    

- ReplaySubject
```swift
let bag = DisposeBag()
var replaySubject = ReplaySubject<String>.create(bufferSize: 1)
replaySubject.onNext("before subscribe first value")
replaySubject.onNext("before subscribe second value")
replaySubject.subscribe { (event) in
  print(event)
}
replaySubject.onNext("first value")
replaySubject.onCompleted()
```
> next(before subscribe second value)    
> next(first value)    
> completed    

- Variable
Variable 은 BehaviorSubject의 Wrapper 함수입니다.
#### Use
- UIEvent

- Network


```swift

return Observable<Any>.create({ (obserbable) -> Disposable in


           let url = "url"  
           let parameters: Parameters = ["a": "a" ,"b":"b" ]
           let headers: HTTPHeaders = [
               "Accept": "application/json"
           ]

           Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
               .responseJSON { response in
                   //print(" - API url: \(String(describing: response.request!))")   // original url request
                   var statusCode = response.response?.statusCode

                   switch response.result {
                   case .success:
                       print("status code is: \(String(describing: statusCode))")


                       if let json = response.data {
                           if let data =  try? JSON(data: json)
                           {


                               obserbable.onNext(data)
                               obserbable.onCompleted()

                           }

                       }

                   case .failure(let error):
                       statusCode = error._code // statusCode private

                       obserbable.onError(error)
                   }

           }
           return Disposables.create {
               print("disposable craeted")
           }
       })
```
