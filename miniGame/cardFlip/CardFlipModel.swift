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
    
    private func delay(idx:Int)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.colors[self.shuffledIndex[idx]].flipped = false
        }
    }
    
    func flipCard (for idx:Int) {
//        if
        print("INDEX", idx)
        if (!colors[shuffledIndex[idx]].correct && canBeFliped) {
            colors[shuffledIndex[idx]].flipped = true
            flipedCount += 1
            
            if (flipedCount == 1) {
                print("1개 뒤집힘")
                compareIdx = idx
            } else if (flipedCount == 2) {
                canBeFliped = false
                if (colors[shuffledIndex[idx]].answer == colors[shuffledIndex[compareIdx]].answer) {
                    print("정답!!!")
                    colors[shuffledIndex[idx]].correct = true
                    colors[shuffledIndex[compareIdx]].correct = true
                } else {
                    print("틀림1!!")
                    delay(idx: idx)
                    delay(idx: compareIdx)
//                    canBeFliped = true
                }
                canBeFliped = true
                flipedCount = 0
            }
        }
        
        
//        if (flipedCount == 1) {
//            print("1개 뒤집힘")
//            compareIdx = idx
//        } else if (flipedCount == 2) {
//            print("2개 뒤집힘")
//            canBeFliped = false
//            delay(idx: idx)
//            delay(idx: compareIdx)
////            canBeFliped = true
//            flipedCount = 0
//        }
//        if (flipedCount == 1) {
////            checkSheet.append(idx)
//
//            compareIdx = idx
//        }
//        else if (flipedCount == 2) {
//            print("compare", compareIdx, idx)
//            if (colors[shuffledIndex[compareIdx]].answer == colors[shuffledIndex[idx]].answer) {
//                colors[shuffledIndex[compareIdx]].correct = true
//                colors[shuffledIndex[idx]].correct = true
//            }
//            else {
//                print("No answer")
//                colors[shuffledIndex[compareIdx]].flipped = false
//                colors[shuffledIndex[idx]].flipped = false
//            }
//            flipedCount = 0
////            checkAnswer()
//        }
//        else if (flipedCount == 3) {
//            flipedCount = 0
//        }
        
        
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
