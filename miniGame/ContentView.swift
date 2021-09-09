//
//  ContentView.swift
//  miniGame
//
//  Created by james on 2021/08/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
            VStack(spacing: 20) {
                GameBtn(title: "TIC TAC TOC", views: AnyView(TicTacTocView()))
                GameBtn(title: "Finding Same Card", views: AnyView(CardFlip()))
                GameBtn(title: "Running", views: AnyView(HelicopterGame()))
                GameBtn(title: "Tetris", views: AnyView(TetrisGameView()))
            }
        }

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
                    .frame(width: 300, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding()
            
    }
    
}
