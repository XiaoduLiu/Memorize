//
//  CardView.swift
//  Memorize
//
//  Created by Louie Liu on 11/17/23.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: Card

    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            //.stroke(lineWidth: 6)  default is fill
            .opacity(Constants.Pie.opacity)
            .overlay (
                    Text(card.content)
                        .font(.system(size:Constants.FountSize.largest))
                        .minimumScaleFactor(Constants.FountSize.scaleFactory)
                        .aspectRatio(1, contentMode: .fit)
                        .multilineTextAlignment(.center)
                        .padding(Constants.Pie.padding)
        )
        .padding(Constants.inset)
        .cardify(isFaceUp: card.isFaceUp)
        .opacity(card.isFaceUp || !card.isMatched ? 1 :0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FountSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactory = smallest / largest
        }
        struct Pie {
            static let padding: CGFloat = 5
            static let opacity: CGFloat = 0.4
        }
    }
}

struct CardView_Preview: PreviewProvider {
    typealias Card = MemoryGame<String>.Card
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(isFaceUp: true, content: "X", id: "test2"))
                CardView(Card(content: "X", id: "test2"))
            }
            HStack {
                CardView(Card(isFaceUp: true, isMatched: true,content: "This is a long line of text", id: "test2"))
                CardView(Card(isMatched: true, content: "", id: "test2"))
            }
        }
        .padding()
        .foregroundColor(.green)
    
    }
}
