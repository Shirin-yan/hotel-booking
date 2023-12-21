//
//  Endpoint.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation

enum Endpoint {
    case hotel
    case room
    case booking
    
    var url: String {
        var components = URLComponents()
        components.host = "run.mocky.io"
        components.scheme = "https"

        switch self {
        case .hotel:
            components.path = "/v3/d144777c-a67f-4e35-867a-cacc3b827473"
            
        case .room:
            components.path = "/v3/8b532701-709e-4194-a41c-1a903af00195"

        case .booking:
            components.path = "//v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
        }
        
        return components.url?.absoluteString ?? ""
    }
}
