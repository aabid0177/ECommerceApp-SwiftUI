//
//  EmailTextField.swift
//  Stylish
//
//  Created by Aabid Khan on 06/05/24.
//

import SwiftUI

struct EmailTextField: View {
    
    var placeholderText: String
    var invalidEmailMessage: String = "Please enter valid email"
    
    @Binding var text: String
    @FocusState var isTextFieldFocused: Bool
    @State private var isValidEmail: Bool = true
    var showIcon: Bool = true
    var textfieldBGColor: Color = .textfieldBackground
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                if showIcon {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color(K.Colors.iconColorGray))
                }
                    
                TextField(placeholderText, text: $text,  prompt: Text(placeholderText).foregroundColor(Color(K.Colors.textColorGray)))
                    .padding(.leading, showIcon ? 10 : 0)
                    .font(.custom(K.Fonts.themeMedium, size: 12))
                    .foregroundStyle(Color(K.Colors.textColorGray))
                    .autocorrectionDisabled(true)
                    .focused($isTextFieldFocused)
                    .keyboardType(.emailAddress)
                    .onChange(of: isTextFieldFocused) {
                        if !isTextFieldFocused {
                            if text.isEmpty {
                                isValidEmail = false
                            }
                            isValidEmail = text.isValidEmail
                        } else {
                            isValidEmail = true
                        }
                }
            }
            .padding()
            .frame(height: 48)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(isValidEmail ? K.Colors.borderColorGray : .red), lineWidth: 1)
            )
            .background(Color(isValidEmail ? textfieldBGColor : .socialButtonBackground))
            
            if !isValidEmail {
                Text(invalidEmailMessage)
                    .font(.custom(K.Fonts.themeMedium, size: 14))
                    .foregroundStyle(.red)
            }
        }
        
    }
}

#Preview {
    EmailTextField(placeholderText: "Username or Email", text: .constant(""))
}
