import UIKit

// Design HashSet

class MyHashSet {
    private var set = [[Int]](repeating: [], count: 10000)
    
    private func hash(_ key: Int) -> Int {
        return key % set.count
    }
    
    func add(_ key: Int) {
        if !contains(key) {
            set[hash(key)].append(key)
        }
    }
    
    func remove(_ key: Int) {
        if let index = set[hash(key)].firstIndex(of: key) {
            set[hash(key)].remove(at: index)
        }
    }
    
    func contains(_ key: Int) -> Bool {
        return set[hash(key)].contains(key)
    }
}
