//
//  Init.swift
//  Recipe
//
//  Created by Uliana Lukash on 27.06.2024.
//

import Foundation
//import FirebaseFirestore


//final class FirestoreConfig {
//    
//    private var db: Firestore
//    init() async {
//        db = Firestore.firestore()
//        readData()
//    }
//    
//    func readData() {
//        Task(priority: .userInitiated) {
//            do {
//                let snapshot = try await db.collection("users").getDocuments()
//                for document in snapshot.documents {
//                print("\(document.documentID) => \(document.data())")
//              }
//            } catch {
//              print("Error getting documents: \(error)")
//            }
//        }
//    }
//}
//
