//
//  UserInfo.swift
//  PizzaApp
//
//  Created by Alia on 22.01.2024.
//

import Foundation

struct PizzaUser: Identifiable {
    
    var id: String
    var name: String
    var phoneNumber: Int
    var address: String
    
    var representation: [String: Any] {

        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phoneNumber"] = self.phoneNumber
        repres["address"] = self.address
        
        return repres
    }
}
