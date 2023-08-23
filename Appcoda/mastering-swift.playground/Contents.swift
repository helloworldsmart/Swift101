import UIKit

// Enumerations
enum DownloadStatus {
    case downloading
    case finished
    case failed
    case cancelled
}

var currentStatus = DownloadStatus.downloading

switch currentStatus {
case .downloading:
    print("Downloading...")
case .finished:
    print("Just finished the download...")
case .failed:
    print("Failed to download the file...")
case .cancelled:
    print("The download is cancelled...")
}

enum Cloud {
    case cirrus
    case cumulus
    case altocumulus
    case stratus
    case cumulonimbus
}

enum WeatherCondition {
    case sunny(temperature: Float)
    case rainy(inchesPerHour: Float)
    case cloudy(cloudType: Cloud, windSpeed: Float)
}

let currentWeather = WeatherCondition.cloudy(cloudType: .cirrus, windSpeed: 4.2)

switch currentWeather {
case .sunny(let temperature):
    print("It is sunny and the temperature is \(temperature).")
case .rainy(let inchesPerHour):
    print("It is raining at a rate of \(inchesPerHour) inches per hour.")
case .cloudy(let cloudType, let windSpeed):
    print("It is cloudy; there are \(cloudType) clouds in the sky, and the wind speed is \(windSpeed).")
}

// Closures
//myFunction("Hello, World!", closureParameter: {(string) in
//    print(string)
//})
//myFunction("Hello, world!") {(string) in
//    print(string)s
//}

// Map
let mapNumbers = [1, 2, 3, 4, 5]
let doubledMapNumbers = mapNumbers.map { $0 * 2 }
print(doubledMapNumbers)

let doubledMapNumbers1 = mapNumbers.map( {(number) in
    return number * 2
})

// Filter
let filterNumbers = [1, 2, 3, 4, 5]
let filteredNumbers = filterNumbers.filter { $0 > 3 }
print(filterNumbers)

// ForEach
let forEachNumbers = [1, 2, 3, 4, 5]
forEachNumbers.forEach { print($0) }

// Reduce
let reduceNumbers = [1, 2, 3, 4, 5]
let reduceNumber = reduceNumbers.reduce(0) { $0 + $1 }
print(reduceNumber)

// flatMap
let flatMapNumbers = [1, nil, 2, nil, 3, nil, 4, nil, 5]
let flatMappedNumbers = flatMapNumbers.compactMap { $0 }
print(flatMappedNumbers)

let chainNumbers = [1, nil, 2, nil, 3, nil, 4, nil, 5]
let doubledNumbersOver8 = chainNumbers.compactMap { $0 }.filter { $0 > 3 }.map { $0 * 2 }
print(doubledNumbersOver8)

// Generics

