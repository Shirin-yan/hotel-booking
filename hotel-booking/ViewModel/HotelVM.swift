//
//  HotelVM.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation
import Combine

class HotelVM: ObservableObject {
    private var subscription: AnyCancellable?
    @Published var data: Hotel?
    @Published var inProgress = true
    
    func getData(){
        inProgress = true

        guard let url = URL(string: Endpoint.hotel.url) else { return }
        
        subscription = NetworkManger.download(url: url)
            .decode(type: Hotel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManger.handleCompletion, receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.inProgress = false
                self.data = data
                self.subscription?.cancel()
            })
    }
}
