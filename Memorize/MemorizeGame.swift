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
    
    init(numberOfPairsOfCards: Int) {
        //cards = Array<Card>()
        cards = []
        // add numberOfPairsOfCards x 2 cards, if you are not use the index then change it to _ instead of index
        for _ in 0..<numberOfPairsOfCards {
            cards.append(Card(content: <#T##CardContent#>))
            cards.append(Card(content: <#T##CardContent#>))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
