//
//  BookingInfoItemView.swift
//  hotel-booking
//
//  Created by Shirin on 23.12.2023.
//

import SwiftUI

struct BookingInfoItemView: View {
    let title: String
    let value: String
    var valueAlignment: Alignment = .leading
    var valueColor = Color.black
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .foregroundColor(.customLightGray)
                .font(.reg_16)
                .frame(maxWidth: UIScreen.main.bounds.width*0.33, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            Text(value)
                .foregroundColor(valueColor)
                .font(valueColor == .black ? .reg_16 : .sbold_16)
                .frame(maxWidth: .infinity, alignment: valueAlignment)
                .multilineTextAlignment(.leading)
        }.padding(.horizontal, 16)
            .padding(.vertical, 8)
    }
}

#Preview {
    BookingInfoItemView(title: "title", value: "value")
}
