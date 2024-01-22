//
//  DatabaseService.swift
//  PizzaApp
//
//  Created by Alia on 22.01.2024.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private init() { }
    
    func setUser(user: PizzaUser, completion: @escaping (Result<PizzaUser, Error>) -> ()) {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
            
        }
    }
}
