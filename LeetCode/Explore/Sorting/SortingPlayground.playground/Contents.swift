import UIKit

class Solution {
    func sortByLength(_ list: inout [String]) {
        list.sort { $0.count < $1.count }
    }
}

