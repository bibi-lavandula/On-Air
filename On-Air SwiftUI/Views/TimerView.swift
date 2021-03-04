//
//  TimerView.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-03-01.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct TimerView: View {
    
    @ObservedObject var foodDatas: FoodViewModel
    @ObservedObject var timerModel = TimerViewModel()
    
    @Binding var selection: Int
    
    @State var counter = 0
    
    var body: some View {
        NavigationView {
            
            let allFood = self.foodDatas.datas
            let timerLength = allFood[selection].time
            let countTo = timerLength * 60
            
            ZStack {
                Color("brandOrange")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
               
                VStack {
                
                    Text(timerModel.textToUpdate)
                        .font(Font.custom("Ruda-ExtraBold", size: 25))
                        .padding()
                   
                    
                    ZStack{
                        
                        ProgressTrackView()
                
                    Text(secondsToMinutesAndSeconds(seconds: timerModel.secondsLeft))
                .font(Font.custom("Ruda-Regular", size: 60))
                .padding()
                        .onAppear(){
                            if self.timerModel.timerMode == .initial {
                                self.timerModel.setTimerLenght(minutes: timerLength * 60)
                                self.counter = 0
                            }
                        }
                        
                        ProgressBarView(counter: counter, countTo: countTo)
                            .onReceive(timer) { time in
                            if (self.counter < countTo) && timerModel.timerMode == .running  {
                            self.counter += 1
                            } 
                    }
                    }
                    
                    Spacer()
                    
                    Image(systemName: timerModel.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.orange)
                        .onTapGesture(perform: {
                            if self.timerModel.timerMode == .initial {
                                self.timerModel.setTimerLenght(minutes: timerLength * 60)
                                self.counter = 0
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
                                    self.timerModel.setTimerLenght(minutes: timerLength * 60)
                                    self.counter = 0
                                    self.timerModel.reset()
                                })
                    }
                    
                    Spacer()
                    
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
