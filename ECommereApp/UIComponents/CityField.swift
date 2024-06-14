//
//  CityField.swift
//  Stylish
//
//  Created by Aabid Khan on 23/05/24.
//

import SwiftUI

struct CityField: View {
    
    var placeholder: String = "Select City"
    @Binding var text: String
    @FocusState var isTextFieldFocused: Bool
    let cities: [String]
    
    var body: some View {
        Menu {
            ForEach(cities, id: \.self) { city in
                Button(action: {
                    text = city
                }, label: {
                    Text("\(city)")
                })
            }
        } label: {
            HStack(spacing: 0) {
                Text(text.isEmpty ? placeholder : text)
                    .font(.custom(K.Fonts.themeMedium, size: 12))
                    .foregroundStyle(Color(K.Colors.textColorGray))
                Spacer()
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 18, height: 10)
                    .foregroundStyle(Color(K.Colors.iconColorGray))
            }
            .padding()
            .frame(height: 48)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.borderColorGray, lineWidth: 1)
            )
            .background(.white)
        }
    }
}

#Preview {
    CityField(text: .constant(""), cities: ["asd"])
}
