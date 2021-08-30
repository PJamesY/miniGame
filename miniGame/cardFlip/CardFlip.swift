//
//  CardFlip.swift
//  miniGame
//
//  Created by james on 2021/08/30.
//

import SwiftUI

//enum SizeNumber: Int {
//    case row = 4
//    case col = 4
//}

//struct SizeNumber {
//    var row = 4
//    let col = 4
//}

//let SizeNumber = ["row": 4, "col":4]

struct CardFlip: View {
    
//    @State var flipped = false // state variable used to update the card
    @State var row = 4
    @State var col = 4
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ForEach(0..<self.row) { row in
                    HStack(alignment:.center) {
                        ForEach(0..<self.col) { col in
                            CardForFlip(geometry:geometry)
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
    @State var flipped = false // state variable used to update the card
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: geometry.size.width * 0.2, height: geometry.size.height / (5*1.5), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(self.flipped ? .red : .blue) // change the card color when flipped
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
        CardFlip()
    }
}
