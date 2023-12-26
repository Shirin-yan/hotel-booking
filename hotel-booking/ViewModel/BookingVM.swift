//
//  BookingVM.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation

class BookingVM: ObservableObject {
    @Published var data: Booking = Booking.example

    @Published var phone = ""
    @Published var mail = ""
    @Published var touristInfo: [TouristInfo] = [TouristInfo()]
}
