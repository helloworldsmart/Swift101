import UIKit
import Foundation

public class Node<Value> {
    public var value: Value
    public var next: Node?

    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

// creating and linking nodes
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3
print(node1)

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        // 1
        var currentNode = head
        var currentIndex = 0
        
        // 2
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() ->  Value? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}


// push
var pushList = LinkedList<Int>()
pushList.push(3)
pushList.push(2)
pushList.push(1)

print(pushList)

// append

var appendList = LinkedList<Int>()
appendList.append(1)
appendList.append(2)
appendList.append(3)

print(appendList)

// inserting at a particular index
var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print("Before inserting: \(list)")
var middleNode = list.node(at: 1)
for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode!)
}
print("After inserting: \(list)")

// pop
var popList = LinkedList<Int>()
popList.push(3)
popList.push(2)
popList.push(1)

print("Before popping list: \(popList)")
let poppedValue = popList.pop()
print("After popping list: \(popList)")
print("Popped value: " + String(describing: poppedValue))

// removing the last node
var removingTheLastList = LinkedList<Int>()
removingTheLastList.push(3)
removingTheLastList.push(2)
removingTheLastList.push(1)

print("Before removing last node: \(removingTheLastList)")
let removedValue = removingTheLastList.removeLast()

print("After removing last node: \(list)")
print("Removed value: " + String(describing: removedValue))

// removing a node after a particular node
var removeList = LinkedList<Int>()
removeList.push(3)
removeList.push(2)
removeList.push(1)

print("Before removing at particular index: \(list)")
let index = 1
let node = removeList.node(at: index - 1)!
let removedValue2 = removeList.remove(after: node)

print("After removing at index \(index): \(list)")
print("Removed value: " + String(describing: removedValue2))
