//
//  Room.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation

struct Room: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let priceFor: String
    let peculiarities: [String]
    let imageUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case priceFor = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
    
    struct Response: Codable {
        let rooms: [Room]
    }
}
