//
//  MemorizeGame.swift
//  Memorize (Model)
//
//  Created by Louie Liu on 11/7/23.
//

import Foundation

struct MemorizeGame<CardContent> {
    
    //only set is private, read is public
    private(set) var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
