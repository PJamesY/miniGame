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
    
    @Published var colors: [(color:Color, answer:Int, flipped:Bool, correct:Bool)] = [
        (.red, 1, false, false), (.red, 1, false, false), (.blue, 2, false, false), (.blue, 2, false, false), (.green, 3, false, false), (.green, 3, false, false),
        (.yellow, 4, false, false), (.yellow, 4, false, false), (.orange, 5, false, false), (.orange, 5, false, false), (.purple, 6, false, false), (.purple, 6, false, false),
        (.black, 7, false, false), (.black, 7, false, false), (.pink, 8, false, false), (.pink, 8, false, false)]
    @Published var shuffledIndex:[Int] = Array(0...15).shuffled()
    @Published var flipedCount = 0
    @Published var canBeFliped = true
    var compareIdx: Int = 1
    var numberAnswer: Int = 0
    
    private func unflip(idx:Int, isCanBeFliped: Bool)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.colors[self.shuffledIndex[idx]].flipped = false
            if (isCanBeFliped) {
                self.canBeFliped = true
                self.flipedCount = 0
            }
            
        }
    }
    
    private func delay () {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.canBeFliped = true
            self.flipedCount = 0
        }
    }
    
    func flipCard (for idx:Int) {
        if (!colors[shuffledIndex[idx]].correct && canBeFliped) {
            
            flipedCount += 1
            
            if (flipedCount == 1) {
                firstCardFlipped(idx: idx)
            } else if (flipedCount == 2) {
                secondCardFlipped(idx: idx)
            }
        }
        
        
    }
    
    func firstCardFlipped (idx:Int) {
        colors[shuffledIndex[idx]].flipped = true
        compareIdx = idx
    }
    
    func secondCardFlipped (idx: Int) {
        colors[shuffledIndex[idx]].flipped = true
        canBeFliped = false
        if (colors[shuffledIndex[idx]].answer == colors[shuffledIndex[compareIdx]].answer) {
            colors[shuffledIndex[idx]].correct = true
            colors[shuffledIndex[compareIdx]].correct = true
            numberAnswer += 1
            canBeFliped = true
            flipedCount = 0
        } else {
            unflip(idx: idx, isCanBeFliped: false)
            unflip(idx: compareIdx, isCanBeFliped: true)
        }
    }
    
    
}
