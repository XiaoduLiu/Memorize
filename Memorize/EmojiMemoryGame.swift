//
//  EmojiMemoryGame.swift
//  Memorize
//  View Model
//
//  Created by Louie Liu on 11/7/23.
//

import SwiftUI

class EmojiMemoryGame {
    
    //make it private to avoid call director from view
    private var model: MemorizeGame<String>
    
    var cards: Array<MemorizeGame<String>.Card> {
        return model.cards
    }
    
    //intend function
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
    
    
    
    
}
