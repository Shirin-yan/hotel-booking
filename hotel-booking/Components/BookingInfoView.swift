//
//  BookingInfoView.swift
//  hotel-booking
//
//  Created by Shirin on 23.12.2023.
//

import SwiftUI

struct BookingInfoView: View {
    var data: Booking
    
    var body: some View {
        VStack {
            BookingInfoItemView(title: "Вылет из", value: data.departure)
            
            BookingInfoItemView(title: "Страна, город", value: data.arrival)
            
            BookingInfoItemView(title: "Даты", value: data.tourStartDate+"-"+data.tourStopDate)
            
            BookingInfoItemView(title: "Кол-во ночей", value: "\(data.nights) ночей")
            
            BookingInfoItemView(title: "Отель", value: data.hotelName)
            
            BookingInfoItemView(title: "Номер", value: data.roomName)
            
            BookingInfoItemView(title: "Питание", value: data.nutrition)
        }.padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(15)
    }
}

#Preview {
    BookingInfoView(data: Booking.example)
}
