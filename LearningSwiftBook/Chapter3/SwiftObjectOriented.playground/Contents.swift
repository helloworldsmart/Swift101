import UIKit

// MARK: Object Oriented: property and method

class Vehicle {
  var color: String?;
  var maxSpeed: Double = 80;
  
  func description() -> String {
    return "A \(self.color ?? "uncolored") vehicle";
  }
  
  func travel() {
    print("Traveling at \(self.maxSpeed) kph");
  }
}

let redVehicle = Vehicle()
redVehicle.color = "Red";
redVehicle.maxSpeed = 90;
redVehicle.travel()
redVehicle.description();

class InitAndDeinitExample {
  init() {
    print("I've been created!");
  }
  convenience init (text: String) {
    self.init();
    print("I was called with the convenience initializer");
  }
  // MARK: Failable initilizer
  convenience init? (value: Int) {
    self.init();
    
    if value > 5 {
      return nil
    }
  }
  deinit {
    print("I'm going away!");
  }
}

var example: InitAndDeinitExample?

example = InitAndDeinitExample();
example = nil;

example = InitAndDeinitExample(text: "Hello");

let three = Int("3");
var failableExample = InitAndDeinitExample(value: 6);

// MARK: Property

class Counter {
  var number: Int = 0;
}

let MyCounter = Counter();
MyCounter.number = 2;

// MARK: Stored property
class BiggerCounter {
  var number: Int;
  var optionalNumber: Int?;
  
  init (value: Int) {
    self.number = value;
  }
}

var anotherCounter = BiggerCounter(value: 3);
anotherCounter.number

// MARK: Computed property
class Rectangle {
  var width: Double = 0.0;
  var height: Double = 0.0;
  
  var area: Double {
    get {
      return width * height;
    }
    set {
      width = sqrt(newValue);
      height = sqrt(newValue);
    }
  }
  
  var center: (x: Double, y: Double) {
    return (width / 2, height / 2);
  }
}

let rect = Rectangle();
rect.width = 3.0;
rect.height = 4.5;
rect.area
rect.area = 9;

rect.center

// MARK: Property observer
class PropertyObserverExample {
  var number: Int = 0 {
    willSet(newValue) {
      print("About to change to \(newValue)");
    }
    didSet(oldValue) {
      print("Just changed from \(oldValue) to \(self.number)!");
    }
  }
}

var observer = PropertyObserverExample();
observer.number = 4;

// MARK: Lazy property
class SomeExpensiveClass {
  init(id: Int) {
    print("Expensive class \(id) created!");
  }
}

class LazyPropertyExample {
  var expensiveClass1 = SomeExpensiveClass(id: 1);
  
  lazy var expensiveClass2 = SomeExpensiveClass(id: 2);
  
  init() {
    print("Example class created!")
  }
}

var lzayExample = LazyPropertyExample();
lzayExample.expensiveClass1;
lzayExample.expensiveClass2;

// MARK: Inherit

class Car: Vehicle {
  var engineType = "V8";
  
  override func description() -> String {
    let description = super.description();
    return description + ", which is a car"
  }
}

// MARK: Protocal
protocol Blinkable {
  var isBlinking: Bool { get }
  
  var blinkSpeed: Double { get set }
  
  func startBlinking(blinkSpeed: Double) -> Void
}

class TrafficLight: Blinkable {
  var isBlinking: Bool = false
  
  var blinkSpeed: Double = 0
  
  func startBlinking(blinkSpeed: Double) {
    print("I am a light and I am now blinking")
    
    isBlinking = true
    
    self.blinkSpeed = blinkSpeed
  }
}

class Lighthouse: Blinkable {
  var isBlinking: Bool = false
  
  var blinkSpeed: Double = 0.0
  
  func startBlinking(blinkSpeed: Double) {
    print("I am a lighthouse, and I am now blinking")
    isBlinking = true
    
    self.blinkSpeed = blinkSpeed
  }
}

var aBlinkingThing: Blinkable

aBlinkingThing = TrafficLight()

aBlinkingThing.startBlinking(blinkSpeed: 4.0)

aBlinkingThing.blinkSpeed

aBlinkingThing = Lighthouse()

protocol ControllableBlink: Blinkable {
  func stopBlinking()
}

// MARK: Extension

extension Int {
  var double: Int {
    return self * 2
  }
  func multiplyWith(anotherNumber: Int) -> Int {
    return self * anotherNumber
  }
}

2.double
2.multiplyWith(anotherNumber: 5)

extension Int: Blinkable {
  public var isBlinking: Bool {
    return false
  }
  
  public var blinkSpeed: Double {
    get {
      return 0.0;
    }
    set {
      //
    }
  }
  public func startBlinking(blinkSpeed: Double) {
    print("I am the integer \(self) .  I do not blink")
  }
}

2.isBlinking
2.startBlinking(blinkSpeed: 2.0)

extension Blinkable {
  func startBlinking(blinkSpeed: Double) {
    print("I am blinking")
  }
}

class AnotherBlinker: Blinkable {
  var isBlinking: Bool = true
  
  var blinkSpeed: Double = 0.0
}

let anotherBlinker = AnotherBlinker()
anotherBlinker.startBlinking(blinkSpeed: 3)

// - open and public -
// internal - moudle內存取; Example: UIKit framework
// fileprivate - 只能在同一個 spurce 檔案存取
// private - 只能在同一個 scope 存取
public class AccessControl {
  internal var internalProperty = 123
  private(set) var privateSetProperty = 234
  
  private class PrivateAccess {
    func doStuff() -> String {
      return "Private Access is doing stuff"
    }
  }

  private let privateClass = PrivateAccess()

  func doAThing() {
    print(privateClass.doStuff())
  }
  
  fileprivate class FileAccess {
    func doStuff() -> String {
      return "File private access is doing stuff"
    }
  }

  fileprivate let fileClass = FileAccess()
  func doAFilePrivateThing() {
    print(fileClass.doStuff())
  }
  
}

let accessControl = AccessControl()
accessControl.doAThing()
//accessControl.privateClass

accessControl.doAFilePrivateThing()
accessControl.fileClass.doStuff()
accessControl.privateSetProperty
//accessControl.privateSetProperty = 4


//- Final

final class FinalClass {}
// class FinalSubClass: FinalClass {}

class PartiallyFinalClass {
  final func doStuff() {
    print("doing stuff")
  }
}

class PartiallyFinalSubClass: PartiallyFinalClass {
//  override func doStuff() {
//    print("Doing different stuff")
//  }
}

// -

// Bad
//extension Int {
//  static func + (left: Int, right: Int) -> Int {
//    return left * right
//  }
//}

class Vector2D {
  var x : Float = 0.0
  var y : Float = 0.0
  
  init (x: Float, y: Float) {
    self.x = x
    self.y = y
  }
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
  let result = Vector2D(x: left.x + right.x, y: left.y + right.y)
  
  return result
}

let first = Vector2D(x: 2, y: 2)
let second = Vector2D(x: 4, y: 1)

let result = first + second

// - subscript
extension UInt8 {
  subscript(bit: UInt8) -> UInt8 {
    get {
      return (self >> bit & 0x07) & UInt8(1)
    }
    
    set {
      let cleanBit = bit & 0x07
      let mask: UInt8 = 0xFF ^ (1 << cleanBit)
      let shiftedBit = (newValue & 1) << cleanBit
      self = self & mask | shiftedBit
    }
  }
}

var byte: UInt8 = 212
byte[0]
byte[2]
byte[5]
byte[6]
byte[7] = 0

byte

// - Generic
class Tree<T> {
  var value: T
  
  private (set) var children: [Tree <T>] = []
  
  init(value: T) {
    self.value = value
  }
  
  func addChild(value: T) -> Tree<T> {
    let newChild = Tree<T>(value: value)
    children.append(newChild)
    return newChild
  }
}

let integerTree = Tree<Int>(value: 5)

integerTree.addChild(value: 10)
integerTree.addChild(value: 5)

let stringTree = Tree<String>(value: "Hello")

stringTree.addChild(value: "Yes")
stringTree.addChild(value: "Internets")

// -Struct
struct Point {
  var x: Int
  var y: Int
}

let p = Point(x: 2, y: 3)

struct NumberStruct {
  var number: Int
}

class NumberClass {
  var number: Int
  
  init(_ number: Int) {
    self.number = number
  }
}

var numberClass1 = NumberClass(3)
var numberClass2 = numberClass1
numberClass1.number
numberClass2.number

var numberStruct1 = NumberStruct(number: 3)
var numberStruct2 = numberStruct1
numberStruct1.number
numberStruct2.number

numberStruct2.number = 4
numberStruct1.number

numberClass2.number = 4
numberClass1.number

// Error
enum BankError: Error {
  case notEnoughFunds
  
  case cannotBeginWithNegativeFounds
  
  case cannotMakeNegativeTransaction(amount: Float)
}

class BankAccount {
  private (set) var balance: Float = 0.0
  
  init(amount: Float) throws {
    guard amount > 0 else {
      throw BankError.cannotBeginWithNegativeFounds
    }
    balance = amount
  }
  
  func deposit(amount: Float) throws {
    guard amount > 0 else {
      throw BankError.cannotMakeNegativeTransaction(amount: amount)
    }
    balance += amount
  }
  
  func withdraw(amount: Float) throws {
    guard amount > 0 else {
      throw BankError.cannotMakeNegativeTransaction(amount: amount)
    }
    
    guard balance >= amount else {
      throw BankError.notEnoughFunds
    }
    balance -= amount
    
  }
}

do {
  let vacationFund = try BankAccount(amount: 5)
  
  try vacationFund.deposit(amount: 5)
  
  try vacationFund.withdraw(amount: 11)
} catch let error as BankError {
  switch (error) {
  case .notEnoughFunds:
    print("Not enough funds in account!")
  case .cannotBeginWithNegativeFounds:
    print("Tried to start an account with negative money!")
  case .cannotMakeNegativeTransaction(let amount):
    print("Tried to do a transaction with a negative amount \(amount) !")
  }
} catch let error {
  print("Ooops \(error)")
}

// Good
let secretBankAccountOrNot = try? BankAccount(amount: -50)

// -Memory Management
// reference counting
// retain count
// retain cycles
// weak reference
// unowned reference
class Human {
  weak var bestFriend: Dog?
  
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  deinit {
    print("\(name) is being removed")
  }
}

class Dog {
  weak var friendBeast: Human?
  
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  deinit {
    print("\(name) is being removed")
  }
}

var turner: Human? = Human(name: "Turner")
var hooch: Dog? = Dog(name: "Hooch")
turner = nil
hooch = nil

turner?.bestFriend = hooch
hooch?.friendBeast = turner

turner = nil
hooch = nil

class Person {
  var name: String
  var passport: Passport?
  
  init(name: String) {
    self.name = name
  }
  
  deinit {
    print("\(name) is being removed")
  }
}

class Passport {
  var number: Int
  unowned let person: Person
  
  init(number: Int, person: Person) {
    self.number = number
    self.person = person
  }
  deinit {
    print("Passport \(number) is being removed")
  }
}

var viktor: Person? = Person(name: "Viktor Navorski")
viktor!.passport = Passport(number: 1234567890, person: viktor!)

viktor?.passport?.number

viktor = nil

// -Design pattern
// model-view-controller(MVC)
// delegation pattern
// notification pattern

// - Model-View-Controller
// - Model - Data Storage - Data, Array, Dictionary
// - View - UI - NSButton and UITextField
// - Controller - business logic - NSKeyedArchiver

// - Delegation
protocol HouseSecurityDelegate {
  func handleIntruder()
}

class House {
  var delegate: HouseSecurityDelegate?
  
  func burglarDetected() {
    delegate?.handleIntruder()
  }
}

class GuardDog: HouseSecurityDelegate {
  func handleIntruder() {
    print("Releasing the hounds")
  }
}

let myHouse = House()
myHouse.burglarDetected()

let theHounds = GuardDog()
myHouse.delegate = theHounds
myHouse.burglarDetected()

// Library
// - Foundation / NSNotificationCenter, JSONSerialization
// - Cocoa
// - Cocoa Touch / UIKit

// - event-driven-programming
// - Application and delegate
// - View
// - UIViewController
// - Storyboard and nib / segues , scene

// Swift Package
// TODO:
