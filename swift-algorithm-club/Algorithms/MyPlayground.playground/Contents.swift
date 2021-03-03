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

func buying1(money: Int, price: Int, capacity: Int, volume: Int) {
  if money >= price {
    if capacity >= volume {
      print("Start buying...")
      print("\(money-price) money left after buying.")
      print("\(capacity-volume) capacity left after buying")
    } else {
      print("No enough capacity")
    }
  } else {
    print("No enough money")
  }
}

func buying2(money: Int, price: Int, capacity: Int, volume: Int) {
  guard money > price else {
    print("No enough money")
    return
  }
  guard capacity >= volume else {
    print("No enough capacity")
    return
  }
  
  print("Start buying....")
  print("\(money-price) money after buying.")
  print("\(capacity-volume) capacity left after buying.")
}

func log(message: String) {
  print("log: \(message)!")
}

log(message: "memory warning")

func logString(string: String) -> String {
  return "log: " + string
}

let logStr = logString(string: "memory warning!")
print("\(logStr)")

func logMessage(_ message: String) {
  print("log: \(message)!")
}

logMessage("memory warning")

func addInt(_ a: Int, _ b: Int) {
  print("Sum is \(a + b)")
}

addInt(3, 4)

var originalArr = [2, 1, 3]

func removeLastInArray(_ array: inout [Int]) {
  array.removeLast()
}

print("\n ===== before removing: \(originalArr)")

removeLastInArray(&originalArr)
print("\n ===== after removing: \(originalArr)")

// immutable array
let immutableNumbers: [Int] = [1, 3, 5, 4, 4, 1]

// mutable array
var mutableNumbers: [Int] = [2, 1, 5, 4, 1, 3]

// iteration 1
for value in mutableNumbers {
//  if let index = mutableNumbers.index(of: value) {
  if let index = mutableNumbers.firstIndex(of: value) {
    print("Index of \(value) is \(index)")
  }
}

// iteration 2
mutableNumbers.forEach { (value) in
  if let index = mutableNumbers.firstIndex(of: value) {
    print("Index of \(value) is \(index)")
  }
}

// iteration 3
for (index, value) in mutableNumbers.enumerated() {
  print("Item \(index + 1): \(value)")
}

mutableNumbers.append(11)

mutableNumbers.insert(42, at: 4)

mutableNumbers.swapAt(0, 1)

mutableNumbers.remove(at: 0)

mutableNumbers.removeFirst()

mutableNumbers.removeAll()
