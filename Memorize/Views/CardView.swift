//
//  CardView.swift
//  Memorize
//
//  Created by João Paulo Serodio on 08/04/23.
//

import SwiftUI

struct CardView: View {

    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(style: .init(lineWidth: 4))
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
        
    }

}
