//
//  MemoryGame.swift
//  Memorize
//
//  Created by João Paulo Serodio on 13/04/23.
//

import Foundation

struct MemoryGame<CardContent> {

    private(set) var cards: Array<Card>

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.cards = Array<Card>()
        // add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(.init(content: content))
            cards.append(.init(content: content))
        }
    }

    func choose(_ card: Card) {

    }

    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }

}
