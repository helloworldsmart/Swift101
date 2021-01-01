import UIKit

// O(1): Stack pushing and popping
let array = [1, 2, 3, 4, 5, 6]
let value = array[5]

// O(log n): Binary Search Algorithm is an example of O(log n) complexity.
var n = 100
var j = 1
while j < n {
  j *= 2
}

// O(n): Array Traversal amd Linear Search are examples of O(n) complexity.
for i in stride(from: 0, to: n, by: 1) {
  print(array[i])
}

// O(n log n): Merge Sort and Heap Sort are examples of O(n log n) complexity.
for i in stride(from: 0, to: n, by: 1) {
  while j < n {
    j *= 2
    // do constant times stuff
  }
}

for i in stride(from: 0, to: n, by: 1) {
  func index(after i: Int) -> Int? {
    return i < n ? i * 2 : nil
  }
  for j in sequence(first: 1, next: index(after:)) {
    // do constent time stuff
  }
}

// O(n^2): Traversing a simple 2-D array and Bubble Sort are examples of O(n^2) complexity.
for i in stride(from: 0, to: n, by: 1) {
  for j in stride(from: 1, to: n, by: 1) {
    // do constant time stuff
  }
}

// 0(n^3)
for i in stride(from: 0, to: n, by: 1) {
  for j in stride(from: 1, to: n, by: 1) {
    for k in stride(from: 1, to: n, by: 1) {
      // do constant time stuff
    }
  }
}

// O(2^n)
func solveHanoi(n: Int, from: String, to: String, spare: String) {
  guard n >= 1 else { return }
  if n > 1 {
    solveHanoi(n: n - 1, from: from, to: spare, spare: to)
    solveHanoi(n: n - 1, from: spare, to: to, spare: from)
  }
}

// O(n!)
func nFactFunc(n: Int) {
  for i in stride(from: 0, to: n, by: 1) {
    nFactFunc(n: n - 1)
  }
}
