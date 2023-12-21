//
//  HotelView.swift
//  hotel-booking
//
//  Created by Shirin on 21.12.2023.
//

import SwiftUI

struct HotelView: View {
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        VStack {
            ScrollView {
                
            }
        }.navigationTitle("Otel")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        HotelView()
    }
}
