//
//  ProgressBarView.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-03-04.
//

import SwiftUI

struct ProgressBarView: View {
    var counter: Int
    var countTo: Int
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 10,
                            lineCap: .round,
                            lineJoin:.round
                        )
                    )
                    .foregroundColor(
                        (completed() ? Color.green : Color.orange)
                    ).animation(
                        .easeInOut(duration: 0.1)
                    )
            )
    }
    func completed() -> Bool {
        return progress() == 1
    }
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

