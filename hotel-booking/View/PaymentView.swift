//
//  PaymentView.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import SwiftUI

struct PaymentView: View {
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        VStack(spacing: 20) {
            Image("congrats")
                .padding(25)
                .background(Color.bgGray)
                .cornerRadius(50)
                .padding(.bottom, 12)
            
            Text("Ваш заказ принят в работу")
                .foregroundColor(.black)
                .font(.med_22)
                .multilineTextAlignment(.center)
            
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .foregroundColor(.customLightGray)
                .font(.reg_16)
                .multilineTextAlignment(.center)
        }.padding(20)
            .navigationTitle("Заказ оплачен")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Text("Супер!")
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .foregroundColor(.white)
                        .font(.med_16)
                        .background(Color.customBlue)
                        .cornerRadius(15)
                        .padding(.top, 12)
                        .onTapGesture {
                            coordinator.popToRoot()
                        }
                }
            }
    }
}

#Preview {
    PaymentView()
}
