//
//  ContentView.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-02-15.
//

import SwiftUI

/*let testData = [
    Food(foodName: "Frozen fries (thick)", weight: 180, temp: 200, time: 18),
    Food(foodName: "Frozen fries (thin)", weight: 180, temp: 200, time: 14)
]*/

struct ContentView: View {
    
    @ObservedObject private var foodDatas = GetFoodData()
    
    @State private var id = ""
    @State private var selectedFood = ""
    
    var body: some View {
        
        NavigationView{
            
            let allFood = self.foodDatas.datas
            
            ZStack {
                Color("brandBlue")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Image("airFryer")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    Text("Select the meal to prepare")
                        .font(.system(size: 25))
                        .padding()
                    
                    Picker(selection: $selectedFood, label: Text("foodPicker")) {
                        ForEach(allFood.indices, id:\.self) { index in
                            Text(allFood[index].name).tag(index)
                        }
                    }
                    Text("Selected meal: \(selectedFood)")
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: selectedFoodView(),
                        label: {
                            Text("Let's make this!")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .padding(12)
                        })
                        .background(Color.white)
                        .cornerRadius(12)
                        .navigationBarHidden(true)
                    
                    HStack {
                        chefView(image: "chefMan")
                        chefView(image: "chefWoman")
                    }
                    
                }
                
            }
            
        }
        
    }
}

struct selectedFoodView: View {
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("brandBlue")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            }
            
            
        }
    }
}



struct chefView: View {
    let image : String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 120, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .aspectRatio(1, contentMode: .fit)
            .padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

