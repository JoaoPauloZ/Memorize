//
//  ContentView.swift
//  Memorize
//
//  Created by João Paulo Serodio on 01/04/23.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            HStack {
                Text("\(viewModel.titleName)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button("New Game") {
                    viewModel.createNewRandomMemoryGame()
                }
                .font(.title3)
                .foregroundColor(viewModel.accentColor)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.accentColor)
            HStack {
                Text("Score: \(viewModel.score)")
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
        ContentView(viewModel: game)
            .previewDevice("iPhone 14 Pro")
    }
}
