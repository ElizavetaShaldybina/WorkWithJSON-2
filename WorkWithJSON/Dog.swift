//
//  Dog.swift
//  WorkWithJSON
//
//  Created by Елизавета Шалдыбина on 14.11.2023.
//

import Foundation

struct Dog: Decodable {
    let message: String?
    let status: String?
    
    init(message: String, status: String) {
        self.message = message
        self.status = status
    }
    
    init(dogData: [String: Any]) {
        message = dogData["message"] as? String ?? ""
        status = dogData["status"] as? String ?? ""
    }
    
    static func getDogs(from value: Any) -> Dog? {
        guard let dogsData = value as? [String: String] else { return nil }
        
        return Dog(dogData: dogsData)
    }
}
