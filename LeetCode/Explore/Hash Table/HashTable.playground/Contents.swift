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

// Hash Set - Usage

class Main {
    static func main() {
        // 1. initialize the set
        var hashSet = Set<Int>()
        // 2. add a new key
        hashSet.insert(3)
        hashSet.insert(2)
        hashSet.insert(1)
        // 3. remove the key
        hashSet.remove(2)
        // 4. check if the key is in the set
        if !hashSet.contains(2) {
            print("Key 2 is not in the set.")
        }
        // 5. get the size of the set
        print("The size of the set is: \(hashSet.count)")
        // 6. iterate the set
        for i in hashSet {
            print(i, terminator: " ")
        }
        print("are in the set")
        // 7. clear the set
        hashSet.removeAll()
        if hashSet.isEmpty {
            print("Set is empty now!")
        }
    }
}

// Call the main function
Main.main()

// Find Duplicates By Hash Set

func findDuplicates<T: Hashable>(keys: [T]) -> Bool {
    var hashSet = Set<T>()
    for key in keys {
        if hashSet.contains(key) {
            return true
        }
        hashSet.insert(key)
    }
    return false
}

//
let keys: [Int] = [1, 2, 3, 4, 5, 2]
if findDuplicates(keys: keys) {
    print("Duplicates found.")
} else {
    print("No duplicates")
}

// Contins Duplicate
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var distinctSet = Set<Int>()
        for num in nums {
            if distinctSet.contains(num) {
                return true
            } else {
                distinctSet.insert(num)
            }
        }
        return false
    }
}

// Single Number
class SingleNumberSolution {
    func singleNumber(_ nums: [Int]) -> Int {
        
    }
}
