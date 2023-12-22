//
//  HotelInfo.swift
//  hotel-booking
//
//  Created by Shirin on 21.12.2023.
//

import Foundation

enum HotelInfo {
    case commodity
    case included
    case excluded
    
    var icon: String {
        switch self {
        case .commodity:
            return "emoji-happy"
        case .included:
            return "tick-square"
        case .excluded:
            return "close-square"
        }
    }
    
    var title: String {
        switch self {
        case .commodity:
            return "Удобство"
        case .included:
            return "Что не включено"
        case .excluded:
            return "Что не включено"
        }
    }
    
    var desc: String {
        switch self {
        case .commodity:
            return "Cамое необходимое"
        case .included:
            return "Cамое необходимое"
        case .excluded:
            return "Cамое необходимое"
        }
    }
}
