//
//  CircularProgressView.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-03-04.
//

import SwiftUI


struct ProgressTrackView: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().stroke(Color.black, lineWidth: 10)
            )
    }
}
