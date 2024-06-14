//
//  DOBTextfield.swift
//  Stylish
//
//  Created by Aabid Khan on 22/05/24.
//

import SwiftUI

struct DOBTextfield: View {
    
    var placeholderText: String
    var errorMessage: String = "Please enter data"
    @State private var isValid: Bool = true
    @Binding var birthday: Date
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            Text(birthday, style: .date)
                .font(.custom(K.Fonts.themeMedium, size: 12))
                .foregroundStyle(Color(K.Colors.textColorGray))
            Spacer()
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color(K.Colors.iconColorGray))
        }
        .padding()
        .frame(height: 48)
        .overlay {
            DatePicker(
                "",
                selection: $birthday,
                in: ...Date(),
                displayedComponents: [.date]
            )
            .blendMode(.destinationOver) //MARK: use this extension to keep the clickable functionality
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(isValid ? K.Colors.borderColorGray : .red), lineWidth: 1)
        )
        .background(Color(isValid ? Color.white : .socialButtonBackground))
    }
}

#Preview {
    DOBTextfield(placeholderText: "Date of Birth", birthday: .constant(Date()))
}
