//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Michael on 2021/3/29.
//

import SwiftUI

class EmojiMemoryGame {
  private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory:{(pairIndex: Int) -> String in
    return "😀"
  })
  
  // MARK: Access to the Model
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  // MARK: - Intent(s)
  
  func choose(card: MemoryGame<String>.Card) {
    model.choose(card: card)
  }
}
