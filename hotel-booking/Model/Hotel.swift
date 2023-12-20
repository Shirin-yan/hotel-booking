//
//  Hotel.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation

struct Hotel: Codable {
    let id: Int
    let name: String
    let address: String
    let minimalPrice: Int
    let priceFor: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let about: AboutHotel
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address = "adress"
        case minimalPrice = "minimal_price"
        case priceFor = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case about = "about_the_hotel"
    }
    
    struct AboutHotel: Codable {
        let description: String
        let peculiarities: [String]
    }
}
