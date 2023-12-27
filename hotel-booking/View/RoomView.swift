//
//  RoomView.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import SwiftUI

struct RoomView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var vm = RoomVM()

    var body: some View {
        VStack {
            if !vm.data.isEmpty  {
                ScrollView {
                    LazyVStack {
                        ForEach(vm.data) { i in
                            RoomItemView(data: i)
                        }
                    }.padding(.vertical, 8)
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
        }.background(Color.bgGray)
            .onAppear(perform: vm.getData)
    }
}

#Preview {
    RoomView()
}
