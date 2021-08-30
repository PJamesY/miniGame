//
//  PickerView.swift
//  miniGame
//
//  Created by james on 2021/08/28.
//

import SwiftUI

enum GameColor: String, CaseIterable {
    case red = "Red"
    case green = "Green"
    case blue = "Blue"
}

enum Level: String, CaseIterable {
    case easy
    case normal
    case hard
}

enum FirstStartPlayer: String, CaseIterable {
    case human
    case computer
}

struct PickerColorView: View {

    @Binding var selectedCircleColor: GameColor
    
    var body: some View {
        Picker(selection: $selectedCircleColor, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
            ForEach(GameColor.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.top)
    }
}

struct PickerLevelView: View {
    @Binding var selectedLevel: Level
    
    var body: some View {
        Picker(selection: $selectedLevel, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
            ForEach(Level.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.top)
    }
}

struct PickerStartPlayer: View {
    @Binding var selectedStartPlayer: FirstStartPlayer
    
    var body: some View {
        Picker(selection: $selectedStartPlayer, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/){
            ForEach(FirstStartPlayer.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
    }
}



//struct PickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerView(selectedCircleColor: CircleColor.red)
//    }
//}
