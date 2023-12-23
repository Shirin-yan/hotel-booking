//
//  AddTouristView.swift
//  hotel-booking
//
//  Created by Shirin on 23.12.2023.
//

import SwiftUI

struct AddTouristView: View {
    var body: some View {
        HStack {
            HStack(alignment: .top) {
                Text("Добавить туриста")
                    .foregroundColor(.black)
                    .font(.med_22)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)

                Image("plus")
                    .frame(width: 32, height: 32, alignment: .center)
                    .background(Color.customBlue)
                    .cornerRadius(6)
                
            }.padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(Color.white)
                .cornerRadius(12)
        }
    }
}

#Preview {
    AddTouristView()
        .background(Color.red)
}
