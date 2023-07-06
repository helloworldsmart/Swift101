import UIKit

var greeting = "Hello, playground"
var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne"
//character = "Eloise"
//character = "Francesca"

var playerName = "Roy"
print(playerName)
playerName = "Dani"
print(playerName)
playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBread = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

let actor = "Denzel Washington"

let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life of an
Apple engineer
"""

let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(movie.hasPrefix("a day"))
print(filename.hasSuffix(".jpg"))

var favoriteShow = "Orange is the New Black"
favoriteShow = "The Good Place"
favoriteShow = "Doctor Who"

var quote1 = "Change the world by being yourself"
var burns = """
The best laid schemes
O' mice and men
Gang aft agley
"""

// Multi-line string literal closing delimiter must begin on a new line

//var coleridge = """
//Water, water, everywhere
//and not a drop to drink"""

let score = 10
let reallyBig = 100_000_000
let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 10
//counter = counter + 5
counter += 5
print(counter)
counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

//let number1 = Float(0.1) + Float(0.2)
let number1 = 0.1 + 0.2
print(number1)
