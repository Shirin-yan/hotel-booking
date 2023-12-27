//
//  RoomVM.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation
import Combine

class RoomVM: ObservableObject {
    private var subscription: AnyCancellable?
    @Published var data: [Room] = []
    @Published var inProgress = true
    
    func getData(){
        inProgress = true

        guard let url = URL(string: Endpoint.room.url) else { return }
        
        subscription = NetworkManger.download(url: url)
            .decode(type: [Room].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManger.handleCompletion, receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.inProgress = false
                self.data = data
                self.subscription?.cancel()
            })
    }
}
