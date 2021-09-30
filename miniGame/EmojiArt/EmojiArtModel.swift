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
    }
    
    enum Background {
        case blank
        case url
        case imageData
    }
}
