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
    
    @State var phone = ""
    @State var email = ""
    @State var phoneBorder = Color.bgGray
    @State var emailBorder = Color.bgGray
    @State var toCheckTouristInfo = false
    
    var body: some View {
        VStack {
            if let data = vm.data {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 8) {
                        
                        RatingView(rating: data.rating, ratingName: data.ratingName)
                        
                        Text(data.hotelName)
                            .font(.med_22)
                            .foregroundStyle(Color.black)
                        
                        Text(data.hotelAddress)
                            .font(.med_14)
                            .foregroundColor(Color.customBlue)
                    }.padding(.horizontal, 20)
                        .padding(.vertical, 16)
                        .background(Color.white)
                        .cornerRadius(12)
                    
                    BookingInfoView(data: data)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Информация о покупателе")
                            .foregroundColor(.black)
                            .font(.med_22)
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                        TextFieldWrapper(title: "Номер телефона", text: phone) {
                            MaskedPhoneTextField(text: $phone, placeholder: "Номер телефона", editingChanged: { editing in
                                if editing == false && !phone.isEmpty {
                                    phoneBorder = phone.isValidPhone() ? .bgGray : .customRed
                                }
                            })
                        }.overlay(RoundedRectangle(cornerRadius: 10).stroke(phoneBorder, lineWidth: 1))
                        
                        TextFieldWrapper(title: "Почта", text: email) {
                            TextField("Почта", text: $email) { editing in
                                if editing == false && !email.isEmpty {
                                    emailBorder = email.isValidEmail() ? .bgGray : .customRed
                                }
                            }.font(.reg_16)
                        }.overlay(RoundedRectangle(cornerRadius: 10).stroke(emailBorder, lineWidth: 1))
                        
                        Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                            .foregroundColor(.customLightGray)
                            .font(.reg_14)
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }.padding(16)
                        .background(Color.white)
                        .cornerRadius(12)
                    
                    ForEach(vm.touristInfo.enumeratedArray(), id: \.offset) { ind, i in
                        TouristInfoView(order: ind+1,
                                        data: Binding(get: { return vm.touristInfo[ind] },
                                                      set: { (newValue) in return vm.touristInfo[ind] = newValue}),
                                        toCheck: $toCheckTouristInfo)
                    }
                    
                    Button {
                        vm.touristInfo.append(TouristInfo())
                    } label: {
                        AddTouristView()
                    }
                    
                    PaymentInfoView(data: data)
                    
                    Spacer(minLength: 10)
                }.scrollDismissesKeyboard(.interactively)
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            Text("Оплатить \(data.totalPrice) ₽")
                                .frame(maxWidth: .infinity, minHeight: 48)
                                .foregroundColor(.white)
                                .font(.med_16)
                                .background(Color.customBlue)
                                .cornerRadius(15)
                                .padding(.top, 12)
                                .onTapGesture(perform: navigate)
                        }
                    }
            } else if vm.inProgress {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            } else {
                Text("Networ error")
                    .foregroundColor(.black)
                    .font(.med_22)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }.navigationTitle("Бронирование")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.bgGray)
            .onAppear(perform: vm.getData)
    }
    
    func navigate() {
        toCheckTouristInfo = true
        if phone.isEmpty || email.isEmpty || vm.isTouristInfoNotFull() {
            phoneBorder = phone.isValidPhone() ? .bgGray : .customRed
            emailBorder = email.isValidEmail() ? .bgGray : .customRed
            return
        }
        
        coordinator.navigateTo(.payment)
    }
}

#Preview {
    NavigationView {
        BookingView()
    }
}
