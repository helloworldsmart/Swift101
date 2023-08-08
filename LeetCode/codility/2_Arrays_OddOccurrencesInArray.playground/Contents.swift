import UIKit


public func solution(_ A : inout [Int]) -> Int {
    // Implement your solution here
    // 1.dictionary 語法錯誤
    var dictionary: [Int: Int]() = {
        1: 0, 2: 0, 3: 0,
        4: 0, 5: 0, 6: 0,
        7: 0, 8: 0, 9: 0,
        10: 0
    }

    for flag in A {
        // ㄋswift dictionary 因 optional ，要加 default: 0
        dictionary[flag, default: 0] += 1
    }

    for (key, value) in dictionary {
        if value == 1 {
            return key
        }
    }

    // error: missing return in global function expected to return 'Int'
    // 沒考慮到都沒有時
    // return -1
}

// -----
//
// -----

public func solution(_ A : inout [Int]) -> Int {
    // Implement your solution here
    var dictionary: [Int: Int] = [
        1: 0, 2: 0, 3: 0,
        4: 0, 5: 0, 6: 0,
        7: 0, 8: 0, 9: 0,
        10: 0
    ]

    for flag in A {
        dictionary[flag, default: 0] += 1
    }

    for (key, value) in dictionary {
        if value == 1 {
            return key
        }
    }

    return -1
}

// -----
// Task Score : 66%
// Correctness: 80%
// Performance: 50%
// -----
