import UIKit

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution1(_ A : inout [Int], _ K : Int) -> [Int] {
    // Implement your solution here
    var tempArray = A
    for _ in K {
        let removedElement = tempArray.removeLast()
        tempArray.insert(removedElement, at: 0)
    }
    return tempArray
}

// -----
// 上面程式語法錯誤
// solution.swift:10:14: error: for-in loop requires 'Int' to conform to 'Sequence'
//for _ in K {
//         ^
//solution.swift:11:40: error: value of type '[Int]' has no member 'removedElement'
//    let removedElement = tempArray.removedElement()
// -----

public func solution2(_ A : inout [Int], _ K : Int) -> [Int] {
    // Implement your solution here
    var tempArray = A
    for _ in 0...K {
        let removedElement = tempArray.removeLast()
        tempArray.insert(removedElement, at: 0)
    }
    return tempArray
}

// -----
// 上面程式因從0開始跑，會多跑一圈的 Error
// -----

public func solution3(_ A : inout [Int], _ K : Int) -> [Int] {
    // Implement your solution here
    var tempArray = A
    for _ in 0..<K {
        let removedElement = tempArray.removeLast()
        tempArray.insert(removedElement, at: 0)
    }
    return tempArray
}

// -----
// Task Score : 87%
// Correctness: 87%
// Performance: Not assessed
// -----
