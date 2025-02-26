//
//  timerVM.swift
//  CatCow
//
//  Created by Maryam Amer Bin Siddique on 21/08/1446 AH.
//

import SwiftUI

class timerVM: ObservableObject {
    @Published var timeRemaining: Int = 0
    @Published var progress: CGFloat = 0
    @Published var isActive = false
    @Published var hasCompleted = false
    
    private var timer: Timer?
    private var totalDuration: Int = 0
    
    func setup(duration: Int) {
        self.totalDuration = duration
        self.timeRemaining = duration
        self.progress = 1.0
        self.hasCompleted = false
    }
    
    func toggleTimer(duration: Int) {
        if isActive {
            stopTimer()
        } else {
            startTimer(duration: duration)
        }
    }
    
    private func startTimer(duration: Int) {
        isActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                self.progress = CGFloat(self.timeRemaining) / CGFloat(self.totalDuration)
            } else {
                self.stopTimer()
                self.hasCompleted = true
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        isActive = false
    }
    
    func reset() {
        stopTimer()
        timeRemaining = totalDuration
        progress = 1.0
        hasCompleted = false
    }
}


//class timerVM: ObservableObject {
//    @Published var timeRemaining: Int = 0
//    @Published var progress: CGFloat = 0
//    @Published var isActive = false
//    var onComplete: (() -> Void)?
//    
//    private var timer: Timer?
//    private var totalDuration: Int = 0
//    
//    func toggleTimer(duration: Int) {
//        if isActive {
//            stopTimer()
//        } else {
//            startTimer(duration: duration)
//        }
//    }
//    
//    private func startTimer(duration: Int) {
//        self.totalDuration = duration
//        self.timeRemaining = duration
//        self.progress = 0
//        self.isActive = true
//        
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            if self.timeRemaining > 0 {
//                self.timeRemaining -= 1
//                self.progress = CGFloat(self.timeRemaining) / CGFloat(self.totalDuration)
//            } else {
//                self.stopTimer()
//                self.onComplete?()
//            }
//        }
//    }
//    
//    func stopTimer() {
//        timer?.invalidate()
//        isActive = false
//    }
//}
