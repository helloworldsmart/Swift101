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


