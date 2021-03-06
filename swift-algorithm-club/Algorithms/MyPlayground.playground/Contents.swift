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

let oneSet: Set = [1, 1, 1, 1]
print(oneSet)

let oneArray: Array = [1, 1, 1, 1]
print(oneArray)

let numbersSet: Set = [1, 2, 3, 4, 5]
print(numbersSet)

for value in numbersSet {
  print(value)
}

numbersSet.forEach { (value) in
  print(value)
}

var mutableStringSet: Set = ["One", "Two", "Three"]
let item = "Two"

//contains
if mutableStringSet.contains(item) {
  print("\(item) found in the set")
} else {
  print("\(item) not found in the set")
}

//isEmpty
let strings = Set<String>()
if strings.isEmpty {
  print("Set is empty")
}

//count
let emptyStrings = Set<String>()
if emptyStrings.count == 0 {
  print("Set has no elements")
}

//insert
mutableStringSet.insert("Four")

//remove 1
mutableStringSet.remove("Three")

//remove 2
if let removeElement = mutableStringSet.remove("Six") {
  print("\(removeElement) was removed from the Set")
} else {
  print("Six is not found in the Set")
}

mutableStringSet.removeAll()

//empty dictionary
var dayOfWeek = Dictionary<Int, String>()
var dayOfWeek2 = [Int: String]()

//not empty dictionary
var dayOfWeek3: [Int: String] = [0: "Sun", 1: "Mon", 2: "Tue"]
print(dayOfWeek3)

// iteration 1
for (key, value) in dayOfWeek3 {
  print("\(key): \(value)")
}

// iteration 2
for key in dayOfWeek3.keys {
  print(key)
}

// iteration 3
for value in dayOfWeek3.values {
  print(value)
}

// find value
if let day = dayOfWeek3[2] {
  print(day)
}

dayOfWeek3[3] = "Wed"
print(dayOfWeek3)

dayOfWeek3[2] = "Mardi"
print(dayOfWeek3)

dayOfWeek3.updateValue("Tue", forKey: 2)
print(dayOfWeek3)

dayOfWeek3[1] = nil
print(dayOfWeek3)

dayOfWeek3.removeValue(forKey: 2);
print(dayOfWeek3)

dayOfWeek3.removeAll()
print(dayOfWeek3)
