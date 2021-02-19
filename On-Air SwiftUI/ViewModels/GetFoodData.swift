//
//  FoodViewModel.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-02-17.
//

import Foundation
import Firebase

class GetFoodData: ObservableObject {
    
    @Published var datas = [Food]()
    
func fetchData(){
        
        let db = Firestore.firestore()
        
        db.collection("meals").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                
                if i.type == .added {
                    
                    //let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let weight = i.document.get("weight") as! Int
                    let temp = i.document.get("temp") as! Int
                    let time = i.document.get("time") as! Int
                    
                    
                    self.datas.append(Food(name: name, weight: weight, temp: temp, time: time))
                }
            }
        }
    }
}
