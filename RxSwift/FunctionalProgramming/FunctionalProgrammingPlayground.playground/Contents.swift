import UIKit

// ##Functional Programming

let allStudents: [Student] = getSchoolStudents();

let gradeThreeClassTwoStudents: [Student] = allStudents
  .filter { student in student.grade == 3 && student.class == 3 }

let gradeThreeClassTwoStudents
  .filter { student in student.sex == .male }
    .forEach { boy in boy.singASong(name: "隱形的翅膀") }

gradeThreeClassTwoStudents
  .filter { student in student.score > 90 }
  .map { student in student.parent }
  .forEach { parent in parent.receiveAPrize() }

gradeThreeClassTwoStudents
  .sorted { student0, student1 in student0.score > student1.score }
  .forEach { student in print("score: \(student.score), name: \(student.name)") }

//-
//let tap: Array<Void> = [(), (), ()]

//taps.forEach { showAlert() }

let taps: Observable<Void> = button.rx.tap.asObservable()
taps.subscribe(onNext: { showAlert() })
passwordOutlet.rx.text.orEmpty
  .map { $0.characters.count >= minimalPasswordLength }
  .bind(to: passwordValidOutlet.rx.isHidden)
  .disposed(by: disposeBag)

//-
let image: UIImage = UIImage(named: <#T##String#>);
imageView.image = image;

let image: Obserable<UIImage> = ...
image.bind(to: imageView.rx.image)

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
