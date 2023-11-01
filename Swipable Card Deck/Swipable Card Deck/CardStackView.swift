import SwiftUI

struct CardView: View {
    let model: CardModel

    @State private var offset = CGSize.zero

    @State private var colorVisibility: CGFloat = 0.0
    @State private var color: Color = .clear

    @State private var isRemoved = false

    var onCardRemoved: (() -> Void)?
    var onCardAdded: (() -> Void)?
    var removal: (() -> Void)?

    var cardShapeView: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .overlay(
                VStack(spacing: 10) {
                    Text(model.text)
                    Text(model.subtext)
                }
                .padding()
            )
            .shadow(radius: 10)
            .frame(width: 320, height: 420)
    }

    var body: some View {
        cardShapeView
            .overlay(cardColorView)
            .rotationEffect(.degrees(Double(offset.width / 40)))
            .offset(x: offset.width, y: offset.height * 0.4)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                        withAnimation {
                            updateCardColor(width: offset.width)
                        }
                    }
                    .onEnded { _ in
                        withAnimation {
                            handleSwipe(width: offset.width)
                            updateCardColor(width: offset.width)
                        }
                    }
            )
            .opacity(isRemoved ? 0 : 1)
    }

    private var cardColorView: some View {
        color
            .opacity(colorVisibility)
            .cornerRadius(20)
    }

    private func handleSwipe(width: CGFloat) {
        switch width {
        case -500...(-150):
            onCardRemoved?()
            offset = CGSize(width: -500, height: 0)
            isRemoved = true
            removal?()
        case 150...500:
            onCardAdded?()
            offset = CGSize(width: 500, height: 0)
            isRemoved = true
            removal?()
        default:
            offset = .zero
        }
    }

    private func updateCardColor(width: CGFloat) {
        switch width {
        case -149...(-1):
            color = .red
        case 1...149:
            color = .green
        default:
            colorVisibility = 0.0
        }
        colorVisibility = min(abs(width) / 150, 1.0)
    }
}

struct CardStackView: View {
    @Binding var cards: [CardModel]

    var body: some View {
        ZStack {
            ForEach(0..<cards.count, id: \.self) { index in
                CardView(model: cards[index], removal: {
                    removeCard(at: index)
                })
                .stacked(at: index, in: cards.count)
                .topAligned(total: cards.count)
            }
        }
    }

    private func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }

    func topAligned(total: Int) -> some View {
        self.zIndex(Double(1000 + total))
    }
}

