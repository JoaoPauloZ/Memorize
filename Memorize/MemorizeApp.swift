//
//  MemorizeApp.swift
//  Memorize
//
//  Created by João Paulo Serodio on 01/04/23.
//

import SwiftUI

@main
struct MemorizeApp: App {

    private let game = EmojiMemoryGame(theme: .fruits)

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }

}
