//
//  NormalTextField.swift
//  Stylish
//
//  Created by Aabid Khan on 22/05/24.
//

import SwiftUI

struct NormalTextField: View {
    
    var placeholderText: String
    @Binding var text: String
    var errorMessage: String = "Please enter data"
    @State private var isValid: Bool = true
    @FocusState var isTextFieldFocused: Bool
    var isUserNameField: Bool = false
    
    var textFieldBGColor: Color {
        if isUserNameField {
            Color.textfieldBackground
        } else {
            Color.white
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                
                TextField(placeholderText, text: $text,  prompt: Text(placeholderText).foregroundColor(Color(K.Colors.textColorGray)))
                    .font(.custom(K.Fonts.themeMedium, size: 12))
                    .foregroundStyle(Color(K.Colors.textColorGray))
                    .autocorrectionDisabled(true)
                    .focused($isTextFieldFocused)
                    .onChange(of: isTextFieldFocused) {
                        if !isTextFieldFocused {
                            if text.isEmpty {
                                isValid = false
                            }
                        } else {
                            isValid = true
                        }
                    }
                    .onChange(of: text) {
                        if isUserNameField {
                            text = text.replacingOccurrences(of: " ", with: "")
                        }
                    }
            }
            .padding()
            .frame(height: 48)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(isValid ? K.Colors.borderColorGray : .red), lineWidth: 1)
            )
            .background(Color(isValid ? textFieldBGColor : .socialButtonBackground))
            
            if !isValid {
                Text("\(placeholderText) is required")
                    .font(.custom(K.Fonts.themeMedium, size: 14))
                    .foregroundStyle(.red)
            }
        }
        
    }
}

#Preview {
    NormalTextField(placeholderText: "Full Name", text: .constant(""))
}
