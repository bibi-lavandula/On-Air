//
//  TimerView.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-03-01.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var foodDatas: FoodViewModel
    @ObservedObject var timerModel = TimerViewModel()
    
    @Binding var selection: Int
    
    var body: some View {
        NavigationView {
            
            let allFood = self.foodDatas.datas
            let timerLength = allFood[selection].time
            
            ZStack {
                Color("brandOrange")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
               
                VStack {
                    
                    Text(secondsToMinutesAndSeconds(seconds: timerModel.secondsLeft))
                .font(.system(size: 80))
                .padding(.top, 80)
                        .onAppear(){
                            if self.timerModel.timerMode == .initial {
                                self.timerModel.setTimerLenght(minutes: timerLength * 60)
                            }
                        }
                    
                    Image(systemName: timerModel.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.orange)
                        .onTapGesture(perform: {
                            if self.timerModel.timerMode == .initial {
                                self.timerModel.setTimerLenght(minutes: timerLength * 60)
                            }
                            self.timerModel.timerMode == .running ? self.timerModel.pause() : self.timerModel.start()
                        })
                    
                    if timerModel.timerMode == .pause {
                            Image(systemName: "gobackward")
                                    .resizable()
                                .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                    .padding(.top, 40)
                                .onTapGesture(perform: {
                                    self.timerModel.reset()
                                })
                    }
                    
                    Spacer()
                    
    
                    
                
                //            Text("\(allFood[selection].name)")
            }
        }
    }
}
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(foodDatas: .init(),selection: .constant(0))
    }
}
