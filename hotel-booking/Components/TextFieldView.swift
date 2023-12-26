//
//  TextFieldView.swift
//  hotel-booking
//
//  Created by Shirin on 23.12.2023.
//

import SwiftUI

struct TextFieldWrapper <Content: View>: View {
    
    var title: String
    var text: String
    var content: () -> Content
    
    init(title: String,
         text: String,
         @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.text = text
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if !text.isEmpty {
                Text(title)
                    .font(.reg_12)
                    .foregroundColor(.customLightGray)
            }
            
            content()
        }.padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(Color.bgGray)
            .cornerRadius(10)
    }
}
