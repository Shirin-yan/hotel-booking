//
//  TouristInfoView.swift
//  hotel-booking
//
//  Created by Shirin on 23.12.2023.
//

import SwiftUI

struct TouristInfoView: View {
    @State var isCollapsed = false
    @State var name: String = ""
    @State var surname: String = ""
    @State var nationality: String = ""
    @State var passportNo: String = ""
    @State var birthday: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Tурист # 1")
                    .foregroundColor(.black)
                    .font(.med_22)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                Image(systemName: isCollapsed ? "chevron.down" : "chevron.up")
                    .foregroundColor(.customBlue)
                    .frame(width: 32, height: 32, alignment: .center)
                    .background(Color.customBlue.opacity(0.1))
                    .cornerRadius(6)
            }.onTapGesture {
                withAnimation(Animation.bouncy(duration: 0.3) ) {
                    isCollapsed.toggle()
                }
            }
            
            if !isCollapsed {
                TextFieldWrapper(title: "Имя", text: name) {
                    TextField(text: $name) {
                        Text("Имя")
                            .foregroundColor(.customLightGray)
                    }.font(.reg_16)
                }
                
                TextFieldWrapper(title: "Фамилия", text: surname) {
                    TextField(text: $surname) {
                        Text("Фамилия")
                            .foregroundColor(.customLightGray)
                    }.font(.reg_16)
                }
                
                TextFieldWrapper(title: "Дата рождения", text: birthday) {
//                    TextField("Дата рождения", value: $birthday, format: .iso8601)
                }
                
                TextFieldWrapper(title: "Гражданство", text: nationality) {
                    TextField(text: $nationality) {
                        Text("Гражданство")
                            .foregroundColor(.customLightGray)
                    }.font(.reg_16)
                }
                
                TextFieldWrapper(title: "Номер загранпаспорта", text: passportNo) {
                    TextField(text: $passportNo) {
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
    TouristInfoView()
        .background(Color.red)
}
