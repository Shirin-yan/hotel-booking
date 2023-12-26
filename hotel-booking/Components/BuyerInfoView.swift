//
//  BuyerInfoView.swift
//  hotel-booking
//
//  Created by Shirin on 26.12.2023.
//

import SwiftUI

struct BuyerInfoView: View {
    @Binding var phone: String
    @Binding var email: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Информация о покупателе")
                .foregroundColor(.black)
                .font(.med_22)
                .frame(maxWidth:.infinity, alignment: .leading)
                .multilineTextAlignment(.leading)

            TextFieldWrapper(title: "Номер телефона", text: phone) {
                TextField(text: $phone) {
                    Text("Номер телефона")
                        .foregroundColor(.customLightGray)
                }.font(.reg_16)
            }
            
            TextFieldWrapper(title: "Почта", text: email) {
                TextField(text: $email) {
                    Text("Почта")
                        .foregroundColor(.customLightGray)
                }.font(.reg_16)
            }
            
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                .foregroundColor(.customLightGray)
                .font(.reg_14)
                .frame(maxWidth:.infinity, alignment: .leading)
                .multilineTextAlignment(.leading)

        }.padding(16)
            .background(Color.white)
            .cornerRadius(12)
    }
}
//
//#Preview {
//    BuyerInfoView()
//}
