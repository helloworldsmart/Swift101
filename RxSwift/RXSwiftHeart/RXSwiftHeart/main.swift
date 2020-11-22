//
//  main.swift
//  RXSwiftHeart
//
//  Created by Michael on 2020/11/22.
//  Copyright © 2020 TheAvengers. All rights reserved.
//

import Foundation
import RxSwift

//-
// Observable - 產生事件
// Observer - 響應事件
// Operator - 創建變化組合事件
// Disposable - 管理綁定(訂閱)的生命週期
// Schedulers - 線程隊列調配

// Obserable<String>
let text = usernameOutlet.rx.text.orEmpty.asObserable()
// Observable<Bool>
let passwordValid = text
  // Operator
  .map { $0.characters.count >= minimalUsernameLength }

// Observer<Bool>
let observer = passwordValidOutlet.rx.isHidden;
// Disposable
let disposable = passwordValid
  // Scheduler
  .subscribeOn(MainScheduler.instance)
  .observeOn(MainScheduler.instance)
  .bind(to: observer)

disposable.dispose();

//- Observable 可監聽序列
let numbers: Observable<Int> = Observable.create { observer -> Disposable in
  
  observer.onNext(7)
  observer.onNext(8)
  observer.onNext(7)
  observer.onNext(8)
  observer.onCompleted()
  
  return Disposable.create()
}

//-
typealias JSON = Any;

let json: Observable<JSON> = Observable.create{ (observer) -> Disposable in
  
  let task = URLSession.shared.dataTask(with: <#T##URL#>) { data, _, error in
    
    guard error == nil else {
      observer.onError(error!)
      return
    }
    
    guard let data = data,
      let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
      else {
        observer.onError(DataError.cantParseJSON)
        return
    }
    
    observer.onNext(jsonObject)
    observer.onCompleted()
  }
  
  task.resume()
  
  return Disposables.create { task.cancel() }
}

json
  .subscribe(onNext: { json in
    print("get json succeed: \(json)")
  }, onError: { error in
    print("get json fail Error: \(error.localizedDescription)")
  }, onCompleted: {
    print("get json task succeed completion")
  })
  .disposed(by: disposeBag)

// Event - 事件
public enum Event<Element> {
  case next(Element)
  case error(Swift.Error)
  case completed
}

// - next - 序列產生一個新的元素
// - error - 創建序列時產生了一個錯誤, 導致序列終止
// - completed - 序列的所有元素都已經成功產生, 整個序列已經完成

// - Single
func getRepo(_ repo: String) -> Single<[String: Any]> {
  return Single<[String: Any]>.create { single in
    let url = URL(string: "https://api.github.com/repos/\(repo)")!
    let task = URLSession.shared.dataTask(with: url) {
      data, _, error in
      
      if let error = error {
        single(.error(error))
        return
      }
      
      guard let data = data,
        let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves),
        let result = json as? [String: Any] else {
          single(.error(DataError.cantParseJSON))
          return
      }
      
      single(.success(result))
    }
    task.resume()
    return Disposables.create { task.cancel() }
  }
}

getRepo("ReactiveX/RxSwift")
  .subscribe(onSuccess: { json in
    print("JSON: ", json)
  }, onError: { error in
    print("Error: ", error)
  })
  .disposed(by: disposeBag)

public enum SingleEvent<Element> {
  case success(Element)
  case error(Swift.Error)
}

func cacheLocally() -> Completable {
  return Completable.create {
   
    
    guard succeed else {
      completable(.error(CacheError.failedCaching))
      return Disposable.create {}
    }
    
    completable(.completed)
    return Disposables.create {}
  }
}

cacheLocally()
  .subscribe(onCompleted: {
    print("Completed with no error")
  }, onError: { error in
    print("Completed with an error: \(error.localizedDescription)")
  })
  .disposed(by: disposeBag)

public enum CompletableEvent {
  case error(Swift.Error)
  case completed
}

// Maybe
func generateString() -> Maybe<String> {
  return Maybe<String>.create { maybe in
    maybe(.success("RxSwift"))
    // OR
    maybe(.completed)
    // OR
    maybe(.error(error))
    return Disposables.create {}
  }
}

generateString()
  .subscribe(onSuccess: { element in
    print("Completed with element \(element)")
  }, onError: { error in
    print("Completed with an error \(error.localizedDescription)")
  }, onCompleted: {
    print("Completed with no element")
  })
  .disposed(by: disposeBag)


// Driver
// - 不會產生 error 事件
// - 一定在 MainScheduler 監聽 (主線程監聽)
// - 共享附加作用

// Part1
//let results = query.rx.text
//  .throttle(0.3, scheduler: MainScheduler.instance)
//  .flatMapLatest { query in
//    fetchAuthCompleteItems(query)
//}
//
//results
//  .map { "\($0.count)" }
//  .bind(to: resultCount.rx.text)
//  .disposed(by: disposeBag)
//
//results
//  .bind(to: resultsTableView.rx.items(cellIdentifier: "Cell")) {
//    (_, result, cell) in
//    cell.textLabel?.text = "\(result)"
//  }
//.disposed(by: disposedBag)

// part2
//let results = query.rx.text
//  .throttle(0.3, scheduler: MainScheduler.instance)
//  .flatMapLatest { query in
//    fetchAuthCompleteItems(query)
//      .observeOn(MainScheduler.instance)
//      .catchErrorJustReturn([])
//  }
//.share(replay: 1)
//
//results
//  .map { "\($0.count)" }
//  .bind(to: resultCount.rx.text)
//  .disposed(by: disposeBag)
//
//results
//  .bind(to: resultsTableView.rx.items(cellIdentifier: "Cell")) {
//    (_, result, cell) in
//    cell.textLabel?.text = "\(result)"
//  }
//.disposed(by: disposedBag)

// part3
let results = query.rx.text.asDriver()
  .throttle(0.3, scheduler: MainScheduler.instance)
  .flatMapLatest { query in
    fetchAuthCompleteItems(query)
      .asDriver(onErrorJustReturn: [])
  }

results
  .map { "\($0.count)" }
  .drive(resultCount.rx.text)
  .disposed(by: disposeBag)

results
  .drive(resultsTableView.rx.items(cellIdentifier: "Cell")) {
    (_, result, cell) in
    cell.textLabel?.text = "\(result)"
  }
.disposed(by: disposedBag)

let safeSequence = rx
  .observeOn(MainScheduler.instance)
  .catchErrorJustReturn(onErrorJustReturn)
  .share(replay: 1, scpoe: .whileConnected)
return Driver(raw: safeSequence)

//- Signal
// - 不會產生 error 事件
// - 一定在 MainScheduler 監聽 (主線程監聽)
// - 共享附加作用
//let textField: UITextField = ...
//let nameLable: UILable = ...
//let nameSizeLabel: UILabel = ...
//
//let state: Driver<String?> = textField.rx.text.asDriver()
//
//let observer = nameLabel.rx.text
//state.driver(observer)
//
//let newObserver = nameSizeLabel.rx.text
//state.map { $0?.count.description }.drive(newObserver)

// Error
//let button: UIButton = ...
//let showAlert: (String) -> Void = ...
//
//let event: Drive<Void> = button.rx.tap.asDriver()
//
//let observer: () -> Void = { showAlert("popup alert 1") }
//event.drive(onNext: observer)
//

//
//let newObserver: () -> Void = { showAlert("popup alert 2") }
//event.drive(onNext: newObserver)

// Perfect:
//let button: UIButton = ...
//let showAlert: (String) -> Void = ...
//
//let event: Signal<Void> = button.rx.tap.asSignal()
//
//let observer: () -> Void = { showAlert("popup alert 1") }
//event.emit(onNext: observer)
//
//let newObserver: () -> Void = { showAlert("popup alert 2") }
//event.emit(onNext: newObserver)

// -4.2 Observer
tap.subscribe(onNext: { [weak self] in
  self?.showAlert()
}, onError: { error in
    print("something error: \(error.localizedDescription)")
}, onCompleted: {
    print("task succeed")
})

// AnyObserver

URLSession.shared.rx.data(request: URLRequest(url: url))
  .subscribe(onNext: { data in
    print("Data Task Success with count: \(data.count)")
  }, onError: { error in
    print("Data Task Error: \(error)")
  })
  .disposed(by: disposeBag)

//-
let observer: AnyObserver<Data> = AnyObserver {
  switch event {
  case .next(let data):
    print("Data Task Success with count: \(data.count)")
  case .error(let error):
    print("Data Task Error: \(error)")
  default:
    break
  }
}

URLSession.shared.rx.data(request: URLRequest(url: url))
  .subscribe(observer)
  .disposed(by: disposeBag)


// -
usernameVaild
  .bind(to: usernameVaildOutlet.tx.isHidden)
  .disposed(by: disposeBag)

//-
let observer: AnyObserve<Bool> = AnyObserver { [weak self] in (event)
  switch event {
  case .next(let isHidden):
    self?.usernameVaildOutlet.isHidden = isHidden
  default:
    break
  }
}

usernameVaild
  .bind(to: observer)
  .disposed(by: disposeBag)

//- Binder
// - 不會處理錯誤事件
// - 確保綁定都是在給定 Scheduler 上執行 (默認MainScheduler)

let observer: Binder<Bool> = Binder(usernameValidOutlet) { (view, isHidden) in
  view.isHidden = isHidden
}

usernameValid
  .bind(to: Observer)
  .disposed(by: disposeBag)

//-
extension Reactive where Base: UIView {
  public var isHidden: Binder<Bool> {
    return Binder(self.base) { view, hidden in
      view.isHidden = hidden
    }
  }
}


usernameVaild
  .bind(to: usernameVaildOutlet.rx.isHidden)
  .disposed(by: disposeBag)

extension Reactive where Base: UIControl {
  public var isEnabled: Binder<Bool> {
    return Binder(self.base) { control, value in
      control.isEnabled = value
    }
  }
}

extension Reactive where Base: UILabel {
  public var text: Binder<String?> {
    return Binder(self.base) { label, text in
      label.text = text
    }
  }
}

// Observable & Observer 既是可監聽序列也是觀察者
// 作為可監聽序列

// 作為觀察者
//let observer = textField.rx.text
//let text: Observable<String?> = ...
//text.bind(to: observer)

// AsyncSubject - Observable 產生完事件後, 發出最後一個元素
let disposeBag = DisposeBag()
let subject = AsyncSubject<String>()

subject
  .subscribe { print("Subscription: 1 Event:", $0) }
  .disposed(by: disposeBag)

subject.onNext("🐶")
subject.onNext("🐱")
subject.onNext("🐹")
subject.onCompleted()

// PublishSubject
let disposeBag = DisposeBag()
let subject = PublishSubject<String>()

subject
  .subscribe { print("Subscription: 1 Event:", $0) }
  .disposed(by: disposeBag)

subject.onNext("🐶")
subject.onNext("🐱")

subject
  .subscribe { print("Subscription: 2 Event:", $0) }
  .disposed(by: disposeBag)

subject.onNext("🅰️")
subject.onNext("🅱️")

// ReplaySubject

let disposeBag = DisposeBag()
let subject = ReplaySubject<String>.create(bufferSize: 1)

subject
  .subscribe { print("Subscription: 1 Event:", $0) }
  .dissposed(by: disposeBag)

subject.onNext("🐶")
subject.onNext("🐱")

subject
  .subscribe { print("Subscription: 2 Event:", $0) }
  .disposed(by: disposeBag)

subject.onNext("🅰️")
subject.onNext("🅱️")

// BehaviorSubject

let disposeBag = DisposeBag()
let subject = BehaviorSubject(value: "🔴")

subject
  .subscribe { print("Subscription: 1 Event:", $0) }
  .disposed(by: disposeBag)

subject.onNext("🐶")
subject.onNext("🐱")

subject
  .subscribe { print("Subscription: 2 Event:", $0) }
  .disposed(by: disposeBag)

subject.onNext("🅰️")
subject.onNext("🅱️")

subject
  .subscribe { print("Subscription: 2 Event:", $0) }
  .disposed(by: disposeBag)

subject.onNext("🍐")
subject.onNext("🍊")
// ControlProperty

// Operator
let rxTemperature: Observable<Double> = ...

rxTemperature.filter { temperature in temperature > 33 }
  .subscribe(onNext: { temperature in
    print("\(temperature)")
  })
  .disposed(by: disposeBag)

// map
let json: Observable<JSON> = ...

json.map(Model.init)
  .subscribe(onNext: { model in
    print("get Model: \(model)")
  })
  .disposed(by: disposeBag)

// zip

let rxHamburg: Observable<Hamburg> = ...
let rxFrenchFries: Observable<FrenchFries> = ...

Observable.zip(rxHamburg, rxFrenchFries)
  .subscribe(onNext: { (hamburg, frenchFries) in
    print("get \(hamburg) and \(frenchFries)")
  })
  .disposed(by: disposeBag)

// - Disposable
