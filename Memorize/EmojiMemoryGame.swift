//
//  EmojiMemoryGame.swift
//  Memorize
//  View Model
//
//  Created by Louie Liu on 11/7/23.
//

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return ["🚗", "💀","👻", "🎃", "😌", "🐶","🐱","🐼", "🐮", "🐷", "🐨", "🦁"][index]
}

class EmojiMemoryGame {
    
    //make it private to avoid call director from view
    //for last one as function, the function can move outside
    private var model: MemorizeGame<String> = MemorizeGame<String>(numberOfPairsOfCards: 4) { index in
        return ["🚗", "💀","👻", "🎃", "😌", "🐶","🐱","🐼", "🐮", "🐷", "🐨", "🦁"][index]
    }
    
    var cards: Array<MemorizeGame<String>.Card> {
        return model.cards
    }
    
    //intend function
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
    
    
    
    
}
