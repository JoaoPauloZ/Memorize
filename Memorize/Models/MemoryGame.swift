//
//  MemoryGame.swift
//  Memorize
//
//  Created by João Paulo Serodio on 13/04/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {

    private(set) var cards: Array<Card>

    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue } }
    }

    private(set) var score: Int = 0

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.cards = []
        // add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(.init(content: content, id: pairIndex*2))
            cards.append(.init(content: content, id: pairIndex*2+1))
        }
        self.cards.shuffle()
    }

    mutating func choose(_ card: Card) {

//        var didMatchCards: Bool = false

        let chosenIndex = cards.firstIndex { $0.id == card.id }

        if let chosenIndex = chosenIndex,
              !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {

            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
//                    didMatchCards = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }

//        cards[chosenIndex].numberOfFlippedOver += 1
//
//        if didMatchCards {
//            score += 2
//            print("score +2")
//        }
//        if indexOfTheOneAndOnlyFaceUpCard == nil &&
//                    cards[chosenIndex].numberOfFlippedOver > 1 {
//            score -= 1
//            print("score -1")
//        }
//
//        print("card: \(card.content) numberOfFlippedOver: \(cards[chosenIndex].numberOfFlippedOver) score: \(score)")
    }

}

// MARK: - Card
extension MemoryGame {

    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var numberOfFlippedOver: Int = 0
        let content: CardContent
        let id: Int
    }

}

extension Array {
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}
