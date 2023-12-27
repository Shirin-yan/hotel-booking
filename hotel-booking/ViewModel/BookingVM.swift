//
//  BookingVM.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation

class BookingVM: ObservableObject {
    @Published var data: Booking = Booking.example

    @Published var touristInfo: [TouristInfo] = [TouristInfo()]
    
    func isTouristInfoNotFull() -> Bool {
        return touristInfo.contains(where: { $0.isValidData == false })
    }
}
