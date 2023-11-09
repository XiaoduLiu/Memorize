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
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        //cards = Array<Card>()
        cards = []
        // add numberOfPairsOfCards x 2 cards, if you are not use the index then change it to _ instead of index
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        //infer the type
        var isFaceUp = false
        var isMatched = false
        //make content as constant and no change after create
        let content: CardContent
    }
}
