//
//  IntroContentView.swift
//  Stylish
//
//  Created by Aabid Khan on 07/05/24.
//

import SwiftUI

struct IntroContentView: View {
    
    var data: IntroData
    
    var body: some View {
        
        VStack {
            Image(data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: K.Size.widthInProportionOfScreen(width: 350), height: K.Size.heightInProportionOfScreen(height: 350))
                .padding(.bottom, 15)
                
            Text(data.title)
                .font(.custom(K.Fonts.themeExtraBold, size: 24))
                .padding(.bottom, 10)
            Text(data.desc)
                .frame(width: K.Size.widthInProportionOfScreen(width: 340))
                .foregroundStyle(Color(.borderColorGray))
                .font(.custom(K.Fonts.themeSemiBold, size: 14))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 76)
    }
}

#Preview {
    IntroContentView(data:introDataArray[0])
}
