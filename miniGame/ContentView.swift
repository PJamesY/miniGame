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
                GameBtn(title: "TIC TAC TOC", views: AnyView(TicTacTocView()), color: Color.red)
                GameBtn(title: "Finding Same Card", views: AnyView(CardFlip()), color: Color.blue)
                GameBtn(title: "Running", views: AnyView(HelicopterGame()), color: Color.green)
                GameBtn(title: "Tetris", views: AnyView(TetrisGameView()), color: Color.yellow)
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
    var color: Color

    var body: some View {
        NavigationLink(
            destination: views,
            label: {
                Text(title)
                    .frame(width: 300, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(color)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding()
            
    }
    
}
