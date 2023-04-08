//
//  ContentView.swift
//  Memorize
//
//  Created by João Paulo Serodio on 01/04/23.
//

import SwiftUI

struct ContentView: View {

    var emojis: [String] = ["🚎", "🚀", "✈️", "🚂", "🚜", "🛸", "🚁", "🚤", "🏍️", "🛶", "⛴️",
                            "⛵️", "🛩️", "🚃", "🚲", "🛴", "🚠", "🚌", "🛻", "🚚", "🛺", "🚗"]
    @State var emojiCount = 4

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                removeButton
                Spacer()
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }

    var removeButton: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }

    var addButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro")
    }
}
