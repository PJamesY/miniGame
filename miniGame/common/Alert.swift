//
//  Alert.swift
//  miniGame
//
//  Created by james on 2021/08/29.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    var records: Int
    static let humanWin = AlertItem(title: Text("You Win!"), message: Text("You are so smart. You beat your own AI"), buttonTitle: Text("Hell yeah"))
    static let computerWin = AlertItem(title: Text("You Lost!"), message: Text("You programed a super AI"), buttonTitle: Text("Rematch"))
    static let draw = AlertItem(title: Text("Draw!"), message: Text("What a battle of wits we have here..."), buttonTitle: Text("Try again"))
}

