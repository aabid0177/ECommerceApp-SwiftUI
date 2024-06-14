//
//  PhoneNumberTextfield.swift
//  Stylish
//
//  Created by Aabid Khan on 22/05/24.
//

import SwiftUI

struct PhoneNumberTextfield: View {
    var placeholder: String = "Phone Number"
    @Binding var text: String
    @Binding var phoneCode: String
    @FocusState var isTextFieldFocused: Bool
    let countryCodes = Bundle.main.decode([CountryCodesModal].self, from: "CountryCodes.json")
    @State private var isValid: Bool = true
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Menu {
                    ForEach(countryCodes, id: \.code) { country in
                        Button(action: {
                            phoneCode = country.dial_code
                        }, label: {
                            Text("\(country.dial_code)")
                                .font(.custom(K.Fonts.themeRegular, size: 14))
                            +
                            Text(" ")
                            +
                            Text("\(country.name)")
                                .font(.custom(K.Fonts.themeRegular, size: 14))
                        })
                    }
                } label: {
                    HStack(spacing: 5) {
                        HStack {
                            Text(phoneCode)
                                .font(.custom(K.Fonts.themeMedium, size: 12))
                                .foregroundStyle(Color(K.Colors.textColorGray))
                                .padding(.leading, 10)
                            
                            Image(systemName: "chevron.down")
                                .resizable()
                                .frame(width: 18, height: 10)
                                .foregroundStyle(Color(K.Colors.iconColorGray))
                        }
                    }
                }
                
                Divider()
                TextField(placeholder, text: $text,  prompt: Text(placeholder).foregroundColor(Color(K.Colors.textColorGray)))
                    .keyboardType(.numberPad)
                    .onChange(of: text, {
                        self.text = String(text.prefix(10))
                    })
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
                Spacer()
            }
            .padding()
            .frame(height: 48)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(isValid ? K.Colors.borderColorGray : .red), lineWidth: 1)
            )
            .background(Color(isValid ? Color.white : .socialButtonBackground))
            
            if !isValid {
                Text("\(placeholder) is required")
                    .font(.custom(K.Fonts.themeMedium, size: 14))
                    .foregroundStyle(.red)
            }
        }
        
    }
}

#Preview {
    PhoneNumberTextfield(text: .constant(""), phoneCode: .constant("+91"))
}
