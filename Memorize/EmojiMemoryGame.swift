//
//  EmojiMemoryGame.swift
//  Memorize
//  View Model
//
//  Created by Louie Liu on 11/7/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    //private static global fix the init issue
    private static let emojis = ["🚗", "💀","👻", "🎃", "😌", "🐶","🐱","🐼", "🐮", "🐷", "🐨", "🦁"]
    
    //make a static function to allow it can be used in init
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 5) { pariIndex in
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
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    //intend function
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    
    
    
}
