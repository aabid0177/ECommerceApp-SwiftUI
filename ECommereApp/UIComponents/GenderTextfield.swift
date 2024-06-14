//
//  GenderTextfield.swift
//  Stylish
//
//  Created by Aabid Khan on 22/05/24.
//

import SwiftUI

struct GenderTextfield: View {
    
    var placeholder: String = "Gender"
    @Binding var text: String
    let genders = ["Male", "Female"]
    
    var body: some View {
        Menu {
            ForEach(genders, id: \.self) { gender in
                Button(action: {
                    text = gender
                }, label: {
                    Text("\(gender)")
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
    GenderTextfield(text: .constant(""))
}
