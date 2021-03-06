import UIKit

var arr: Array<Int>
var arr2: [Int]

var arr3 = [Int]()
arr3.append(12)

arr3 = []

var anotherArr: [Int] = [];

// var threeInts = [Int](count: 3, repeatedValue:0)
let number1 = [Int](repeating: 0, count: 10);
let number2 = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10);

// https://www.hackingwithswift.com/example-code/language/how-to-create-an-array-by-repeating-an-item

var secondThreeInts = [Int](repeating: 0, count: 3);
var anotherThreeInt = [Int](repeating: 2, count: 3);

var sixInts = secondThreeInts + anotherThreeInt;

var shoppingList: [String] = ["Eggs", "Mike"]
var anotherList = ["Rice", "Apples"]

var array4 = ["Apples", "Eggs", "Mike", "Rice", "Water"]

print(array4[2])

array4[2] = "Oranges"

print(array4[4])

array4[1...4] = ["Milk"]

var array5 = ["Apples", "Eggs", "Mike"]
print(array5.count)

array5 = []

if array5.isEmpty {
  print("Empty !")
} else {
  print("Not Empty !")
}

var array6 = ["Apples", "Eggs"]
array6.append("Milk")
// old: array6.insert("Rice", atIndex: 0)
array6.insert("Rice", at: 0)
// old: array6.removeAtIndex(1)
array6.remove(at: 1)
array6

array6.removeLast()
array6

var array7 = ["Rice", "Apples", "Eggs", "Milk"]
for item in array7 {
  print(item)
}

for (index, value) in array7.enumerated() {
  print("Item \(index + 1): \(value)")
}

var someSet: Set<String>

var mySet = Set<Int>()
var anotherSet: Set<String> = ["Rock", "Classical", "Hip hop"];

anotherSet = []

print(anotherSet.count)


if anotherSet.isEmpty {
  print("Empty !")
} else {
  print("Not Empty !")
}
var mySet2: Set<String> = ["Rock", "Classical"]
mySet2.insert("Hip hop")
mySet2

mySet2.remove("Rock")

if mySet2.contains("Classical") {
  print("Classical is here !")
} else {
  print("Not Here !")
}

mySet2.removeAll()

var mySet3: Set<String> = ["Rice", "Apples", "Eggs"]
for item in mySet3 {
  print(item)
}

// old: mySet3.sort()
for item in mySet3.sorted() {
  print(item)
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
// old: sort()
oddDigits.intersection(evenDigits).sorted()

// old: oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

oddDigits.union(evenDigits).sorted()

// old:c subtract
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["狗", "貓"]
let farmAnimals: Set = ["牛", "雞", "羊", "狗", "貓"]
let cityAnimals: Set = ["鳥", "鼠"]

// old: houseAnimals.isSubsetOf(farmAnimals)
houseAnimals.isSubset(of: farmAnimals)

farmAnimals.isSuperset(of: houseAnimals)

farmAnimals.isDisjoint(with: cityAnimals)

var someDict: Dictionary<String, String>

var someAnotherDict: [String: String]

var myDict = [String: Int]()

myDict["One"] = 1;

myDict = [:]

var myDict2 = ["TYO": "Tokyo", "DUB": "Dublin"]

print(myDict2.count)

if myDict2.isEmpty {
  print("Empty !")
} else {
  print("Not empty !")
}

myDict2["LHR"] = "London"

myDict2["LHR"] = "London Heathrow"

myDict2["LHR"] = nil

var myDict3 = ["LHR" : "London", "DUB": "Dublin"]

myDict3.updateValue("London Heathrow", forKey: "LHR")

print(myDict3["LHR"] as Any)

// myDict3.removeValueForKey("DUB")
myDict3.removeValue(forKey: "DUB")

var myDict4 = ["LHR": "London", "DUB": "Dublin"]

var someArr1 = [String](myDict4.keys)

var someArr2 = [String](myDict4.values)

someArr1.sort()
someArr2.sort()

for (key, value) in myDict4 {
  print("\(key): \(value)")
}

for code in myDict4.keys {
  print(code)
}

for n in myDict4.values {
  print(n)
}
