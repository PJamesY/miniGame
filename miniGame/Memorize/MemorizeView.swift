//
//  MemorizeView.swift
//  miniGame
//
//  Created by james on 2021/09/11.
//

import SwiftUI

struct MemorizeView: View {
    @ObservedObject var game: EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
//
//    init(_ card: EmojiMemoryGame.Card) {
//        self.card = card
//    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}
 
struct MemorizeView_Previews: PreviewProvider {
    static var previews: some View {
//        let game = EmojiMemoryGame()
        MemorizeView()
            .preferredColorScheme(.light)
        MemorizeView()
            .preferredColorScheme(.dark)
    }
}
