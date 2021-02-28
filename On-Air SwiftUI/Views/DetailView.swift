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
        
        NavigationView{
            
            let allFood = self.foodDatas.datas
            
            ZStack {
                Color("brandBlue")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    
                    //Text("\(imageURL?.absoluteString ?? "placeholder")")
                        
                    WebImage(url: imageURL)
                        .resizable()
                        .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fit)
                        
                    .onAppear(perform: loadImageFromFirebase)
                    
                    
                    Text("Cooking Time: \(allFood[selection].time) mins")
                    
                
                }
                
                
                
            }
            
            
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

