//
//  HotelInfoItemView.swift
//  hotel-booking
//
//  Created by Shirin on 21.12.2023.
//

import SwiftUI

struct HotelInfoItemView: View {
    var data: HotelInfo
    
    var body: some View {
        HStack(spacing: 12) {
            Image(data.icon)
            
            VStack(spacing: 2) {
                Text(data.title)
                    .font(.med_16)
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(data.desc)
                    .font(.med_14)
                    .foregroundColor(.customLightGray)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Image(systemName: "chevron.right")
        }.padding(.horizontal, 16)
            .padding(.vertical, 10)
    }
}

#Preview {
    HotelInfoItemView(data: .commodity)
}
