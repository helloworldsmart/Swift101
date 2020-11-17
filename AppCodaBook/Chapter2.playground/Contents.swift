import UIKit

//- 2.6
var timeYouWakeUp = 6;

if timeYouWakeUp == 6 {
  print("Cook yourself a big break!")
} else {
  print("Go out for breakfast")
}

switch timeYouWakeUp {
case 6:
  print("Cook yourself a big breakfast!")
default:
  print("Go out for breakfast")
}

var bonus = 5000

if bonus >= 10000 {
  print("I will travel to Paris and London!")
} else if bonus >= 5000 && bonus < 10000 {
  print("I will travel to Tokyo")
} else if bonus >= 1000 && bonus < 5000 {
  print("I will travel to Bangkok")
} else {
  print("Just stay home")
}

switch bonus {
case 10000...:
  print("I will travel to Paris and London!")
case 5000...9999:
  print("I will travel to Bangkok")
default:
  print("Just stay home")
}

// 2.7
var bookCollection = ["Tool of Titans", "Rework", "Your Move"]
bookCollection[0]
bookCollection.append("Authority")
bookCollection.count

for index in 0...3 {
  print(bookCollection[index])
}

for index in 0...bookCollection.count - 1 {
  print(bookCollection[index])
}

for book in bookCollection {
  print(book)
}

var bookCollectionDict = ["1328683788": "Tool of Titans", "0307463745": "Rework", "1612060919": "Authority"]
bookCollectionDict["0307463745"]

for (key, value) in bookCollectionDict{
  print("ISBN: \(key)")
  print("Title: \(value)")
}

//- homework

var emojiDict: [String: String] = ["👻": "Ghost",
                                   "💩": "Poop",
                                   "😤": "Angry",
                                   "😱": "Scream",
                                   "👾": "Alien monster"]
var wordToLookup = "👻"
var meaning = emojiDict[wordToLookup]

wordToLookup = "😤"
meaning = emojiDict[wordToLookup]

//-2.8
var jobTitle: String?

jobTitle = "iOS Developer"

if jobTitle != nil {
  let message = "Your job title is " + jobTitle!
  print(message)
}

if let jobTitleWithValue = jobTitle {
  let message = "Your job title is " + jobTitleWithValue;
  print(message)
}
