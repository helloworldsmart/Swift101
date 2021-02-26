import UIKit

var str = "Hello, playground"
struct IntStack {
  var items = [Int]()
  mutating func push(_ item: Int) {
    items.append(item)
  }
  mutating func pop() -> Int {
    return items.removeLast()
  }
}

struct Stack<Element> {
  var items = [Element]()
  mutating func push(_ item: Element) {
    items.append(item)
  }
  mutating func pop() -> Element {
    return items.removeLast()
  }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()

extension Stack {
  var topItem: Element? {
    return items.isEmpty ? nil : items[items.count - 1]
  }
}

if let topItem = stackOfStrings.topItem {
  print("The top item on the stack is \(topItem).")
}

/*
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {

}
*/

/*
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
  for (index, value) in array.enumerated() {
    if value == valueToFind {
      return index
    }
  }
  return nil
}
 */

func findIndex<T: Equatable>(ofString valueToFind: T, in array: [T]) -> Int? {
  for (index, value) in array.enumerated() {
    if value == valueToFind {
      return index
    }
  }
  return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
  print("The index of llama is \(foundIndex)")
}

let doubleIndex = findIndex(ofString: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(ofString: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

protocol Container {
  associatedtype Item
  mutating func append(_ item: Item)
  var count: Int { get }
  subscript(i: Int) -> Item { get }
}

struct IntStack2: Container {
  var items = [Int]()
  mutating func push(_ item: Int) {
    items.append(item)
  }
  mutating func pop() -> Int {
    return items.removeLast()
  }
  //
  typealias Item = Int
  mutating func append(_ item: Int) {
    self.push(item)
  }
  var count: Int {
    return items.count
  }
  subscript(i: Int) -> Int {
    return items[i]
  }
}


struct Stack2<Element>: Container {
  var items = [Element]()
  mutating func push(_ item: Element) {
    items.append(item)
  }
  mutating func pop() -> Element {
    return items.removeLast()
  }
  //
  mutating func append(_ item: Element) {
    self.push(item)
  }
  var count: Int {
    return items.count
  }
  subscript(i: Int) -> Element {
    return items[i]
  }
}

extension Array: Container {}

protocol SuffixableContainer: Container {
  associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
  func suffix(_ size: Int) -> Suffix
}

extension Stack2: SuffixableContainer {
  func suffix(_ size: Int) -> Stack2 {
    var result = Stack2()
    for index in (count - size)..<count {
      result.append(self[index])
    }
    return result
  }
}

var stackOfInts = Stack2<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)


//....
