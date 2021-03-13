import UIKit

for index in 1...3 {
  print(index)
}

let base = 2
var total = 1
for _ in 1...3 {
  total *= base
}

print(total)

let array = ["Apple", "Book", "Cat"]

for index in array {
  print(index)
}

let dict = ["Apple": 12, "Book": 3, "Cat": 5]
for (key, values) in dict {
  print("\(key) : \(values)")
}

var n = 2
while n < 20 {
  n = n * 2
}

print(n)

var m = 512
repeat {
  m = m * 2
} while m < 100
print(m)

let number = 10
if number > 20 {
  print("Number is larger than 20")
} else {
  print("Number is smaller than 20 or equal to 20.")
}

let number2 = 100
if number2 < 20 {
  print("數字小於 20")
} else if number2 < 200 {
  print("數字不小於 20, 但小於 200")
} else if number2 < 1000 {
  print("數字不小於 200, 但小於 1000")
}  else {
  print("數字不小於 1000")
}

let number3 = 10
if number3 > 50 {
  print("number3 > 50")
} else if number3 > 200 {
  print("number3 > 200")
}

let str = "123"

if let number = Int(str) {
  print("字串 \"\(str)\" 轉換成一個整數 \(number)")
} else {
  print("字串 \"\(str)\" 不是一個整數")
}

let str2 = "It is a string ."
if let number = Int(str2) {
  print("字串 \"\(str)\" 轉換成一個整數 \(number)")
} else {
  print("字串 \"\(str)\" 不是一個整數")
}

let number4 = 2
switch number4 {
case 1: break
case 2:
  print("It is 2.")
case 3: break
default:
  print("沒有比對到")
}

let number5 = 120
var str3: String
switch number5 {
case 0...10:
  str3 = "幾"
case 11...100:
  str3 = "很多"
case 101...1000:
  str3 = "非常多"
default:
  str3 = "超級多"
}

print("我有\(str3)顆蘋果")

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
  print("(0, 0) 在原點")
case (_, 0):
  print("(\(somePoint.0), 0) 在 X 軸上")
case (0, _):
  print("(0, \(somePoint.1)) 在 Y 軸上")
case (-2...2, -2...2):
  print("\(somePoint.0), \(somePoint.1) 在方形內")
default:
  print("\(somePoint.0), \(somePoint.1) 在方形外")
}

let number6 = 20
switch number6 {
case 1...100 where number6 == 50:
  print("在 1...100 區間內 且值為 50")
case 1...100 where number6 == 20:
  print("在 1...100 區間內 且值為 20")
default:
  print("沒有比對到")
}

for n in 1...10 {
  if n % 2 == 0 {
    continue
  }
  print(n)
}

for n in 1...10 {
  if n > 2 {
    break
  }
  print(n)
}

let number7 = 5
var str4 = ""
switch number7 {
case 2,3,5,7,11,13,17,19:
  str4 += "It is a prime number."
  fallthrough
case 100, 200:
  str4 += "Fallthrough one."
  fallthrough
default:
  str4 += "Fallthrough twice"
}

print(str4)


var number8 = 1
gameLoop: while number8 < 10 {
  switch number8 {
  case 1...4:
    number8 += 1
  case 5:
    number8 *= 10
    break gameLoop
  default:
    number8 += 1
  }
}

print(number8)

func post(article: [String: String]) {
  guard let insideTitle = article["title"] else {
    return
  }
  
  print("標題是 \(insideTitle) ，")
  
  guard let insideContent = article["content"] else {
    print("但是沒有內容。")
    return
  }
  print("內容為 \(insideContent)。")
}

post(article: ["title": "Article_1"])
post(article: ["title":"Article_2","content":"Article_2_full_content"])

//var age1 = -25
//assert(age1 > 0, "年齡必須大於零")

if #available(iOS 9, *) {
  print("")
} else {
  print("")
}
