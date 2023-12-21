//
//  NetworkManger.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation
import Combine

class NetworkManger {
    
    static func download(url: URL) -> AnyPublisher<Data, any Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({try handleURLResponse(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else{
            throw NetworkError.badURLResponse(url: url)
        }
        
        return output.data
    }
    
    enum NetworkError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):
                return "\n [🔥] bad response from url \(url) \n"
            case .unknown:
                return "\n [⚠️] unknown error occured \n"
            }
        }
    }
}
