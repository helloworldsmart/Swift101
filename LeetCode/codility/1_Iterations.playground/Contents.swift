import UIKit

import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ N : Int) -> Int {
    // Implement your solution here
    var max = 0
    var count = 0
    let binaryString = String(N, radix: 2)
    var flag = 0
    for char in binaryString {
        if char == "1" {
            flag += 1
        }
        if char == "0" && flag == 1 {
            count += 1
        }
        if flag == 2 {
            if max < count {
                max = count
            }
            flag = 1
        }
    }
    return max
}

// -----
// 上面程式在找尋二進制表示中的最大二進位間隙（binary gap），但在計算時可能遇到一些問題。程式在碰到每個 "1" 時增加 flag 變數，用來標記是否進入二進位間隙（當 flag 為 1 時），或是已經超過間隙（當 flag 為 2 時）。然而，這個計算方式可能有問題，尤其是在評估連續多個 "1" 的情況下。
// -----

public func solution2(_ N : Int) -> Int {
    // Implement your solution here
    var max = 0
    var count = 0
    let binaryString = String(N, radix: 2)
    var flag = 0
    var isClose = false
    for char in binaryString {
        if char == "1" {
            flag += 1
        }
        if char == "0" && flag == 1 {
            count += 1
        }
        if flag == 2 && count >= 1 && isClose == false {
            if max < count {
                max = count
                isClose = true
            }
        }
        if flag == 3 {
            flag = 1
            count = 0
            isClose = false
        }
    }
    return max
}

// -----
// Task Score : 53%
// Correctness: 53%
// Performance: Not assessed
// -----
