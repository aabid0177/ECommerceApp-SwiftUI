//
//  PasswordField.swift
//  Stylish
//
//  Created by Aabid Khan on 06/05/24.
//

import SwiftUI

struct PasswordField: View {
    
    var placeholderText: String
    @Binding var text: String
    @State private var showText: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "exclamationmark.lock.fill")
                .resizable()
                .frame(width: 16, height: 20)
                .foregroundStyle(Color(K.Colors.iconColorGray))
            
            if showText {
                TextField(placeholderText, text: $text,  prompt: Text(placeholderText).foregroundColor(Color(K.Colors.textColorGray)))
                    .padding(.leading)
                    .font(.custom(K.Fonts.themeMedium, size: 12))
                    .foregroundStyle(Color(K.Colors.textColorGray))
            } else {
                SecureField(placeholderText, text: $text,  prompt: Text(placeholderText).foregroundColor(Color(K.Colors.textColorGray)))
                    .padding(.leading)
                    .font(.custom(K.Fonts.themeMedium, size: 12))
                    .foregroundStyle(Color(K.Colors.textColorGray))
            }
            
            
            Button(action: {
                showText.toggle()
            }, label: {
                Image(systemName: showText ? "eye" : "eye.slash")
                .foregroundStyle(Color(K.Colors.iconColorGray))
            })
            .frame(width: 30, height: 30)
        }
        .padding()
        .frame(height: 55)
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(K.Colors.borderColorGray), lineWidth: 1)
        )
        .background(Color(.textfieldBackground))
    }
}

#Preview {
    PasswordField(placeholderText: "Password", text: .constant(""))
}
