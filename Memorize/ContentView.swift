//
//  ContentView.swift
//  Memorize
//
//  Created by João Paulo Serodio on 01/04/23.
//

import SwiftUI

struct ContentView: View {

    let emojisVehicles: [String] = ["🚎", "🚀", "✈️", "🚂", "🚜", "🛸",
                                    "🚁", "🚤", "🏍️", "🛶","⛴️", "⛵️",
                                    "🛩️", "🚃", "🚲", "🛴", "🚠", "🚌",
                                    "🛻", "🚚","🛺", "🚗"]

    let emojisObjects: [String] = ["📺", "🧭", "📻", "🎙️", "🔋", "🔦",
                                   "⚒️", "🧲", "⛓️", "⚖️", "🪜", "💈",
                                   "🔭", "🔬", "🪑", "🛌", "🚪", "🗝️",
                                   "🖼️", "🪄", "🩺", "⚙️", "🔩", "🪚"]

    let emojisFlags: [String]   = ["🇧🇷", "🇦🇴", "🇰🇾", "🇨🇦", "🇧🇬", "🏳️‍🌈",
                                   "🇨🇱", "🇿🇦", "🇳🇴", "🇳🇱", "🇮🇹", "🇩🇪",
                                   "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇬🇷", "🇪🇸", "🇺🇸", "🇹🇷", "🇱🇹"]


    @State var emojis: [String]

    @State var emojiCount = 15

    init() {
        self.emojis = self.emojisFlags
    }

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.bold)

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
                buttonFactory("Vehicles", imageName: "car.circle", array: emojisVehicles)
                Spacer()
                buttonFactory("Flags", imageName: "flag.circle", array: emojisFlags)
                Spacer()
                buttonFactory("Objects", imageName: "lightbulb.circle", array: emojisObjects)
            }
            .font(.largeTitle)
            .padding(.horizontal)
            .foregroundColor(Color(hue: 0.40, saturation: 0.90, brightness: 0.60))

        }
        .padding(.horizontal)
    }

    func buttonFactory(_ text: String, imageName: String, array: [String]) -> some View {
        let button = Button {
            emojis = array.shuffled()
            emojiCount = Int.random(in: 8..<emojis.count)
        } label: {
            VStack {
                Image(systemName: imageName).fontWeight(.light)
                Text(text).font(.body)
            }
        }
        return button
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro")
    }
}
