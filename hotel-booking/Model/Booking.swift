//
//  Booking.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import Foundation

struct Booking: Codable {
    let id: Int
    let hotelName: String
    let hotelAddress: String
    let rating: Int
    let ratingName: String
    let departure: String
    let arrival: String
    let tourStartDate: String
    let tourStopDate: String
    let nights: Int
    let roomName: String
    let nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int

    enum CodingKeys: String, CodingKey {
        case id
        case hotelName = "hotel_name"
        case hotelAddress = "hotel_adress"
        case rating = "horating"
        case ratingName = "rating_name"
        case departure
        case arrival = "arrival_country"
        case tourStartDate = "tour_date_start"
        case tourStopDate = "tour_date_stop"
        case nights = "number_of_nights"
        case roomName = "room"
        case nutrition = "nutrition"
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
    
    static let example = Booking(id: 1, 
                                 hotelName: "Лучший пятизвездочный отель в Хургаде, Египет",
                                 hotelAddress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
                                 rating: 5,
                                 ratingName: "Превосходно",
                                 departure: "Москва",
                                 arrival: "Египет, Хургада",
                                 tourStartDate: "19.09.2023",
                                 tourStopDate: "27.09.2023",
                                 nights: 7,
                                 roomName: "Люкс номер с видом на море",
                                 nutrition: "Все включено",
                                 tourPrice: 289400,
                                 fuelCharge: 9300,
                                 serviceCharge: 2150)
}
