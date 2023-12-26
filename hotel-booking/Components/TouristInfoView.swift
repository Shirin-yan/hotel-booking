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
    @State var data: TouristInfo
    
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
                    TextField(text: $data.name) {
                        Text("Имя")
                            .foregroundColor(.customLightGray)
                    }.font(.reg_16)
                }
                
                TextFieldWrapper(title: "Фамилия", text: data.surname) {
                    TextField(text: $data.surname) {
                        Text("Фамилия")
                            .foregroundColor(.customLightGray)
                    }.font(.reg_16)
                }
                
                TextFieldWrapper(title: "Дата рождения", text: data.bithday) {
                    TextField(text: $data.bithday) {
                        Text("Дата рождения")
                            .foregroundColor(.customLightGray)
                    }.font(.reg_16)
                }
                
                TextFieldWrapper(title: "Гражданство", text: data.nationality) {
                    TextField(text: $data.nationality) {
                        Text("Гражданство")
                            .foregroundColor(.customLightGray)
                    }.font(.reg_16)
                }
                
                TextFieldWrapper(title: "Номер загранпаспорта", text: data.passport) {
                    TextField(text: $data.passport) {
                        Text("Номер загранпаспорта")
                            .foregroundColor(.customLightGray)
                    }.font(.reg_16)
                }
            }
        }.padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(Color.white)
            .cornerRadius(12)
    }
}

#Preview {
    TouristInfoView(order: 1, data: TouristInfo())
        .background(Color.red)
}
