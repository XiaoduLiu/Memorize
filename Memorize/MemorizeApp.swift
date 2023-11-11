//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Louie Liu on 10/28/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
