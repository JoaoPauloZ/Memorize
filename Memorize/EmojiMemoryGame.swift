//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by João Paulo Serodio on 13/04/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    @Published private var model: MemoryGame<String>

    @Published private var theme: MemoryGameTheme<String>

    var titleName: String { theme.name }

    var accentColor: Color {
        switch theme.color {
        case "red": return .red
        case "pink": return .pink
        case "blue": return .blue
        case "cyan": return .cyan
        case "green": return .green
        case "yellow": return .yellow
        default: return .orange
        }
    }

    var cards: [MemoryGame<String>.Card] { model.cards }

    var score: String { String(model.score) }

    init(theme: MemoryGameTheme<String>) {
        self.model = EmojiMemoryGame.createMemoryGame(with: theme)
        self.theme = theme
    }

    static func createMemoryGame(with theme: MemoryGameTheme<String>) -> MemoryGame<String> {

        let emojis = Array(theme.cards).shuffled()
        let numberOfPairs: Int = min(emojis.count, theme.numberOfPairsOfCards)

        let game = MemoryGame<String>(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }

        return game
    }

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

    func createNewRandomMemoryGame() {
        let availablesThemes: [MemoryGameTheme] = [.flags, .foods, .fruits, .objects, .sports, .vehicles]
        let otherThemes = availablesThemes.filter { $0.name != self.theme.name }
        if let theme = otherThemes.randomElement() {
            self.model = EmojiMemoryGame.createMemoryGame(with: theme)
            self.theme = theme
        }
    }

}
