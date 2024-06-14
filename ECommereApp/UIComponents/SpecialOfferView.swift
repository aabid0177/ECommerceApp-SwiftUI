//
//  SpecialOffer.swift
//  Stylish
//
//  Created by Aabid Khan on 13/05/24.
//

import SwiftUI

struct SpecialOffer: View {
    var body: some View {
        HStack(spacing: 24) {
            Image(.offer)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Special Offers")
                        .font(.custom(K.Fonts.themeMedium, size: 16))
                    Image(.shock)
                }
                Text("We make sure you get the offer you need at best prices")
                    .multilineTextAlignment(.leading)
                    .font(.custom(K.Fonts.themeRegular, size: 12))
            }
            .frame(width: K.Size.widthInProportionOfScreen(width: 171))
            Spacer()
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    SpecialOffer()
}
