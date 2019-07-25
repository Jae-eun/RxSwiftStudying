# Disposing

> 구독을 취소하여 Observable을 수동적으로 종료시킴.



```swift
let observable = Observable.of(1, 2, 3)

let subscription = observable.subscribe({ num in
	print(num)
})

subscription.dispose()
```

* Int의 Observable을 생성하고 **subscribe** 을 통해 Disposable을 반환
* 구독을 취소하고 싶으면 **dispose()**를 호출



# DisposeBag()

* 각각의 구독을 한번에 관리하기 위해 사용
* Disposable은 DisposeBag instance의 **deinit()**이 실행될 때 dispose()를 호출