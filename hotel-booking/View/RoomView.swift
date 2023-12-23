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
        ScrollView {
            LazyVStack {
                ForEach(vm.data) { i in
                    RoomItemView(data: i)
                }
            }.padding(.vertical, 8)
        }.background(Color.bgGray)
    }
}

#Preview {
    RoomView()
}
