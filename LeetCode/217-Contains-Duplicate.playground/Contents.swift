import UIKit
import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var newNums: [Int] = []
        for value in nums {
           if (newNums.contains(value) != true) {
               newNums.append(value)
           } else {
               return true
           }
        }
        return false
    }
}

func getSolution() -> Void {
        print(Solution().containsDuplicate([1,2,3,4,1]))
    }
