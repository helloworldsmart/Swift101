//
//  Pools.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/1.
//

import Foundation

struct PoolsSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [PoolItem]
}

struct PoolItem: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var photoCredit: String
    var description: String
}

