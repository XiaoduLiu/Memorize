//
//  EmojiMemoryGame.swift
//  Memorize
//  View Model
//
//  Created by Louie Liu on 11/7/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    //private static global fix the init issue
    private static let emojis = ["🚗", "💀","👻", "🎃", "😌", "🐶","🐱","🐼", "🐮", "🐷", "🐨", "🦁"]
    
    //make a static function to allow it can be used in init
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 2) { pariIndex in
            if emojis.indices.contains(pariIndex) {
                return emojis[pariIndex]
            } else {
                return "!?"
            }
        }
    }
    
    //make it private to avoid call director from view
    //for last one as function, the function can move outside
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var color: Color {
        .orange
    }
    var score: Int {
        model.score
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    //intend function
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    
    
    
}
