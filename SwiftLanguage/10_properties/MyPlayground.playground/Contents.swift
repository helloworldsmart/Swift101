import UIKit

struct FixedLengthRange {
  var firstValue: Int
  let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

class DataImporter {
  var fileName = "data.txt"
}

class DataManager {
  lazy var importer = DataImporter()
  var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importer.fileName)

struct Point {
  var x = 0.0
  var y = 0.0
}

struct Size {
  var width = 0.0
  var height = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set(newCenter) {
      origin.x = newCenter.x - (size.width / 2)
      origin.y = newCenter.y - (size.height / 2)
    }
  }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
print("\(initialSquareCenter)")
square.center = Point(x: 15.0, y: 15.0)
print("Square.origin is now at (\(square.origin.x), \(square.origin.y))")

struct AlternativeRect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set {
      origin.x = newValue.x - (size.width / 2)
      origin.y = newValue.y - (size.height / 2)
    }
  }
}

struct CompactRect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
    }
    set {
      origin.x = newValue.x - (size.width / 2)
      origin.y = newValue.y - (size.height / 2)
    }
  }
}

struct Cuboid {
  var width = 0.0, height = 0.0, depth = 0.0
  var volume: Double {
    return width * height * depth
  }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is\(fourByFiveByTwo.volume)")

class StepCounter {
  var totalSteps: Int = 0 {
    willSet(newTotalSteps) {
      print("将 totalSteps 的值设置为 \(newTotalSteps)")
    }
    didSet {
      if totalSteps > oldValue {
        print("增加了 \(totalSteps - oldValue) 步")
      }
    }
  }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896

// propertyWrapper
@propertyWrapper
struct TwelveOrLess {
  private var number: Int
  init() {
    self.number = 0
  }
  var wrappedValue: Int {
    get { return number }
    set { number = min(newValue, 12) }
  }
}

struct SmallRectangle {
  @TwelveOrLess var height: Int
  @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

struct SmallRectangle1 {
  private var _height = TwelveOrLess()
  private var _width = TwelveOrLess()
  var height: Int {
    get { return _height.wrappedValue }
    set { _height.wrappedValue = newValue }
  }
  var width: Int {
    get { return _width.wrappedValue }
    set { _width.wrappedValue = newValue }
  }
}

@propertyWrapper
struct SmallNumber {
  private var maximum: Int
  private var number: Int
  
  var wrappedValue: Int {
    get { return number }
    set { number = min(newValue, maximum) }
  }
  
  init() {
    maximum = 12
    number = 0
  }
  init(wrappedValue: Int) {
    maximum = 12
    number = min(wrappedValue, maximum)
  }
  init(wrappedValue: Int, maximum: Int) {
    self.maximum = maximum
    number = min(wrappedValue, maximum)
  }
}

struct ZeroRectangle {
  @SmallNumber var height: Int
  @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

struct UnitRectangle {
  @SmallNumber var height: Int = 1
  @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)
