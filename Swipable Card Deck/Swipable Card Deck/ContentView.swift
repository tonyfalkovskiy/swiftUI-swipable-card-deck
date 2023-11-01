import SwiftUI

struct ContentView: View {
    @State var cards: [CardModel] = .init(repeating: CardModel(text: "Demo text", subtext: "Demo subtext"), count: 5)
    var body: some View {
        ZStack {
            VStack {
                CardStackView(cards: $cards)
                Spacer()
                Button {
                    cards.append(CardModel(text: "Added card", subtext: "Demo subtext"))
                } label: {
                    Text("Add new card")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
