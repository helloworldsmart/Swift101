import UIKit

// MARK: Properties
//class Music {
//  let notes: [String]
//  
//  init(notes: [String]) {
//    self.notes = notes
//  }
//  
//  func prepared() -> String {
//    return notes.joined(separator: " ")
//  }
//}
//
//class Instrument {
//  let brand: String
//  
//  init(brand: String) {
//    self.brand = brand
//  }
//  
//  // MARK: Methods
//  func tune() -> String {
//    fatalError("Implement the method for \(brand)")
//  }
//  
//  func play(_ music: Music) -> String {
//    return music.prepared()
//  }
//  
//  func perform(_ music: Music) {
//    print(tune())
//    print(play(music))
//  }
//}

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

// MARK: Private

class Amplifier {
  private var _volume: Int
  
  private(set) var isOn: Bool
  
  init() {
    isOn = false
    _volume = 0
  }
  
  func plugIn() {
    isOn = true
  }
  
  func unplug() {
    isOn = false
  }
  
  var volume: Int {
    get {
      return isOn ? _volume : 0
    }
    set {
      _volume = min(max(newValue, 0), 10)
    }
  }
}

// MARK: Composition

class ElectricGuitar: Guitar {
  let amplifier: Amplifier
  
  init(brand: String, stringGauge: String = "light", amplifier: Amplifier) {
    self.amplifier = amplifier
    super.init(brand: brand, stringGauge: stringGauge)
  }
  
  override func tune() -> String {
    amplifier.plugIn()
    amplifier.volume = 5
    return "Tune \(brand) electric with E A D G B E"
  }
  
  override func play(_ music: Music) -> String {
    let preparedNotes = super.play(music)
    return "Play solo \(preparedNotes) at volume \(amplifier.volume)"
  }
}

class BassGuitar: Guitar {
  let amplifier: Amplifier
  
  init(brand: String, stringGauge: String = "heavy", amplifier: Amplifier) {
    self.amplifier = amplifier
    super.init(brand: brand, stringGauge: stringGauge)
  }
  
  override func tune() -> String {
    amplifier.plugIn()
    return "Tune \(brand) bass with E A D G"
  }
  
  override func play(_ music: Music) -> String {
    let preparedNotes = super.play(music)
    return "Play bass line \(preparedNotes) at volume \(amplifier.volume)."
  }
}

let amplifier = Amplifier()
let electricGuitar = ElectricGuitar(brand: "Gibson", stringGauge: "medium", amplifier: amplifier)
electricGuitar.tune()

let bassGuitar = BassGuitar(brand: "Fender", stringGauge: "heavy", amplifier: amplifier)
bassGuitar.tune()

bassGuitar.amplifier.volume
electricGuitar.amplifier.volume

bassGuitar.amplifier.unplug()
bassGuitar.amplifier.volume
electricGuitar.amplifier.volume

bassGuitar.amplifier.plugIn()
bassGuitar.amplifier.volume
electricGuitar.amplifier.volume

// MARK: Polymorphism

class Band {
  let instruments: [Instrument]
  
  init(instruments: [Instrument]) {
    self.instruments = instruments
  }
  
  func perform(_ music: Music) {
    for instrument in instruments {
      instrument.perform(music)
    }
  }
}

let instruments = [piano, acousticGuitar, electricGuitar, bassGuitar]
let band = Band(instruments: instruments)
band.perform(music)

// MARK: Access Control
