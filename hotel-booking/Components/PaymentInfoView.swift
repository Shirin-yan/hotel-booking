//
//  PaymentInfoView.swift
//  hotel-booking
//
//  Created by Shirin on 23.12.2023.
//

import SwiftUI

struct PaymentInfoView: View {
    var data: Booking
    
    var body: some View {
        VStack {
            BookingInfoItemView(title: "Тур", value: "\(data.tourPrice) ₽", valueAlignment: .trailing)
            
            BookingInfoItemView(title: "Топливный сбор", value: "\(data.fuelCharge) ₽", valueAlignment: .trailing)
            
            BookingInfoItemView(title: "Сервисный сбор", value: "\(data.serviceCharge) ₽", valueAlignment: .trailing)
            
            BookingInfoItemView(title: "К оплате", value: "\(data.totalPrice) ₽", valueAlignment: .trailing, valueColor: .customBlue)
        }.padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(12)
    }
}

#Preview {
    PaymentInfoView(data: Booking.example)
}
