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
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.bold)

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
            .foregroundColor(.red)
            Spacer()
            HStack {
//                buttonFactory("Vehicles", imageName: "car.circle", array: emojisVehicles)
//                Spacer()
//                buttonFactory("Flags", imageName: "flag.circle", array: emojisFlags)
//                Spacer()
//                buttonFactory("Objects", imageName: "lightbulb.circle", array: emojisObjects)
            }
            .font(.largeTitle)
            .padding(.horizontal)
            .foregroundColor(Color(hue: 0.40, saturation: 0.90, brightness: 0.60))

        }
        .padding(.horizontal)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .previewDevice("iPhone 14 Pro")
    }
}
