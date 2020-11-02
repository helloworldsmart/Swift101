import Foundation
import RxSwift



/*:
 Copyright (c) 2019 Razeware LLC

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 distribute, sublicense, create a derivative work, and/or sell copies of the
 Software in any work that is designed, intended, or marketed for pedagogical or
 instructional purposes related to programming, coding, application development,
 or information technology.  Permission for such use, copying, modification,
 merger, publication, distribution, sublicensing, creation of derivative works,
 or sale is expressly withheld.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

example(of: "ignoreElements") {
  // 1. 創造一個 strikes subject
  let strikes = PublishSubject<String>();

  let disposeBag = DisposeBag();

  // 2.Subscribe to all strikes’ events, but ignore all .next events by using ignoreElements.
  strikes
  .ignoreElements()
  .subscribe { _ in
    print("You're out!")
  }
  .disposed(by: disposeBag)
}

example(of: "elementAt") {
  //1.創造一個 subject
  let strikes = PublishSubject<String>();

  let disposeBag = DisposeBag();

  //2. You subscribe to the .next events, ignoring all
  //but the 3rd .next event (found at index 2).
  strikes
    .elementAt(2)
    .subscribe(onNext: { _ in
      print("You're out!")
    })
    .disposed(by: disposeBag);
}

example(of: "filter") {
  let disposeBag = DisposeBag()

  //1.You create an observable of some predefined integers.
  Observable.of(1, 2, 3, 4, 5, 6)
    // 2
    .filter { $0 % 2 == 0 }

    .subscribe(onNext: {
      print($0)
    })
    .disposed(by: disposeBag);
}

example(of: "skip") {
  let disposeBag = DisposeBag();

  //1 Create an observable of letters.
  Observable.of("A", "B", "C", "D", "E", "F")
    //2 Use skip to skip the first 3 elements
    // and subscribe to .next events.
    .skip(3)
  .subscribe(onNext: {
    print($0)
  })
    .disposed(by: disposeBag);
}

example(of: "skipWhile") {
  let disposeBag = DisposeBag();

  //1
  Observable.of(2, 2, 3, 4, 4)
    //2
    .skipWhile { $0 % 2 == 0 }
    .subscribe(onNext: {
      print($0)
    })
    .disposed(by: disposeBag)
}

example(of: "skipUntil") {
  let disposeBag = DisposeBag();

  // 1
  let subject = PublishSubject<String>();
  let trigger = PublishSubject<String>();
  //2
  subject
    .skipUntil(trigger)
    .subscribe(onNext: {
      print($0)
    })
    .disposed(by: disposeBag)

  subject.onNext("A")
  subject.onNext("B")

  trigger.onNext("X")

  subject.onNext("C")

}

example(of: "take") {
  let disposeBag = DisposeBag();

  //1
  Observable.of(1, 2, 3, 4, 5, 6)
    //2
  .take(3)
  .subscribe(onNext: {
    print($0)
  })
  .disposed(by: disposeBag)
}

example(of: "takeWhile") {
  let disposeBag = DisposeBag()
  
  Observable.of(2, 2, 4, 4, 6, 6)
    .enumerated()
    .takeWhile { index, integer in
      integer % 2 == 0 && index < 3
    }
    .map { $0.element }
    .subscribe(onNext: {
     print($0)
    })
    .disposed(by:disposeBag)
}

example(of: "takeUntil") {
  let diaposeBag = DisposeBag();

  //1
  let subject = PublishSubject<String>();
  let trigger = PublishSubject<String>();

  //2
  subject
    .takeUntil(trigger)
    .subscribe(onNext: {
      print($0);
    })
    .disposed(by: diaposeBag)

  //3
  subject.onNext("1")
  subject.onNext("2")

  trigger.onNext("X")
  subject.onNext("3")

}

//Distinct operators
example(of: "distinctUntilChange") {
  let diaposeBag = DisposeBag();

  //1
  Observable.of("A", "A", "B", "B", "A")
    .distinctUntilChanged()
    .subscribe(onNext: {
      print($0)
    })
    .disposed(by: diaposeBag)
}
