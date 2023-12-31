//
//  ContentView.swift
//  Memorize
//
//  Created by Louie Liu on 10/28/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    
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
            HStack {
                score
                Spacer()
                shuffle
            }
            //.background(Color.blue)
            .font(.largeTitle)
        }
        //.background(Color.yellow)
        .padding()
        
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            VStack {
                CardView(card)
                    .padding(spacing)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .onTapGesture {
                        //withAnimation(.easeInOut(duration: 3)) {
                        withAnimation {
                            viewModel.choose(card)
                        }
                    }
            }
        }
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        return 0
    }
}

struct EmojiMemoryGameView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
