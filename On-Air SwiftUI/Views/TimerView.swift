//
//  TimerView.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-03-01.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var foodDatas: FoodViewModel
    
    @Binding var selection: Int
    var body: some View {
        
        ZStack {
            Color("brandOrange")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(foodDatas: .init(),selection: .constant(0))
    }
}
