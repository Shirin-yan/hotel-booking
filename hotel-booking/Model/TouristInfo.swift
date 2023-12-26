//
//  TouristInfo.swift
//  hotel-booking
//
//  Created by Shirin on 26.12.2023.
//

import Foundation

struct TouristInfo {
    var name: String
    var surname: String
    var bithday: String
    var nationality: String
    var passport: String
    var passportExpireDate: String
    
    init(){
        self.name = ""
        self.surname = ""
        self.bithday = ""
        self.nationality = ""
        self.passport = ""
        self.passportExpireDate = ""
    }
}
