//
//  Button.swift
//  Stylish
//
//  Created by Aabid Khan on 03/05/24.
//

import SwiftUI

struct ThemeButton: View {
    var disable: Bool = false
    var text: String
    var action: (() -> ())?
    @Binding var showLoader: Bool
    
    var body: some View {
        Button(action: {
            if let action = action {
                showLoader = true
                action()
            }
        }, label: {
            HStack(spacing: 10) {
                Text(text)
                .foregroundStyle(.white)
                .font(.custom(K.Fonts.themeSemiBold, size: 20))
                if showLoader {
                    ProgressView()
                        .tint(.white)
                }
            }
        })
        .padding()
        .frame(width: K.Size.widthInProportionOfScreen(width: 317), height: 55)
        .background(Color(disable ? K.Colors.borderColorGray : K.Colors.pink))
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .disabled(disable)
    }
}

#Preview {
    ThemeButton(disable: false, text: "Login", showLoader: .constant(false))
}
