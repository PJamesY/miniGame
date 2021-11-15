//
//  ContentView.swift
//  miniGame
//
//  Created by james on 2021/08/28.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some View {
        EmojiArtDocumentView()
//        MoveView()
//        Button {
//        NavigationView {
////            NavigationLink("Word", destination:MemorizeView())
//            NavigationLink("emoji", destination:EmojiArtDocumentView())
//        }
        
//        } label: {
//            Text("Please")
//        }
//        NavigationLink(
//            destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
//            label: {
//                /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
//            })
//        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
//            VStack(spacing: 20) {
//                Button {
//
//                } label: {
//                    Text("Please")
//                }
//                GameBtn(title: "TIC TAC TOC", views: AnyView(TicTacTocView()), color: Color.red)
//                GameBtn(title: "Finding Same Card", views: AnyView(CardFlip()), color: Color.blue)
//                GameBtn(title: "Running", views: AnyView(HelicopterGame()), color: Color.green)
//                GameBtn(title: "Tetris", views: AnyView(TetrisGameView()), color: Color.yellow)
//                GameBtn(title: "Memorize", views: AnyView(MemorizeView()), color: Color.black)
//            }
//        }

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
//                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(color)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding()
            
    }
    
}
