//
//  Food.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-02-17.
//

import Foundation

struct Food: Identifiable {
    let id = UUID().uuidString
    let name: String
    let weight: Int
    let temp: Int
    let time: Int

}
