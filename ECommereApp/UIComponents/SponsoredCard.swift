//
//  SponsoredCard.swift
//  Stylish
//
//  Created by Aabid Khan on 14/05/24.
//

import SwiftUI

struct SponsoredCard: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Sponsored")
                    .font(.custom(K.Fonts.themeMedium, size: 20))
                Spacer()
            }
            
            Image(.sponsored)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("up to 50% Off")
                    .font(.custom(K.Fonts.themeBold, size: 16))
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(.custom(K.Fonts.themeBold, size: 16))
            })
            .foregroundStyle(.black)
            .padding(.top, 6)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
        .padding(.top, 8)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    SponsoredCard()
}
