//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by João Paulo Serodio on 01/04/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {

    @ObservedObject var game: EmojiMemoryGame

    var body: some View {
        VStack {
            HStack {
                Text("\(game.titleName)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button("New Game") {
                    game.createNewRandomMemoryGame()
                }
                .font(.title3)
                .foregroundColor(game.accentColor)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(game.accentColor)
            HStack {
                Text("Score: \(game.score)")
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
        }
        .padding(.horizontal)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(theme: .fruits)
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 14 Pro")
    }
}
