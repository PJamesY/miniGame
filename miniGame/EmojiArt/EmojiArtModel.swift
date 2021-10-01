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
    
    enum Background {
        case blank
        case url
        case imageData
    }
}
