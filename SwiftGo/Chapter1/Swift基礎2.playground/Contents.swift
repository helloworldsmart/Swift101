import UIKit

var emptyString = ""
var anotherEmptyString = String()

//for character in "Dog!".characters {
//  print(character)
//}

let str = "Hello"
let secondStr = ", world ."
var anotherStr = str + secondStr
print(anotherStr)

anotherStr += " Have a nice day ."
print(anotherStr)

print("I have \(1 + 2 * 6) cars .")

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"

let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"

//print(anotherStr.characters.count)
print(anotherStr.count)

let str3 = "It is Sunday ."
let str4 = "It is Sunday ."
let str5 = "It is Saturday ."

if str3 == str4 {
  print("Success")
}

if str4.hasPrefix("It is") {
  print("Success")
}

if str5.hasSuffix("Sunday .") {
  print("Success")
} else {
  print("Failure")
}
