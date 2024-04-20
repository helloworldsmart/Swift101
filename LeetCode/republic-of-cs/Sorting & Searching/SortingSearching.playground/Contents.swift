import UIKit

func sortColors(_ nums: inout [Int]) {
    var low = 0
    var mid = 0
    var high = nums.count - 1
    
    while mid <= high {
        switch nums[mid] {
        case 0:
            nums.swapAt(mid, low)
            low += 1
            mid += 1
        case 1:
            mid += 1
        case 2:
            nums.swapAt(mid, high)
            high -= 1
        default:
            break
        }
    }
}

var colors = [2, 0, 2, 1, 1, 0]
sortColors(&colors)
print(colors)
