//
//  EmptyView.swift
//  Stylish
//
//  Created by Aabid Khan on 20/05/24.
//

import SwiftUI

struct EmptyViewCustom: View {
    
    var icon: Image
    var heading: String
    var subHeading: String
    var showIcon: Bool = true
    
    var body: some View {
        VStack {
            if showIcon {
                icon
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            Text(heading)
                .font(.custom(K.Fonts.themeSemiBold, size: 16))
            Text(subHeading)
                .font(.custom(K.Fonts.themeRegular, size: 14))
        }
        
    }
}

#Preview {
    EmptyViewCustom(icon: Image(.cart), heading: "", subHeading: "")
}
