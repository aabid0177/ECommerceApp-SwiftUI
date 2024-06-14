//
//  SummerSale.swift
//  Stylish
//
//  Created by Aabid Khan on 13/05/24.
//

import SwiftUI

struct SummerSale: View {
    var body: some View {
        VStack {
            Image(.summerSale)
                .resizable()
                .scaledToFit()
                .background(.yellow)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("New Arrivals")
                        .font(.custom(K.Fonts.themeMedium, size: 20))
                    Text("Summer’ 25 Collections")
                        .font(.custom(K.Fonts.themeRegular, size: 16))
                }
                
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
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            .padding(.all, 8)
        }
        .padding(.bottom, 8)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    SummerSale()
}
