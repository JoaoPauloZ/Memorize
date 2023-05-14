//
//  CardView.swift
//  Memorize
//
//  Created by João Paulo Serodio on 08/04/23.
//

import SwiftUI

struct CardView: View {

    let card: EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(style: .init(lineWidth: DrawingConstants.lineWidth))
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }

    private func font(in size: CGSize) -> Font {
        .system(size: min(size.width, size.height)*DrawingConstants.fontScale)
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20.0
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8

    }

}
