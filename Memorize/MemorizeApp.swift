//
//  MemorizeApp.swift
//  Memorize
//
//  Created by João Paulo Serodio on 01/04/23.
//

import SwiftUI

@main
struct MemorizeApp: App {

    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }

}
