//
//  TimerManager.swift
//  miniGame
//
//  Created by james on 2021/08/29.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    @Published var timerMode: TimerMode = .initial
    @Published var seconds = 0
    @Published var records = 0
    
    var timer = Timer()
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.seconds += 1
            self.records += 1
//            timer.invalidate()
        })
    }
    
    func reset() {
        self.timerMode = .initial
        self.seconds = 0
        self.records = 0
        timer.invalidate()
    }
    
    func stop() {
        self.timerMode = .paused
        timer.invalidate()
    }
}
