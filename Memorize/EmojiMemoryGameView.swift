//
//  ContentView.swift
//  Memorize
//
//  Created by Louie Liu on 10/28/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    //never do this way
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .animation(.default,value: viewModel.cards)
                //.background(Color.red)
            Button("Shuffle") {
                viewModel.shuffle()
            }
            //.background(Color.blue)
        }
        //.background(Color.yellow)
        .padding()
        
    }
    
    private var cards: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .aspectRatio(2/3, contentMode: .fit)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(.orange)
    }

}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
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
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 :0)
    }
}

struct EmojiMemoryGameView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
