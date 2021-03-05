import UIKit

//var str = "Hello, playground"

print("Hello, World !")

let name: String = "Joe"

var price: Int = 300

print(name)

let score = 200

let myFullName = "Kevin Chen"

var myClass55 = "101"

let piValue = 3.1415926
var height = 178.25

let oneHeight = 165.25
print(type(of: oneHeight))
let anotherHeight: Float = 175.5

let number1 = 3
let number2 = 0.1415

let pi = Double(number1) + number2

print(pi)

let integerPi = Int(pi)
print(integerPi)

let storeOpen = true
let forFree = false

let firstString = "Nice to meet you."
let secondString = "Nice to meet you, too."

let str1 = "It is a string."
let str2 = "b"
let str3: Character = "c"

let myScore = "My score is \(score)"

print(myScore)

let myInfo = ("Michael Chen", 18, 178.25)
let myHeight = myInfo.2

print("My height is \(myHeight)")

let (myName, myAge, myRealHeight) = myInfo

print("My name is \(myName) .")

print("I am \(myAge) years o;d.")

let (_, _, myTrueHeight) = myInfo

print("My height is \(myTrueHeight) . ")

let herInfo = (name: "Jess", age: 24, height: 160.5)
print("Her name is \(herInfo.name)")

typealias MyType = Int

var someNumber: MyType = 123

var someScore: Int?

someScore = 100

//如果沒有optional type: error: 'nil' cannot be assigned to type 'Int'
someScore = nil

let numberValue: String? = "5566UI"
print(type(of: numberValue))
let newNumber = Int(numberValue ?? "1")

let number3: Int? = 500

print(number3!)


var number4: Int?

// Fatal error: Unexpectedly found nil while unwrapping an Optional value
//print(number4!)

let oneString: String? = "Good morning ."

let anotherString: String = oneString!

let twoString: String! = "Good night ."

let finalString: String = twoString

let threeString: String = "Good night night ."

let finalFinalString: String = threeString

let b = 10
var a = 5

a = b

let (x, y) = (1, 2)

var c = 1 + 2
var d = 7 - 2
var e = 3 * 2
var f = 10.0 / 2.5

let firstString1 = "Hello, "
let secondString1 = "World."
let finalString1 = firstString1 + secondString1
print(finalString1)

var oneNumber = 9 % 4
print(oneNumber)

//var anotherNumber = 8.0 % 2.5
//print(anotherNumber)

let number5 = 3
var anotherNumber5 = -number5
var finalNumber5 = -anotherNumber5

let number6 = -6
var anotherNumber6 = +number6

var num = 3
num += 2
print(num)

num -= 4
num *= 10
num /= 2
num %= 2

1 == 1
2 != 2
2 > 1
1 < 2
1 >= 1
2 <= 1

var i = 1
if i == 1 {
  print("Yes, it is 1.")
} else {
  print("No, it is not 1.")
}

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")

//(4, "dog", "cat", "cow", "car", "apple", "watch") == (4, "dog", "cat", "cow", "car", "apple", "watch")

var oldScore = 25
if oldScore < 60 {
  oldScore = oldScore + 50
} else {
  oldScore += 20
}

var newScore = 25
newScore = newScore + (newScore < 60 ? 50 : 20)

let defaultColor = "red"
var userDefinedColor: String?
var colorToUse = userDefinedColor ?? defaultColor
print(colorToUse)

var userAnotherDefinedColor: String? = "green"
var anotherColorToUse = userAnotherDefinedColor ?? userAnotherDefinedColor
print(anotherColorToUse ?? "red")

for index in 1...5 {
  print("\(index) * 5 = \(index * 5)")
}

for index in 1..<5 {
  print("\(index) * 5 = \(index * 5)")
}

let isOn = false
if !isOn {
  print("It is on.")
}

let isOpen = true
let isMorning = false
if isOpen && isMorning {
  print("Success !")
} else {
  print("Failure !")
}

let isSunday = true
let isWeekday = false
if isSunday || isWeekday {
  print("Success !")
} else {
  print("Failure !")
}



