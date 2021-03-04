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
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    func start() {
        timerMode = .running
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.secondsLeft -= 1
            if self.secondsLeft == 0 {
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
                
                self.reset()
            }
            
        })
    }
    
    func reset() {
        self.timerMode = .initial
        self.secondsLeft = 0
        timer.invalidate()
    }
    
    func pause() {
        self.timerMode = .pause
        timer.invalidate()
    }
    
    func setTimerLenght(minutes: Int) {
        secondsLeft = minutes
    }
    
}

