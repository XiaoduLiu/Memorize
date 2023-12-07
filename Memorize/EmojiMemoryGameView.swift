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
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
                //.animation(.default, value: viewModel.cards)
                //.background(Color.red)
            Button("Shuffle") {
                withAnimation {
                    viewModel.shuffle()
                }
            }
            //.background(Color.blue)
        }
        //.background(Color.yellow)
        .padding()
        
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            VStack {
                CardView(card)
                    .padding(spacing)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 3)) {
                            viewModel.choose(card)
                        }
                    }
            }
        }
    }

}

struct EmojiMemoryGameView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
