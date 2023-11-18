//
//  Cardify.swift
//  Memorize
//
//  Created by Louie Liu on 11/18/23.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        
        ZStack {
            //view can only do local variable, if-else (switch) and list of views
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius) //constant using let, variable using var
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
