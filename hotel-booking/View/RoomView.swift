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
        List {
            ForEach(vm.data) { i in
                RoomItemView(data: i)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }.listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
        }
    }
}

#Preview {
    RoomView()
}
