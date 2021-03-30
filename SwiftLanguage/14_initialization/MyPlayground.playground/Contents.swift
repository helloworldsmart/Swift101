import UIKit

struct Fahrenheit {
  var temperature: Double
  init() {
    temperature = 32.0
  }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

struct Celsius {
  var temperatureInCelsius: Double
                      
  init(fromFahrenheit fahrenheit: Double) {
    temperatureInCelsius = (fahrenheit - 32.0) / 1.8
  }
  init(fromKelvin kelvin: Double) {
    temperatureInCelsius = kelvin - 273.15
  }
  init(_ celsius: Double) {
    temperatureInCelsius = celsius
  }
}

let bodyTemperature = Celsius(37.0)

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print("boilingPointOfWater is \(boilingPointOfWater)")
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

struct Color {
  let red, green, blue: Double
  init(red: Double, green: Double, blue: Double) {
    self.red = red
    self.green = green
    self.blue = blue
  }
  init(white: Double) {
    red = white
    green = white
    blue = white
  }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

class SurveyQuesting {
  var text: String
  var response: String?
  init(text: String) {
    self.text = text
  }
  func ask() {
    print(text)
  }
}

let cheeseQuestion = SurveyQuesting(text: "Do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "Yes, I do like cheese."

let beetsQuestion = SurveyQuesting(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"

class ShoppingListItem {
  var name: String?
  var quantity = 1
  var purchased = false
}

var item = ShoppingListItem()

struct Size {
  var width = 0.0, height = 0.0
}

struct Point {
  var x = 0.0, y = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

// error: Couldn't lookup symbols:
//let zeroByTwo = Size(height: 2.0)
//print(zeroByTwo.width, zeroByTwo.height)
//
//let zeroByZero = Size()
//print(zeroByZero.width, zeroByZero.height)

struct Rect {
  var origin = Point()
  var size = Size()
  
  init() {
    
  }
  
  init(origin: Point, size: Size) {
    self.origin = origin
    self.size = size
  }
  
  init(center: Point, size: Size) {
    let originX = center.x - (size.width / 2)
    let originY = center.y - (size.height / 2)
    self.init(origin: Point(x: originX, y: originY), size: size)
  }
}

let basicRect = Rect()
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

/*
init(parameters) {
  statements
}
 */

/*
 convenience init(parameters) {
  statements
 }
 */

class Vehicle {
  var numberOfWheels = 0
  var description: String {
    return "\(numberOfWheels) wheel(s)"
  }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
  override init() {
    super.init()
    numberOfWheels = 2
  }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
  var color: String
  init(color: String) {
    self.color = color
    // super.init() 被隱藏調用
  }
  override var description: String {
    return "\(super.description) in a beautiful \(color)"
  }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")

class Food {
  var name: String
  init(name: String) {
    self.name = name
  }
  
  convenience init() {
    self.init(name: "[Unnamed]")
  }
}

let nameMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient: Food {
  var quantity: Int
  init(name: String, quantity: Int) {
    self.quantity = quantity
    super.init(name: name)
  }
  override convenience init(name: String) {
    self.init(name: name, quantity: 1)
  }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem2: RecipeIngredient {
  var purchased = false
  var description: String {
    var output = "\(quantity) x \(name)"
    output += purchased ? " ✔" : " ✘"
    return output
  }
}

var breakfastList = [
  ShoppingListItem2(),
  ShoppingListItem2(name: "Bacon"),
  ShoppingListItem2(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
  print(item.description)
}

let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
  print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)
  
if valueChanged == nil {
  print("\(pi) conversion to Int does not maintain values")
}

struct Animal {
  let species: String
  init?(species: String) {
    if species.isEmpty {
      return nil
    }
    self.species = species
  }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
  print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
  print("The anonymous creature could not be initialized")
}

enum TemperatureUnit {
  case Kelvin, Celsius, Fahrenheit
  init?(symbol: Character) {
    switch symbol {
    case "K":
      self = .Kelvin
    case "C":
      self = .Celsius
    case "F":
      self = .Fahrenheit
    default:
      return nil
    }
  }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
  print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
  print("This is a defined temperature unit, so initialization succeeded.")
}
