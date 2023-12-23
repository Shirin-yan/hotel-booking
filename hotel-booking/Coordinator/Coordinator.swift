//
//  Coordinator.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    enum Page: Hashable {
        case hotel
        case room(name: String)
        case booking
        case payment
    }
    
    @Published var path: NavigationPath = NavigationPath()
    
    @ViewBuilder 
    func view(for page: Page) -> some View {
        switch page {
        case .hotel:
            HotelView()
        case .room(let name):
            RoomView()
                .navigationTitle(name)
        case .booking:
            BookingView()
        case .payment:
            PaymentView()
        }
    }
    
    func navigateTo(_ page: Page) {
        path.append(page)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
