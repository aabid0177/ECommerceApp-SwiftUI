//
//  DealOfTheDayView.swift
//  Stylish
//
//  Created by Aabid Khan on 13/05/24.
//

import SwiftUI

struct DealOfTheDayView: View {
    
    var bgColor: Color = .dealViewBGBlue
    var primaryText: String = "Deal of the Day"
    var secondaryText: String = "22h 55m 20s remaining"
    var icon: Image = Image(systemName: "alarm")
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(primaryText)
                    .font(.custom(K.Fonts.themeMedium, size: 16))
                Label(
                    title: { Text(secondaryText)
                        .font(.custom(K.Fonts.themeRegular, size: 12))},
                    icon: {
                        icon
                    }
                )
            }
            .foregroundStyle(.white)
            Spacer()
            Button(action: {
                
            }, label: {
                HStack {
                    Text("View all")
                        .font(.custom(K.Fonts.themeSemiBold, size: 12))
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.white)
            })
            .padding(.all, 8)
            .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.white, lineWidth: 1)
            )
        }
        .padding(.all, 12)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    DealOfTheDayView()
}
