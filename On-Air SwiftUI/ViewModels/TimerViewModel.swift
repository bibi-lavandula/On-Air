//
//  TimerViewModel.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-03-04.
//

import Foundation
import SwiftUI
import AVFoundation

class TimerViewModel: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = 0
    @Published var counter = 0
    @Published var textToUpdate: String = ""
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    func start() {
        
        timerMode = .running
        textToUpdate = "Preparing💨💨💨"
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.secondsLeft -= 1
            if self.secondsLeft == 0 {
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
                
                self.complete()
                
            }
            
        })
    }
    
    func complete() {
        self.timerMode = .initial
        self.textToUpdate = "🦄🦄Done!🦄🦄"
        timer.invalidate()
    }
    
    func reset() {
        self.timerMode = .initial
        self.textToUpdate = ""
        timer.invalidate()
    }
    
    func pause() {
        self.timerMode = .pause
        self.textToUpdate = "Waiting...🐢"
        timer.invalidate()
    }
    
    func setTimerLenght(minutes: Int) {
        secondsLeft = minutes
    }
    
}

