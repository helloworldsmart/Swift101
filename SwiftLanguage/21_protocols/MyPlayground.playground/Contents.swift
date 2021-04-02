import UIKit

// Set 可寫
// Get 可讀
protocol SomeProtocol {
  var mustBeSettable: Int { get set }
  var doesNotNeedToBeSettable: Int { get }
}

// static ???
protocol AnotherProtocol {
  static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
  var fullName: String { get }
}


struct Person: FullyNamed {
  var fullName: String
}

let join = Person(fullName: "John Appleseed")

class Starship: FullyNamed {
  var prefix: String?
  var name: String
  init(name: String, prefix: String? = nil) {
    self.name = name
    self.prefix = prefix
  }
  var fullName: String {
    return (prefix != nil ? prefix! + " " : "") + name
  }
}
// 星艦迷航記 - 聯邦星艦企業號 NCC-1701
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

protocol SomeProtocol1 {
  static func someTypeMethod()
}

protocol RandomNumberGenerator {
  func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
  var lastRandom = 42.0
  let m = 139969.0
  let a = 3877.0
  let c = 29573.0
  func random() -> Double {
    lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
    return lastRandom / m
  }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")

print("And another one: \(generator.random())")

protocol Togglable {
  mutating func toggle()
}
enum OnOffSwitch: Togglable {
  case off, on
  mutating func toggle() {
    switch self {
    case .off:
      self = .on
    case .on:
      self = .off
    }
  }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
