//
//  MemoryGame.swift
//  Memorize
//
//  Created by João Paulo Serodio on 13/04/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {

    private(set) var cards: Array<Card>

    private var indexOfTheOneAndOnlyFaceUpCard: Int?

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.cards = Array<Card>()
        // add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(.init(content: content, id: pairIndex*2))
            cards.append(.init(content: content, id: pairIndex*2+1))
        }
    }

    mutating func choose(_ card: Card) {

        let chosenIndex = cards.firstIndex { $0.id == card.id }

        guard let chosenIndex = chosenIndex,
              !cards[chosenIndex].isFaceUp,
              !cards[chosenIndex].isMatched else {
            return
        }

        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            indexOfTheOneAndOnlyFaceUpCard = nil
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
        cards[chosenIndex].isFaceUp.toggle()
    }


}

// MARK: - Card
extension MemoryGame {

    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }

}

