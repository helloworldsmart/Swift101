//
//  MemoryGame.swift
//  Memorize
//
//  Created by Michael on 2021/3/29.
//

import Foundation

struct MemoryGame<CardContent> {
  var cards: Array<Card>
  
  func choose(card: Card)  {
    print("card chosen: \(card)")
  }
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = cardContentFactory(pairIndex)
      cards.append(Card(isFaceUp: false, isMatched: false, content: content))
      cards.append(Card(isFaceUp: false, isMatched: false, content: content))
    }
  }
  
  struct Card: Identifiable {
    var isFaceUp: Bool
    var isMatched: Bool
    var content: CardContent
    var id: Int
  }
}
