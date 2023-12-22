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
                        .padding(.horizontal, 20)
                        .padding(.bottom, 8)
                
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .imageScale(.small)
                            .foregroundColor(.customOrange)
                        
                        Text("\(vm.data.rating) " + vm.data.ratingName)
                            .font(.med_16)
                            .foregroundColor(Color.customOrange)
                    }.padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.customOrange.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.horizontal, 20)

                    Text(vm.data.name)
                        .font(.med_22)
                        .foregroundStyle(Color.black)
                        .padding(.horizontal, 20)

                    Text(vm.data.address)
                        .font(.med_14)
                        .foregroundColor(Color.customBlue)
                        .padding(.horizontal, 20)

                Group {
                    Text("от \(vm.data.minimalPrice) ₽ ")
                        .font(.sbold_30)
                        .foregroundColor(Color.black)
                    +
                    Text(vm.data.priceFor)
                        .font(.reg_16)
                        .foregroundColor(Color.customLightGray)
                }.padding(.horizontal, 20)
            }.padding(.vertical, 16)
                .background(Color.white)
                .cornerRadius(12)
            
            LazyVStack(alignment: .leading, spacing: 16) {
                Text("Об отеле")
                    .font(.med_22)
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                
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
                    .padding(.horizontal, 20)

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
                    .padding(.horizontal, 20)
                
            }.padding(.vertical, 16)
                .background(Color.white)
                .cornerRadius(12)

        }.navigationTitle("Otel")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Text("К выбору номера")
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .foregroundColor(.white)
                            .font(.med_16)
                            .background(Color.customBlue)
                            .cornerRadius(15)
                    }
                }//.frame(maxWidth: .infinity)
            }

            .background(Color.bgGray)
//            .toolbar(.automatic, for: .bottomBar) {
//                ToolbarItem {
//                    Button {
//                        
//                    } label: {
//                        Text("К выбору номера")
//                            .frame(maxWidth: .infinity, minHeight: 48)
//                            .foregroundColor(.white)
//                            .font(.med_16)
//                            .background(Color.customBlue)
//                            .cornerRadius(15)
//                    }
//                }
//            }
    }
}

#Preview {
    NavigationView {
        HotelView()
    }
}
