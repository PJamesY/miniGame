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
    var image: String
}

struct TrailRow: View {
    var trail: Trail
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Image(trail.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text(trail.name)
            }
        }
    }
}

struct MoveView: View {
    @State private var dragAmount = CGSize.zero
    let Children = [
        Trail(name: "라현이", image: "1-1"),
        Trail(name: "선율이", image: "2")
    ]
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationView {
            List(Children) { child in
                TrailRow(trail: child)
            }
            .navigationTitle("❤️")
        }
        
        
//        Image("1-1")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
////            .frame(width: 100, height: 100)
//
////            .scaledToFit()
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged{ dragAmount = $0.translation }
////                    .onEnded{ _ in dragAmount =  }
//            )
    }
}

struct MoveView_Previews: PreviewProvider {
    static var previews: some View {
        MoveView()
    }
}
