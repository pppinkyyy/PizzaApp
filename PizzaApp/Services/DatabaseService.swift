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
    
    func setProfile(user: PizzaUser, completion: @escaping (Result<PizzaUser, Error>) -> ()) {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
            
        }
    }
    
    func getProfile(completion: @escaping (Result<PizzaUser, Error>) -> ()) {
        
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let phone = data["phoneNumber"] as? Int else { return }
            guard let address = data["address"] as? String else { return }
            
            let user = PizzaUser(id: id, name: userName, phoneNumber: phone, address: address)
            
            completion(.success(user))
        }
    }
    
    
}
