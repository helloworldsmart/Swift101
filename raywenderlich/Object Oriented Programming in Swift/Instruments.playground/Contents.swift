import UIKit

// MARK: Properties
class Music {
  let notes: [String]
  
  init(notes: [String]) {
    self.notes = notes
  }
  
  func prepared() -> String {
    return notes.joined(separator: " ")
  }
}

class Instrument {
  let brand: String
  
  init(brand: String) {
    self.brand = brand
  }
  
  // MARK: Methods
  func tune() -> String {
    fatalError("Implement the method for \(brand)")
  }
  
  func play(_ music: Music) -> String {
    return music.prepared()
  }
  
  func perform(_ music: Music) {
    print(tune())
    print(play(music))
  }
}

// MARK: Inheritance
class Piano: Instrument {
  let hasPedals: Bool
  
  static let whiteKeys = 52
  static let blackKeys = 36
  
  init(brand: String, hasPedals: Bool = false) {
    self.hasPedals = hasPedals
    super.init(brand: brand)
  }
  
  override func tune() -> String {
    return "Piano standard tuning for \(brand)"
  }
  
  // MARK: Method Overloading
  func play(_ music: Music, usingPedals: Bool) -> String {
    let preparedNotes = super.play(music)
    if hasPedals && usingPedals {
      return "Play piano notes \(preparedNotes) with pedals."
    } else {
      return "Piano piano notes \(preparedNotes) without pedals."
    }
  }
  
  override func play(_ music: Music) -> String {
    return play(music, usingPedals: hasPedals)
  }
  
}

// MARK: Instances
let piano = Piano(brand: "Yamaha", hasPedals: true)
piano.tune()

let music = Music(notes: ["C", "G", "F"])
piano.play(music, usingPedals: false)

piano.play(music)
Piano.whiteKeys
Piano.blackKeys

// MARK: Intermediate Abstract Base Class
class Guitar: Instrument {
  let stringGauge: String
  
  init(brand: String, stringGauge: String = "medium") {
    self.stringGauge = stringGauge
    super.init(brand: brand)
  }
}

// MARK: Concrete Guitars
class AcousticGuitar: Guitar {
  static let numberOfStrings = 6
  static let fretCount = 20
  
  override func tune() -> String {
    return "Tune \(brand) acoustic with E A D G B E"
  }
  
  override func play(_ music: Music) -> String {
    let preparedNotes = super.play(music)
    return "Play folk tune on frets \(preparedNotes)."
  }
}

// MARK: Challenge
let acousticGuitar = AcousticGuitar(brand: "Roland", stringGauge: "light")
acousticGuitar.tune()
acousticGuitar.play(music)
