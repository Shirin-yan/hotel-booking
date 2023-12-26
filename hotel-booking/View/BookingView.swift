//
//  BookingView.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import SwiftUI

struct BookingView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var vm = BookingVM()

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 8) {

                RatingView(rating: vm.data.rating, ratingName: vm.data.ratingName)
                
                Text(vm.data.hotelName)
                    .font(.med_22)
                    .foregroundStyle(Color.black)

                Text(vm.data.hotelAddress)
                    .font(.med_14)
                    .foregroundColor(Color.customBlue)
            }.padding(.horizontal, 20)
                .padding(.vertical, 16)
                .background(Color.white)
                .cornerRadius(12)
            
            BookingInfoView(data: vm.data)
            
            BuyerInfoView(phone: $vm.phone, email: $vm.mail)
            
            ForEach(vm.touristInfo.enumeratedArray(), id: \.offset) { ind, i in
                TouristInfoView(order: ind+1, data: i)
            }
            
            Button {
                vm.touristInfo.append(TouristInfo())
            } label: {
                AddTouristView()
            }
            
            PaymentInfoView(data: vm.data)
            
            Spacer(minLength: 10)
        }.navigationTitle("Бронирование")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Text("Оплатить \(vm.data.totalPrice) ₽")
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .foregroundColor(.white)
                        .font(.med_16)
                        .background(Color.customBlue)
                        .cornerRadius(15)
                        .padding(.top, 12)
                        .onTapGesture {
                            coordinator.navigateTo(.payment)
                        }
                }
            }.background(Color.bgGray)
    }
}

#Preview {
    NavigationView {
        BookingView()
    }
}
