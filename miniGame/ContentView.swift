//
//  ContentView.swift
//  miniGame
//
//  Created by james on 2021/08/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                GameBtn(title: "TIC TAC TOC", views: AnyView(TicTacTocView()))
                GameBtn(title: "Finding Same Card", views: AnyView(CardFlip()))
                GameBtn(title: "Running", views: AnyView(HelicopterGame()))
                GameBtn(title: "Tetris", views: AnyView(Tetris()))
            }



        }
        
        
//        ScrollView(.vertical) {
//            VStack(spacing: 20) {
//                ForEach(0..<10) {
//                    Text("Item \($0)")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .frame(width: 200, height: 200)
//                        .background(Color.blue)
//                }
//            }
//        }
        
        
    }
}

struct james: View {
    var body: some View {
        Text("TEXT")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GameBtn: View {
    var title: String
    var views: AnyView

    
    var body: some View {
        NavigationLink(
            destination: views,
            label: {
                Text(title)
                    .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding()
            
    }
}
