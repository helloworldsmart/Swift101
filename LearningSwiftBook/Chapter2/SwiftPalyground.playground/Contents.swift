import UIKit

var str = "Hello, playground"

func sumNumbers(numbers: Int...) -> Int {
  var total = 0;
  for number in numbers {
    total += number
  }
  return total;
}

let sum = sumNumbers(numbers: 2, 3, 4, 5);
print(sum);

//-

var myVariable = 123;
let myConstantVariable = 123;

myVariable += 5;
str = "Hello there"

let explicitInt: Int = 5;

var explicitDouble: Double = 5;
explicitDouble + 0.3;

var someVariable: Int;
someVariable = 0;
someVariable += 2;

true.description;
4.advanced(by: 3);

//-Array

let intArray = [1, 2, 3, 4, 5];
let explicitIntArray: [Int] = [1, 2, 3, 4, 5];

Array(arrayLiteral: 42, 24);

intArray[2];
// Error: intArray[-1];

var mutableArray = [1, 2, 3, 4, 5];

mutableArray.append(6);
mutableArray.remove(at: 2);
mutableArray[0] = 3;
mutableArray.insert(3, at: 2);

var emptyArray = [Int]();
emptyArray.append(0);

intArray.count;

let fileNotFound = (404, "File Not Found");
fileNotFound.0;

let serverError = (code: 500, message: "Internal Server Error");
serverError.message;

//-Dictionary
var crew = [
  "Captain": "Benjamin Sisko",
  "First Officer": "Kira Nerys",
  "Constable": "Odo",
];

crew["Captain"];

crew["Doctor"] = "Julian Bashir";
crew["Security Officer"] = "Michael Eddington";

crew.removeValue(forKey: "Security Officer");

crew["Security Officer"] = "Jadzia Dax";
crew["Security Officer"] = nil;

let arrayDictionary = [
  0: 1,
  1: 2,
  2: 3,
  3: 4,
  4: 5,
]

arrayDictionary[0];
if ( 1 + 2 == 3 ) {
  print("The math checks out");
}

//- Control flow

let ifVariable = 5;
if ( ifVariable == 1 ) {
  print("It is one");
} else if ( ifVariable <= 3 ) {
  print("It is less than or equal to three");
} else if ( ifVariable == 4 ) {
  print("It is four");
} else {
  print(" It is something else");
}

//- Loop

let loopArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
var loopSum = 0;
for number in loopArray {
  loopSum += number;
}
print(loopSum);

var sum2 = 0;
for number in 1 ..< 10 {
  sum2 = number;
}
print(sum2);

var sum3 = 0;
for number in 1 ... 10 {
  sum3 += number;
}
print(sum3);

var strideSum: Double = 0;
for number in stride(from: 0, to: 1, by: 0.1) {
  strideSum += number;
}
print(strideSum);

var strideSum2: Double = 0;
for number in stride(from: 0, through: 1, by: 0.1) {
  strideSum2 += number;
}
print(strideSum2)

var countDown = 5;
while countDown > 0 {
  countDown -= 1
}

//- Switch

let integerSwitch = 3;
switch integerSwitch {
case 0:
  print("It's 0");
case 1:
  print("It's 1");
case 2:
  print("It's 2");
default:
  print("It's something else");
}

var someNumber = 15;
switch someNumber {
case 0...10:
  print("Number is between 0 and 10");
  break;
case 11...20:
  print("Number is between 11 and 20");
  break;
case 21:
  print("Number is 21!");
  break;
default:
  print("Number is something else");
  break;
}

let fallthroughSwitch = 10;
switch fallthroughSwitch {
case 0..<20:
  print("Number is between 0 and 20");
case 0..<30:
  print("Number is between 0 and 30");
  break;
default:
  print("Number is something else");
}

let greeting = "Hello";
switch greeting {
case "Hello":
  print("Oh hello there");
  break;
case "Goodbye":
  print("Sorry to see you leave.");
  break;
default:
  print("Huh?");
  break;
}

let switchingTuple = ("Yes", 123);
switch switchingTuple {
case ("Yes", 123):
  print("Tuple contains 'Yes' and '123'");
  break;
case ("Yes", _):
  print("Tuple contains 'Yes' and something else");
  break;
case (let string, _):
  print("Tuple contains '\(string)' and something else");
  break;
}

//-Types
// -Int
// -Double
// -String
// -Bool
// set emumeration

//-Usage String
let emptyStrin = "";

let anotherEmptyString = String();

var composingString = "Hello";
composingString += " world";

for character in "hello" {
  print(character);
}

print(composingString.count);

"Cafe".uppercased();
"Cafe".lowercased();

let string1: String = "Hello";
let string2: String = "Hel" + "lo";
if string1 == string2 {
  print("The string are equal.");
}

let café = "Café";
let cafe = "Cafe\u{301}";

if café == cafe {
  print("The string are equal.");
}

if "Hello".hasPrefix("H") {
  print("String begins with an H");
}

if "Hello".hasSuffix("llo") {
  print("String ends in llo");
}

// - string interpolation
let name = "Fred";
let age = 21;
let line = "My name is \(name). I am \(age) years old."

//-Set
var setOfStrings = Set<String>();

var fruitSet: Set = ["apple", "orange", "orange", "banana"];
fruitSet.count;

if fruitSet.isEmpty {
  print("My set is empty!");
}
fruitSet.insert("pear");
fruitSet.remove("apple");

// let index = fruitSet.index(of: "pear");
let index = fruitSet.firstIndex(of: "pear");
fruitSet[index!];

for fruit in fruitSet {
  let fruitPlural = fruit + "s";
  print("You know what's testy? \(fruitPlural.uppercased())")
}

//-Enumeration
enum FutureiPad {
  case iPadSuperPro
  case iPadTotallyPro
  case iPadLudicrous
}

var nextiPad = FutureiPad.iPadSuperPro;
nextiPad = .iPadTotallyPro;

switch nextiPad {
case .iPadSuperPro:
  print("Too big!");
  break;
case .iPadTotallyPro:
  print("Too small!");
  break;
case .iPadLudicrous:
  print("Just right!");
  break;
}
// -associated value
enum BasicWeapon {
  case laser
  case missiles
}

enum AdvancedWeapon {
  case laser(powerLevel: Int);
  case missles(range: Int);
}

let spaceLaser = AdvancedWeapon.laser(powerLevel: 5);

switch spaceLaser {
case .laser(powerLevel: 0...10):
  print("It's a laser with power from 0 to 10!");
case .laser:
  print("It's a laser!");
case .missles(let range):
  print("It's a missles with range \(range)");
}

enum Response: String {
  case hello = "Hi";
  case goodbye = "See you next time";
  case thankYou = "No worries";
}

let hello = Response.hello;
hello.rawValue

enum Nucleobase: String {
  case cytosine, guanine, adenine, thymine
}
Nucleobase.adenine.rawValue;

enum Element: Int {
  case hydrogen = 1, helium, lithium, beryllium, boron, carbon, nitrogen
}

Element.lithium.rawValue;

//-Type Safe

let almostMeanOfLife = String(Int(41.787878)); // "41"

//-Optional
var anOptionalInteger: Int? = nil;
anOptionalInteger = 42

var aNonOptionalInteger = 42;
//aNonOptionalInteger = nil; // 'nil' cannot be assigned to type 'Int'

if anOptionalInteger != nil {
  print("It has a value!")
} else {
  print("It has no value!")
}

var implicitlyUnwrappedOptionInteger: Int!
implicitlyUnwrappedOptionInteger = 1;
1 + implicitlyUnwrappedOptionInteger;

var conditionalString: String? = "a string"
if let theString = conditionalString {
  print("The string is '\(theString)'");
} else {
  print("The string is nil");
}

// optional chaining
var optionalArray: [Int]? = [1, 2, 3, 4];
var count = optionalArray?.count;

optionalArray = nil;
count = optionalArray?.count;

let optionalDict: [String: [Int]]? = ["array":[1, 2, 3, 4]];
count = optionalDict?["array"]?.count;

// nil-coalescing
var values = ["name": "fred"];
var personsAge = "unspecified";

if let unwrappedValue = values["age"] {
  personsAge = unwrappedValue;
}

print("They are \(personsAge) years old");

personsAge = values["age"] ?? "unspecified"
print("The are \(personsAge) years old");

personsAge = values["age", default: "unspecified"];
print("They are \(personsAge) years old");

// Type Casting

let person: [String: Any] = ["name": "Jane", "Age": 26, "Wears glasset": true]

var anything: Any = "hello";
anything = 3;
anything = false;
anything = [1, 2, 3, 4];

let possibleString = person["name"];
if possibleString is String {
  print("\(possibleString!) is a string!");
}

if let name = person["name"] {
  var maybeString = name as? String;
  
  var maybeInt = name as? Int;
}

if let name = person["name"] {
  var maybeString = name as! String;
}

// -function closure
