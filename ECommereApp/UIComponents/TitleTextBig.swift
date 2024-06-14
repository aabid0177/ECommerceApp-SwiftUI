//
//  TitleTextBig.swift
//  Stylish
//
//  Created by Aabid Khan on 03/05/24.
//

import SwiftUI

struct TitleTextBig: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom(K.Fonts.themeBold, size: 36))
    }
}

#Preview {
    TitleTextBig(text: "Welcome Back!")
}
