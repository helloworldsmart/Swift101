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

// Design HashMap

class MyHashMap {
    
    private var buckets: [[(Int, Int)]]
    private let bucketSize = 1000
    
    init() {
        buckets = Array(repeating: [], count: bucketSize)
    }
    
    func put(_ key: Int, _ value: Int) {
        let hashValue = key % bucketSize
        for (index, kv) in buckets[hashValue].enumerated() {
            if kv.0 == key {
                buckets[hashValue][index] = (key, value)
                return
            }
        }
        buckets[hashValue].append((key, value))
    }
    
    func get(_ key: Int) -> Int {
        let hashValue = key % bucketSize
        for kv in buckets[hashValue] {
            if kv.0 == key {
                return kv.1
            }
        }
        return -1
    }
    
    func remove(_ key:  Int) {
        let hashValue = key % bucketSize
        buckets[hashValue].removeAll(where: {$0.0 == key})
    }
}
