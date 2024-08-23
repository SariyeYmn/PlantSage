//
//  Database.swift
//  PlantSage
//
//  Created by Sariye Yaman on 23.08.2024.
//

import SwiftUI
import FirebaseFirestore

//here we create a class named database which get data from firebase firestore

class Database: ObservableObject{
    
    @Published var plantList = [PlantsModel]()
    
    init(){
        getPlants()
    }
    
    func getPlants(){
        
        let db = Firestore.firestore()
        
        db.collection("PLANTS").addSnapshotListener{ snapshot, error in
            if let snapshot = snapshot{
                for document in snapshot.documents{
                    self.plantList.append(
                        PlantsModel(
                            id: document.documentID,
                            title: document.get("title") as! String,
                            categories: document.get("categories") as! String,
                            description: document.get("description") as! String,
                            images: document.get("images") as! [String]
                        )
                        )
                }
            }
            
        }
    }
}
