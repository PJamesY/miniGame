//
//  MemorizeView.swift
//  miniGame
//
//  Created by james on 2021/09/11.
//

import SwiftUI

struct MemorizeView: View {
    let viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            print("Tapped!")
        }
    }
}
 
struct MemorizeView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        MemorizeView(viewModel: game)
            .preferredColorScheme(.light)
        MemorizeView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
