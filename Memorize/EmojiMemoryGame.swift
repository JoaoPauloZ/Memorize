//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by João Paulo Serodio on 13/04/23.
//

import SwiftUI

class EmojiMemoryGame {

//    let emojisVehicles: [String] = ["🚎", "🚀", "✈️", "🚂", "🚜", "🛸",
//                                    "🚁", "🚤", "🏍️", "🛶","⛴️", "⛵️",
//                                    "🛩️", "🚃", "🚲", "🛴", "🚠", "🚌",
//                                    "🛻", "🚚","🛺", "🚗"]
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

    private var model: MemoryGame<String> = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

}
