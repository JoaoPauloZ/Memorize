//
//  CardView.swift
//  Memorize
//
//  Created by João Paulo Serodio on 08/04/23.
//

import SwiftUI

struct CardView: View {

    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(style: .init(lineWidth: 4))
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }

}
