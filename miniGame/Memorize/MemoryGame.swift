//
//  MemoryGame.swift
//  miniGame
//
//  Created by james on 2021/09/11.
//

import Foundation

struct MemoryGame<CardContent> {
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}