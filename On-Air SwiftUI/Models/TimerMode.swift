//
//  Timer.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-03-04.
//

import Foundation

enum TimerMode {
    case running
    case pause
    case initial
}

func secondsToMinutesAndSeconds (seconds : Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    return "\(minuteStamp): \(secondStamp)"
}
