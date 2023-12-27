//
//  BookingVM.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation
import Combine

class BookingVM: ObservableObject {
    private var subscription: AnyCancellable?

    @Published var inProgress = true
    @Published var data: Booking?
    @Published var touristInfo: [TouristInfo] = [TouristInfo()]
    
    func isTouristInfoNotFull() -> Bool {
        return touristInfo.contains(where: { $0.isValidData == false })
    }
    
    func getData(){
        inProgress = true

        guard let url = URL(string: Endpoint.booking.url) else { return }
        
        subscription = NetworkManger.download(url: url)
            .decode(type: Booking.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManger.handleCompletion, receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.inProgress = false
                self.data = data
                self.subscription?.cancel()
            })
    }
}
