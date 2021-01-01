import UIKit
import Foundation

/*
Stack: last-in first-out LIFO
 - push
 - pop
 - peek
*/

struct Stack<Element> {
  fileprivate var array: [Element] = []
  
  mutating func push(_ element: Element) {
    array.append(element)
  }
  
  mutating func pop() -> Element? {
    return array.popLast()
  }
  
  func peek() -> Element? {
    return array.last
  }
  
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  var count: Int {
    return array.count
  }
}

var rwBookStack = Stack<String>()

rwBookStack.push("3D Games by Tutorials")
rwBookStack.peek()
rwBookStack.pop()
rwBookStack.pop()

extension Stack: CustomStringConvertible {
  var description: String {
    let topDivider = "---Stack---\n"
    let bottomDivider = "\n-----------\n"
    
    // previous
    // let stackElements = array.reversed().joined(separator: "\n")
    // now
    let stackElements = array.map { "\($0)" }.reversed().joined(separator: "\n")
    return topDivider + stackElements + bottomDivider
  }
}

rwBookStack.push("3D Games by Tutorials")
rwBookStack.push("tvOS Apprentice")
rwBookStack.push("iOS Apprentice")
rwBookStack.push("Swift Apprentice")
print(rwBookStack)
