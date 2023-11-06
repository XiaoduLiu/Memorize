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
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.black)
            
            HStack {
                cardRemover
                Spacer()
                cardAdder
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        .padding()
    }
    
    var cardRemover: some View {
        Button(action: {
            if (cardCount > 1) {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if (cardCount < emojis.count) {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
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
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
