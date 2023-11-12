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
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter {index in cards[index].isFaceUp }.only
        }
        set {
            return cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0)}
        }
    }
    
    //variable for a func is let constant so you can not change it
    mutating func choose(_ card: Card) {
        //print("choose \(card)")
        //card.isFaceUp.toggle() (wrong)
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    //otherwise, it will not allow to shuffle self is immutable
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        //infer the type
        var isFaceUp = false
        var isMatched = false
        //make content as constant and no change after create
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "Up":"Down")\(isMatched ? " matched":"")"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
