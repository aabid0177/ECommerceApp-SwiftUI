//
//  ButtonRoundedCorner.swift
//  Stylish
//
//  Created by Aabid Khan on 15/05/24.
//

import SwiftUI

struct ButtonRoundedCorner: View {
    var title = "Nearest Store"
    var icon = Image(.location)
    
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack(spacing: 0) {
                icon
                Text(title)
                    .font(.custom(K.Fonts.themeMedium, size: 10))
                    .foregroundStyle(.iconColorGray)
            }
        })
        .padding(.all, 4)
        .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.iconColorGray, lineWidth: 1)
        )
        .frame(height: 24)
    }
}

#Preview {
    ButtonRoundedCorner()
}
