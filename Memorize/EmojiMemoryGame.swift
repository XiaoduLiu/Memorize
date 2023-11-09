//
//  EmojiMemoryGame.swift
//  Memorize
//  View Model
//
//  Created by Louie Liu on 11/7/23.
//

import SwiftUI


class EmojiMemoryGame {
    //private static global fix the init issue
    private static let emojis = ["🚗", "💀","👻", "🎃", "😌", "🐶","🐱","🐼", "🐮", "🐷", "🐨", "🦁"]

    
    //make it private to avoid call director from view
    //for last one as function, the function can move outside
    private var model: MemorizeGame<String> = MemorizeGame<String>(numberOfPairsOfCards: 4) { pariIndex in
        return emojis[pariIndex]
    }
    
    var cards: Array<MemorizeGame<String>.Card> {
        return model.cards
    }
    
    //intend function
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
    
    
    
    
}
