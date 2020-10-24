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
