import UIKit
import Foundation

//class UserFetcher {
//    func fetchUsers(onComplete: @escaping ([User]) -> Void) {
//        let session = URLSession.shared
//        let url = URL(string: "")!
//        session.dataTask(with: url) { (data, _, error) in
//            guard let data = data else {
//                print(error!)
//                onComplete([])
//                return
//            }
//
//            let decoder = JSONDecoder()
//            let decoded = try? decoder.decode([User].self, from: data)
//            onComplete(decoded ?? [])
//
//        }
//    }
//}

// ----

//class Fetcher<T: Decodable> {
//    func fetch(onComplete: @escaping ([T]) -> Void) {
//        let session = URLSession.shared
//        let url = URL(string: "")!
//        session.dataTask(with: url) { (data, _, error) in
//            guard let data = data else {
//                print(error!)
//                onComplete([])
//                return
//            }
//
//            let decoder = JSONDecoder()
//            let decoded = try? decoder.decode([T].self, from: data)
//            onComplete(decoded ?? [])
//
//        }
//    }
//}
//
//typealias UserFetcher = Fetcher<User>
//typealias MartianFetcher = ListFetcher<Martian>

// ----

class ListFetcher<T: Decodable> {
    func fetch(onComplete: @escaping ([T]) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "")!
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error!)
                onComplete([])
                return
            }

            let decoder = JSONDecoder()
            let decoded = try? decoder.decode([T].self, from: data)
            onComplete(decoded ?? [])

        }
    }
}

class FileFetcher<T: Decodable>: ListFetcher<T> {
    override func fetch(onComplete: @escaping ([T]) -> Void) {
        let json = try? String(contentsOfFile: "martians.json")
        guard let data = json?.data(using: .utf8) else {
            return
        }
        
        let decoder = JSONDecoder()
        let decoded = try? decoder.decode([T].self, from: data)
        onComplete(decoded ?? [])
    }
}


//fetcher.fetch { martians in
//    self.martians = martians
//    self.tableView.reloadData()
//}
//
//if fetcher is FileFetcher {
//    tableView.reloadData()
//}

// ---- Old
//protocol MartianFetcher {
//    func getMartians(onComplete: ([Martian]) -> Void)
//    func getMartian(id: String, onComplete: ([Martian]) -> Void )
//}
//
//// ---- New
//protocol MartianFetcher {
//    func getMartians(onComplete: ([Martian]) -> Void)
//}
//
//protocol MartianFetcher {
//    func getMartian(id: String, onComplete: ([Martian]) -> Void )
//}
