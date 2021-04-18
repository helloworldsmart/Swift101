//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Michael on 2021/4/18.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
