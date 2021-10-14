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
        }
    }
    
    var documentBody: some View {
        Color.yellow
    }
}

struct EmojiArtDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView()
    }
}
