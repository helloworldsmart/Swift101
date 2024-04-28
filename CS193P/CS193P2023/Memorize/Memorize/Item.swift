//
//  Item.swift
//  Memorize
//
//  Created by Michael on 2024/4/28.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
