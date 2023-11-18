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
        ZStack {
            //view can only do local variable, if-else (switch) and list of views
            let base = RoundedRectangle(cornerRadius: 12) //constant using let, variable using var
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size:200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 :0)
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
