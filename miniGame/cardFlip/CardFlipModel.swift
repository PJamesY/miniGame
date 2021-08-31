//
//  CardFlipModel.swift
//  miniGame
//
//  Created by james on 2021/08/31.
//

import SwiftUI

final class CardFlipModel: ObservableObject {
    @Published var row = 4
    @Published var col = 4
//    @Published var colors:[Color] = [Color.red, Color.red, Color.blue, Color.blue, Color.green, Color.green, Color.yellow, Color.yellow, Color.orange, Color.orange, .purple, .purple, .black, .black, .pink, .pink]
    
    @Published var colors: [(color:Color, answer:Int, flipped:Bool, correct:Bool)] = [
        (.red, 1, false, false), (.red, 1, false, false), (.blue, 2, false, false), (.blue, 2, false, false), (.green, 3, false, false), (.green, 3, false, false),
        (.yellow, 4, false, false), (.yellow, 4, false, false), (.orange, 5, false, false), (.orange, 5, false, false), (.purple, 6, false, false), (.purple, 6, false, false),
        (.black, 7, false, false), (.black, 7, false, false), (.pink, 8, false, false), (.pink, 8, false, false)]
    @Published var shuffledIndex:[Int] = Array(0...15).shuffled()
    @Published var flipedCount = 0
    @Published var canBeFliped = true
    var compareIdx: Int = 1
    
//    func checkAnswer () -> Bool {
//
//    }
    
    
    
    func flipCard (for idx:Int) {
//        if
        print("INDEX", idx)
        colors[shuffledIndex[idx]].flipped = true
        flipedCount += 1
        if (flipedCount == 1) {
//            checkSheet.append(idx)
            
            compareIdx = idx
        }
        if (flipedCount == 2) {
            if (colors[shuffledIndex[compareIdx]].answer == colors[shuffledIndex[idx]].answer) {
                colors[shuffledIndex[compareIdx]].correct = true
                colors[shuffledIndex[idx]].correct = true
            }
            else {
                colors[shuffledIndex[compareIdx]].flipped = false
                colors[shuffledIndex[idx]].flipped = false
            }
            flipedCount = 0
//            checkAnswer()
        }
//        print("KKKKK", flipedCount, color[0].0, color[0].answer, color[0].2)
//        if ( flipedCount == 2 ) {
//            canBeFliped = false
//        }
        
    }
    
    func unFlipCard () {
        if (flipedCount > 0) {
            flipedCount -= 1
        } else if (flipedCount == 0) {
//            flipedCount
        }
    }
    
    
}
