//
//  TouristInfoView.swift
//  hotel-booking
//
//  Created by Shirin on 23.12.2023.
//

import SwiftUI

struct TouristInfoView: View {
    @State var isCollapsed = true
    @State var showDatePicker = false
    @State var order: Int
    @Binding var data: TouristInfo
    @Binding var toCheck: Bool
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }

    var body: some View {
        VStack {
            HStack {
                Text("Tурист # \(order)")
                    .foregroundColor(.black)
                    .font(.med_22)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                Image(systemName: isCollapsed ? "chevron.down" : "chevron.up")
                    .foregroundColor(.customBlue)
                    .frame(width: 32, height: 32, alignment: .center)
                    .background(Color.customBlue.opacity(0.1))
                    .cornerRadius(6)
            }.contentShape(Rectangle())
                .onTapGesture {
                withAnimation(Animation.bouncy(duration: 0.3) ) {
                    isCollapsed.toggle()
                }
            }
            
            if !isCollapsed {
                TextFieldWrapper(title: "Имя", text: data.name) {
                    TextField("Имя", text: $data.name)
                        .font(.reg_16)
                }.overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(getBorderColor(data.name), lineWidth: 1))
                
                TextFieldWrapper(title: "Фамилия", text: data.surname) {
                    TextField("Фамилия", text: $data.surname)
                        .font(.reg_16)
                }.overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(getBorderColor(data.surname), lineWidth: 1))
                
                TextFieldWrapper(title: "Дата рождения", text: data.bithday) {
                    MaskedDateTextField(text: $data.bithday, placeholder: "Дата рождения") { editing in
                        if !editing {
                            if dateFormatter.date(from: data.bithday) == nil {
                                data.bithday = ""
                            }
                        }
                    }.keyboardType(.numberPad)
                        .font(.reg_16)
                }.overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(getBorderColor(data.bithday), lineWidth: 1))
                
                TextFieldWrapper(title: "Гражданство", text: data.nationality) {
                    TextField("Гражданство", text: $data.nationality)
                        .font(.reg_16)
                }.overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(getBorderColor(data.nationality), lineWidth: 1))
                
                TextFieldWrapper(title: "Номер загранпаспорта", text: data.passport) {
                    TextField("Номер загранпаспорта", text: $data.passport)
                        .font(.reg_16)
                }.overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(getBorderColor(data.passport), lineWidth: 1))
                
                TextFieldWrapper(title: "Срок действия загранпаспорта", text: data.passportExpireDate) {
                    MaskedDateTextField(text: $data.passportExpireDate, placeholder: "Срок действия загранпаспорта") {editing in
                        if !editing {
                            if dateFormatter.date(from: data.passportExpireDate) == nil {
                                data.passportExpireDate = ""
                            }
                        }
                    }.keyboardType(.numberPad)
                        .font(.reg_16)
                }.overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(getBorderColor(data.passportExpireDate), lineWidth: 1))
            }
        }.padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(Color.white)
            .cornerRadius(12)
        
    }
    
    func getBorderColor(_ text: String) -> Color {
        return toCheck && text.isEmpty ? .customRed : .bgGray
    }
}
//
//#Preview {
//    TouristInfoView(order: 1, data: TouristInfo(), toCheck: true)
//        .background(Color.red)
//}
