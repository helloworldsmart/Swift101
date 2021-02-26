import UIKit

var str = "Hello, playground"

for index in 1...5 {
  print("index: \(index)")
}

for index in 1..<5 {
  print("index: \(index)")
}

for index in (1..<5).reversed() {
  print("index: \(index)")
}

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let tmp = a;
  a = b;
  b = tmp;
}

var someInt = 3;
var anotherInt = 107;
swapTwoInts(&someInt, &anotherInt);
print("someInt is now \(someInt), and another is now \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
  let tmp = a;
  a = b;
  b = tmp;
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
  let tmp = a;
  a = b;
  b = tmp;
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
  let tmp = a;
  a = b;
  b = tmp;
}





