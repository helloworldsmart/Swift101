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
