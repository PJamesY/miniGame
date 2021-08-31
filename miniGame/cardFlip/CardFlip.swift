//
//  CardFlip.swift
//  miniGame
//
//  Created by james on 2021/08/30.
//

import SwiftUI

var currentIdx = 0

struct CardFlip: View {
    
    @StateObject private var cardFlipModel = CardFlipModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ForEach(0..<cardFlipModel.row) { row in
                    HStack(alignment:.center) {
                        ForEach(0..<cardFlipModel.col) { col in
//                            CardForFlip(geometry:geometry, answer: cardFlipModel.colors[cardFlipModel.shuffledIndex[row + (col * 3) + col]], canbefliped: cardFlipModel.canBeFliped, totalFlipedCount: cardFlipModel.flipedCount, flip: cardFlipModel.flipCard )
                            
                            CardForFlip(geometry:geometry, cf: cardFlipModel, idx:row + (col * 3) + col)
                                
                        }
                        
                    }
                    
                }
                
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
        
        
    }
}

struct CardForFlip: View {
    
    var geometry: GeometryProxy
    var cf: CardFlipModel
    var idx: Int
//    var answer: Color
//    var canbefliped: Bool
//    var totalFlipedCount: Int
//    var flip: () -> Void
    @State var flipped = false // state variable used to update the card
//    @StateObject var cardFlipModel1: CardFlipModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: geometry.size.width * 0.2, height: geometry.size.height / (5*1.5), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(cf.colors[cf.shuffledIndex[idx]].flipped ? cf.colors[cf.shuffledIndex[idx]].color : .gray) // change the card color when flipped
            .rotation3DEffect(cf.colors[cf.shuffledIndex[idx]].flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
            .animation(.default) // implicitly applying animation
            .onTapGesture {
                cf.flipCard(for: idx)
//                cf.colors[cf.shuffledIndex[idx]].flipped.toggle()
//                delay()
//                if (cardFlipModel.colors[idx].flipped) {
//                    cardFlipModel.colors[idx].flipped.toggle()
//                    delay()
//                }
//                if (totalFlipedCount == 1) {
//                    delay()
//                }
                
            }
    }
    
    private func delay()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            cf.colors[cf.shuffledIndex[idx]].flipped = false
        }
    }
}

struct CardFlip_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardFlip()
                .preferredColorScheme(.light)
            CardFlip()
        }
    }
}
