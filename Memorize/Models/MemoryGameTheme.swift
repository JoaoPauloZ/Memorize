//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by João Paulo Serodio on 23/04/23.
//

import SwiftUI

struct MemoryGameTheme<CardContent> where CardContent: Hashable {

    let name: String
    let cards: Set<CardContent>
    let numberOfPairsOfCards: Int
    let color: String

}

// MARK: - Default Themes
extension MemoryGameTheme<String> {

    static var vehicles: MemoryGameTheme {

        let emojis = "🚎,🚀,✈️,🚂,🚜,🛸,🚁,🏍️,🛶,⛴️,⛵️,🛩️,🚃,🚲,🛴,🚠,🚌,🛻,🚚,🚗"
            .components(separatedBy: ",")

        let theme = MemoryGameTheme(name: "Vehicles",
                                    cards: Set(emojis),
                                    numberOfPairsOfCards: .max,
                                    color: "blue")
        return theme
    }

    static var objects: MemoryGameTheme {

        let emojis = "📺,🧭,📻,🎙️,🔋,🔦,🧲,⛓️,⚖️,🪜,💈,🔭,🔬,🪑,🛌,🚪,🗝️,🖼️,🪄,🩺"
            .components(separatedBy: ",")

        let theme = MemoryGameTheme<String>(name: "Objects",
                                            cards: Set(emojis),
                                            numberOfPairsOfCards: 10,
                                            color: "yellow")
        return theme
    }

    static var flags: MemoryGameTheme {

        let emojis: [String]   = ["🇧🇷", "🇦🇴", "🇰🇾", "🇨🇦", "🇧🇬", "🏳️‍🌈",
                                  "🇨🇱", "🇿🇦", "🇳🇴", "🇳🇱", "🇮🇹", "🇩🇪",
                                  "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇬🇷", "🇪🇸", "🇺🇸", "🇹🇷", "🇱🇹"]

        let theme = MemoryGameTheme<String>(name: "Flags",
                                            cards: Set(emojis),
                                            numberOfPairsOfCards: 8,
                                            color: "orange")
        return theme
    }

    static var sports: MemoryGameTheme {

        let emojis = "⚽️,🏀,⚾️,🎯,🎳,🎾,🏐,🎱,🏓,⛳️,🛹,🥊,🏂,🥋"
            .components(separatedBy: ",")

        let theme = MemoryGameTheme(name: "Sports",
                                    cards: Set(emojis),
                                    numberOfPairsOfCards: 6,
                                    color: "pink")
        return theme
    }

    static var fruits: MemoryGameTheme {

        let emojis = "🍎,🍐,🍊,🍋,🍌,🍉,🍇,🍓,🍒,🍑,🥭,🍍,🥥,🥝,🍅,🥑"
            .components(separatedBy: ",")

        let theme = MemoryGameTheme(name: "Fruits",
                                    cards: Set(emojis),
                                    numberOfPairsOfCards: 8,
                                    color: "green")
        return theme
    }

    static var foods: MemoryGameTheme {

        let emojis = "🥐,🥯,🍞,🧀,🥚,🥞,🥓,🧇,🌮,🥪,🍔,🌭,🍕,🍟,🥗,🥘,🍲,🍜,🍝"
            .components(separatedBy: ",")

        let theme = MemoryGameTheme(name: "Foods",
                                    cards: Set(emojis),
                                    numberOfPairsOfCards: 7,
                                    color: "cyan")
        return theme
    }

}
