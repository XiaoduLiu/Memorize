//
//  ContentView.swift
//  Memorize
//
//  Created by Louie Liu on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚗", "💀","👻", "🎃", "😌", "🐶","🐱","🐼", "🐮", "🐷", "🐨", "🦁"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
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

#Preview {
    ContentView()
}
