import SwiftUI

enum Emoji: String, CaseIterable {
    case 🐶, 🦊, 🐺, 🐒, 🐷, 🦁, 🐱, 🐸
}

struct ContentView: View {
    @State private var selectedEmoji: Emoji = .🐶

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(edges: .all)
            .overlay(
                VStack {
                    Spacer() // Üstte boşluk bırak
                    
                    Text("Daily Emote")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    

                    Button {
                        selectedEmoji = getRandomEmoji()
                    } label: {
                        Text(selectedEmoji.rawValue)
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                    .padding(.bottom, 30)

                    Picker("Select Emoji", selection: $selectedEmoji) {
                        ForEach(Emoji.allCases, id: \.self) { emoji in
                            Text(emoji.rawValue)
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 20)

                    Spacer() // Alttaki boşluk bırak
                }
                .padding()
            )
    }

    func getRandomEmoji() -> Emoji {
        let allEmojis = Emoji.allCases
        let randomIndex = Int.random(in: 0..<allEmojis.count)
        return allEmojis[randomIndex]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
