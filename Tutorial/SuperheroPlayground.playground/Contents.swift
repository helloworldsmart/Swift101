import UIKit

var greeting = "Hello, playground"

// Q: 想問各位前輩，問一個非常初階但一直沒有很理解的問題，為什麼在init的時候，要做self那個部分，我知道self是指當前的class
// Q: self.name = name 的用意是什麼
class Superhero {
    var name: String
    var universe: String
    
    init(name: String, universe: String) {
        self.name = name
        self.universe = universe
    }
}

// MARK: 定義問題
// 你的疑問是：
// init(name: String, universe: String)
// 這邊都有帶 name 了，為什麼還要把 name 存進 self.name
// 對嗎？

// A: 寫成這樣你會比較好理解嗎？
// init 帶入的數值命名為 name
// 並不代表這個 name 存在在 Superhero 內

class NewSuperhero {
    var name: String
    var universe: String
    
    init(nameInput: String, universeInput: String) {
        self.name = nameInput
        self.universe = universeInput
    }
}


// 你可以把它理解為下面這個 function
func initSuperhero(name: String, universe: String) -> NewSuperhero {
    let superhero = NewSuperhero(nameInput: "", universeInput: "")
    
    superhero.name = name
    superhero.universe = universe
    
    return superhero
}


initSuperhero(name: "Spider man Michael ", universe: "999")
