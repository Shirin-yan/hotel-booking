//
//  RoomItemView.swift
//  hotel-booking
//
//  Created by Shirin on 23.12.2023.
//

import SwiftUI

struct RoomItemView: View {
    @EnvironmentObject var coordinator: Coordinator
    var data: Room
    
    var body: some View {
        VStack {
            SliderView(data: data.imageUrls)
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
        
            Text(data.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.black)
                .font(.med_22)
                .padding(.horizontal, 20)
            
            HStack(spacing: 3) {
                Text("Подробнее о номере")
                    .font(.med_16)
                    .frame(alignment: .leading)
                    .foregroundColor(.customBlue)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.customBlue)
            }.padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.customBlue.opacity(0.1))
                .cornerRadius(5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            Group {
                Text("от \(data.price) ₽ ")
                    .font(.sbold_30)
                    .foregroundColor(Color.black)
                +
                Text(data.priceFor)
                    .font(.reg_16)
                    .foregroundColor(Color.customLightGray)
            }.padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                coordinator.navigateTo(.booking)
            } label: {
                Text("Выбрать номер")
                    .frame(maxWidth: .infinity, minHeight: 48)
                    .foregroundColor(.white)
                    .font(.med_16)
                    .background(Color.customBlue)
                    .cornerRadius(15)
            }.padding(.horizontal, 20)
        }.padding(.vertical, 16)
            .background(Color.white)
            .cornerRadius(12)
            .padding(.bottom, 8)
    }
}

#Preview {
    RoomItemView(data: Room.examples.first!)
}