//
//  EmojiArtModel.swift
//  miniGame
//
//  Created by james on 2021/09/30.
//

import Foundation

struct EmojiArtModel {
    var background: Background
    var emojis = [Emoji]()
    
    struct Emoji {
        let text: String
        var x: Int
        var y: Int
        var size: Int
    }
    
    mutating func addEmoji(_ text: String, at location: (x: Int, y: Int), size: Int) {
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size))
    }
    
    enum Background {
        case blank
        case url
        case imageData
    }
}
