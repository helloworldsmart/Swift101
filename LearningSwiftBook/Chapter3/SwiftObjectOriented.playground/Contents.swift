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
