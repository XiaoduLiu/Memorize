//
//  ContentView.swift
//  Memorize
//
//  Created by Louie Liu on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (content: {
            Image(systemName: "globe")
                .foregroundColor(.brown)
            Text("Hello, cs139p!").padding()
        })
        .padding()
        .font(.largeTitle)
        .foregroundColor(.orange)
        .imageScale(.large)
    }
}



#Preview {
    ContentView()
}
