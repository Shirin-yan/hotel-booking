//
//  RatingView.swift
//  hotel-booking
//
//  Created by Shirin on 23.12.2023.
//

import SwiftUI

struct RatingView: View {
    var rating: Int
    var ratingName: String
    
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
                .imageScale(.small)
                .foregroundColor(.customOrange)
            
            Text("\(rating) " + ratingName)
                .font(.med_16)
                .foregroundColor(Color.customOrange)
        }.padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.customOrange.opacity(0.2))
            .cornerRadius(5)
    }
}
