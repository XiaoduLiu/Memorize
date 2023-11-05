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
    var body: some View {
        ZStack (content: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 12.0)
                .strokeBorder(lineWidth: 2)
            Text("🚗").font(.largeTitle)
        })
    }
}

#Preview {
    ContentView()
}
