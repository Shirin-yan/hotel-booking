//
//  tourBookingApp.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import SwiftUI

@main
struct tourBookingApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView {
                HotelView()
            }.preferredColorScheme(.light)
        }
    }
}
