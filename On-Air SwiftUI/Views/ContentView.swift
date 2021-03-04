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
    
    @ObservedObject var foodDatas = FoodViewModel()//array from db
    
    @State private var id = ""
    @State public var selection: Int = 0

    
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
                        .padding()
                    
                    Spacer()
                    
                    Text("Select a meal to prepare")
                        .font(Font.custom("Ruda-Bold", size: 25))
                    
                    Picker(selection: $selection, label: Text("Select your food")) {
                        ForEach(allFood.indices, id:\.self) { index in
                            Text(allFood[index].name.capitalized).tag(index)
                        }
                        .font(Font.custom("Ruda-Regular", size: 20))
                    }
                    .onAppear() {
                        if allFood.isEmpty{
                            self.foodDatas.fetchData()
                        } else {
                            return
                        }
                    }
                    
                    /*if allFood.isEmpty {
                     Text("")
                     } else {
                     Text("Selected meal: \(allFood[selection].name)")}*/
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: DetailView(foodDatas: foodDatas, selection: self.$selection),
                        label: {
                            Text("Let's make this!")
                                .font(Font.custom("Ruda-ExtraBold", size: 20))
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

