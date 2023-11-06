//
//  ContentView.swift
//  Memorize
//
//  Created by Louie Liu on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    // let isFaceUp: Bool (after create, it cannot change), starting let first and change to var if need
    var body: some View {
        ZStack (content: {
            //view can only do local variable, if-else (switch) and list of views
            let base = RoundedRectangle(cornerRadius: 12) //constant using let, variable using var
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🚗").font(.largeTitle)
            } else {
                base.fill()
            }
        })
    }
}

#Preview {
    ContentView()
}
