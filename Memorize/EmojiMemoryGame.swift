//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by João Paulo Serodio on 13/04/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    static let emojisVehicles: [String] = ["🚎", "🚀", "✈️", "🚂", "🚜", "🛸",
                                           "🚁", "🚤", "🏍️", "🛶","⛴️", "⛵️",
                                           "🛩️", "🚃", "🚲", "🛴", "🚠", "🚌",
                                           "🛻", "🚚","🛺", "🚗"]
//
//    let emojisObjects: [String] = ["📺", "🧭", "📻", "🎙️", "🔋", "🔦",
//                                   "⚒️", "🧲", "⛓️", "⚖️", "🪜", "💈",
//                                   "🔭", "🔬", "🪑", "🛌", "🚪", "🗝️",
//                                   "🖼️", "🪄", "🩺", "⚙️", "🔩", "🪚"]
//
//    let emojisFlags: [String]   = ["🇧🇷", "🇦🇴", "🇰🇾", "🇨🇦", "🇧🇬", "🏳️‍🌈",
//                                   "🇨🇱", "🇿🇦", "🇳🇴", "🇳🇱", "🇮🇹", "🇩🇪",
//                                   "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇬🇷", "🇪🇸", "🇺🇸", "🇹🇷", "🇱🇹"]

    static var emojis: [String] = []

    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: [MemoryGame<String>.Card] { model.cards }

    static func createMemoryGame() -> MemoryGame<String> {
        emojis = emojisVehicles
        return MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

}
