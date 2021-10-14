//
//  EmojiArtDocumentView.swift
//  miniGame
//
//  Created by james on 2021/10/13.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument = EmojiArtDocument()
    
    var body: some View {
        VStack(spacing:0) {
            documentBody
            palette
        }
    }
    
    var documentBody: some View {
        Color.yellow
    }
    
    var palette: some View {
        ScrollingEmojisView(emojis: testEmojis)
    }
    
    let testEmojis = "🚗🚚😀😃😄🙂🤬😰😓🤔"
}

struct ScrollingEmojisView: View {
    let emojis: String
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis.map { String($0) }, id: \.self) { emoji in
                    Text(emoji)
                }
            }
        }
    }
}

struct EmojiArtDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView()
    }
}
