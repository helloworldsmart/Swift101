import UIKit

var str = "Hello, playground"
//https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E5%95%8F%E9%A1%8C%E8%A7%A3%E7%AD%94%E9%9B%86/%E4%BD%BF%E7%94%A8-baseurl-urlcomponents-urlqueryitem-%E7%94%A2%E7%94%9F-url-1e4539a33a89

let url = URL(string: "https://itunes.apple.com/search?media=music&country=tw&term=告五人")

if let urlString = "https://itunes.apple.com/search?media=music&country=tw&term=告五人".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) {
  print(url)
}

var urlComponents = URLComponents()
urlComponents.host = "itunes.apple.com"
urlComponents.scheme = "https"
urlComponents.path = "/search"
urlComponents.query = "media=music&country=tw&term=告五人"
let url2 = urlComponents.url
print(url2!)

extension URL {
  func withQueries(_ queries: [String: String]) -> URL? {
    var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
    components?.queryItems = queries.map {
      URLQueryItem(name: $0.0, value: $0.1)
    }
    return components?.url
  }
}

let queries = [
  "term": "告五人",
  "media": "music",
  "country": "tw"
]
let url3 = URL(string: "https://itunes.apple.com/search")?.withQueries(queries)
print(url3!)

class ITunesService {
  static let shared = ITunesService()
  var baseURL = URL(string: "https://itunes.apple.com")
  
  func search(term: String, media: String, country: String) {
    let queries = [
      "term": term,
      "media": media,
      "country": country
    ]
    
    
    if let url = baseURL?.appendingPathComponent("search").withQueries(queries) {
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data,
           let content = String(data: data, encoding: .utf8) {
          print(content)
        }
      }.resume()
    }
  }
  
  
  
}



// https://qiita.com/vc7/items/56975d0d90871a494d34
//-


var componentAgain = URLComponents(string: "https://example.com")
componentAgain?.queryItems = [
  URLQueryItem(name: "item key", value: "產品"),
  URLQueryItem(name: "size", value: "small"),
  URLQueryItem(name: "current", value: nil)
]

print((componentAgain?.url)!)
