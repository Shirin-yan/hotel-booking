//
//  CoordinatorView.swift
//  hotel-booking
//
//  Created by Shirin on 20.12.2023.
//

import SwiftUI

struct CoordinatorView<Content: View>: View {
    @StateObject var coordinator = Coordinator()

    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            content
                .navigationDestination(for: Coordinator.Page.self) { page in
                    coordinator.view(for: page)
                }
        }.environmentObject(coordinator)
    }
}
