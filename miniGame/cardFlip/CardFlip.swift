//
//  CardFlip.swift
//  miniGame
//
//  Created by james on 2021/08/30.
//

import SwiftUI

var currentIdx = 0

struct CardFlip: View {
    let row = 4
    let col = 4
    let colors:[Color] = [Color.red, Color.red, Color.blue, Color.blue, Color.green, Color.green, Color.yellow, Color.yellow, Color.orange, Color.orange, .purple, .purple, .black, .black, .pink, .pink]
    let shuffledIndex:[Int] = Array(0...15).shuffled()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ForEach(0..<self.row) { row in
                    HStack(alignment:.center) {
                        ForEach(0..<self.col) { col in
                            CardForFlip(geometry:geometry, answer: colors[shuffledIndex[row + (col * 3) + col]])
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
    var answer: Color
    @State var flipped = false // state variable used to update the card
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: geometry.size.width * 0.2, height: geometry.size.height / (5*1.5), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(self.flipped ? answer : .gray) // change the card color when flipped
            .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
            .animation(.default) // implicitly applying animation
            .onTapGesture {
                self.flipped.toggle()
                delay()
            }
    }
    
    private func delay()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            flipped = false
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
