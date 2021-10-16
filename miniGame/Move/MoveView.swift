//
//  MoveView.swift
//  miniGame
//
//  Created by james on 2021/10/16.
//

import SwiftUI

struct Trail: Identifiable {
    var id = UUID()
    var name: String
    var image: Image
}

struct MoveView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
        Image("1-1")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
//            .frame(width: 100, height: 100)
            
//            .scaledToFit()
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{ dragAmount = $0.translation }
//                    .onEnded{ _ in dragAmount =  }
            )
    }
}

struct MoveView_Previews: PreviewProvider {
    static var previews: some View {
        MoveView()
    }
}
