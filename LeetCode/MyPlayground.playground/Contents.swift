import UIKit

var greeting = "Hello, playground"


class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroArr: [Int] = []
        var tempArr: [Int] = []

        for item in nums {
            if item == 0 {
                zeroArr.append(item)
            } else {
                tempArr.append(item)
            }
        }

        tempArr.sort()
        tempArr += zeroArr
        nums = tempArr
    }
}

class Solution2 {
    func moveZeroes(_ nums: inout [Int]) {
        var totalNum = nums.count
        
        for item in nums {
            if item == 0 {
                nums.swapAt(<#T##i: Int##Int#>, <#T##j: Int##Int#>)
            }
        }
        
        for (index, num) in nums.enumerated() {
            if num == 0 {
                nums.swapAt(<#T##i: Int##Int#>, <#T##j: Int##Int#>)
            }
        }
    }
}
