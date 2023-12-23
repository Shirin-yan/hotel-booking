//
//  HotelView.swift
//  hotel-booking
//
//  Created by Shirin on 21.12.2023.
//

import SwiftUI

struct HotelView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var vm = HotelVM()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 8) {
                    SliderView(data: vm.data.imageUrls)
                        .padding(.bottom, 8)
                
                RatingView(rating: vm.data.rating, ratingName: vm.data.ratingName)
                
                    Text(vm.data.name)
                        .font(.med_22)
                        .foregroundStyle(Color.black)

                    Text(vm.data.address)
                        .font(.med_14)
                        .foregroundColor(Color.customBlue)

                Group {
                    Text("от \(vm.data.minimalPrice) ₽ ")
                        .font(.sbold_30)
                        .foregroundColor(Color.black)
                    +
                    Text(vm.data.priceFor)
                        .font(.reg_16)
                        .foregroundColor(Color.customLightGray)
                }
            }.padding(.vertical, 16)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(12)
            
            LazyVStack(alignment: .leading, spacing: 16) {
                Text("Об отеле")
                    .font(.med_22)
                    .foregroundColor(.black)
                
//                ForEach(vm.data.about.peculiarities, id: \.self) { i in
//                    Text(i)
//                        .foregroundColor(.customLightGray)
//                        .font(.med_16)
//                        .padding(.horizontal, 10)
//                        .padding(.vertical, 5)
//                        .background(Color.bgGray)
//                        .cornerRadius(5)
//                }
                
                Text(vm.data.about.description)
                    .font(.reg_16)
                    .foregroundColor(.black.opacity(0.9))

                VStack(spacing: 0) {
                    HotelInfoItemView(data: .commodity)
                    
                    Divider()
                        .padding(.leading, 50)
                        .padding(.trailing, 16)
                    
                    HotelInfoItemView(data: .included)
                    
                    Divider()
                        .padding(.leading, 50)
                        .padding(.trailing, 16)

                    HotelInfoItemView(data: .excluded)
                }.background(Color.customWhite)
                    .cornerRadius(15)
                
            }.padding(.vertical, 16)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(12)

            Spacer(minLength: 20)
            
        }.navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Text("К выбору номера")
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.customBlue)
                        .foregroundColor(.white)
                        .font(.med_16)
                        .cornerRadius(15)
                        .padding(.top, 12)
                        .onTapGesture {
                            coordinator.navigateTo(.room(name: vm.data.name))
                        }
                }
            }.background(Color.bgGray)
    }
}

#Preview {
    NavigationView {
        HotelView()
    }
}
