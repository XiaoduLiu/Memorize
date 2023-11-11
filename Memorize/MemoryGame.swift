//
//  MemorizeGame.swift
//  Memorize (Model)
//
//  Created by Louie Liu on 11/7/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    //only set is private, read is public
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        //cards = Array<Card>()
        cards = []
        // add numberOfPairsOfCards x 2 cards, if you are not use the index then change it to _ instead of index
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a" ))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b" ))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    //otherwise, it will not allow to shuffle self is immutable
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable {
        //infer the type
        var isFaceUp = true
        var isMatched = false
        //make content as constant and no change after create
        let content: CardContent
        
        var id: String
    }
}
