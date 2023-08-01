import UIKit

var greeting = "Hello, playground"

// 1. Main Queue:

DispatchQueue.main.async {
    // Do Any UI updates here
}

// 2. The Global Queue:
DispatchQueue.global(qos: .background).async {
    // Do any heavy operation here
}

// 3. Custom Queues:
let concurrentQueue = DispatchQueue(label: "concurrentQueue", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serialQueue", qos: .background)

//DispatchQueue.global(qos: .background).async {
//    let image = downloadImageFromServer()
//    DispatchQueue.main.async {
//        self.imageView.image = image
//    }
//}

DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("😈 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("🥳 \(i)")
    }
}

DispatchQueue.global(qos: .background).sync {
    for i in 0...10 {
        print("😈 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...10 {
        print("🥳 \(i)")
    }
}

