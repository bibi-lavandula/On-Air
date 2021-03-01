//
//  SelectedFoodDetails.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-02-23.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct DetailView: View {
    
    @ObservedObject var foodDatas: FoodViewModel
    
    @Binding var selection: Int
    
    @State private var imageURL = URL(string: "")
    
    var body: some View {
        
        let allFood = self.foodDatas.datas
        
        ZStack {
            
            Color("brandBlue")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                
                //Text("\(imageURL?.absoluteString ?? "placeholder")")
                
                WebImage(url: imageURL)
                    .resizable()
                    .frame(width: 230, height: 230, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    
                    .onAppear(perform: loadImageFromFirebase)
                
                Text("\(allFood[selection].des)")
                    .frame(width: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(Font.custom("Ruda-Regular", size: 15))
                
                Spacer()
                    .frame(maxHeight: 20)
                
                Text("Cooking portion: \(allFood[selection].weight) gram")
                    .font(Font.custom("Ruda-Regular", size: 15))
                
                Spacer()
                    .frame(maxHeight: 20)
                
                Text("Cooking time: \(allFood[selection].time) mins")
                    .font(Font.custom("Ruda-Regular", size: 15))
                
                Spacer()
                    .frame(maxHeight: 50)
                
                ZStack{
                    Image("chef")
                        .resizable()
                        .frame(width: 150, height: 270, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .aspectRatio(1, contentMode: .fit)
                    
                    NavigationLink(
                        destination: TimerView(foodDatas: foodDatas, selection: self.$selection),
                        label: {
                            Text("Continue")
                                .font(Font.custom("Ruda-ExtraBold", size: 20))
                                .foregroundColor(Color.black)
                                .padding(12)
                        })
                        .background(Color.white)
                        .cornerRadius(12)
                }
            }
            .navigationBarTitle("\(allFood[selection].name.capitalized)",
                                displayMode: .inline)
        }
        
        
        
    }
    
    func loadImageFromFirebase() {
        let allFood = self.foodDatas.datas
        let storageRef = Storage.storage().reference(withPath: "\(allFood[selection].name).png")
              storageRef.downloadURL { (url, error) in
                     if error != nil {
                         print((error?.localizedDescription)!)
                         return
              }
                    self.imageURL = url!
        }
      }

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(foodDatas: .init(),selection: .constant(0))
    }
}

