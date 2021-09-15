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
        AspectVGrid(items: game.cards, aspectRatio: 2/3) {card in
            cardView(for: card)
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
        
    }
    
    private func scale(thatFits size:CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    
    private struct DrawingConstants {
        static let fontSize: CGFloat = 32
        static let fontScale: CGFloat = 0.7
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
