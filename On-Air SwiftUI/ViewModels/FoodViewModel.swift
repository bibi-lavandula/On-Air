//
//  FoodViewModel.swift
//  On-Air SwiftUI
//
//  Created by Shin Yun Ong on 2021-02-17.
//

import Foundation
import Firebase

class FoodViewModel: ObservableObject {
    
    @Published var datas = [Food]()
    
    private var db = Firestore.firestore()
    
func fetchData(){
        
        db.collection("meals").addSnapshotListener { (snap, err) in
            DispatchQueue.main.async {
            if err != nil {
                print((err?.localizedDescription)!)
                return
            } else {
                for i in snap!.documentChanges{
                    
                    let id = i.document.documentID
                    let name = i.document.get("name") as? String ?? ""
                    let des = i.document.get("description") as? String ?? ""
                    let weight = i.document.get("weight") as? Int ?? 0
                    let temp = i.document.get("temp") as? Int ?? 0
                    let time = i.document.get("time") as? Int ?? 0
                    
                    
                    self.datas.append(Food(id: id, name: name, des: des, weight: weight, temp: temp, time: time))
                }
            }
            }
        }
    }
}
