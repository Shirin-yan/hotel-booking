//
//  SliderView.swift
//  hotel-booking
//
//  Created by Shirin on 21.12.2023.
//

import SwiftUI

struct SliderView: View {
    @State var index = 0
    var data: [String] = Hotel.example.imageUrls
    
    var body: some View {
        TabView(selection : $index){
            ForEach(data.enumeratedArray(), id: \.offset) { ind, i in
                AsyncImage(url: URL(string: i)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }.tag(ind)
            }
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
            .aspectRatio(1.3, contentMode: .fit)
            .cornerRadius(10)
    }
}

#Preview {
    SliderView()
}
