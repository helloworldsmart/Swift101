import UIKit

//-
func addNumbers(firstValue: Int, secondValue: Int) -> Int {
  return firstValue + secondValue;
}

var numbersFunc: (Int, Int) -> Int;
numbersFunc = addNumbers;
numbersFunc(2, 3);

func timesThree(number: Int) -> Int {
  return number * 3;
}

func doSomethingTo(aNumber: Int, thingToDo: (Int) -> Int) -> Int {
  return thingToDo(aNumber);
}

doSomethingTo(aNumber: 4, thingToDo: timesThree);

func createAdder(numberToAdd: Int) -> (Int) -> Int {
  func adder(number: Int) -> Int {
    return number + numberToAdd;
  }
  return adder;
}
var addTwo = createAdder(numberToAdd: 2);
addTwo(2);

//-
func createIncrementor(incrementAmount: Int) -> () -> Int {
  var amount = 0;
  func incrementor() -> Int {
    amount += incrementAmount;
    return amount;
  }
  return incrementor;
}

var incrementByTen = createIncrementor(incrementAmount: 10);
incrementByTen();
incrementByTen();
var incrementByFifteen = createIncrementor(incrementAmount: 15);
incrementByFifteen;

// Closure
let jumbledArray = [2, 1, 98, 2, 13];
jumbledArray.sorted();

let numbers = [2, 1, 56, 32, 120, 13];
var numbersSorted = numbers.sorted { (n1: Int, n2: Int) -> Bool in
  return n2 > n1;
}

print(numbersSorted);

let numbersSortedReverse = numbers.sorted(by: { n1, n2 in return n1 > n2})

var numbersSortedAgain = numbers.sorted(by: { $0 > $1 });
var numbersSortedReversedAgain = numbers.sorted { $0 > $1 };
var numbersSortedReversedOneMoreTime = numbers.sorted { $0 > $1 };

var comparator = {(a: Int, b: Int) in a < b};
comparator(1, 2);

//-Defer
func doSomeWork() {
  print("Getting started!");
  defer {
    print("All done!")
  }
  print("Getting to work!");
}
doSomeWork()

//-Guard
func doAThing() {
  guard 2+2 == 4 else {
    print("The universe makes no sense");
    return;
  }
  print("We can continue with our daily lives");
}

func doSomeStuff(importantVariable: Int?) {
  guard let importantVariable = importantVariable else {
    return
  }
  print("doing our important work with \(importantVariable)");
}
doSomeStuff(importantVariable: 3)
doSomeStuff(importantVariable: nil)
