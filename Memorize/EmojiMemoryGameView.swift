//
//  ContentView.swift
//  Memorize
//
//  Created by Louie Liu on 10/28/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    //never do this way
    var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    let emojis = ["🚗", "💀","👻", "🎃", "😌", "🐶","🐱","🐼", "🐮", "🐷", "🐨", "🦁"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
        .foregroundColor(.orange)
    }

}

struct CardView: View {
    let content: String
    @State var isFaceUp = true //@State add pointer to the variable
    // let isFaceUp: Bool (after create, it cannot change), starting let first and change to var if need
    var body: some View {
        ZStack {
            //view can only do local variable, if-else (switch) and list of views
            let base = RoundedRectangle(cornerRadius: 12) //constant using let, variable using var
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct EmojiMemoryGameView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
